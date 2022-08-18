# Text Encoding to UTF-8 in CMD
# Example For Delete Tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/tags

# ------------------------------------------------------------------------------------------------- #

# CASE - delete error when no exist tag name

TAG_NAME=sensor

curl -k -X DELETE $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"name\": \"$TAG_NAME\"}"

# Return Format / Example for tag name does not exist in lake
# {"message":"no such name : sensor","status":"error"}

# ------------------------------------------------------------------------------------------------- #

# CASE - delete tag

TAG_NAME=sensor1

curl -k -X DELETE $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"name\": \"$TAG_NAME\"}"

# Return Format / Example for delete tag
# {"data":{},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - delete tag

TAG_NAME=sensor2

curl -k -X DELETE $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"name\": \"$TAG_NAME\"}"

# Return Format / Example for delete tag
# {"data":{},"status":"success"}