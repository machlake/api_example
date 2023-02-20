# Text Encoding to UTF-8 in CMD
# Example For Get Tag List API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/tags

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag with limit

ROW_LIMIT=3

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "limit=$ROW_LIMIT"

# Return Format
# {
#     "success": true,
#     "reason": "get tag meta list success",
#     "data":{
#         "tag":[
#             {"name":"sensor1"},
#             {"name":"sensor2"},
#             {"name":"door1"}
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag with Limit and Offset

ROW_LIMIT=1
ROW_OFFSET=1

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "limit=$ROW_LIMIT" \
    --data-urlencode "offset=$ROW_OFFSET"

# Return Format
# {
#     "success": true,
#     "reason": "get tag meta list success",
#     "data":{
#         "tag":[
#             {"name":"sensor2"}
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag with name hint

TAG_NAME=door

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "name=$TAG_NAME"

# Return Format
# {
#     "success": true,
#     "reason": "get tag meta list success",
#     "data":{
#         "tag":[
#             {"name":"door1"}
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag about not exist

TAG_NAME=wrong_name

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "name=$TAG_NAME"

# Return Format
# {
#     "success": true,
#     "reason": "get tag meta list success",
#     "data": {
#         "tag": []
#     }
# }