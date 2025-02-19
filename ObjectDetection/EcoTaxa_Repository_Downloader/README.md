# EcoTaxa Repo Downloader

This is a python utility for downloading [EcoTaxa](https://ecotaxa.obs-vlfr.fr) repositories using the [EcoTaxa API](https://ecotaxa.obs-vlfr.fr/api) through the [python hookup](https://github.com/ecotaxa/ecotaxa_py_client) .

## Setup
I recommend making a virtual environment. This is the code I ran on my machine to get everything set up and running as is:
```
python -m venv venv

./venv/Scripts/Activate.ps1

pip install git+https://github.com/ecotaxa/ecotaxa_py_client.git

python -i main.py
```
Note the `-i` argument allows you to continue in Python with all the variables you've left off with and is entirely unnecessary.

While running, you'll be asked for your EcoTaxa username and password (password is hidden). I think it's weird and definitely a security issue, sorry.

## Settings
There's a lot of weird stuff in the python file that I left in. The initial file is copied off of the python hookup's sample page. I tried to separate out the key piece of information that's actually important for us, which is the project ID. 

The default project is [Planktoscope-OEAS-ODU](https://ecotaxa.obs-vlfr.fr/prj/4599).

```
python main.py [projectID]
```
example:
```
python main.py 4599
```

You can find a project ID in the URL. Project 4599 is "Planktoscope-OEAS-ODU", as seen in the URL:
ht<span>tp://e</span>cota<span>xa.</span>obs-vl<span>fr.</span>fr/prj/<b>4599</b>

## Running
You'll be prompted to enter a username and password. These are the credentials on the EcoTaxa website. Following your credentials, the script creates the YOLO training directories:
```
images
+ test
+ train
+ val
labels
+ test
+ train
+ val
```
The script will use the filenames of fetched images to determine class ID orders. It will skip the image saving and metadata creation portions of the process and resume the run from where it left off. The script will print a status update with every object saved or skipped (and the reason it was skipped) to the console. It will create 2 files, an image with the class descriptor in images/train, and a metadata file that references the classification ID in labels/train. Some samples have multiple images. An image will be skipped if it cannot be accessed or if it is already saved, and the number of saved images is given in the status updates.

Lastly, the script makes a configuration file with a list of all of the classes in their ID order as well as the locations of the training images.

### Need help?
shay.konradsdottir@ama-inc.com
