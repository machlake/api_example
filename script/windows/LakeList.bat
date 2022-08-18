chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Get Lake List API by using curl in window script
:: written by yeony kim

set API_KEY=YOUR_API_KEY

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"

set URL="https://api.machlake.com/lakes"

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - GET LAKE List

curl -k -X GET %URL% -H %CONTENT_HEADER% -H %API_HEADER%

:: Return Format
:: {"data":{"lake":[{"lake_id":"YOUR_LAKE_ID","lake_info":{"lake_name":"sample_lake","lake_plan":"basic","region":"ap-northeast-2","timezone":"Asia/Seoul"}}],"mount":[],"share":[]},"status":"success"}
