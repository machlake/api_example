chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Delete Single Data for tag API by using curl in window script
:: written by yeony kim

set API_KEY=YOUR_API_KEY
set LAKE_ID=YOUR_LAKE_ID
set CLOUD_VENDOR=YOUR_CLOUD_VENDOR
set CLOUD_REGION=YOUR_CLOUD_REGION

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set URL="https://%CLOUD_VENDOR%.%CLOUD_REGION%.machlake.com/v1/lakes/%LAKE_ID%/values"

set DELETE_TYPE=raw

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Delete Tag value with base_time

set TAG_NAME=sensor1
set BASE_TIME=\"2021-01-06 18:00:00 000:000:000\"

curl -k -X DELETE %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%DELETE_TYPE%" \
    --data-urlencode "tag_name=%TAG_NAME%" \
    --data-urlencode "base_time =%BASE_TIME%"

:: Return Format
:: {
::     "success": true,
::     "reason": "delete value success"
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Delete all Tag value

curl -k -X DELETE %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%DELETE_TYPE%"

:: Return Format / not exist tag name in lake
:: {
::     "success": true,
::     "reason": "delete value success"
:: }

:: -------------------------------------------------------------------------------------------------  #

:: CASE - Delete Tag value when no exist tag name

TAG_NAME=wrong_name

curl -k -X DELETE %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%DELETE_TYPE%" \
    --data-urlencode "tag_name=%TAG_NAME%", 

:: Return Format
:: status code : 400 Bad Request
:: {
::     "success": false,
::     "reason": "Metadata of TAGDATA table is not found. (Key = wrong_name)"
:: }
