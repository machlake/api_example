"""
Example For Get Tag View API by using requests in python
written by yeony kim
"""

import requests

LAKE_ID = "YOUR_LAKE_ID"
API_KEY = "YOUR_API_TOKEN"
CLOUD_VENDOR="CLOUD_VENDOR"
CLOUD_REGION="CLOUD_REGION"

URL = f"https://{CLOUD_VENDOR}.{CLOUD_REGION}.machlake.com/v1/lakes/{LAKE_ID}/values"

headers = {
    "Content-Type": "application/json",
    "x-api-key": API_KEY
}

SELECT_TYPE="stat"


# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag

params = {
    "type": SELECT_TYPE,
    "name": "sensor1"
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "success",
#     "data": {
#         "columns": [
#             {"name":"NAME","type":5,"length":100},
#             {"name":"ROW_COUNT","type":112,"length":20},
#             {"name":"MIN_VALUE","type":20,"length":17},
#             {"name":"MAX_VALUE","type":20,"length":17},
#             {"name":"MIN_TIME","type":5,"length":4096},
#             {"name":"MAX_TIME","type":5,"length":4096},
#             {"name":"MIN_VALUE_TIME","type":5,"length":4096},
#             {"name":"MAX_VALUE_TIME","type":5,"length":4096},
#             {"name":"RECENT_ROW_TIME","type":5,"length":4096}
#         ],
#         "rows": [
#             ["sensor1",103277000,0,3999,"2022-07-05 14:14:08","2022-07-06 12:15:11","2022-07-06 12:15:04","2022-07-06 12:14:35","2022-07-06 12:15:11"]
#         ]
#     }
# }


# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag with date_format

params = {
    "type": SELECT_TYPE,
    "name": "sensor1",
    "date_format": "MS" # MILLISECOND
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "success",
#     "data": {
#         "columns": [
#             {"name":"NAME","type":5,"length":100},
#             {"name":"ROW_COUNT","type":112,"length":20},
#             {"name":"MIN_VALUE","type":20,"length":17},
#             {"name":"MAX_VALUE","type":20,"length":17},
#             {"name":"MIN_TIME","type":12,"length":20},
#             {"name":"MAX_TIME","type":12,"length":20},
#             {"name":"MIN_VALUE_TIME","type":12,"length":20},
#             {"name":"MAX_VALUE_TIME","type":12,"length":20},
#             {"name":"RECENT_ROW_TIME","type":12,"length":20}
#         ],
#         "rows": [
#             ["sensor1",103277006,0,3999,1675142048271,1676596324000,1675653288184,1675653301116,1676596324000]
#         ]
#     }
# }


# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag about not exist

params = {
    "type": SELECT_TYPE,
    "name": "OTHER_NAME"
}

response = requests.get(URL, headers=headers,  params=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "success",
#     "data": {
#         "columns": [
#             {"name":"NAME","type":5,"length":100},
#             {"name":"ROW_COUNT","type":112,"length":20},
#             {"name":"MIN_VALUE","type":20,"length":17},
#             {"name":"MAX_VALUE","type":20,"length":17},
#             {"name":"MIN_TIME","type":5,"length":4096},
#             {"name":"MAX_TIME","type":5,"length":4096},
#             {"name":"MIN_VALUE_TIME","type":5,"length":4096},
#             {"name":"MAX_VALUE_TIME","type":5,"length":4096},
#             {"name":"RECENT_ROW_TIME","type":5,"length":4096}
#         ],
#         "rows": []
#     }
# }
