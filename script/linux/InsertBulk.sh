# Text Encoding to UTF-8 in CMD
# Example For Insert Bulk Data for tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/values

# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Data with nano date time string format

DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
VALUES="[[\"sensor1\", \"2021-01-06 18:00:00 001:000:000\", 2.0], [\"sensor1\", \"2021-01-06 18:00:00 002:000:000\", 2.5], [\"sensor1\", \"2021-01-06 18:00:00 003:000:000\", 2.0], [\"sensor2\", \"2021-01-06 18:00:00 001:000:000\", 2.0], [\"sensor2\", \"2021-01-06 18:00:00 002:000:000\", 2.5], [\"sensor2\", \"2021-01-06 18:00:00 003:000:000\", 2.0]]"

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER  -d "{\"date_format\": $DATE_FORMAT, \"values\": $VALUES}"

# Return Format
# {
#     "success": true,
#     "reason": "append success",
#     "data": {"fail": 0,"success": 6}
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Data with nano date time stamp

VALUES="[[\"sensor1\", 1609930804000000000, 2.0], [\"sensor1\", 1609930805000000000, 2.5], [\"sensor1\", 1609930806000000000, 2.0], [\"sensor2\", 1609930804000000000, 2.0], [\"sensor2\", 1609930805000000000, 2.5], [\"sensor2\", 1609930806000000000, 2.0]]"

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER  -d "{\"values\": $VALUES}"

# Return Format
# {
#     "success": true,
#     "reason": "append success",
#     "data": {"fail": 0,"success": 6}
# }
