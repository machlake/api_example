"""
Example For Insert Bulk Data for tag API by using request in python
written by yeony kim
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
CLOUD_VENDOR="CLOUD_VENDOR"
CLOUD_REGION="CLOUD_REGION"

URL = f"https://{CLOUD_VENDOR}.{CLOUD_REGION}.machlake.com/v1/lakes/{LAKE_ID}/values"

headers = {
    "Content-Type": "application/json",
    "x-api-key": API_KEY
}


# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Data with nano date time string format

params = {
    "date_format": "YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn",
    "values": [
        ["sensor1","2021-01-06 18:00:00 001:000:000", 2.0], 
        ["sensor1","2021-01-06 18:00:00 002:000:000", 2.5], 
        ["sensor1","2021-01-06 18:00:00 003:000:000", 2.0], 
        ["sensor2","2021-01-06 18:00:00 001:000:000", 2.0], 
        ["sensor2","2021-01-06 18:00:00 002:000:000", 2.5], 
        ["sensor2","2021-01-06 18:00:00 003:000:000", 2.0]
    ]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "append success",
#     "data": {"fail": 0,"success": 6}
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Data with nano date time stamp

params = {
    "values": [
        ["sensor1", 1609930804000000000, 2.0], 
        ["sensor1", 1609930805000000000, 2.5], 
        ["sensor1", 1609930806000000000, 2.0], 
        ["sensor2", 1609930804000000000, 2.0], 
        ["sensor2", 1609930805000000000, 2.5], 
        ["sensor2", 1609930806000000000, 2.0]
    ]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "append success",
#     "data": {"fail": 0,"success": 6}
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Data with UTC-0 timezone

params = {
    "timezone": "Africa/Abidjan",
    "values": [
        ["sensor1","2021-01-06 18:00:00 001:000:000", 2.0], 
        ["sensor1","2021-01-06 18:00:00 002:000:000", 2.5], 
        ["sensor1","2021-01-06 18:00:00 003:000:000", 2.0], 
        ["sensor2","2021-01-06 18:00:00 001:000:000", 2.0], 
        ["sensor2","2021-01-06 18:00:00 002:000:000", 2.5], 
        ["sensor2","2021-01-06 18:00:00 003:000:000", 2.0]
    ]
}

response = requests.post(URL, headers=headers,  json=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "append success",
#     "data": {"fail": 0,"success": 6}
# }
