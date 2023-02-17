# Text Encoding to UTF-8 in CMD
# Example For Get Tag Stat API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION
TAG_NAME=$YOUR_TAG_NAME

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/values

# parameters
SELECT_TYPE=stat 

# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag
TAG_NAME=sensor1

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "type=$SELECT_TYPE"  \
    --data-urlencode "tag_name=$TAG_NAME"

# Return Format
# {
#     "success": true,
#     "reason": "success",
#     "data": {
#         "columns": [
#             {"name":"NAME","type":5,"length":100},
#             {"name":"ROW_COUNT","type":112,"length":20},
#             {"name":"MIN_VALUE","type":20,"length":17},
#             {"name":"MAX_VALUE","type":20,"length":17},
#             {"name":"MIN_TIME","type":5,"length":4096},
#             {"name":"MAX_TIME","type":5,"length":4096},
#             {"name":"MIN_VALUE_TIME","type":5,"length":4096},
#             {"name":"MAX_VALUE_TIME","type":5,"length":4096},
#             {"name":"RECENT_ROW_TIME","type":5,"length":4096}
#         ],
#         "rows": [
#             ["sensor1",103277000,0,3999,"2022-07-05 14:14:08","2022-07-06 12:15:11","2022-07-06 12:15:04","2022-07-06 12:14:35","2022-07-06 12:15:11"]
#         ]
#     }
# }


# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag with date_format
TAG_NAME=sensor1
DATE_FORMAT=MS # MILLISECOND

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "type=$SELECT_TYPE"  \
    --data-urlencode "tag_name=$TAG_NAME" \
    --data-urlencode "date_format=$DATE_FORMAT"

# Return Format
{
    "success": true,
    "reason": "success",
    "data": {
        "columns": [
            {"name":"NAME","type":5,"length":100},
            {"name":"ROW_COUNT","type":112,"length":20},
            {"name":"MIN_VALUE","type":20,"length":17},
            {"name":"MAX_VALUE","type":20,"length":17},
            {"name":"MIN_TIME","type":12,"length":20},
            {"name":"MAX_TIME","type":12,"length":20},
            {"name":"MIN_VALUE_TIME","type":12,"length":20},
            {"name":"MAX_VALUE_TIME","type":12,"length":20},
            {"name":"RECENT_ROW_TIME","type":12,"length":20}
        ],
        "rows": [
            ["sensor1",103277006,0,3999,1675142048271,1676596324000,1675653288184,1675653301116,1676596324000]
        ]
    }
}


# ------------------------------------------------------------------------------------------------- #

# CASE - Select Tag about not exist

TAG_NAME=OTHER_NAME

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER \
    --data-urlencode "tag_name=$TAG_NAME"

# Return Format
# {
#     "success": true,
#     "reason": "success",
#     "data": {
#         "columns": [
#             {"name":"NAME","type":5,"length":100},
#             {"name":"ROW_COUNT","type":112,"length":20},
#             {"name":"MIN_VALUE","type":20,"length":17},
#             {"name":"MAX_VALUE","type":20,"length":17},
#             {"name":"MIN_TIME","type":5,"length":4096},
#             {"name":"MAX_TIME","type":5,"length":4096},
#             {"name":"MIN_VALUE_TIME","type":5,"length":4096},
#             {"name":"MAX_VALUE_TIME","type":5,"length":4096},
#             {"name":"RECENT_ROW_TIME","type":5,"length":4096}
#         ],
#         "rows": []
#     }
# }