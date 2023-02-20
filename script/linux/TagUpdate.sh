# Text Encoding to UTF-8 in CMD
# Example For Update Tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/tags

# ------------------------------------------------------------------------------------------------- #

# CASE - Update Tag Name

SRC_TAG_NAME=sensor1
TAR_TAG_NAME=sensor10
VALUES="{\"name\": \"$SRC_TAG_NAME\", \"columns\": [{\"col_name\": \"name\", \"value\": \"$TAR_TAG_NAME\"}]}"

curl -k -X PUT $URL -H $CONTENT_HEADER -H $API_HEADER  -d $VALUES

# Return Format
# {
#     "success": true,
#     "reason": "update tag meta success",
#     "data":{"name":"sensor10"}
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Update Tag additional column
# columns
# name (varchar, 80), location (varchar, 40)

SRC_TAG_NAME=sensor02
ADD_COLUMN="4F-101"
VALUES="{\"name\": \"$SRC_TAG_NAME\", \"columns\": [{\"col_name\": \"location\", \"value\": \"$ADD_COLUMN\"}]}"

curl -k -X PUT $URL -H $CONTENT_HEADER -H $API_HEADER  -d $VALUES

# Return Format
# {
#     "success": true,
#     "reason": "update tag meta success",
#     "data": {
#         "location": "4F-101",
#         "name": "sensor02"
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Update Tag when not exist tag

SRC_TAG_NAME=wrong_name
ADD_COLUMN="4F-101"
VALUES="{\"name\": \"$SRC_TAG_NAME\", \"columns\": [{\"col_name\": \"location\", \"value\": \"$ADD_COLUMN\"}]}"

curl -k -X PUT $URL -H $CONTENT_HEADER -H $API_HEADER  -d $VALUES

# Return Format
# status code : 400 Bad Request
# {
#     "success": false,
#     "reason": "no such name : wrong_name"
# }
