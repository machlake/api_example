# Text Encoding to UTF-8 in CMD
# Example For Get Tag List API by using curl in ubuntu
# written by yeony kim
# sensor1, sensor2 is applied in lake

API_KEY=

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
LAKE_ID=c5ehcdmcb0jc72ia6pug
URL=https://$LAKE_ID.machlake.com/lakes/tags

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag

TAG_NAME=sensor
QUERY_LIMIT=
QUERY_OFFSET=


curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "name=$TAG_NAME" --data-urlencode "limit=$QUERY_LIMIT" --data-urlencode "offset=$QUERY_OFFSET"

# Return Format / Example For 
# {"data":{"tag":[{"name":"sensor1"},{"name":"sensor2"}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag with SQL Limit

QUERY_LIMIT=1
QUERY_OFFSET=

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "name=$TAG_NAME" --data-urlencode "limit=$QUERY_LIMIT" --data-urlencode "offset=$QUERY_OFFSET"

# Return Format
# {"data":{"tag":[{"name":"sensor1"}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag with SQL Limit and SQL Offset

QUERY_LIMIT=1
QUERY_OFFSET=1

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "name=$TAG_NAME" --data-urlencode "limit=$QUERY_LIMIT" --data-urlencode "offset=$QUERY_OFFSET"

# Return Format
# {"data":{"tag":[{"name":"sensor2"}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag about not exist

TAG_NAME=OTHER_NAME
QUERY_LIMIT=
QUERY_OFFSET=

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "name=$TAG_NAME" --data-urlencode "limit=$QUERY_LIMIT" --data-urlencode "offset=$QUERY_OFFSET"

# Return Format
# {"data":{"tag":[]},"status":"success"}