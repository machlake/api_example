chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Delete All Data for tag API by using curl in window script
:: written by yeony kim

set API_KEY=YOUR_API_KEY
set LAKE_ID=YOUR_LAKE_ID
set CLOUD_VENDOR=YOUR_CLOUD_VENDOR
set CLOUD_REGION=YOUR_CLOUD_REGION

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set URL="https://%CLOUD_VENDOR%.%CLOUD_REGION%.machlake.com/lakes/%LAKE_ID%/values/raw"

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - DELETE All Tag DATA

set TAG_NAME=
set BASE_TIME=\"\"

curl -k -X DELETE %URL% -H %CONTENT_HEADER% -H %API_HEADER% -d "{\"tag_name\": \"%TAG_NAME%\", \"base_time\": %BASE_TIME%}"

:: Return Format / not exist tag name in lake
:: {"data":{},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::