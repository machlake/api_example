"""
Example For Delete All Data for tag API by using request in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
URL = f"https://{LAKE_ID}.machlake.com/lakes/values/raw"

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

# CASE - Delete All Data

params = {
}

response = requests.delete(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{},"status":"success"}

