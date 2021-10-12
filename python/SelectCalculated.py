"""
Example For Select Calculated Data for tag API by using request in python
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

# CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min

params = {
    'tag_name': 'sensor1,sensor2',
    'calc_mode': 'min',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'start_time': '2021-01-06 17:00:00 000:000:000',
    'end_time': '2021-01-06 21:00:00 000:000:000'
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"MIN","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:01 000:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:02 000:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:03 000:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:04 000:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:05 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}


# CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=max and interval_value=3

params = {
    'tag_name': 'sensor1,sensor2',
    'calc_mode': 'max',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'start_time': '2021-01-06 17:00:00 000:000:000',
    'end_time': '2021-01-06 21:00:00 000:000:000',
    'interval_value': 3
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"MAX","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:03 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:03 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:03 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}


# CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min and interval_type=m and interval_value=90

params = {
    'tag_name': 'sensor1,sensor2',
    'calc_mode': 'max',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'start_time': '2021-01-06 17:00:00 000:000:000',
    'end_time': '2021-01-06 21:00:00 000:000:000',
    'interval_type': 'm',
    'interval_value': 90
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"MAX","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 16:30:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 19:30:00 000:000:000","VALUE":2.5}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 16:30:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 19:30:00 000:000:000","VALUE":2.5}]}]},"status":"success"}

