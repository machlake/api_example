# Text Encoding to UTF-8 in CMD
# Example For Get Tag View API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION
TAG_NAME=$YOUR_TAG_NAME

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/tag

# ------------------------------------------------------------------------------------------------- #

# CASE - Get Tag Information

TAG_NAME=sensor

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "name=$TAG_NAME"

# Return Format / not exist tag name in lake
# {"message":"no such name : sensor","status":"error"}

TAG_NAME=sensor1

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "name=$TAG_NAME"
# Return Format
# {"data":{"name":"sensor1"},"status":"success"}

# ------------------------------------------------------------------------------------------------- #