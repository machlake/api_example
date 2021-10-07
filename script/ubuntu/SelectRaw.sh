# Text Encoding to UTF-8 in CMD
# Example For Select Raw Data for tag API by using curl in window script
# written by yeony kim

API_KEY=

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
LAKE_ID=c5ehcdmcb0jc72ia6pug
URL=https://$LAKE_ID.machlake.com/lakes/values/raw

# ------------------------------------------------------------------------------------------------- #

# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
TAG_NAME=sensor1
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "date_format=$DATE_FORMAT" --data-urlencode "start_time=$START_TIME" --data-urlencode "end_time=$END_TIME"

# Return Format
# {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 001:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 002:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:00 004:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 005:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 006:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:00 007:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 008:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 009:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 001:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 002:000:000","VALUE":2.5},{"TIME":"2021-01-06 18:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS"

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "date_format=$DATE_FORMAT" --data-urlencode "start_time=$START_TIME" --data-urlencode "end_time=$END_TIME"

# Return Format
# {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00","VALUE":1},{"TIME":"2021-01-06 17:00:00","VALUE":1.5},{"TIME":"2021-01-06 17:00:00","VALUE":2},{"TIME":"2021-01-06 17:00:00","VALUE":1},{"TIME":"2021-01-06 17:00:00","VALUE":1.5},{"TIME":"2021-01-06 17:00:00","VALUE":2},{"TIME":"2021-01-06 17:00:00","VALUE":1},{"TIME":"2021-01-06 17:00:00","VALUE":1.5},{"TIME":"2021-01-06 17:00:00","VALUE":2},{"TIME":"2021-01-06 18:00:00","VALUE":2},{"TIME":"2021-01-06 18:00:00","VALUE":2.5},{"TIME":"2021-01-06 18:00:00","VALUE":2},{"TIME":"2021-01-06 20:00:04","VALUE":2},{"TIME":"2021-01-06 20:00:05","VALUE":2.5},{"TIME":"2021-01-06 20:00:06","VALUE":2}]}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS, data inserted with date skip mmm:uuu:nnn
TAG_NAME=sensor2
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "date_format=$DATE_FORMAT" --data-urlencode "start_time=$START_TIME" --data-urlencode "end_time=$END_TIME"

# Return Format / 현재 Insert된 데이터를 가져오며, InsertStandard를 수행한 후 실행하면 하기와 같은 response를 받을 수 있음
# {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:01 000:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:02 000:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:03 000:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:04 000:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:05 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 001:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 002:000:000","VALUE":2.5},{"TIME":"2021-01-06 18:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS and with UTC-0 timezone
TAG_NAME=sensor2
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"

curl -k -G $URL -H "Use-Timezone: Africa/Abidjan" -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "date_format=$DATE_FORMAT" --data-urlencode "start_time=$START_TIME" --data-urlencode "end_time=$END_TIME"

# Return Format / 현재 Insert된 데이터를 가져오며, InsertStandard를 수행한 후 실행하면 하기와 같은 response를 받을 수 있음
# {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 17:00:00 007:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 008:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 009:000:000","VALUE":2}]}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS and with local timezone, data inserted UTC-0 timezone setting
TAG_NAME=sensor2
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-07 02:00:00 000:000:000"
END_TIME="2021-01-07 12:00:00 000:000:000"

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "date_format=$DATE_FORMAT" --data-urlencode "start_time=$START_TIME" --data-urlencode "end_time=$END_TIME"

# Return Format
# {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-07 02:00:00 007:000:000","VALUE":1},{"TIME":"2021-01-07 02:00:00 008:000:000","VALUE":1.5},{"TIME":"2021-01-07 02:00:00 009:000:000","VALUE":2}]}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
TAG_NAME=sensor1,sensor2
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"
LIMIT=10
OFFSET=5
DIRECTION=0
VALUE_RETURN_FORM=0

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "date_format=$DATE_FORMAT" --data-urlencode "start_time=$START_TIME" --data-urlencode "end_time=$END_TIME" --data-urlencode "limit=$LIMIT" --data-urlencode "offset=$OFFSET" --data-urlencode "direction=$DIRECTION" --data-urlencode "value_return_form=$VALUE_RETURN_FORM"

# Return Format
# {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 006:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:00 007:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 008:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 009:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 001:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 002:000:000","VALUE":2.5},{"TIME":"2021-01-06 18:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
TAG_NAME=sensor1,sensor2
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"
LIMIT=
OFFSET=
DIRECTION=1
VALUE_RETURN_FORM=1

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "date_format=$DATE_FORMAT" --data-urlencode "start_time=$START_TIME" --data-urlencode "end_time=$END_TIME" --data-urlencode "limit=$LIMIT" --data-urlencode "offset=$OFFSET" --data-urlencode "direction=$DIRECTION" --data-urlencode "value_return_form=$VALUE_RETURN_FORM"

# Return Format
# {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":{"TIME":["2021-01-06 20:00:06 000:000:000","2021-01-06 20:00:05 000:000:000","2021-01-06 20:00:04 000:000:000","2021-01-06 18:00:00 003:000:000","2021-01-06 18:00:00 002:000:000","2021-01-06 18:00:00 001:000:000","2021-01-06 17:00:05 000:000:000","2021-01-06 17:00:04 000:000:000","2021-01-06 17:00:03 000:000:000","2021-01-06 17:00:02 000:000:000","2021-01-06 17:00:01 000:000:000","2021-01-06 17:00:00 000:000:000"],"VALUE":[2,2.5,2,2,2.5,2,2,1.5,1,2,1.5,1]}},{"tag_name":"sensor1","data":{"TIME":["2021-01-06 20:00:06 000:000:000","2021-01-06 20:00:05 000:000:000","2021-01-06 20:00:04 000:000:000","2021-01-06 18:00:00 003:000:000","2021-01-06 18:00:00 002:000:000","2021-01-06 18:00:00 001:000:000","2021-01-06 17:00:00 009:000:000","2021-01-06 17:00:00 008:000:000","2021-01-06 17:00:00 007:000:000","2021-01-06 17:00:00 006:000:000","2021-01-06 17:00:00 005:000:000","2021-01-06 17:00:00 004:000:000","2021-01-06 17:00:00 003:000:000","2021-01-06 17:00:00 002:000:000","2021-01-06 17:00:00 001:000:000"],"VALUE":[2,2.5,2,2,2.5,2,2,1.5,1,2,1.5,1,2,1.5,1]}}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #