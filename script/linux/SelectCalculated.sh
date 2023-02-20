# Text Encoding to UTF-8 in CMD
# Example For Select Calculated Data for tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/values

SELECT_TYPE=calc
TAG_NAME=sensor1,sensor2

# ------------------------------------------------------------------------------------------------- #

# CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min

CALC_MODE=min
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "type=$SELECT_TYPE"  \
    --data-urlencode "tag_name=$TAG_NAME" \
    --data-urlencode "calc_mode=$CALC_MODE" \
    --data-urlencode "start_time=$START_TIME" \
    --data-urlencode "end_time=$END_TIME" \
    --data-urlencode "date_format=$DATE_FORMAT"

# Return Format
# {
#     "success": true,
#     "reason": "success",
#     "data":{
#         "columns":[
#             {"name":"NAME","type":5,"length":80},
#             {"name":"TIME","type":5,"length":4096},
#             {"name":"VALUE","type":20,"length":17}
#         ],
#         "rows":[
#             ["sensor1","2021-01-06 17:00:00 000:000:000",1],
#             ["sensor2","2021-01-06 17:00:00 000:000:000",1],
#             ["sensor2","2021-01-06 17:00:01 000:000:000",1.5],
#             ["sensor2","2021-01-06 17:00:02 000:000:000",2],
#             ["sensor2","2021-01-06 17:00:03 000:000:000",1],
#             ["sensor2","2021-01-06 17:00:04 000:000:000",1.5],
#             ["sensor2","2021-01-06 17:00:05 000:000:000",2],
#             ["sensor1","2021-01-06 18:00:00 000:000:000",2],
#             ["sensor2","2021-01-06 18:00:00 000:000:000",2],
#             ["sensor1","2021-01-06 20:00:04 000:000:000",2],
#             ["sensor2","2021-01-06 20:00:04 000:000:000",2],
#             ["sensor1","2021-01-06 20:00:05 000:000:000",2.5],
#             ["sensor2","2021-01-06 20:00:05 000:000:000",2.5],
#             ["sensor1","2021-01-06 20:00:06 000:000:000",2]
#             ["sensor2","2021-01-06 20:00:06 000:000:000",2]
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=max and interval_value=3

CALC_MODE=max
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"
INTERVAL_VALUE=3

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "type=$SELECT_TYPE" \
    --data-urlencode "tag_name=$TAG_NAME" \
    --data-urlencode "calc_mode=$CALC_MODE" \
    --data-urlencode "start_time=$START_TIME" \
    --data-urlencode "end_time=$END_TIME" \
    --data-urlencode "date_format=$DATE_FORMAT" \
    --data-urlencode "interval_value=$INTERVAL_VALUE"

# Return Format
# {
#     "success": true,
#     "reason": "success",
#     "data":{
#         "columns":[
#             {"name":"NAME","type":5,"length":80},
#             {"name":"TIME","type":5,"length":4096},
#             {"name":"VALUE","type":20,"length":17}
#         ],
#         "rows":[
#             ["sensor2","2021-01-06 17:00:00 000:000:000",2],
#             ["sensor1","2021-01-06 17:00:00 000:000:000",2],
#             ["sensor2","2021-01-06 17:00:03 000:000:000",2],
#             ["sensor2","2021-01-06 18:00:00 000:000:000",2.5],
#             ["sensor1","2021-01-06 18:00:00 000:000:000",2.5],
#             ["sensor2","2021-01-06 20:00:03 000:000:000",2.5],
#             ["sensor1","2021-01-06 20:00:03 000:000:000",2.5],
#             ["sensor2","2021-01-06 20:00:06 000:000:000",2],
#             ["sensor1","2021-01-06 20:00:06 000:000:000",2]
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min and interval_type=m and interval_value=90

CALC_MODE=cnt
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"
INTERVAL_TYPE=m
INTERVAL_VALUE=90

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "type=$SELECT_TYPE" \
    --data-urlencode "tag_name=$TAG_NAME" \
    --data-urlencode "calc_mode=$CALC_MODE" \
    --data-urlencode "start_time=$START_TIME" \
    --data-urlencode "end_time=$END_TIME" \
    --data-urlencode "date_format=$DATE_FORMAT" \
    --data-urlencode "interval_value=$INTERVAL_VALUE" \
    --data-urlencode "interval_type=$INTERVAL_TYPE"

# Return Format
# {
#     "success": true,
#     "reason": "success",
#     "data":{
#         "columns":[
#             {"name":"NAME","type":5,"length":80},
#             {"name":"TIME","type":5,"length":4096},
#             {"name":"VALUE","type":12,"length":20}
#         ],
#         "rows":[
#             ["sensor1","2021-01-06 16:30:00 000:000:000",1],
#             ["sensor2","2021-01-06 16:30:00 000:000:000",1],
#             ["sensor1","2021-01-06 18:00:00 000:000:000",1],
#             ["sensor2","2021-01-06 18:00:00 000:000:000",1],
#             ["sensor1","2021-01-06 19:30:00 000:000:000",1],
#             ["sensor2","2021-01-06 19:30:00 000:000:000",1],
#         ]
#     }
# }
