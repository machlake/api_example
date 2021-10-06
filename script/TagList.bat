chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Get Tag List API by using curl in window script
:: written by yeony kim
:: Lake가 모두 만들어진 상태에서 Lake의 TagSchema(Tag meta) 와 ValueSchema(Value)의 설정값을 모두 알고
:: sensor1과 sensor2가 tag로 등록된 것을 알고 있는 상태

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: zTI-Drfk76e3adxwEoweqiOkupF8LN0V6QCq8nTXlrlDT2zDHx9Vz8nVX14_2y5IhWzydKv-CaMBuCM6UasX1myX19ki4dJr38NYd2k6juYf9"
set LAKE_ID=c5ehcdmcb0jc72ia6pug

set TAG_NAME=
set QUERY_LIMIT=
set QUERY_OFFSET=

set URL="https://%LAKE_ID%.machlake.com/lakes/tags?name=%TAG_NAME%&limit=%QUERY_LIMIT%&offset=%QUERY_OFFSET%"
curl -k -X GET %URL% -H %CONTENT_HEADER% -H %API_HEADER%

:: Return Format
:: {"data":{"tag":[{"name":"sensor1"},{"name":"sensor2"}]},"status":"success"}

set QUERY_LIMIT=1
set QUERY_OFFSET=

set URL="https://%LAKE_ID%.machlake.com/lakes/tags?name=%TAG_NAME%&limit=%QUERY_LIMIT%&offset=%QUERY_OFFSET%"
curl -k -X GET %URL% -H %CONTENT_HEADER% -H %API_HEADER%

:: Return Format
:: {"data":{"tag":[{"name":"sensor1"}]},"status":"success"}

set QUERY_LIMIT=1
set QUERY_OFFSET=1

set URL="https://%LAKE_ID%.machlake.com/lakes/tags?name=%TAG_NAME%&limit=%QUERY_LIMIT%&offset=%QUERY_OFFSET%"
curl -k -X GET %URL% -H %CONTENT_HEADER% -H %API_HEADER%

:: Return Format
:: {"data":{"tag":[{"name":"sensor2"}]},"status":"success"}

set TAG_NAME=OTHER_NAME
set QUERY_LIMIT=
set QUERY_OFFSET=

set URL="https://%LAKE_ID%.machlake.com/lakes/tags?name=%TAG_NAME%&limit=%QUERY_LIMIT%&offset=%QUERY_OFFSET%"
curl -k -X GET %URL% -H %CONTENT_HEADER% -H %API_HEADER%

:: Return Format
:: {"data":{"tag":[]},"status":"success"}