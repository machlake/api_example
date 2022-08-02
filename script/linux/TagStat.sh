# Text Encoding to UTF-8 in CMD
# Example For Get Tag Stat API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION
TAG_NAME=$YOUR_TAG_NAME

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/stat

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag

QUERY_LIMIT=
QUERY_OFFSET=


curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "limit=$QUERY_LIMIT" --data-urlencode "offset=$QUERY_OFFSET"

# Return Format / Example For 
# {"data":{"calc_mode":"raw","columns":[{"length":20,"name":"ROW_COUNT","type":112}......]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag with SQL Limit

QUERY_LIMIT=1
QUERY_OFFSET=

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "limit=$QUERY_LIMIT" --data-urlencode "offset=$QUERY_OFFSET"

# Return Format
# {"data":{"calc_mode":"raw","columns":[{"length":20,"name":"ROW_COUNT","type":112}......]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag with SQL Limit and SQL Offset

QUERY_LIMIT=1
QUERY_OFFSET=1

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "limit=$QUERY_LIMIT" --data-urlencode "offset=$QUERY_OFFSET"

# Return Format
# {"data":{"calc_mode":"raw","columns":[{"length":20,"name":"ROW_COUNT","type":112}......]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag about not exist

TAG_NAME=OTHER_NAME
QUERY_LIMIT=
QUERY_OFFSET=

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "limit=$QUERY_LIMIT" --data-urlencode "offset=$QUERY_OFFSET"

# Return Format
# {"data":{"calc_mode":"raw","columns":[{"length":20,"name":"ROW_COUNT","type":112}......]},"status":"success"}
