# Text Encoding to UTF-8 in CMD
# Example For Get Lake View API by using curl in shell script

API_KEY=$YOUR_API_KEY
LAKE_ID=$YOUR_LAKE_ID

CONTENT_HEADER="Content-Type:application/json"
API_HEADER="x-api-key:$API_KEY"

URL=https://api.machlake.com/lakes/$LAKE_ID

# ------------------------------------------------------------------------------------------------- #

# CASE - GET LAKE List

curl -k -X GET $URL -H $CONTENT_HEADER -H $API_HEADER

# Return Format
# {"data":{"lake_id":"YOUR_LAKE_ID","lake_info":{"create_date":"2021-10-14 01:20:34","lake_name":"sample_lake","lake_plan":"basic","lake_type":"Normal","region":"ap-northeast-2","timezone":"Asia/Seoul","update_date":"0"},"lake_status":{"count_of_tag":0,"count_of_value":0,"query_call":0,"state":"running","storage":7456575488,"traffic":1990097},"plan_limit":{"default_tag_count":10000,"limit_append_tag":1000,"limit_append_value":100,"limit_select_tag":1000,"limit_select_value":100,"max_concurrent":100000,"max_network":10737418240,"max_query":10000,"max_storage":21474836480,"max_tag_count":100000},"tag_schema":[{"col_length":40,"col_name":"name","col_type":"varchar"}],"value_schema":[{"col_length":0,"col_name":"time","col_type":"datetime"},{"col_length":0,"col_name":"value","col_type":"double"}]},"status":"success"}
