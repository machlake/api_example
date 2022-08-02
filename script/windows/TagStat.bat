chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Get Tag List API by using curl in window script
:: written by yeony kim
:: sensor1, sensor2 is applied in lake

set API_KEY=
set LAKE_ID=
set API_KEY=
set CLOUD_VENDOR=
set CLOUD_REGION=
set TAG_NAME=

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set URL=https://%CLOUD_VENDOR%.%CLOUD_REGION%.machlake.com/lakes/%LAKE_ID%/values/stat

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Select Tag

set TAG_NAME=sensor
set QUERY_LIMIT=
set QUERY_OFFSET=


curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data-urlencode "name=%TAG_NAME%" --data-urlencode "limit=%QUERY_LIMIT%" --data-urlencode "offset=%QUERY_OFFSET%"

:: Return Format / Example For 
:: {"data":{"tag":[{"name":"sensor1"},{"name":"sensor2"}]},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Select Tag with SQL Limit

set QUERY_LIMIT=1
set QUERY_OFFSET=

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data-urlencode "name=%TAG_NAME%" --data-urlencode "limit=%QUERY_LIMIT%" --data-urlencode "offset=%QUERY_OFFSET%"

:: Return Format
:: {"data":{"tag":[{"name":"sensor1"}]},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Select Tag with SQL Limit and SQL Offset

set QUERY_LIMIT=1
set QUERY_OFFSET=1

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data-urlencode "name=%TAG_NAME%" --data-urlencode "limit=%QUERY_LIMIT%" --data-urlencode "offset=%QUERY_OFFSET%"

:: Return Format
:: {"data":{"tag":[{"name":"sensor2"}]},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Select Tag about not exist

set TAG_NAME=OTHER_NAME
set QUERY_LIMIT=
set QUERY_OFFSET=

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data-urlencode "name=%TAG_NAME%" --data-urlencode "limit=%QUERY_LIMIT%" --data-urlencode "offset=%QUERY_OFFSET%"

:: Return Format
:: {"data":{"tag":[]},"status":"success"}