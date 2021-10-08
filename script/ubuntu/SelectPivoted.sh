# Text Encoding to UTF-8 in CMD
# Example For Select Pivoted Data for tag API by using curl in ubuntu
# written by yeony kim

API_KEY=

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
LAKE_ID=c5ehcdmcb0jc72ia6pug
URL=https://$LAKE_ID.machlake.com/lakes/values/pivoted

# ------------------------------------------------------------------------------------------------- #

# CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
TAG_NAME=sensor1,sensor2
CALC_MODE=min
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "calc_mode=$CALC_MODE" --data-urlencode "start_time=$START_TIME" --data-urlencode "end_time=$END_TIME" --data-urlencode "date_format=$DATE_FORMAT"

# Return Format
# {"data":{"calc_mode":"MIN","columns":[{"name":"TIME","type":5,"length":4096},{"name":"sensor1","type":20,"length":17},{"name":"sensor2","type":20,"length":17}],"samples":[{"data":[{"TIME":"2021-01-06 17:00:00 000:000:000","sensor1":1,"sensor2":1},{"TIME":"2021-01-06 17:00:01 000:000:000","sensor1":null,"sensor2":1.5},{"TIME":"2021-01-06 17:00:02 000:000:000","sensor1":null,"sensor2":2},{"TIME":"2021-01-06 17:00:03 000:000:000","sensor1":null,"sensor2":1},{"TIME":"2021-01-06 17:00:04 000:000:000","sensor1":null,"sensor2":1.5},{"TIME":"2021-01-06 17:00:05 000:000:000","sensor1":null,"sensor2":2},{"TIME":"2021-01-06 18:00:00 000:000:000","sensor1":2,"sensor2":2},{"TIME":"2021-01-06 20:00:04 000:000:000","sensor1":2,"sensor2":2},{"TIME":"2021-01-06 20:00:05 000:000:000","sensor1":2.5,"sensor2":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","sensor1":2,"sensor2":2}]}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
VALUE_RETURN_FORM=1
CALC_MODE=cnt

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "calc_mode=$CALC_MODE" --data-urlencode "start_time=$START_TIME" --data-urlencode "end_time=$END_TIME" --data-urlencode "date_format=$DATE_FORMAT" --data-urlencode "value_return_form=$VALUE_RETURN_FORM"

# Return Format
# {"data":{"calc_mode":"COUNT","columns":[{"name":"TIME","type":5,"length":4096},{"name":"sensor1","type":12,"length":20},{"name":"sensor2","type":12,"length":20}],"samples":[{"data":{"TIME":["2021-01-06 17:00:00 000:000:000","2021-01-06 17:00:01 000:000:000","2021-01-06 17:00:02 000:000:000","2021-01-06 17:00:03 000:000:000","2021-01-06 17:00:04 000:000:000","2021-01-06 17:00:05 000:000:000","2021-01-06 18:00:00 000:000:000","2021-01-06 20:00:04 000:000:000","2021-01-06 20:00:05 000:000:000","2021-01-06 20:00:06 000:000:000"],"sensor1":[9,0,0,0,0,0,3,1,1,1],"sensor2":[1,1,1,1,1,1,3,1,1,1]}}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #
