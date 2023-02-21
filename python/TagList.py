"""
Example For Get Tag List API by using requests in python
written by yeony kim
sensor1, sensor2 is applied in lake
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

# CASE - Select Tag with limit

params = {
    "limit": 3,
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8")) 

# Return Format
# {
#     "success": true,
#     "reason": "get tag meta list success",
#     "data":{
#         "tag":[
#             {"name":"sensor1"},
#             {"name":"sensor2"},
#             {"name":"door1"}
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag with Limit and Offset

params = {
    "limit": 1,
    "offset": 1
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "get tag meta list success",
#     "data":{
#         "tag":[
#             {"name":"sensor2"}
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag with name hint

params = {
    "name": "door",
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "get tag meta list success",
#     "data":{
#         "tag":[
#             {"name":"door1"}
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag about not exist

params = {
    "name": "wrong_name",
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "get tag meta list success",
#     "data": {
#         "tag": []
#     }
# }
