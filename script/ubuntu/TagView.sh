# Text Encoding to UTF-8 in CMD
# Example For Get Tag View API by using curl in ubuntu
# written by yeony kim
# sensor1, sensor2 is applied in lake

API_KEY=

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
LAKE_ID=c5ehcdmcb0jc72ia6pug
URL=https://$LAKE_ID.machlake.com/lakes/tag

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