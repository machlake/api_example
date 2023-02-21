"""
Example For Delete Single Data for tag API by using request in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
CLOUD_VENDOR="CLOUD_VENDOR"
CLOUD_REGION="CLOUD_REGION"

URL = f"https://{CLOUD_VENDOR}.{CLOUD_REGION}.machlake.com/v1/lakes/{LAKE_ID}/values"

headers = {
    "Content-Type": "application/json",
    "x-api-key": API_KEY
}

DELETE_TYPE="raw"


# -------------------------------------------------------------------------------------------------  #

# CASE - Delete Tag value with base_time

params = {
    "type": DELETE_TYPE,
    "tag_name": "sensor1",
    "base_time": "2021-01-06 18:00:00 000:000:000"
}

response = requests.delete(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "delete value success"
# }

# -------------------------------------------------------------------------------------------------  #

# CASE - Delete all Tag value

params = {
    "type": DELETE_TYPE
}

response = requests.delete(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format / not exist tag name in lake
# {
#     "success": true,
#     "reason": "delete value success"
# }

# -------------------------------------------------------------------------------------------------  #

# CASE - Delete Tag value when no exist tag name

params = {
    "type": DELETE_TYPE,
    "tag_name": "wrong_name"
}

response = requests.delete(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# status code : 400 Bad Request
# {
#     "success": false,
#     "reason": "Metadata of TAGDATA table is not found. (Key = wrong_name)"
# }
