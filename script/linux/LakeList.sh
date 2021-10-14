# Text Encoding to UTF-8 in CMD
# Example For Get Lake List API by using curl in shell script
# written by yeony kim

API_KEY=

CONTENT_HEADER="Content-Type:application/json"
API_HEADER="x-api-key:$API_KEY"

URL=https://api.machlake.com/lakes

# ------------------------------------------------------------------------------------------------- #

# CASE - GET LAKE List

curl -k -X GET $URL -H $CONTENT_HEADER -H $API_HEADER

# Return Format
# {"data":{"lake":[{"lake_id":"YOUR_LAKE_ID","lake_info":{"lake_name":"sample_lake","lake_plan":"basic","region":"ap-northeast-2","timezone":"Asia/Seoul"}}],"mount":[],"share":[]},"status":"success"}
