# Text Encoding to UTF-8 in CMD
# Example For Insert Bulk Data for tag API by using curl in window script
# written by yeony kim

API_KEY=

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
LAKE_ID=c5ehcdmcb0jc72ia6pug
URL=https://$LAKE_ID.machlake.com/lakes/values/bulk

# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Bulk Data with nano date time string format

DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
VALUES="[[\"sensor1\", \"2021-01-06 18:00:00 001:000:000\", 2.0], [\"sensor1\", \"2021-01-06 18:00:00 002:000:000\", 2.5], [\"sensor1\", \"2021-01-06 18:00:00 003:000:000\", 2.0], [\"sensor2\", \"2021-01-06 18:00:00 001:000:000\", 2.0], [\"sensor2\", \"2021-01-06 18:00:00 002:000:000\", 2.5], [\"sensor2\", \"2021-01-06 18:00:00 003:000:000\", 2.0]]"

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER  -d "{\"date_format\": $DATE_FORMAT, \"values\": $VALUES}"

# Return Format
# {"data":{"fail":0,"success":6},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Insert Bulk Data with nano date time stamp

VALUES="[[\"sensor1\", 1609930804000000000, 2.0], [\"sensor1\", 1609930805000000000, 2.5], [\"sensor1\", 1609930806000000000, 2.0], [\"sensor2\", 1609930804000000000, 2.0], [\"sensor2\", 1609930805000000000, 2.5], [\"sensor2\", 1609930806000000000, 2.0]]"

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER  -d "{\"values\": $VALUES}"

# Return Format
# {"data":{"fail":0,"success":6},"status":"success"}

# ------------------------------------------------------------------------------------------------- #