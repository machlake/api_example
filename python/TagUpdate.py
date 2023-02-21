"""
Example For Update Tag API by using requests in python
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

# CASE - Update Tag Name

params = {
    "name": "sensor1",
    "columns": [
        {"col_name": "name", "value": "sensor10"}
    ]
}

response = requests.put(URL, headers=headers,  json=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "update tag meta success",
#     "data":{"name":"sensor10"}
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Update Tag additional column
# columns
# name (varchar, 80), location (varchar, 40)

params = {
    "name": "sensor2",
    "columns": [
        {"col_name": "location", "value": "4F-101"}
    ]
}

response = requests.put(URL, headers=headers,  json=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "update tag meta success",
#     "data": {
#         "location": "4F-101",
#         "name": "sensor02"
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Update Tag when not exist tag

params = {
    "name": "wrong_name",
    "columns": [
        {"col_name": "location", "value": "4F-102"}
    ]
}

response = requests.put(URL, headers=headers,  json=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# status code : 400 Bad Request
# {
#     "success": false,
#     "reason": "no such name : wrong_name"
# }
