"""
Example For Delete Tag API by using requests in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "c5ehcdmcb0jc72ia6pug"
URL = f"https://{LAKE_ID}.machlake.com/lakes/tags"
headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

# CASE - delete error when no exist tag name

params = {
    'name': 'sensor',
}

response = requests.delete(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"message":"no such name : sensor","status":"error"}

# CASE - delete tag

params = {
    'name': 'sensor1',
}

response = requests.delete(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{},"status":"success"}

# CASE - delete tag

params = {
    'name': 'sensor2',
}

response = requests.delete(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{},"status":"success"}
