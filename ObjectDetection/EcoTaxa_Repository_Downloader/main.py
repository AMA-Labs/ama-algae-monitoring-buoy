# Shay Konradsdottir 20220714 Created
'''
Setup for powershell:
python -m venv venv
./venv/Scripts/Activate.ps1
pip install git+https://github.com/ecotaxa/ecotaxa_py_client.git
python -i main.py
'''

import sys

# You can change the project with an argument
ProjectID = 4599
if len(sys.argv) > 0 and sys.argv[0].isnumeric():
    ProjectID = int(sys.argv[0])


from fileinput import filename
import time
import ecotaxa_py_client
from pprint import pprint
from ecotaxa_py_client.api import files_api, projects_api, objects_api, object_api, taxonomy_tree_api
from ecotaxa_py_client.model.directory_model import DirectoryModel
from ecotaxa_py_client.model.http_validation_error import HTTPValidationError
from ecotaxa_py_client.model.project_filters import ProjectFilters

from ecotaxa_py_client.api import authentification_api
from ecotaxa_py_client.model.login_req import LoginReq
import getpass
import os
import requests
import unicodedata
import re

# Defining the host is optional and defaults to https://ecotaxa.obs-vlfr.fr/api
# See configuration.py for a list of all supported configuration parameters.
configuration = ecotaxa_py_client.Configuration(
    host = "https://ecotaxa.obs-vlfr.fr/api",
    discard_unknown_keys = True
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure OAuth2 access token for authorization :
# You need to call the login api, [ https://github.com/ecotaxa/ecotaxa_py_client/blob/main/docs/AuthentificationApi.md#login | doc here ] .
# You should use your login and password from the ecotaxa webapp (if you are not registrated please sing up through [ https://ecotaxa.obs-vlfr.fr/login | this page ] ).
# This api call will return you a JWT token, you will use it as : YOUR_ACCESS_TOKEN for the following calls.

print("logging in")
# Enter a context with an instance of the API client
with ecotaxa_py_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = authentification_api.AuthentificationApi(api_client)
    #setup your credentials
    
    login_req = LoginReq(
        username=input("username: "),
        password=getpass.getpass(prompt='password: '),
    ) # LoginReq | 

    # example passing only required values which don't have defaults set
    try:
        # Login
        api_response_token = api_instance.login(login_req)
        pprint(api_response_token)
        #set YOUR_ACCESS_TOKEN configuration
        configuration.access_token = api_response_token
    except ecotaxa_py_client.ApiException as e:
        print("Exception when calling AuthentificationApi->login: %s\n" % e)

api_client = ecotaxa_py_client.ApiClient(configuration)
print("api_instance = projects_api.ProjectsApi(api_client)")
objectsListAPI = objects_api.ObjectsApi(api_client)
objectAPI = object_api.ObjectApi(api_client)
projectsAPI = projects_api.ProjectsApi(api_client)
taxasAPI = taxonomy_tree_api.TaxonomyTreeApi(api_client)

# Get all the objects in this project
objectsList = objectsListAPI.get_object_set(ProjectID, ProjectFilters())

# Get project metadata (unused atm)
projectVals = projectsAPI.project_query(ProjectID)

# Setup the save directories 
cwd = os.getcwd()
print("""Creating directories in : """ + cwd + """
    images
        test
        train
        val
    labels
        test
        train
        val
""")

for parent in ['images', 'labels']:
    for child in ['test', 'train', 'val']:
        os.makedirs(cwd + "/" + parent + "/" + child, exist_ok=True)

training_images_loc = cwd + "/images/train/"
training_labels_loc = cwd + "/labels/train/"

# get all classification names used so far (if previous run used)
classification_names = {}
classifications = {}
pattern = r'[^A-Za-z0-9]+'
folder_contents = os.listdir(training_images_loc)

for file in folder_contents:
    class_id = os.path.basename(file).split("_")[0]
    if class_id.isnumeric():
        if not (int(class_id) in classification_names):
            classification = taxasAPI.query_taxa(int(class_id))["display_name"]
            classification = re.sub(pattern, '-', classification)
            classification_names[int(class_id)] = classification
            classifications[int(class_id)] = 0
        classifications[int(class_id)] += 1


# Print what we've started with
for classID in classification_names.keys():
    print("Found " + str(classifications[classID]) + " " + classification_names[classID])
starting_point = sum(classifications.values())
print("Found " + str(starting_point) + " previous entries.")

# Sorting our object IDs
sortedObjectList = list(objectsList.object_ids)
sortedObjectList.sort()

# Checking the first [starting_point] objects to organize our classifications in that order
print("Checking first " + str(starting_point) + " objects for classification ID ordering.")
classification_order = []
for i in range(starting_point):
    sampleOBJ = objectAPI.object_query(sortedObjectList[i])
    classid = sampleOBJ["classif_id"]
    if not classid in classification_order:
        classification_order.append(classid)
    if len(classification_order) == len(classifications):
        for key in classification_order:
            if not key in classifications.keys():
                print("New classification ID found, restart required.")
                starting_point = 0
                classifications = {}
                classification_names = {}
                classification_order = []
                break
        break

if len(classification_order) > 0:
    print("Reordering categories in order.")
    new_classifications = {}
    new_classifications_names = {}
    for x in classification_order:
        new_classifications[x] = classifications[x]
        new_classifications_names[x] = classification_names[x]
    classifications = new_classifications
    classification_names = new_classifications_names

print("Starting download (" + str(len(sortedObjectList)) + " items total)")
for i in range(starting_point, len(sortedObjectList)):
    sampleOBJ = objectAPI.object_query(sortedObjectList[i])
    classid = sampleOBJ["classif_id"]

    if classid in classifications.keys():
        classifications[classid] += 1
    else:
        classifications[classid] = 1
        classification = taxasAPI.query_taxa(int(classid))["display_name"]
        classification = re.sub(pattern, '-', classification)
        classification_names[classid] = classification
    
    increment_val = classifications[classid]
    classification = classification_names[classid]
    save_file_base = str(classid) + "_" + classification + "_" + str(sortedObjectList[i])

    skipped_images = 0
    total_images = len(sampleOBJ['images'])
    for img_index in range(total_images):
        save_file = save_file_base
        if total_images > 1:
            save_file = save_file_base + "_" + str(img_index)
        if os.path.exists(training_images_loc + save_file + ".jpg"):
            skipped_images += 1
            continue

        img_location = "https://ecotaxa.obs-vlfr.fr/vault/" + sampleOBJ['images'][img_index]['file_name']
        img_data = requests.get(img_location).content
        with open(training_labels_loc + save_file + ".txt", "w") as handler:
            line = str(list(classifications.keys()).index(classid)) + " .5 .5 .5 .5" # Assuming full image
            handler.write(line)
        with open(training_images_loc + save_file + ".jpg", "wb") as handler:
            handler.write(img_data)
    print("Finished item " + str(i+1) + " of " + str(len(sortedObjectList)) + ". " + str(total_images - skipped_images) + "/" + str(total_images) + " images fetched. Classification: " + classification + " #" + str(increment_val))

print("Making configuration file")
print(str(list(classifications.keys())))
with open(cwd + "/config.yaml", "w") as handler:
    line = """# YOLOv5 configurations file
# SK 20220715
train: """ + training_images_loc + """
val: """ + training_images_loc + """

nc = """ + str(len(classifications.keys())) + """
names: """ + str(list(classification_names.values())) + """

# EOF
    """
    handler.write(line)

        
        
