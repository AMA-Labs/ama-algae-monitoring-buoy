
import cv2
import numpy as np
import math
import numpy as np




def _getpxCV(px):
    return int(px[0]) + int(px[1]) + int(px[2])

def __cvimage_to_pygame(image):
    corrected = image[:,:,(2,1,0,3)]
    return pygame.image.frombuffer(image.tostring(), image.shape[1::-1], "RGBA")

# set size/range
# 1. Get initial pixel color
# 2. Sum colors of size/range
#       compare to initial color - if within threshold then fill. Otherwise, skip 

def _getLCD(val):
    if val % 2 == 0: return 2
    else:
        sqrt = math.sqrt(val)
        for i in range(3, 1+sqrt, 2):
            if val % i == 0: return i
    return val

def _regionSplit(x, y, w, h):
    cols = _getLCD(w)
    rows = _getLCD(h)

    if cols == w and rows == h:
        # Can't split
        return []

    w = w/cols
    h = h/rows
    ret = []
    for col in range(cols):
        for row in range(rows):
            ret.append([x + col*w, y * row*h, w, h])
    return ret
    
def set_contrast(colors):
    minColor = colors[:,:,0:3].min()
    maxColor = colors[:,:,0:3].max() - minColor
    subtr = np.subtract(colors[:,:,0:3], minColor).astype("float64")
    subtr = np.multiply(subtr, (255 / maxColor))
    colors[:,:,0:3] = subtr
    return colors

def __getColors(img, x, y, w, h):
    colors = img[0,0]
    if x > 0:
        colors = np.concatenate(colors, img[x-1, y:(y+h)])
    if y > 0:
        colors = np.concatenate(colors, img[x:(x+w), y-1])
    if x+w < img.shape[0]:
        colors = np.concatenate(colors, img[x+w, y:(y+h)])
    if y+h < img.shape[1]:
        colors = np.concatenate(colors, img[x:(x+w), y+h])
    colors = np.delete(colors, 0, 0)
    keep = np.equal(colors[:, 3], 0)
    return colors[keep]

def __countAdjacentTransparents(img, x, y, w, h):
    colors = []
    if x > 0:
        colors = np.concatenate(colors, img[x-1, y:(y+h)])
    if y > 0:
        colors = np.concatenate(colors, img[x:(x+w), y-1])
    if x+w < img.shape[0]:
        colors = np.concatenate(colors, img[x+w, y:(y+h)])
    if y+h < img.shape[1]:
        colors = np.concatenate(colors, img[x:(x+w), y+h])


def _isInThreshold(target, color, threshold):
    
    # If anything is invisible, return false. Let's split it until there is no more invisibile sections.
    visible = np.equal(target[:,:,3], 0)
    if np.any(visible):
        return False

    diff = np.zeros(target.shape)
    min_range = 0
    max_range = 0
    for i in range(3):
        temp = np.subtract(target[:,:,i], color[i])
        min_range = min(min_range, temp.min())
        max_range = max(max_range, temp.max())
        diff += np.abs(temp)

    # Difference in array is greater than threshold, therefore there may be "islands"
    if max_range - min_range >= threshold:
        return False
        
    valid = np.greater(diff, threshold)
    # ignore invisible ones
    
    if np.any(valid):
        return False
    return True



def __removeSection(img, reference, threshold, x, y, w, h):
    if reference is None:
        colors = __getColors(img, x, y, w, h)
    else:
        colors = [img[reference]]

    if len(colors) == 0:
        return
    
    # Focus on target region
    target = img[x:(x+w), y:(y+h)]

    for color in colors:
        if _isInThreshold(target, color, threshold):
            target[:,:,3] = 0
            return
    
    # None of the colors were in the threshold, split into smaller sections

    
    target = img[x:(x+w), y:(y+h)]
    comparison = np.subtract(target, color)
    if np.greater(np.abs(comparison), threshold).any():
        # split into smaller bits
        subsections = _regionSplit()
    else:
        img[x:(x+w), y:(y+h), 3] = 0 
    
# Returns a map with all the edges marked true
def __getEdges(img):
    sides = np.diff(img, axis=1, prepend=0) != 0
    caps = np.diff(img, axis=0, prepend=0) != 0
    return caps + sides

def __fillIsland(img):
    ret = (np.zeros(img.shape) == True)
    for row in range(img.shape[0]):
        points = img[row].nonzero()
        points = points[0]
        if len(points) == 0:
            continue
        # remove sequential bits
        index = 0
        last = 0
        while index < len(points):
            current = points[index]
            if abs(current - last) == 1:
                points = np.delete(points, index)
            else:
                index += 1
            last = current

        if len(points) % 2 == 1: # Theoretically ~ THIS SHOULD NEVER HAPPEN
            points = np.append(points, -1)
        for i in range(int(len(points)/2)):
            ret[row, points[2*i]:points[2*i+1]] = True
    return ret

# Returns a traced edge
def __getIslandTrace(map, reference):
    ret = np.zeros(map.shape)
    queue = [reference]
    while len(queue) > 0:
        item = queue.pop()
        # If it doesn't exist in our map, continue
        if min(item) < 0 or item[0] >= map.shape[0] or item[1] >= map.shape[1]:
            continue
        # If it's not part of the edge, skip
        if not map[item]:
            continue
        map[item] = False
        ret[item] = True
        for x in [-1, 0, 1]:
            for y in [-1, 0, 1]:
                if x == y:
                    continue
                new_point = (item[0] + x, item[1] + y)
                queue.append(new_point)

    return ret



def removeBG(img, min_threshold_percentage = 1):

    ### Find dominate colours
    pixels = img.shape[0] * img.shape[1]
    # Turn colors into unique single integer values 
    colormap = img[:,:,0] + img[:,:,1] * 256 + img[:,:,2] * 256**2

    # flatten the map
    linear_colours = np.reshape(colormap[img[:,:,3] == 255], (pixels))
    # Get bins
    linear_colours = np.sort(linear_colours)
    bins = np.bincount(linear_colours)
    bins = bins[bins != 0]
    
    # Make threshold and remove values under threshold
    threshold_value = len(bins) * min_threshold_percentage / 100
    keepers = np.less_equal(np.arange(len(bins)), threshold_value)
    colors = np.unique(linear_colours)[keepers]

    ### Remove by dominant colours from outter edge
    # get the edges based on transparency
    #   In most cases, especially for BG removal, this should be pointless
    #   However, if the image in question has transparent edges, this might help
    existing_edges = __getEdges(img[:,:,3])
    existing_edges[-1,:] = True
    existing_edges[:,-1] = True
    
    # get truth map of all colors
    transparency_map = np.isin(colormap, colors)

    # get edges of transparency map
    transparency_edges = __getEdges(transparency_map == False)

    # find overlaps with existing transparency edges
    overlapping_points = np.logical_and(transparency_edges, existing_edges)

    # separate the regions
    islands = []
    while overlapping_points.any():
        points = overlapping_points.nonzero()
        for i in range(len(points[0])):
            reference = (points[0][i], points[1][i])
            addition = __getIslandTrace(transparency_edges, reference)
            if addition.any():
                islands.append(addition)


        overlapping_points = np.logical_and(transparency_edges, existing_edges)

    # fill the islands
    for i in range(len(islands)):
        islands[i] = __fillIsland(islands[i])
    





    