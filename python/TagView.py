"""
Example For Get Tag View API by using requests in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
CLOUD_VENDOR="CLOUD_VENDOR"
CLOUD_REGION="CLOUD_REGION"

URL = f"https://{CLOUD_VENDOR}.{CLOUD_REGION}.machlake.com/lakes/{LAKE_ID}/tag"

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

# CASE - Get Tag Information

params = {
    'name': 'sensor'
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"message":"no such name : sensor","status":"error"}

# CASE - Get Tag Information

params = {
    'name': 'sensor1'
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"name":"sensor1"},"status":"success"}