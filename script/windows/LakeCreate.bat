chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Create Lake API by using curl in window script
:: written by yeony kim

set API_KEY=YOUR_API_KEY

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"

set URL="https://api.machlake.com/lakes"

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - create LAKE

curl -k -X POST %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data "{\"lake_info\":{\"lake_name\":\"sample_lake\",\"lake_plan\":\"basic\",\"owner\":\"YOUR_MACHLAKE_ID\",\"region\":\"ap-northeast-2\",\"timezone\":\"Asia/Seoul\",\"storage_size\":20},\"tag_schema\":[{\"col_name\":\"name\",\"col_type\":\"varchar\",\"col_length\":40}],\"value_schema\":[{\"col_name\":\"time\",\"col_type\":\"datetime\"},{\"col_name\":\"value\",\"col_type\":\"double\"}]}"

:: Return Format
:: {"data":"YOUR_LAKE_ID","status":"success"}