# The purpose of this script is to split the YOLO directories into equally partitioned folders
# You can also use this script to exclude classes

# -exclude      Begins a list of items to exclude.
# -silent       No user input required for run
# -size [%]     Split size by percentage (integer 1-99) of base (default 50)
# -scramble     Randomize the items put into each list
# -dirs [#]     How many directories to make. If left blank, will perform as many as size allows
from curses.ascii import isdigit
import os
import random
import shutil
import yaml
import sys

# Parameter processing
exclude_list = []
start_exclude = False
silent_run = False
skip_next = False
size = 50
dirs = 2
scramble = False

for arg_i in range(sys.argv):
    if skip_next:
        skip_next = False
        continue
    arg = sys.argv[arg_i]
    if arg.lower() == "-silent":
        silent_run = True
    elif arg.lower() == "-dirs":
        if len(sys.argv) > arg_i:
            s = sys.argv[arg_i + 1]
            if s.isnumeric():
                s = int(s)
                if s < 0:
                    print("There must be at least 1 directory.")
                else:
                    dirs = s
                    print("Number of directories: " + str(dirs))
            else:
                print("Dirs must be followed by an integer (1+)")
        else:
            print("Dirs must be followed by an integer (1+)")
        skip_next = True
    elif arg.lower() == "-scramble":
        scramble = True
    elif arg.lower() == "-size":
        if len(sys.argv) > arg_i:
            s = sys.argv[arg_i + 1]
            if s.isnumeric():
                s = int(s)
                if s > 99 or s < 1:
                    print("Size outside of range (1-99)")
                else:
                    size = s
                    print("Size set to: " + str(size) + "\%")
            else:
                print("Size must be followed by an integer (1-99)")
        else:
            print("Size must be followed by an integer (1-99)")
        skip_next = True
    elif start_exclude:
        exclude_list.append(arg)
    elif arg.lower() == "-exclude" and not start_exclude:
        start_exclude = True
if dirs * size > 100:
    print("Dirs * Size > 100\%, scramble turned on")
    scramble = True
if len(exclude_list) > 0:
    print("Excluding: " + str(exclude_list))



# Get working environment
cwd = os.getcwd()

# Load config file
with open("config.yaml", "r") as stream:
    try:
        config = yaml.safe_load(stream)
    except yaml.YAMLError as err:
        print(err)
        sys.exit()

# directory swapping helper function
def swap_dirs(directory, to_img = True):
    num_str = os.path.basename(os.path.dirname(directory + "\\..\\")).split("_")
    use_num = False
    if len(num_str) > 0:
        num_str = num_str[-1]
        use_num = True

    loc = os.path.abspath(directory + "\\..\\..\\")
    if to_img:
        loc += "images"
    else:
        loc += "labels"

    if use_num:
        loc += "_" + num_str

    return loc + "\\train\\"

# directory maker helper function
def make_dirs(directory, number):
    print("""Preparing directories in : """ + directory + """
        images_""" + str(number) + """
            test
            train
            val
        labels_""" + str(number) + """
            test
            train
            val
    """)
    for parent in ['images', 'labels']:
        for child in ['test', 'train', 'val']:
            directory_name = directory + "/" + parent + "_" + str(number) + "/" + child
            
            if os.path.isdir(directory_name):
                print(str(parent) + "_" + str(number) + " already exists. Deleting files.")
                for file in os.listdir(directory_name):
                    if os.path.isfile(file):
                        os.remove(file)

            os.makedirs(directory_name, exist_ok=True)
    return directory + "/" + "images_" + str(number) + "/train"

# find the associated image of a file helper function
def get_paired_file(full_filepath, to_img = False):
    dir = os.path.dirname(full_filepath)
    img_folder = swap_dirs(dir, to_img)
    filename = os.path.splitext(os.path.basename(full_filepath))[0]
    for path, dirname, fn in os.walk(img_folder):
        if filename in fn:
            return img_folder + fn
    raise FileNotFoundError("No image file found for " + str(full_filepath))




# load base directories
image_dir = config['train']
label_dir = swap_dirs(image_dir, False)

# create class directory
classIDs = {}
classCounts = {}
for i in range(config['nc']):
    class_name = config['names'][i]
    # don't add classes from exclusion list
    if len(exclude_list) > 0 or class_name in exclude_list:
        continue
    classIDs[i] = config['names'][i]
    classCounts[i] = 0

file_list = {}
# get number of each class
for file in os.listdir(label_dir):
    if os.path.isfile(file):
        if ".txt" in os.path.splitext(file):
            with open(file) as f:
                line = f.read()
                class_ID = line.split(" ")[0]
                if class_ID.isnumeric() and int(class_ID) in classCounts:
                    classCounts[int(class_ID)] += 1
                    if not int(class_ID) in file_list:
                        file_list[int(class_ID)] = []
                    file_list[int(class_ID)].append(label_dir + "\\" + file)

# allow user to delete if needed
if not silent_run:
    continue_exclusions = False
    while not continue_exclusions:
        print("Select item(s) to be excluded from processing (comma delimited)")
        print("Input \"continue\" to continue the program")
        print("Option #: Class Name")
        for key in classIDs.keys():
            print(key + ":\t" + classIDs[key])
        print("--- end of classes ---")
        items = input("Enter classes numbers to exclude: ")
        if len(items) > 0:
            items = items.split(",")
            for item in items:
                item = item.strip()
                if item.lower() == "continue":
                    continue_exclusions = True
                # Remove the item if it exists
                elif item in classIDs.keys():
                    class_length = len(classIDs)
                    classIDs = {key:val for key, val in classIDs.items() if key != item}
                    if class_length > len(classIDs):
                        print("Class excluded:\t" + item)

# Displaying number of items
print("Count of each file type to be processed: ")
for id in classIDs.keys():
    print(classIDs[id] + ":\t" + str(classCounts[id]))

# Get the number of objects per class
object_percs = {}
object_indexes = {}
for id in classCounts.keys():
    # minimum of 1 of each file will be used
    # number of items in the class * size % / number of classes
    object_percs[id] = max(1, (classCounts[id] * size/100) / len(classIDs))
    # index used to track each object, if scramble is false
    object_indexes[id] = 0

print("Total number of items per directory: " + str(sum(object_percs.values())))

# Starting the splitting process
for i in range(dirs):
    # Creating directories based on number of dirs requested
    current_dir = make_dirs(cwd, i)

    # Get new directories
    img_dir = swap_dirs(current_dir, True)
    files_dir = swap_dirs(current_dir, False)

    for id in classIDs.keys():
        # get starting index for this directory
        index = object_indexes[id]
        if scramble:
            index = random.randint(0, classCounts[id]-1)
        
        for __i in range(object_percs[id]):
            file_name = file_list[index]
            # Get original files
            image_loc = get_paired_file(file_name, True)
            file_loc = get_paired_file(file_name, False)
            # Copy files over
            shutil.copy(image_loc, img_dir + os.path.basename(image_loc))
            shutil.copy(file_loc, files_dir + os.path.basename(file_loc))

            # increment object indexes (if needed) or get random one
            if scramble:
                index = random.randint(0, classCounts[id]-1)
            else:
                object_indexes[id] += 1
                if object_indexes >= classCounts[id]:
                    object_indexes = 0
    print("Finished directory: " + os.path.basename(current_dir + "\\..\\"))

    # TODO: Make the configuration file

        

    

    

