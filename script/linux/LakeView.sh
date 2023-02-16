# Text Encoding to UTF-8 in CMD
# Example For Get Lake View API by using curl in shell script

API_KEY=$YOUR_API_KEY
LAKE_ID=$YOUR_LAKE_ID

CONTENT_HEADER="Content-Type:application/json"
API_HEADER="x-api-key:$API_KEY"

URL=https://api.machlake.com/v1/lakes/$LAKE_ID

# ------------------------------------------------------------------------------------------------- #

# CASE - GET LAKE List

curl -k -X GET $URL -H $CONTENT_HEADER -H $API_HEADER

# Return Format
# {
#     "success" : true,
#     "reason"  : "get lake info success",
#     "data": {
#         "lake_id" : "{lake_id}",
#         "lake_info"   : {
#             "lake_name"    : "sample_lake",
#             "lake_plan"    : "basic",
#             "lake_type"    : "N",
#             "region"       : "aws1.kor",
#             "timezone"     : "America/Los_Angeles",
#             "create_time"  : "2021-09-30 10:30:05",
#             "update_time"  : "2021-10-01 14:59:12"
#         },
#         "lake_status" : {
#             "count_of_tag"   : 128,
#             "count_of_value" : 123456,
#             "query_call": 0,
#             "traffic": 4743829,
#             "storage": 3032870912,
#             "state"  : "running" 
#         },
#         "plan_limit": {
#             "max_tag": 1000,
#             "max_query": 10000,
#             "max_disk": 32212254720,
#             "max_concurrent": 100000,
#             "limit_select_tag": 1000,
#             "limit_select_value": 100,
#             "limit_append_value": 100,
#             "limit_append_tag": 1000,
#             "default_tag_count": 10000
#         },
#         "tag_schema" : [
#             {
#                 "col_name"   : "name",
#                 "col_type"   : "varchar",
#                 "col_length" : 40
#             }
#         ],
#         "value_schema" : [
#             {
#                 "col_name"   : "time",
#                 "col_type"   : "datetime"
#             },
#             {
#                 "col_name"   : "value",
#                 "col_type"   : "double"
#             }
#         ]
#     }
# }
