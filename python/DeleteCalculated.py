"""
Example For Delete Calculated Data for tag API by using request in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
URL = f"https://{LAKE_ID}.machlake.com/lakes/values/calculated"

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

# CASE - Delete Calculated Data

params = {
    'base_time': "2021-01-06 18:00:00 000:000:000"
}

response = requests.delete(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{},"status":"success"}


# CASE - Delete Calculated Data WITH second time stamp

params = {
    'base_time': '1609930800'
}

response = requests.delete(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{},"status":"success"}


