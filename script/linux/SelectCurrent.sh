# Text Encoding to UTF-8 in CMD
# Example For Select Current Data for tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION
TAG_NAME=$YOUR_TAG_NAME

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/current

# ------------------------------------------------------------------------------------------------- #

# CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
TAG_NAME=sensor1,sensor2
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "date_format=$DATE_FORMAT"

# Return Format
# {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-07 02:00:00 009:000:000","VALUE":2}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
TAG_NAME=sensor1,sensor2
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
VALUE_RETURN_FORM=1

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "date_format=$DATE_FORMAT" --data-urlencode "value_return_form=$VALUE_RETURN_FORM"

# Return Format
# {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":{"TIME":["2021-01-07 02:00:00 009:000:000"],"VALUE":[2]}},{"tag_name":"sensor1","data":{"TIME":["2021-01-06 20:00:06 000:000:000"],"VALUE":[2]}}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #