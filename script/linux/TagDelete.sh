# Text Encoding to UTF-8 in CMD
# Example For Delete Tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/tags

# ------------------------------------------------------------------------------------------------- #

# CASE - delete tag

TAG_NAME=sensor1

curl -k -X DELETE $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "name=$TAG_NAME"

# Return Format
# {
#     "success":true,
#     "reason":"delete tag meta success"
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - delete error when no exist tag name

TAG_NAME=wrong_name

curl -k -X DELETE $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "name=$TAG_NAME"

# Return Format
# status code:400 Bad Request
# {
#     "success":false,
#     "reason":"no such name:wrong_name"
# }
