"""
Example For Delete Calculated Data for tag API by using request in python
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

DELETE_TYPE="calc"


# ------------------------------------------------------------------------------------------------- #

# CASE - Delete Calculated Data

params = {
    "type": DELETE_TYPE,
    "base_time": "2021-01-06 18:00:00 000:000:000" # or BASE_TIME="1609930800"
}

response = requests.delete(URL, headers=headers, params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "delete value success"
# }
