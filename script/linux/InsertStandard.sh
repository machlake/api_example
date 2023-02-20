# Text Encoding to UTF-8 in CMD
# Example For Insert Standard Data for tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/values

# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Data with nano date time string format

TAG_NAME=sensor1
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
VALUES="[[\"2021-01-06 17:00:00 001:000:000\", 1.0], [\"2021-01-06 17:00:00 002:000:000\", 1.5], [\"2021-01-06 17:00:00 003:000:000\", 2.0]]"

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER  -d "{\"tag_name\": \"$TAG_NAME\", \"date_format\": \"$DATE_FORMAT\", \"values\": $VALUES}"

# Return Format 
# {
#     "success": true,
#     "reason": "append success",
#     "data": {"fail": 0,"success": 3}
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Data with time format is empty but data format in data is nano date time string

TAG_NAME=sensor1
DATE_FORMAT=""
VALUES="[[\"2021-01-06 17:00:00 004:000:000\", 1.0], [\"2021-01-06 17:00:00 005:000:000\", 1.5], [\"2021-01-06 17:00:00 006:000:000\", 2.0]]"

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER  -d "{\"tag_name\": \"$TAG_NAME\", \"date_format\": \"$DATE_FORMAT\", \"values\": $VALUES}"

# Return Format
# {
#     "success": true,
#     "reason": "append success",
#     "data": {"fail": 0,"success": 3}
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Data with utc-0 time zone and time format is empty but data format in data is nano date time string

TZ=Africa/Abidjan
TAG_NAME=sensor1
DATE_FORMAT=""
VALUES="[[\"2021-01-06 8:00:00 007:000:000\", 1.0], [\"2021-01-06 8:00:00 008:000:000\", 1.5], [\"2021-01-06 8:00:00 009:000:000\", 2.0]]"

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"timezone\": \"$TZ\", \"tag_name\": \"$TAG_NAME\", \"date_format\": \"$DATE_FORMAT\", \"values\": $VALUES}"

# Return Format 
# {
#     "success": true,
#     "reason": "append success",
#     "data": {"fail": 0,"success": 3}
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Data with date time string format

TAG_NAME=sensor2
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS"
VALUES="[[\"2021-01-06 17:00:00\", 1.0], [\"2021-01-06 17:00:01\", 1.5], [\"2021-01-06 17:00:02\", 2.0]]"

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"tag_name\": \"$TAG_NAME\", \"date_format\": \"$DATE_FORMAT\", \"values\": $VALUES}"

# Return Format 
# {
#     "success": true,
#     "reason": "append success",
#     "data": {"fail": 0,"success": 3}
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Data with nano-timestamp

TAG_NAME=sensor2
VALUES="[[1609920003000000000, 1.0], [1609920004000000000, 1.5], [1609920005000000000, 2.0]]"

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER  -d "{\"tag_name\": \"sensor2\", \"values\": $VALUES}"

# Return Format
# {
#     "success": true,
#     "reason": "append success",
#     "data": {"fail": 0,"success": 3}
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Data with utc-0 time zone and date time string format but data format in data is nano date time string

TZ=Africa/Abidjan
TAG_NAME=sensor2
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS"
VALUES="[[\"2021-01-06 17:00:00 007:000:000\", 1.0], [\"2021-01-06 17:00:00 008:000:000\", 1.5], [\"2021-01-06 17:00:00 009:000:000\", 2.0]]"

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"timezone\": \"$TZ\", \"tag_name\": \"$TAG_NAME\", \"date_format\": \"$DATE_FORMAT\", \"values\": $VALUES}"

# Return Format
# {
#     "success": true,
#     "reason": "append success",
#     "data": {"fail": 0,"success": 3}
# }
