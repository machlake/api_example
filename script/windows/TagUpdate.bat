chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Update Tag API by using curl in window script
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

:: CASE - Update Tag Name

set SRC_TAG_NAME=sensor1
set TAR_TAG_NAME=sensor10
set VALUES="{\"name\": \"%SRC_TAG_NAME%\", \"columns\": [{\"col_name\": \"name\", \"value\": \"%TAR_TAG_NAME%\"}]}"

curl -k -X PUT %URL% -H %CONTENT_HEADER% -H %API_HEADER%  -d %VALUES%

:: Return Format
:: {
::     "success": true,
::     "reason": "update tag meta success",
::     "data":{"name":"sensor10"}
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Update Tag additional column
:: columns
:: name (varchar, 80), location (varchar, 40)

set SRC_TAG_NAME=sensor02
set ADD_COLUMN=4F-101
set VALUES="{\"name\": \"%SRC_TAG_NAME%\", \"columns\": [{\"col_name\": \"location\", \"value\": \"%ADD_COLUMN%\"}]}"

curl -k -X PUT %URL% -H %CONTENT_HEADER% -H %API_HEADER%  -d %VALUES%

:: Return Format
:: {
::     "success": true,
::     "reason": "update tag meta success",
::     "data": {
::         "location": "4F-101",
::         "name": "sensor02"
::     }
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Update Tag when not exist tag

set SRC_TAG_NAME=wrong_name
set ADD_COLUMN=4F-101
set VALUES="{\"name\": \"%SRC_TAG_NAME%\", \"columns\": [{\"col_name\": \"location\", \"value\": \"%ADD_COLUMN%\"}]}"

curl -k -X PUT %URL% -H %CONTENT_HEADER% -H %API_HEADER%  -d %VALUES%

:: Return Format
:: status code : 400 Bad Request
:: {
::     "success": false,
::     "reason": "no such name : wrong_name"
:: }