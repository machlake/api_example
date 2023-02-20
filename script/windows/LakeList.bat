chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Get Lake List API by using curl in window script
:: written by yeony kim

set API_KEY=YOUR_API_KEY

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"

set URL="https://api.machlake.com/v1/lakes"

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - GET LAKE List

curl -k -X GET %URL% -H %CONTENT_HEADER% -H %API_HEADER%

:: Return Format
:: {
::     "success" : true,
::     "reason"  : "get list success",
::     "data": [
::         {
::             "lake_id" : "{lake_id}",
::             "lake_info" : {
::                 "lake_name"    : "sample_lake",
::                 "lake_plan"    : "basic",
::                 "region"       : "aws1.kor",
::                 "timezone"     : "Asia/Seoul"
::             }
::         },
::         ......
::     ]
:: }
