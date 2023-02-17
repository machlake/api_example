# Text Encoding to UTF-8 in CMD
# Example For Create Tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/tags

# ------------------------------------------------------------------------------------------------- #

# CASE - Create Tag

# data format
# {
#     "tag":[
#         ["sensor1"], 
#         ["sensor2"]
#     ]
# }

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"tag\":[[\"sensor1\"], [\"sensor2\"]]}"

# Return Format
# {
#     "success":true,
#     "reason":"create tag success",
#     "data":{
#         "success_count":2,
#         "tag":[
#             {"name":"sensor1"},
#             {"name":"sensor2"}
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Create Tag with addition columns
# columns
# name (varchar, 80), location (varchar, 40)

# data format
# {
#     "tag":[
#         ["sensor01", "3F-101"],
#         ["sensor02", "3F-102"]
#     ]
# }

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"tag\":[[\"sensor01\",\"3F-101\"],[\"sensor02\",\"3F-102\"]]}"

# Return Format
# {
#     "success":true,
#     "reason":"create tag success",
#     "data":{
#         "success_count":2,
#         "tag":[
#             {
#                 "location":"3F-101",
#                 "name":"sensor01"
#             },
#             {
#                 "location":"3F-102",
#                 "name":"sensor02"
#             }
#         ]
#     }
# }

# ------------------------------------------------------------------------------------------------- #

# CASE - Create exist Tag

# data format
# {
#     "tag":[["sensor1"]]
# }

curl -k -X POST $URL -H $CONTENT_HEADER -H $API_HEADER -d "{\"tag\":[[\"sensor1\"], [\"sensor2\"]]}"

# Return Format
# status code:400 Bad Request
# {
#     "success":false,
#     "reason":"Metadata key (sensor1) of TAGDATA table is already inserted."
# }