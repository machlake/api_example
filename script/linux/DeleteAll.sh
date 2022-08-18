 # Text Encoding to UTF-8 in CMD
 # Example For Delete All Data for tag API by using curl in ubuntu
 
LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/raw

 # -------------------------------------------------------------------------------------------------  #

 # CASE - DELETE All Tag DATA

TAG_NAME=
BASE_TIME=\"\"

curl -k -X DELETE $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"tag_name\": \"$TAG_NAME\", \"base_time\": $BASE_TIME}"

 # Return Format / not exist tag name in lake
 # {"data":{},"status":"success"}

 # -------------------------------------------------------------------------------------------------  #