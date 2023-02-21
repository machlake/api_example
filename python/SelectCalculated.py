"""
Example For Select Calculated Data for tag API by using request in python
written by yeony kim
"""

import requests

API_KEY = "YOUR_API_TOKEN"
LAKE_ID = "YOUR_LAKE_ID"
CLOUD_VENDOR="CLOUD_VENDOR"
CLOUD_REGION="CLOUD_REGION"

URL = f"https://{CLOUD_VENDOR}.{CLOUD_REGION}.machlake.com/v1/lakes/{LAKE_ID}/values"

SELECT_TYPE="calc"
TAG_NAME="sensor1,sensor2"

headers = {
    "Content-Type": "application/json",
    "x-api-key": API_KEY
}


# ------------------------------------------------------------------------------------------------- #

# CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min

params = {
    "type": SELECT_TYPE,
    "tag_name": TAG_NAME,
    "calc_mode": "min",
    "date_format": "YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn",
    "start_time": "2021-01-06 17:00:00 000:000:000",
    "end_time": "2021-01-06 21:00:00 000:000:000"
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "success",
#     "data":{
#         "columns":[
#             {"name":"NAME","type":5,"length":80},
#             {"name":"TIME","type":5,"length":4096},
#             {"name":"VALUE","type":20,"length":17}
#         ],
#         "rows":[
#             ["sensor1","2021-01-06 17:00:00 000:000:000",1],
#             ["sensor2","2021-01-06 17:00:00 000:000:000",1],
#             ["sensor2","2021-01-06 17:00:01 000:000:000",1.5],
#             ["sensor2","2021-01-06 17:00:02 000:000:000",2],
#             ["sensor2","2021-01-06 17:00:03 000:000:000",1],
#             ["sensor2","2021-01-06 17:00:04 000:000:000",1.5],
#             ["sensor2","2021-01-06 17:00:05 000:000:000",2],
#             ["sensor1","2021-01-06 18:00:00 000:000:000",2],
#             ["sensor2","2021-01-06 18:00:00 000:000:000",2],
#             ["sensor1","2021-01-06 20:00:04 000:000:000",2],
#             ["sensor2","2021-01-06 20:00:04 000:000:000",2],
#             ["sensor1","2021-01-06 20:00:05 000:000:000",2.5],
#             ["sensor2","2021-01-06 20:00:05 000:000:000",2.5],
#             ["sensor1","2021-01-06 20:00:06 000:000:000",2]
#             ["sensor2","2021-01-06 20:00:06 000:000:000",2]
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=max and interval_value=3

params = {
    "type": SELECT_TYPE,
    "tag_name": TAG_NAME,
    "calc_mode": "max",
    "date_format": "YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn",
    "start_time": "2021-01-06 17:00:00 000:000:000",
    "end_time": "2021-01-06 21:00:00 000:000:000",
    "interval_value": 3
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8")) 

# Return Format
# {
#     "success": true,
#     "reason": "success",
#     "data":{
#         "columns":[
#             {"name":"NAME","type":5,"length":80},
#             {"name":"TIME","type":5,"length":4096},
#             {"name":"VALUE","type":20,"length":17}
#         ],
#         "rows":[
#             ["sensor2","2021-01-06 17:00:00 000:000:000",2],
#             ["sensor1","2021-01-06 17:00:00 000:000:000",2],
#             ["sensor2","2021-01-06 17:00:03 000:000:000",2],
#             ["sensor2","2021-01-06 18:00:00 000:000:000",2.5],
#             ["sensor1","2021-01-06 18:00:00 000:000:000",2.5],
#             ["sensor2","2021-01-06 20:00:03 000:000:000",2.5],
#             ["sensor1","2021-01-06 20:00:03 000:000:000",2.5],
#             ["sensor2","2021-01-06 20:00:06 000:000:000",2],
#             ["sensor1","2021-01-06 20:00:06 000:000:000",2]
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min and interval_type=m and interval_value=90

params = {
    "type": SELECT_TYPE,
    "tag_name": TAG_NAME,
    "calc_mode": "min",
    "date_format": "YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn",
    "start_time": "2021-01-06 17:00:00 000:000:000",
    "end_time": "2021-01-06 21:00:00 000:000:000",
    "interval_type": "m",
    "interval_value": 90
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "success",
#     "data":{
#         "columns":[
#             {"name":"NAME","type":5,"length":80},
#             {"name":"TIME","type":5,"length":4096},
#             {"name":"VALUE","type":12,"length":20}
#         ],
#         "rows":[
#             ["sensor1","2021-01-06 16:30:00 000:000:000",1],
#             ["sensor2","2021-01-06 16:30:00 000:000:000",1],
#             ["sensor1","2021-01-06 18:00:00 000:000:000",1],
#             ["sensor2","2021-01-06 18:00:00 000:000:000",1],
#             ["sensor1","2021-01-06 19:30:00 000:000:000",1],
#             ["sensor2","2021-01-06 19:30:00 000:000:000",1],
#         ]
#     }
# }
