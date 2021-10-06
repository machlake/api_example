chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Get Tag View API by using curl in window script
:: written by yeony kim
:: Lake가 모두 만들어진 상태에서 Lake의 TagSchema(Tag meta) 와 ValueSchema(Value)의 설정값을 모두 알고
:: sensor1과 sensor2가 tag로 등록된 것을 알고 있는 상태

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: zTI-Drfk76e3adxwEoweqiOkupF8LN0V6QCq8nTXlrlDT2zDHx9Vz8nVX14_2y5IhWzydKv-CaMBuCM6UasX1myX19ki4dJr38NYd2k6juYf9"
set LAKE_ID=c5ehcdmcb0jc72ia6pug

set TAG_NAME=sensor

set URL=https://%LAKE_ID%.machlake.com/lakes/tag?name=%TAG_NAME%
curl -k -X GET %URL% -H %CONTENT_HEADER% -H %API_HEADER%

:: Return Format / tag name이 match 되는 것이 없는 예제
:: {"message":"no such name : sensor","status":"error"}

set TAG_NAME=sensor1

set URL=https://%LAKE_ID%.machlake.com/lakes/tag?name=%TAG_NAME%
curl -k -X GET %URL% -H %CONTENT_HEADER% -H %API_HEADER%
:: Return Format
:: {"data":{"name":"sensor1"},"status":"success"}