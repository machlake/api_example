"""
Example For Update Tag API by using requests in python
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

# CASE - Tag Name Change SRC to TAR / Tag Name Change Error when Not exist

params = {
    'name': 'sensor1',
    'columns': [{'col_name': "name", 'value': "sensor10"}]
}

response = requests.put(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"name":"sensor10"},"status":"success"}

# CASE - Tag Name Change TAR to SRC / Tag Name Change Error when Not exist

params = {
    'name': 'sensor10',
    'columns': [{'col_name': "name", 'value': "sensor1"}]
}

response = requests.put(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"name":"sensor1"},"status":"success"}

