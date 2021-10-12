"""
Example For Get Tag List API by using requests in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
URL = f"https://{LAKE_ID}.machlake.com/lakes/tags"
headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

# CASE - Select Tag

params = {
    'name': 'sensor1'
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"tag":[{"name":"sensor1"}]},"status":"success"}

# CASE - Select Tag with SQL Limit

params = {
    'name': 'sensor',
    'limit': 1
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"tag":[{"name":"sensor1"}]},"status":"success"}

# CASE - Select Tag with SQL Limit and SQL Offset

params = {
    'name': 'sensor',
    'limit': 1,
    'offset': 1
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"tag":[{"name":"sensor2"}]},"status":"success"}

# CASE - Select Tag about not exist

params = {
    'name': 'other_name',
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"tag":[]},"status":"success"}
