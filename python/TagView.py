"""
Example For Get Tag View API by using requests in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "c5ehcdmcb0jc72ia6pug"
URL = f"https://{LAKE_ID}.machlake.com/lakes/tag"

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