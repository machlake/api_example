"""
Example For Delete Tag API by using requests in python
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

# CASE - delete tag

params = {
    "name": "sensor",
}

response = requests.delete(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success":true,
#     "reason":"delete tag meta success"
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - delete error when no exist tag name

params = {
    "name": "wrong_name",
}

response = requests.delete(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# status code:400 Bad Request
# {
#     "success":false,
#     "reason":"no such name:wrong_name"
# }
