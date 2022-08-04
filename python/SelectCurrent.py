"""
Example For Select Current Data for tag API by using request in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
CLOUD_VENDOR="CLOUD_VENDOR"
CLOUD_REGION="CLOUD_REGION"

URL = f"https://{CLOUD_VENDOR}.{CLOUD_REGION}.machlake.com/lakes/{LAKE_ID}/values/current"

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

# CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

params = {
    'tag_name': 'sensor1,sensor2',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-07 02:00:00 009:000:000","VALUE":2}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}


# CASE - Current DATA GET with another value form

params = {
    'tag_name': 'sensor1,sensor2',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'value_return_form': 1
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":{"TIME":["2021-01-06 20:00:06 000:000:000"],"VALUE":[2]}},{"tag_name":"sensor2","data":{"TIME":["2021-01-07 02:00:00 009:000:000"],"VALUE":[2]}}]},"status":"success"}


