"""
Example For Get Lake List API by using request in python
written by yeony kim
"""

import requests

API_KEY = "YOUR_API_TOKEN"
URL = f"https://api.machlake.com/lakes"

# CASE - GET LAKE List

headers = {
    'Content-Type': 'application/json',
    'x-api-key': API_KEY
}

response = requests.get(URL, headers=headers, verify=False)
print(response.content.decode('utf-8'))  # {"data":{"lake":[{"lake_id":"YOUR_LAKE_ID","lake_info":{"lake_name":"sample_lake","lake_plan":"basic","region":"ap-northeast-2","timezone":"Asia/Seoul"}}],"mount":[],"share":[]},"status":"success"}
