"""
Example For Select Data by Time Range for tag API by using request in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUT_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
URL = f"https://{LAKE_ID}.machlake.com/lakes/values/time_range"

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

# CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

params = {
    'tag_name': 'sensor1',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"columns":[{"length":4096,"name":"MIN","type":5},{"length":4096,"name":"MAX","type":5}],"samples":[{"data":[{"MAX":"2021-01-06 20:00:06 000:000:000","MIN":"2021-01-06 17:00:00 001:000:000"}],"tag_name":"sensor1"}]},"status":"success"}


# CASE - Current DATA GET with date format nanosecond timestamp

params = {
    'tag_name': 'sensor1,sensor2',
    'date_format': 'NANOSECOND',
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"columns":[{"length":20,"name":"MIN","type":12},{"length":20,"name":"MAX","type":12}],"samples":[{"data":[{"MAX":1609952400009000000,"MIN":1609920000000000000}],"tag_name":"sensor2"},{"data":[{"MAX":1609930806000000000,"MIN":1609920000001000000}],"tag_name":"sensor1"}]},"status":"success"}

