# Text Encoding to UTF-8 in CMD
# Example For Create Tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION
TAG_NAME=$YOUR_TAG_NAME

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/tags

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