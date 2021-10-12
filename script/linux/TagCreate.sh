# Text Encoding to UTF-8 in CMD
# Example For Create Tag API by using curl in ubuntu
# written by yeony kim

API_KEY=

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
LAKE_ID=YOUR_LAKE_ID

URL=https://$LAKE_ID.machlake.com/lakes/tags

# ------------------------------------------------------------------------------------------------- #

# CASE - create TAG

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER --data "{\"tag\": [[\"sensor1\"], [\"sensor2\"]]}"

# Return Format
# {"data":{"success_count":2,"tag":[{"name":"sensor1"},{"name":"sensor2"}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - tag duplicate error

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER --data "{\"tag\": [[\"sensor1\"], [\"sensor2\"]]}"

# Return Format / Example For Exist same tag name in lake
# {"message":"Metadata key (sensor2) of TAGDATA table is already inserted.","status":"error"}

# ------------------------------------------------------------------------------------------------- #