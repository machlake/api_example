"""
Example For Create LAKE API by using request in python
written by yeony kim
"""

import requests

API_KEY = "YOUR_API_TOKEN"
URL = f"https://api.machlake.com/lakes"

# CASE - CASE - create LAKE

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

params = {
    'lake_info': {
        'lake_name': "sample_lake",
        'lake_plan': "basic",
        'owner': "YOUR_MACHLAKE_ID",
        'region': "YOUR_REGION",
        'timezone': "YOUR_TIMEZONE",
        'storage_size': 20
    },
    'tag_schema': [
        {'col_name': "name", 'col_type': "varchar", 'col_length': 40}
    ],
    'value_schema': [
        {'col_name': "time", 'col_type': "datetime"},
        {'col_name': "value", 'col_type': "double"}
    ]
}

response = requests.post(URL, headers=headers, json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":"YOUR_LAKE_ID","status":"success"}
