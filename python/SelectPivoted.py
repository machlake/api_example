"""
Example For Select Pivoted Data for tag API by using request in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "c5ehcdmcb0jc72ia6pug"
URL = f"https://{LAKE_ID}.machlake.com/lakes/values/pivoted"

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

# CASE - Pivoted DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

params = {
    'tag_name': 'sensor1',
    'calc_mode': 'min',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'start_time': '2021-01-06 17:00:00 000:000:000',
    'end_time': '2021-01-06 21:00:00 000:000:000'
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"MIN","columns":[{"name":"TIME","type":5,"length":4096},{"name":"sensor1","type":20,"length":17}],"samples":[{"data":[{"TIME":"2021-01-06 17:00:00 000:000:000","sensor1":1},{"TIME":"2021-01-06 18:00:00 000:000:000","sensor1":2},{"TIME":"2021-01-06 20:00:04 000:000:000","sensor1":2},{"TIME":"2021-01-06 20:00:05 000:000:000","sensor1":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","sensor1":2}]}]},"status":"success"}


# CASE - Pivoted DATA GET with another value form

params = {
    'tag_name': 'sensor1,sensor2',
    'calc_mode': 'cnt',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'start_time': '2021-01-06 17:00:00 000:000:000',
    'end_time': '2021-01-06 21:00:00 000:000:000',
    'value_return_form': 1
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"calc_mode":"COUNT","columns":[{"name":"TIME","type":5,"length":4096},{"name":"sensor1","type":12,"length":20},{"name":"sensor2","type":12,"length":20}],"samples":[{"data":{"TIME":["2021-01-06 17:00:00 000:000:000","2021-01-06 17:00:01 000:000:000","2021-01-06 17:00:02 000:000:000","2021-01-06 17:00:03 000:000:000","2021-01-06 17:00:04 000:000:000","2021-01-06 17:00:05 000:000:000","2021-01-06 18:00:00 000:000:000","2021-01-06 20:00:04 000:000:000","2021-01-06 20:00:05 000:000:000","2021-01-06 20:00:06 000:000:000"],"sensor1":[9,0,0,0,0,0,3,1,1,1],"sensor2":[1,1,1,1,1,1,3,1,1,1]}}]},"status":"success"}


