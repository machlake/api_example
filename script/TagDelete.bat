chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Delete Tag API by using curl in window script
:: written by yeony kim
:: sensor1, sensor2 is applied in lake

set API_KEY=

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set LAKE_ID=c5ehcdmcb0jc72ia6pug
set URL=https://%LAKE_ID%.machlake.com/lakes/tags

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - delete error when no exist tag name

set TAG_NAME=sensor

curl -k -X DELETE %URL% -H %CONTENT_HEADER% -H %API_HEADER% -d "{\"name\": \"%TAG_NAME%\"}"

:: Return Format / Example for tag name does not exist in lake
:: {"message":"no such name : sensor","status":"error"}

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - delete tag

set TAG_NAME=sensor1

curl -k -X DELETE %URL% -H %CONTENT_HEADER% -H %API_HEADER% -d "{\"name\": \"%TAG_NAME%\"}"

:: Return Format / Example for delete tag
:: {"data":{},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - delete tag

set TAG_NAME=sensor2

curl -k -X DELETE %URL% -H %CONTENT_HEADER% -H %API_HEADER% -d "{\"name\": \"%TAG_NAME%\"}"

:: Return Format / Example for delete tag
:: {"data":{},"status":"success"}

