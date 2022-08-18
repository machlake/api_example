chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Insert Standard Data for tag API by using curl in window script
:: written by yeony kim

set API_KEY=YOUR_API_KEY
set LAKE_ID=YOUR_LAKE_ID
set CLOUD_VENDOR=YOUR_CLOUD_VENDOR
set CLOUD_REGION=YOUR_CLOUD_REGION

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set URL="https://%CLOUD_VENDOR%.%CLOUD_REGION%.machlake.com/lakes/%LAKE_ID%/values/standard"

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Insert Data with nano date time string format

set TAG_NAME=sensor1
set DATE_FORMAT=\"YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn\"
set VALUES=[[\"2021-01-06 17:00:00 001:000:000\", 1.0], [\"2021-01-06 17:00:00 002:000:000\", 1.5], [\"2021-01-06 17:00:00 003:000:000\", 2.0]]

curl -k -X POST %URL% -H %CONTENT_HEADER% -H %API_HEADER%  -d "{\"tag_name\": \"%TAG_NAME%\", \"date_format\": %DATE_FORMAT%, \"values\": %VALUES%}"

:: Return Format 
:: {"data":{"fail":0,"success":3},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Insert Data with time format is empty but data format in data is nano date time string

set TAG_NAME=sensor1
set DATE_FORMAT=\"\"
set VALUES=[[\"2021-01-06 17:00:00 004:000:000\", 1.0], [\"2021-01-06 17:00:00 005:000:000\", 1.5], [\"2021-01-06 17:00:00 006:000:000\", 2.0]]

curl -k -X POST %URL% -H %CONTENT_HEADER% -H %API_HEADER%  -d "{\"tag_name\": \"%TAG_NAME%\", \"date_format\": %DATE_FORMAT%, \"values\": %VALUES%}"

:: Return Format  / date_format이 맞지 않아도 success 함
:: {"data":{"fail":0,"success":3},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Insert Data with utc-0 time zone and time format is empty but data format in data is nano date time string

set TAG_NAME=sensor1
set DATE_FORMAT=\"\"
set VALUES=[[\"2021-01-06 8:00:00 007:000:000\", 1.0], [\"2021-01-06 8:00:00 008:000:000\", 1.5], [\"2021-01-06 8:00:00 009:000:000\", 2.0]]

curl -k -X POST %URL% -H "Use-Timezone: Africa/Abidjan" -H %CONTENT_HEADER% -H %API_HEADER%  -d "{\"tag_name\": \"%TAG_NAME%\", \"date_format\": %DATE_FORMAT%, \"values\": %VALUES%}"

:: Return Format 
:: {"data":{"fail":0,"success":3},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Insert Data with date time string format

set TAG_NAME=sensor2
set DATE_FORMAT=\"YYYY-MM-DD HH24:MI:SS\"
set VALUES=[[\"2021-01-06 17:00:00\", 1.0], [\"2021-01-06 17:00:01\", 1.5], [\"2021-01-06 17:00:02\", 2.0]]

curl -k -X POST %URL% -H %CONTENT_HEADER% -H %API_HEADER%  -d "{\"tag_name\": \"%TAG_NAME%\", \"date_format\": %DATE_FORMAT%, \"values\": %VALUES%}"

:: Return Format 
:: {"data":{"fail":0,"success":3},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Insert Data with nano-timestamp

set TAG_NAME=sensor2
set VALUES=[[1609920003000000000, 1.0], [1609920004000000000, 1.5], [1609920005000000000, 2.0]]

curl -k -X POST %URL% -H %CONTENT_HEADER% -H %API_HEADER%  -d "{\"tag_name\": \"sensor2\", \"values\": %VALUES%}"

:: Return Format  / timestamp 사용 예제
:: {"data":{"fail":0,"success":3},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Insert Data with utc-0 time zone and date time string format but data format in data is nano date time string

set TAG_NAME=sensor2
set DATE_FORMAT=\"YYYY-MM-DD HH24:MI:SS\"
set VALUES=[[\"2021-01-06 17:00:00 007:000:000\", 1.0], [\"2021-01-06 17:00:00 008:000:000\", 1.5], [\"2021-01-06 17:00:00 009:000:000\", 2.0]]

curl -k -X POST %URL% -H "Use-Timezone: Africa/Abidjan" -H %CONTENT_HEADER% -H %API_HEADER%  -d "{\"tag_name\": \"%TAG_NAME%\", \"date_format\": %DATE_FORMAT%, \"values\": %VALUES%}"

:: Return Format / Time Zone 사용 (UTC-0)
:: {"data":{"fail":0,"success":3},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::