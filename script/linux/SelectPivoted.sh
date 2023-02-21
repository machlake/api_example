# Text Encoding to UTF-8 in CMD
# Example For Select Pivoted Data for tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/values

# ------------------------------------------------------------------------------------------------- #

# CASE - Pivoted DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
SELECT_TYPE=pivot
TAG_NAME=sensor1,sensor2
CALC_MODE=min
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "type=$SELECT_TYPE" \
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
#             {"name":"TIME","type":5,"length":4096},
#             {"name":"sensor1","type":20,"length":17},
#             {"name":"sensor2","type":20,"length":17}
#         ],
#         "rows":[
#             ["2021-01-06 17:00:00 000:000:000",1,1],
#             ["2021-01-06 17:00:01 000:000:000",null,1.5],
#             ["2021-01-06 17:00:02 000:000:000",null,2],
#             ["2021-01-06 17:00:03 000:000:000",null,1],
#             ["2021-01-06 17:00:04 000:000:000",null,1.5],
#             ["2021-01-06 17:00:05 000:000:000",null,2],
#             ["2021-01-06 18:00:00 000:000:000",2,2],
#             ["2021-01-06 20:00:04 000:000:000",2,2],
#             ["2021-01-06 20:00:05 000:000:000",2.2.5],
#             ["2021-01-06 20:00:06 000:000:000",2,2]
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #
