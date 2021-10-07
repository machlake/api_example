chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Get Tag View API by using curl in window script
:: written by yeony kim
:: sensor1, sensor2 is applied in lake

set API_KEY=

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set LAKE_ID=c5ehcdmcb0jc72ia6pug
set URL=https://%LAKE_ID%.machlake.com/lakes/tag

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