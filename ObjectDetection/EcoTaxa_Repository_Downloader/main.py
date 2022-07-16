# Shay Konradsdottir 20220714 Created
'''
Setup for powershell:
python -m venv venv
./venv/Scripts/Activate.ps1
pip install git+https://github.com/ecotaxa/ecotaxa_py_client.git
python -i main.py
'''

import sys

ProjectID = 4599
if len(sys.argv) > 0:
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
# Get project metadata
projectVals = projectsAPI.project_query(ProjectID)
# Get a sample object in this list
sample = objectAPI.object_query(objectsList.object_ids[0])

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

print("Starting download (" + str(objectsList.total_ids) + " items total)")
classifications = {}
for i in range(objectsList.total_ids):
    sampleOBJ = objectAPI.object_query(objectsList.object_ids[i])
    classification = taxasAPI.query_taxa(sampleOBJ["classif_id"])["display_name"]

    increment_val = 0
    pattern = r'[^A-Za-z0-9]+'
    classification = re.sub(pattern, '-', classification)
    if classification in classifications.keys():
        classifications[classification] += 1
        increment_val = classifications[classification]
    else:
        classifications[classification] = 0
    
    class_num = list(classifications.keys()).index(classification)
    save_file_base = classification + "_" + str(increment_val)

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
        with open(training_images_loc + save_file + ".jpg", "wb") as handler:
            handler.write(img_data)
        with open(training_labels_loc + save_file + ".txt", "w") as handler:
            line = str(class_num) + " .5 .5 .5 .5" # Assuming full image
            handler.write(line)
    print("Finished item " + str(i) + " of " + str(objectsList.total_ids) + ". " + str(total_images - skipped_images) + "/" + str(total_images) + " images fetched. Classification: " + classification + " #" + str(1+increment_val))

print("Making configuration file")
print(str(list(classifications.keys())))
with open(cwd + "/config.yaml", "w") as handler:
    line = """# YOLOv5 configurations file
# SK 20220715
train: """ + training_images_loc + """
val: """ + training_images_loc + """

nc = """ + str(len(classifications.keys())) + """
names: """ + str(list(classifications.keys())) + """

# EOF
    """
    handler.write(line)

        
        
