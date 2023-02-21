"""
Example For Get Tag View API by using requests in python
written by yeony kim
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
CLOUD_VENDOR="CLOUD_VENDOR"
CLOUD_REGION="CLOUD_REGION"

URL = f"https://{CLOUD_VENDOR}.{CLOUD_REGION}.machlake.com/v1/lakes/{LAKE_ID}/tag"

headers = {
    "Content-Type": "application/json",
    "x-api-key": API_KEY
}


# ------------------------------------------------------------------------------------------------- #

# CASE - Get Tag Information

params = {
    "name": "sensor1"
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "get tag meta success",
#     "data": {"name": "sensor01"}
# }


# ------------------------------------------------------------------------------------------------- #

# CASE - Get Tag Information when no exist tag name

params = {
    "name": "wrong_name"
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# status code : 400 Bad Request
# {
#     "success": false,
#     "reason": "no such name : wrong_name"
# }
