"""
Example For Get Lake List API by using request in python
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

# CASE - GET LAKE List

response = requests.get(URL, headers=headers, verify=False)
print(response.content.decode("utf-8"))

# Return Format
# {
#     "success" : true,
#     "reason"  : "get list success",
#     "data": [
#         {
#             "lake_id" : "{lake_id}",
#             "lake_info" : {
#                 "lake_name"    : "sample_lake",
#                 "lake_plan"    : "basic",
#                 "region"       : "aws1.kor",
#                 "timezone"     : "Asia/Seoul"
#             }
#         },
#         ......
#     ]
# }
