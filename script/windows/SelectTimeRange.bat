chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Select Data by Time Range for tag API by using curl in window script
:: written by yeony kim

set API_KEY=

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set LAKE_ID=YOUR_LAKE_ID
set URL="https://%LAKE_ID%.machlake.com/lakes/values/time_range"

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set TAG_NAME=sensor1,sensor2
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data-urlencode "tag_name=%TAG_NAME%" --data-urlencode "date_format=%DATE_FORMAT%"

:: Return Format
:: {"data":{"columns":[{"length":4096,"name":"MIN","type":5},{"length":4096,"name":"MAX","type":5}],"samples":[{"data":[{"MAX":"2021-01-07 02:00:00 009:000:000","MIN":"2021-01-06 17:00:00 000:000:000"}],"tag_name":"sensor2"},{"data":[{"MAX":"2021-01-06 20:00:06 000:000:000","MIN":"2021-01-06 17:00:00 001:000:000"}],"tag_name":"sensor1"}]},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::
:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Current DATA GET with date format nanosecond timestamp
set TAG_NAME=sensor1,sensor2
set DATE_FORMAT=NANOSECOND

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data-urlencode "tag_name=%TAG_NAME%" --data-urlencode "date_format=%DATE_FORMAT%"

:: Return Format
:: {"data":{"columns":[{"length":20,"name":"MIN","type":12},{"length":20,"name":"MAX","type":12}],"samples":[{"data":[{"MAX":1609952400009000000,"MIN":1609920000000000000}],"tag_name":"sensor2"},{"data":[{"MAX":1609930806000000000,"MIN":1609920000001000000}],"tag_name":"sensor1"}]},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::