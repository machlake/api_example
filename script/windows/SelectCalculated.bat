chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Select Calculated Data for tag API by using curl in window script
:: written by yeony kim

set API_KEY=YOUR_API_KEY
set LAKE_ID=YOUR_LAKE_ID
set CLOUD_VENDOR=YOUR_CLOUD_VENDOR
set CLOUD_REGION=YOUR_CLOUD_REGION

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set URL="https://%CLOUD_VENDOR%.%CLOUD_REGION%.machlake.com/v1/lakes/%LAKE_ID%/values"

set SELECT_TYPE=calc
set TAG_NAME=sensor1,sensor2

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min

set CALC_MODE=min
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set START_TIME=2021-01-06 17:00:00 000:000:000
set END_TIME=2021-01-06 21:00:00 000:000:000

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%" \
    --data-urlencode "tag_name=%TAG_NAME%" \
    --data-urlencode "calc_mode=%CALC_MODE%" \
    --data-urlencode "start_time=%START_TIME%" \
    --data-urlencode "end_time=%END_TIME%" \
    --data-urlencode "date_format=%DATE_FORMAT%"

:: Return Format
:: {
::     "success": true,
::     "reason": "success",
::     "data":{
::         "columns":[
::             {"name":"NAME","type":5,"length":80},
::             {"name":"TIME","type":5,"length":4096},
::             {"name":"VALUE","type":20,"length":17}
::         ],
::         "rows":[
::             ["sensor1","2021-01-06 17:00:00 000:000:000",1],
::             ["sensor2","2021-01-06 17:00:00 000:000:000",1],
::             ["sensor2","2021-01-06 17:00:01 000:000:000",1.5],
::             ["sensor2","2021-01-06 17:00:02 000:000:000",2],
::             ["sensor2","2021-01-06 17:00:03 000:000:000",1],
::             ["sensor2","2021-01-06 17:00:04 000:000:000",1.5],
::             ["sensor2","2021-01-06 17:00:05 000:000:000",2],
::             ["sensor1","2021-01-06 18:00:00 000:000:000",2],
::             ["sensor2","2021-01-06 18:00:00 000:000:000",2],
::             ["sensor1","2021-01-06 20:00:04 000:000:000",2],
::             ["sensor2","2021-01-06 20:00:04 000:000:000",2],
::             ["sensor1","2021-01-06 20:00:05 000:000:000",2.5],
::             ["sensor2","2021-01-06 20:00:05 000:000:000",2.5],
::             ["sensor1","2021-01-06 20:00:06 000:000:000",2]
::             ["sensor2","2021-01-06 20:00:06 000:000:000",2]
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=max and interval_value=3

set CALC_MODE=max
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set START_TIME=2021-01-06 17:00:00 000:000:000
set END_TIME=2021-01-06 21:00:00 000:000:000
set INTERVAL_VALUE=3

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%" \
    --data-urlencode "tag_name=%TAG_NAME%" \
    --data-urlencode "calc_mode=%CALC_MODE%" \
    --data-urlencode "start_time=%START_TIME%" \
    --data-urlencode "end_time=%END_TIME%" \
    --data-urlencode "date_format=%DATE_FORMAT%" \
    --data-urlencode "interval_value=%INTERVAL_VALUE%"

:: Return Format
:: {
::     "success": true,
::     "reason": "success",
::     "data":{
::         "columns":[
::             {"name":"NAME","type":5,"length":80},
::             {"name":"TIME","type":5,"length":4096},
::             {"name":"VALUE","type":20,"length":17}
::         ],
::         "rows":[
::             ["sensor2","2021-01-06 17:00:00 000:000:000",2],
::             ["sensor1","2021-01-06 17:00:00 000:000:000",2],
::             ["sensor2","2021-01-06 17:00:03 000:000:000",2],
::             ["sensor2","2021-01-06 18:00:00 000:000:000",2.5],
::             ["sensor1","2021-01-06 18:00:00 000:000:000",2.5],
::             ["sensor2","2021-01-06 20:00:03 000:000:000",2.5],
::             ["sensor1","2021-01-06 20:00:03 000:000:000",2.5],
::             ["sensor2","2021-01-06 20:00:06 000:000:000",2],
::             ["sensor1","2021-01-06 20:00:06 000:000:000",2]
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min and interval_type=m and interval_value=90

set CALC_MODE=min
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set START_TIME=2021-01-06 17:00:00 000:000:000
set END_TIME=2021-01-06 21:00:00 000:000:000
set INTERVAL_TYPE=m
set INTERVAL_VALUE=90

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%" \
    --data-urlencode "tag_name=%TAG_NAME%" \
    --data-urlencode "calc_mode=%CALC_MODE%" \
    --data-urlencode "start_time=%START_TIME%" \
    --data-urlencode "end_time=%END_TIME%" \
    --data-urlencode "date_format=%DATE_FORMAT%" \
    --data-urlencode "interval_value=%INTERVAL_VALUE%" \
    --data-urlencode "interval_type=%INTERVAL_TYPE%"

:: Return Format
:: {
::     "success": true,
::     "reason": "success",
::     "data":{
::         "columns":[
::             {"name":"NAME","type":5,"length":80},
::             {"name":"TIME","type":5,"length":4096},
::             {"name":"VALUE","type":12,"length":20}
::         ],
::         "rows":[
::             ["sensor1","2021-01-06 16:30:00 000:000:000",1],
::             ["sensor2","2021-01-06 16:30:00 000:000:000",1],
::             ["sensor1","2021-01-06 18:00:00 000:000:000",1],
::             ["sensor2","2021-01-06 18:00:00 000:000:000",1],
::             ["sensor1","2021-01-06 19:30:00 000:000:000",1],
::             ["sensor2","2021-01-06 19:30:00 000:000:000",1],
::         ]
::     }
:: }
