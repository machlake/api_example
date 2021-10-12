"""
Example For Delete Single Data for tag API by using request in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "c5ehcdmcb0jc72ia6pug"
URL = f"https://{LAKE_ID}.machlake.com/lakes/values/raw"

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

# CASE - DELETE TAG DATA WITH TIME String

params = {
    'tag_name': 'sensor1',
    'base_time': "2021-01-06 18:00:00 000:000:000"
}

response = requests.delete(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{},"status":"success"}


# CASE - DELETE TAG DATA WITH second time stamp

params = {
    'tag_name': 'sensor2',
    'base_time': '1609930800'
}

response = requests.delete(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{},"status":"success"}


