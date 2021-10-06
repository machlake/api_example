chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Create Tag API by using curl in window script
:: written by yeony kim
:: Lake가 모두 만들어진 상태에서 Lake의 TagSchema(Tag meta) 와 ValueSchema(Value)의 설정값을 모두 알고 있는 상태에서 진행

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: zTI-Drfk76e3adxwEoweqiOkupF8LN0V6QCq8nTXlrlDT2zDHx9Vz8nVX14_2y5IhWzydKv-CaMBuCM6UasX1myX19ki4dJr38NYd2k6juYf9"
set LAKE_ID=c5ehcdmcb0jc72ia6pug

set URL=https://%LAKE_ID%.machlake.com/lakes/tags
curl -k -X POST %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data "{\"tag\": [[\"sensor1\"], [\"sensor2\"]]}"

:: Return Format
:: {"data":{"success_count":2,"tag":[{"name":"sensor1"},{"name":"sensor2"}]},"status":"success"}

set URL=https://%LAKE_ID%.machlake.com/lakes/tags
curl -k -X POST %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data "{\"tag\": [[\"sensor1\"], [\"sensor2\"]]}"

:: Return Format / 같은 tag 이름이 존재할때 반환 예제
:: {"message":"Metadata key (sensor2) of TAGDATA table is already inserted.","status":"error"}