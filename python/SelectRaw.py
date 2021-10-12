"""
Example For Select Raw Data for tag API by using request in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
URL = f"https://{LAKE_ID}.machlake.com/lakes/values/raw"

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

params = {
    'tag_name': 'sensor1',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'start_time': '2021-01-06 17:00:00 000:000:000',
    'end_time': '2021-01-06 21:00:00 000:000:000'
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 001:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 002:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:00 004:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 005:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 006:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:00 007:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 008:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 009:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 001:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 002:000:000","VALUE":2.5},{"TIME":"2021-01-06 18:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}


# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS

params = {
    'tag_name': 'sensor1',
    'date_format': 'YYYY-MM-DD HH24:MI:SS',
    'start_time': '2021-01-06 17:00:00 000:000:000',
    'end_time': '2021-01-06 21:00:00 000:000:000'
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00","VALUE":1},{"TIME":"2021-01-06 17:00:00","VALUE":1.5},{"TIME":"2021-01-06 17:00:00","VALUE":2},{"TIME":"2021-01-06 17:00:00","VALUE":1},{"TIME":"2021-01-06 17:00:00","VALUE":1.5},{"TIME":"2021-01-06 17:00:00","VALUE":2},{"TIME":"2021-01-06 17:00:00","VALUE":1},{"TIME":"2021-01-06 17:00:00","VALUE":1.5},{"TIME":"2021-01-06 17:00:00","VALUE":2},{"TIME":"2021-01-06 18:00:00","VALUE":2},{"TIME":"2021-01-06 18:00:00","VALUE":2.5},{"TIME":"2021-01-06 18:00:00","VALUE":2},{"TIME":"2021-01-06 20:00:04","VALUE":2},{"TIME":"2021-01-06 20:00:05","VALUE":2.5},{"TIME":"2021-01-06 20:00:06","VALUE":2}]}]},"status":"success"}


# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS, data inserted with date skip mmm:uuu:nnn

params = {
    'tag_name': 'sensor1',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'start_time': '2021-01-06 17:00:00 000:000:000',
    'end_time': '2021-01-06 21:00:00 000:000:000'
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 001:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 002:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:00 004:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 005:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 006:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:00 007:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 008:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 009:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 001:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 002:000:000","VALUE":2.5},{"TIME":"2021-01-06 18:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}


# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS and with UTC-0 timezone

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY,
    "Use-Timezone": "Africa/Abidjan"
}

params = {
    'tag_name': 'sensor1',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'start_time': '2021-01-06 17:00:00 000:000:000',
    'end_time': '2021-01-06 21:00:00 000:000:000'
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":null},"status":"success"}


# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn and limit / offset / direction / value_retrun_form=0

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY,
}

params = {
    'tag_name': 'sensor1,sensor2',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'start_time': '2021-01-06 17:00:00 000:000:000',
    'end_time': '2021-01-06 21:00:00 000:000:000',
    'limit': 10,
    'offset': 5,
    'direction': 0,
    'value_return_form': 0
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 006:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:00 007:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 008:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 009:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 001:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 002:000:000","VALUE":2.5},{"TIME":"2021-01-06 18:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}


# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn and limit / offset / direction / value_retrun_form=0

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY,
}

params = {
    'tag_name': 'sensor1,sensor2',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'start_time': '2021-01-06 17:00:00 000:000:000',
    'end_time': '2021-01-06 21:00:00 000:000:000',
    'direction': 1,
    'value_return_form': 1
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":{"TIME":["2021-01-06 20:00:06 000:000:000","2021-01-06 20:00:05 000:000:000","2021-01-06 20:00:04 000:000:000","2021-01-06 18:00:00 003:000:000","2021-01-06 18:00:00 002:000:000","2021-01-06 18:00:00 001:000:000","2021-01-06 17:00:05 000:000:000","2021-01-06 17:00:04 000:000:000","2021-01-06 17:00:03 000:000:000","2021-01-06 17:00:02 000:000:000","2021-01-06 17:00:01 000:000:000","2021-01-06 17:00:00 000:000:000"],"VALUE":[2,2.5,2,2,2.5,2,2,1.5,1,2,1.5,1]}},{"tag_name":"sensor1","data":{"TIME":["2021-01-06 20:00:06 000:000:000","2021-01-06 20:00:05 000:000:000","2021-01-06 20:00:04 000:000:000","2021-01-06 18:00:00 003:000:000","2021-01-06 18:00:00 002:000:000","2021-01-06 18:00:00 001:000:000","2021-01-06 17:00:00 009:000:000","2021-01-06 17:00:00 008:000:000","2021-01-06 17:00:00 007:000:000","2021-01-06 17:00:00 006:000:000","2021-01-06 17:00:00 005:000:000","2021-01-06 17:00:00 004:000:000","2021-01-06 17:00:00 003:000:000","2021-01-06 17:00:00 002:000:000","2021-01-06 17:00:00 001:000:000"],"VALUE":[2,2.5,2,2,2.5,2,2,1.5,1,2,1.5,1,2,1.5,1]}}]},"status":"success"}

