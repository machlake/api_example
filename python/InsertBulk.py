"""
Example For Insert Bulk Data for tag API by using request in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "c5ehcdmcb0jc72ia6pug"
URL = f"https://{LAKE_ID}.machlake.com/lakes/values/bulk"

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

# CASE - Insert Bulk Data with nano date time string format

params = {
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'values': [["sensor1","2021-01-06 18:00:00 001:000:000", 2.0], ["sensor1","2021-01-06 18:00:00 002:000:000", 2.5], ["sensor1","2021-01-06 18:00:00 003:000:000", 2.0], ["sensor2","2021-01-06 18:00:00 001:000:000", 2.0], ["sensor2","2021-01-06 18:00:00 002:000:000", 2.5], ["sensor2","2021-01-06 18:00:00 003:000:000", 2.0]]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"fail":0,"success":6},"status":"success"}


# CASE - Insert Bulk Data with nano date time string format


params = {
    'values': [["sensor1", 1609930804000000000, 2.0], ["sensor1", 1609930805000000000, 2.5], ["sensor1", 1609930806000000000, 2.0], ["sensor2", 1609930804000000000, 2.0], ["sensor2", 1609930805000000000, 2.5], ["sensor2", 1609930806000000000, 2.0]]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"fail":0,"success":6},"status":"success"}
