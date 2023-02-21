# Text Encoding to UTF-8 in CMD
# Example For Create Lake API by using curl in shell script

API_KEY=$YOUR_API_KEY

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY

URL=https://api.machlake.com/v1/lakes

# ------------------------------------------------------------------------------------------------- #

# CASE - create LAKE
# {
#     "lake_info":{
#         "lake_name":"sample_lake",
#         "lake_plan":"basic",
#         "region":"aws1.kor",
#         "timezone":"Asia/Seoul",
#         "storage_size":20}
#     ,
#     "tag_schema":[
#         {
#             "col_name":"name",
#             "col_type":"varchar",
#             "col_length":40
#         }
#     ],
#     "value_schema":[
#         {
#             "col_name":"time",
#             "col_type":"datetime"
#         },
#         {
#             "col_name":"value",
#             "col_type":"double"
#         }
#     ]
# }

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"lake_info\":{\"lake_name\":\"sample_lake\",\"lake_plan\":\"basic\",\"region\":\"aws1.kor\",\"timezone\":\"Asia/Seoul\",\"storage_size\":20},\"tag_schema\":[{\"col_name\":\"name\",\"col_type\":\"varchar\",\"col_length\":40}],\"value_schema\":[{\"col_name\":\"time\",\"col_type\":\"datetime\"},{\"col_name\":\"value\",\"col_type\":\"double\"}]}"

# Return Format
# {
#     "success": true,
#     "reason": "create lake start",
#     "data": "{lake id}"
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - create LAKE with additional column
# {
#     "lake_info":{
#         "lake_name":"sample_lake2",
#         "lake_plan":"basic",
#         "region":"aws1.kor",
#         "timezone":"Asia/Seoul",
#         "storage_size":20},
#     "tag_schema":[
#         {
#             "col_name":"name",
#             "col_type":"varchar",
#             "col_length":80
#         },
#         {
#            "col_name": "location",
#            "col_type": "varchar",
#            "col_length": 40
#         }
#     ],
#     "value_schema":[
#         {
#             "col_name":"time",
#             "col_type":"datetime"
#         },
#         {
#             "col_name":"value",
#             "col_type":"double"
#         },
#         {
#             "col_name": "worktime",
#             "col_type": "integer"
#         }
#     ]
# }

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"lake_info\":{\"lake_name\":\"sample_lake2\",\"lake_plan\":\"basic\",\"region\":\"aws1.kor\",\"timezone\":\"Asia/Seoul\",\"storage_size\":20},\"tag_schema\":[{\"col_name\":\"name\",\"col_type\":\"varchar\",\"col_length\":80},\"col_name\": \"location\",\"col_type\": \"varchar\",\"col_length\": 40}],\"value_schema\":[{\"col_name\":\"time\",\"col_type\":\"datetime\"},{\"col_name\":\"value\",\"col_type\":\"double\"},{\"col_name\": \"worktime\",\"col_type\": \"integer\"}]}"

# Return Format
# {
#     "success": true,
#     "reason": "create lake start",
#     "data": "{lake id}"
# }
