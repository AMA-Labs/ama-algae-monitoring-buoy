# requirements:
#   opencv-python

import cv2
import numpy as np
import segmenter

BLACK_THRESHOLD = 10

img = cv2.imread('frame0.jpg', 1)

# converting to LAB color space
lab= cv2.cvtColor(img, cv2.COLOR_BGR2LAB)
l_channel, a, b = cv2.split(lab)

# Applying CLAHE to L-channel
# feel free to try different values for the limit and grid size:
clahe = cv2.createCLAHE(clipLimit=3.0, tileGridSize=(1,1))
cl = clahe.apply(l_channel)

# merge the CLAHE enhanced L-channel with the a and b channel
limg = cv2.merge((cl,a,b))

# Converting image from LAB Color model to BGR color spcae
enhanced_img = cv2.cvtColor(limg, cv2.COLOR_LAB2BGR)
enhanced_img = cv2.cvtColor(enhanced_img, cv2.COLOR_BGR2BGRA)

# removing super dark pixels as transparent
segmenter.removeBG(enhanced_img, 2)

cv2.imwrite('Result.png', enhanced_img)
