"""
Example For Create Tag API by using request in python
written by yeony kim
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
CLOUD_VENDOR="CLOUD_VENDOR"
CLOUD_REGION="CLOUD_REGION"

URL = f"https://{CLOUD_VENDOR}.{CLOUD_REGION}.machlake.com/v1/lakes/{LAKE_ID}/tags"

headers = {
    "Content-Type": "application/json",
    "x-api-key": API_KEY
}


# ------------------------------------------------------------------------------------------------- #

# CASE - Create Tag

params = {
    "tag": [
        ["sensor1"], 
        ["sensor2"]
    ]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode("utf-8")) 

# Return Format
# {
#     "success":true,
#     "reason":"create tag success",
#     "data":{
#         "success_count":2,
#         "tag":[
#             {"name":"sensor1"},
#             {"name":"sensor2"}
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Create Tag with addition columns
# columns
# name (varchar, 80), location (varchar, 40)

params = {
    "tag":[
        ["sensor01", "3F-101"],
        ["sensor02", "3F-102"]
    ]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode("utf-8")) 

# Return Format
# {
#     "success":true,
#     "reason":"create tag success",
#     "data":{
#         "success_count":2,
#         "tag":[
#             {
#                 "location":"3F-101",
#                 "name":"sensor01"
#             },
#             {
#                 "location":"3F-102",
#                 "name":"sensor02"
#             }
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Create exist Tag

params = {
    "tag": [
        ["sensor1"]
    ]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode("utf-8")) 

# Return Format
# status code:400 Bad Request
# {
#     "success":false,
#     "reason":"Metadata key (sensor1) of TAGDATA table is already inserted."
# }
