chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Insert Bulk Data for tag API by using curl in window script
:: written by yeony kim

set API_KEY=YOUR_API_KEY
set LAKE_ID=YOUR_LAKE_ID
set CLOUD_VENDOR=YOUR_CLOUD_VENDOR
set CLOUD_REGION=YOUR_CLOUD_REGION

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set URL="https://%CLOUD_VENDOR%.%CLOUD_REGION%.machlake.com/lakes/%LAKE_ID%/values/bulk"

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Insert Bulk Data with nano date time string format

set DATE_FORMAT=\"YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn\"
set VALUES=[[\"sensor1\", \"2021-01-06 18:00:00 001:000:000\", 2.0], [\"sensor1\", \"2021-01-06 18:00:00 002:000:000\", 2.5], [\"sensor1\", \"2021-01-06 18:00:00 003:000:000\", 2.0], [\"sensor2\", \"2021-01-06 18:00:00 001:000:000\", 2.0], [\"sensor2\", \"2021-01-06 18:00:00 002:000:000\", 2.5], [\"sensor2\", \"2021-01-06 18:00:00 003:000:000\", 2.0]]

curl -k -X POST %URL% -H %CONTENT_HEADER% -H %API_HEADER%  -d "{\"date_format\": %DATE_FORMAT%, \"values\": %VALUES%}"

:: Return Format
:: {"data":{"fail":0,"success":6},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Insert Bulk Data with nano date time stamp

set VALUES=[[\"sensor1\", 1609930804000000000, 2.0], [\"sensor1\", 1609930805000000000, 2.5], [\"sensor1\", 1609930806000000000, 2.0], [\"sensor2\", 1609930804000000000, 2.0], [\"sensor2\", 1609930805000000000, 2.5], [\"sensor2\", 1609930806000000000, 2.0]]

curl -k -X POST %URL% -H %CONTENT_HEADER% -H %API_HEADER%  -d "{\"values\": %VALUES%}"

:: Return Format
:: {"data":{"fail":0,"success":6},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::