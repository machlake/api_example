chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Get Tag List API by using curl in window script
:: written by yeony kim
:: sensor1, sensor2 is applied in lake

set API_KEY=YOUR_API_KEY
set LAKE_ID=YOUR_LAKE_ID
set CLOUD_VENDOR=YOUR_CLOUD_VENDOR
set CLOUD_REGION=YOUR_CLOUD_REGION

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set URL="https://%CLOUD_VENDOR%.%CLOUD_REGION%.machlake.com/v1/lakes/%LAKE_ID%/tags"

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Select Tag with limit

set ROW_LIMIT=3

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "limit=%ROW_LIMIT%"

:: Return Format
:: {
::     "success": true,
::     "reason": "get tag meta list success",
::     "data":{
::         "tag":[
::             {"name":"sensor1"},
::             {"name":"sensor2"},
::             {"name":"door1"}
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- #

:: CASE - Select Tag with Limit and Offset

set ROW_LIMIT=1
set ROW_OFFSET=1

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "limit=%ROW_LIMIT%" \
    --data-urlencode "offset=%ROW_OFFSET%"

:: Return Format
:: {
::     "success": true,
::     "reason": "get tag meta list success",
::     "data":{
::         "tag":[
::             {"name":"sensor2"}
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- #

:: CASE - Select Tag with name hint

set TAG_NAME=door

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "name=%TAG_NAME%"

:: Return Format
:: {
::     "success": true,
::     "reason": "get tag meta list success",
::     "data":{
::         "tag":[
::             {"name":"door1"}
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- #

:: CASE - Select Tag about not exist

set TAG_NAME=wrong_name

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "name=%TAG_NAME%"

:: Return Format
:: {
::     "success": true,
::     "reason": "get tag meta list success",
::     "data": {
::         "tag": []
::     }
:: }