# Text Encoding to UTF-8 in CMD
# Example For Update Tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/tags

# ------------------------------------------------------------------------------------------------- #

# CASE - Tag Name Change SRC to TAR

SRC_TAG_NAME=sensor1
TAR_TAG_NAME=sensor10

curl -k -X PUT $URL -H $CONTENT_HEADER -H $API_HEADER  -d "{\"name\": \"$SRC_TAG_NAME\", \"columns\": [{\"col_name\": \"name\", \"value\": \"$TAR_TAG_NAME\"}]}"

# Return Format
# {"data":{"name":"sensor10"},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Tag Name Change Error when Not exist

curl -k -X PUT $URL -H $CONTENT_HEADER -H $API_HEADER  -d "{\"name\": \"$SRC_TAG_NAME\", \"columns\": [{\"col_name\": \"name\", \"value\": \"$TAR_TAG_NAME\"}]}"

# Return Format / SRC_TAG_NAME이 존재 하지 않는 경우 예시
# {"message":"no such name : sensor1","status":"error"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Tag Name Change SRC to TAR

SRC_TAG_NAME=sensor10
TAR_TAG_NAME=sensor1

curl -k -X PUT $URL -H $CONTENT_HEADER -H $API_HEADER  -d "{\"name\": \"$SRC_TAG_NAME\", \"columns\": [{\"col_name\": \"name\", \"value\": \"$TAR_TAG_NAME\"}]}"

# Return Format
# {"data":{"name":"sensor1"},"status":"success"}

# ------------------------------------------------------------------------------------------------- #