"""
Example For Insert Standard Data for tag API by using request in python
written by yeony kim
sensor1, sensor2 is applied in lake
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
URL = f"https://{LAKE_ID}.machlake.com/lakes/values/standard"

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

# CASE - Insert Data with nano date time string format

params = {
    'tag_name': 'sensor1',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'values': [["2021-01-06 17:00:00 001:000:000", 1.0], ["2021-01-06 17:00:00 002:000:000", 1.5], ["2021-01-06 17:00:00 003:000:000", 2.0]]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"fail":0,"success":3},"status":"success"}

# CASE - Insert Data with time format is empty but data format in data is nano date time string

params = {
    'tag_name': 'sensor1',
    'values': [["2021-01-06 17:00:00 004:000:000", 1.0], ["2021-01-06 17:00:00 005:000:000", 1.5], ["2021-01-06 17:00:00 006:000:000", 2.0]]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"fail":0,"success":3},"status":"success"}


# CASE - Insert Data with utc-0 time zone and time format is empty but data format in data is nano date time string

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY,
    'Use-Timezone': 'Africa/Abidjan'
}

params = {
    'tag_name': 'sensor1',
    'values': [["2021-01-06 8:00:00 007:000:000", 1.0], ["2021-01-06 8:00:00 008:000:000", 1.5], ["2021-01-06 8:00:00 009:000:000", 2.0]]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"fail":0,"success":3},"status":"success"}


# CASE - Insert Data with date time string format

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY,
}

params = {
    'tag_name': 'sensor2',
    'date_format': 'YYYY-MM-DD HH24:MI:SS',
    'values': [["2021-01-06 17:00:00", 1.0], ["2021-01-06 17:00:01", 1.5], ["2021-01-06 17:00:02", 2.0]]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"fail":0,"success":3},"status":"success"}


# CASE - Insert Data with nano-timestamp

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY,
}

params = {
    'tag_name': 'sensor2',
    'values': [[1609920003000000000, 1.0], [1609920004000000000, 1.5], [1609920005000000000, 2.0]]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"fail":0,"success":3},"status":"success"}


# CASE - Insert Data with utc-0 time zone and date time string format but data format in data is nano date time string

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY,
    "Use-Timezone": "Africa/Abidjan"
}

params = {
    'tag_name': 'sensor2',
    'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    'values': [["2021-01-06 17:00:00 007:000:000", 1.0], ["2021-01-06 17:00:00 008:000:000", 1.5], ["2021-01-06 17:00:00 009:000:000", 2.0]]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"fail":0,"success":3},"status":"success"}
