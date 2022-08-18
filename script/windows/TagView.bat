chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Get Tag View API by using curl in window script
:: written by yeony kim
:: sensor1, sensor2 is applied in lake

set API_KEY=YOUR_API_KEY
set LAKE_ID=YOUR_LAKE_ID
set CLOUD_VENDOR=YOUR_CLOUD_VENDOR
set CLOUD_REGION=YOUR_CLOUD_REGION

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set URL="https://%CLOUD_VENDOR%.%CLOUD_REGION%.machlake.com/lakes/%LAKE_ID%/tag"

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Get Tag Information

set TAG_NAME=sensor

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data-urlencode "name=%TAG_NAME%"

:: Return Format / not exist tag name in lake
:: {"message":"no such name : sensor","status":"error"}

set TAG_NAME=sensor1

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data-urlencode "name=%TAG_NAME%"
:: Return Format
:: {"data":{"name":"sensor1"},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::