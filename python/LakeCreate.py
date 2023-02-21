"""
Example For Create LAKE API by using request in python
written by yeony kim
"""

import requests

API_KEY = "YOUR_API_TOKEN"
URL = f"https://api.machlake.com/v1/lakes"

headers = {
    "Content-Type": "application/json",
    "x-api-key": API_KEY
}


# ------------------------------------------------------------------------------------------------- #

# CASE - create LAKE

params = {
    "lake_info":{
        "lake_name":"sample_lake",
        "lake_plan":"basic",
        "region":"aws1.kor",
        "timezone":"Asia/Seoul",
        "storage_size":20
    },
    "tag_schema":[
        {"col_name":"name","col_type":"varchar","col_length":40},
    ],
    "value_schema":[
        {"col_name":"time","col_type":"datetime"},
        {"col_name":"value","col_type":"double"}
    ]
}

response = requests.post(URL, headers=headers, json=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "create lake start",
#     "data": "{lake id}"
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - create LAKE with additional column

params = {
    "lake_info":{
        "lake_name":"sample_lake2",
        "lake_plan":"basic",
        "region":"aws1.kor",
        "timezone":"Asia/Seoul",
        "storage_size":20
    },
    "tag_schema":[
        {"col_name":"name","col_type":"varchar","col_length":80},
        {"col_name":"location","col_type":"varchar","col_length":40}
    ],
    "value_schema":[
        {"col_name":"time","col_type":"datetime"},
        {"col_name":"value","col_type":"double"},
        {"col_name":"worktime","col_type":"integer"}
    ]
}

response = requests.post(URL, headers=headers, json=params, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success": true,
#     "reason": "create lake start",
#     "data": "{lake id}"
# }
