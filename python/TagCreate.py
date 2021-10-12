"""
Example For Create Tag API by using request in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
URL = f"https://{LAKE_ID}.machlake.com/lakes/tags"

# CASE - create TAG / tag duplicate error

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

params = {
    'tag': [['sensor1'], ['sensor2']],
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"success_count":2,"tag":[{"name":"sensor1"},{"name":"sensor2"}]},"status":"success"}
