# Import the os module, for the os.walk function
import os
from PIL import Image
 
# Set the directory you want to start crawling from
rootDir = 'CMSTemp/old'

# imageSize = (288,162)
imageSize = (225,225) # Works better

for dirName, subdirList, fileList in os.walk(rootDir):
    print('Found directory: %s' % dirName)
    for fname in fileList:
        print('\t%s' % fname)
        directoryy = dirName.replace("\\",'/')
        print(directoryy+'/'+fname)
        image = Image.open(str(directoryy+'/'+fname)) # concatenate the path to the image file
        print(image.size)
        image.thumbnail(imageSize) # .thumbnail() maintains the image's aspect ratio
        print(image.size)
        image.save(str(directoryy+'/'+fname))
        print('\n')
        