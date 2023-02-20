chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Select Raw Data for tag API by using curl in window script
:: written by yeony kim

set API_KEY=YOUR_API_KEY
set LAKE_ID=YOUR_LAKE_ID
set CLOUD_VENDOR=YOUR_CLOUD_VENDOR
set CLOUD_REGION=YOUR_CLOUD_REGION

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set URL="https://%CLOUD_VENDOR%.%CLOUD_REGION%.machlake.com/v1/lakes/%LAKE_ID%/values"

set SELECT_TYPE=raw

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

set TAG_NAME=sensor1
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set START_TIME=2021-01-06 17:00:00 000:000:000
set END_TIME=2021-01-06 21:00:00 000:000:000

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%" \
    --data-urlencode "tag_name=%TAG_NAME%" \
    --data-urlencode "date_format=%DATE_FORMAT%" \
    --data-urlencode "start_time=%START_TIME%" \
    --data-urlencode "end_time=%END_TIME%"

:: Return Format
:: {
::     "success":true,
::     "reason":"success",
::     "data":{
::         "columns":[
::             {"name":"NAME","type":5,"length":80},
::             {"name":"TIME","type":5,"length":4096},
::             {"name":"VALUE","type":20,"length":17}
::         ],
::         "rows":[
::             ["sensor1","2021-01-06 17:00:00 001:000:000",1],
::             ["sensor1","2021-01-06 17:00:00 002:000:000",1.5],
::             ["sensor1","2021-01-06 17:00:00 003:000:000",2],
::             ["sensor1","2021-01-06 17:00:00 004:000:000",1],
::             ["sensor1","2021-01-06 17:00:00 005:000:000",1.5],
::             ["sensor1","2021-01-06 17:00:00 006:000:000",2],
::             ["sensor1","2021-01-06 17:00:00 007:000:000",1],
::             ["sensor1","2021-01-06 17:00:00 008:000:000",1.5],
::             ["sensor1","2021-01-06 17:00:00 009:000:000",2],
::             ["sensor1","2021-01-06 18:00:00 001:000:000",2],
::             ["sensor1","2021-01-06 18:00:00 002:000:000",2.5],
::             ["sensor1","2021-01-06 18:00:00 003:000:000",2]
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS

set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS
set TAG_NAME=sensor1
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS
set START_TIME=2021-01-06 17:00:00
set END_TIME=2021-01-06 21:00:00

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%" \
    --data-urlencode "tag_name=%TAG_NAME%" \
    --data-urlencode "date_format=%DATE_FORMAT%" \
    --data-urlencode "start_time=%START_TIME%" \
    --data-urlencode "end_time=%END_TIME%"

:: Return Format
:: {
::     "success":true,
::     "reason":"success",
::     "data":{
::         "columns":[
::             {"name":"NAME","type":5,"length":80},
::             {"name":"TIME","type":5,"length":4096},
::             {"name":"VALUE","type":20,"length":17}
::         ],
::         "rows":[
::             ["sensor1","2021-01-06 17:00:00",1],
::             ["sensor1","2021-01-06 17:00:00",1.5],
::             ["sensor1","2021-01-06 17:00:00",2],
::             ["sensor1","2021-01-06 17:00:00",1],
::             ["sensor1","2021-01-06 17:00:00",1.5],
::             ["sensor1","2021-01-06 17:00:00",2],
::             ["sensor1","2021-01-06 17:00:00",1],
::             ["sensor1","2021-01-06 17:00:00",1.5],
::             ["sensor1","2021-01-06 17:00:00",2],
::             ["sensor1","2021-01-06 18:00:00",2],
::             ["sensor1","2021-01-06 18:00:00",2.5],
::             ["sensor1","2021-01-06 18:00:00",2]
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS, data inserted with date skip mmm:uuu:nnn

set TAG_NAME=sensor2
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set START_TIME=2021-01-06 17:00:00 000:000:000
set END_TIME=2021-01-06 21:00:00 000:000:000

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%" \
    --data-urlencode "tag_name=%TAG_NAME%" \
    --data-urlencode "date_format=%DATE_FORMAT%" \
    --data-urlencode "start_time=%START_TIME%" \
    --data-urlencode "end_time=%END_TIME%"

:: Return Format
:: {
::     "success":true,
::     "reason":"success",
::     "data":{
::         "columns":[
::             {"name":"NAME","type":5,"length":80},
::             {"name":"TIME","type":5,"length":4096},
::             {"name":"VALUE","type":20,"length":17}
::         ],
::         "rows":[
::             ["sensor2","2021-01-06 17:00:00 000:000:000",1],
::             ["sensor2","2021-01-06 17:00:01 000:000:000",1.5],
::             ["sensor2","2021-01-06 17:00:02 000:000:000",2],
::             ["sensor2","2021-01-06 17:00:03 000:000:000",1],
::             ["sensor2","2021-01-06 17:00:04 000:000:000",1.5],
::             ["sensor2","2021-01-06 17:00:05 000:000:000",2],
::             ["sensor2","2021-01-06 18:00:00 001:000:000",2],
::             ["sensor2","2021-01-06 18:00:00 002:000:000",2.5],
::             ["sensor2","2021-01-06 18:00:00 003:000:000",2],
::             ["sensor2","2021-01-06 20:00:04 000:000:000",2],
::             ["sensor2","2021-01-06 20:00:05 000:000:000",2.5],
::             ["sensor2","2021-01-06 20:00:06 000:000:000",2]
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - DATA GET with UTC-0 timezone

set TZ=Africa/Abidjan
set TAG_NAME=sensor2
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set START_TIME=2021-01-06 17:00:00 000:000:000
set END_TIME=2021-01-06 21:00:00 000:000:000

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%" \
    --data-urlencode "timezone=%TZ%" \
    --data-urlencode "tag_name=%TAG_NAME%" \
    --data-urlencode "date_format=%DATE_FORMAT%" \
    --data-urlencode "start_time=%START_TIME%" \
    --data-urlencode "end_time=%END_TIME%"

:: Return Format
:: {
::     "success":true,
::     "reason":"success",
::     "data":{
::         "columns":[
::             {"name":"NAME","type":5,"length":80},
::             {"name":"TIME","type":5,"length":4096},
::             {"name":"VALUE","type":20,"length":17}
::         ],
::         "rows":[
::             ["sensor2","2021-01-06 17:00:00 007:000:000",1],
::             ["sensor2","2021-01-06 17:00:00 008:000:000",1.5],
::             ["sensor2","2021-01-06 17:00:00 009:000:000",2]
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - DATA GET with local timezone, data inserted UTC-0 timezone setting

set TAG_NAME=sensor2
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set START_TIME=2021-01-07 02:00:00 000:000:000
set END_TIME=2021-01-07 12:00:00 000:000:000

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%" \
    --data-urlencode "tag_name=%TAG_NAME%" \
    --data-urlencode "date_format=%DATE_FORMAT%" \
    --data-urlencode "start_time=%START_TIME%" \
    --data-urlencode "end_time=%END_TIME%"

:: Return Format
:: {
::     "success":true,
::     "reason":"success",
::     "data":{
::         "columns":[
::             {"name":"NAME","type":5,"length":80},
::             {"name":"TIME","type":5,"length":4096},
::             {"name":"VALUE","type":20,"length":17}
::         ],
::         "rows":[
::             ["sensor2","2021-01-07 02:00:00 007:000:000",1],
::             ["sensor2","2021-01-07 02:00:00 008:000:000",1.5],
::             ["sensor2","2021-01-07 02:00:00 009:000:000",2]
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - DATA GET with limit and offset

set TAG_NAME=sensor1,sensor2
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set START_TIME=2021-01-06 17:00:00 000:000:000
set END_TIME=2021-01-06 21:00:00 000:000:000
set LIMIT=10
set OFFSET=5

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%" \
    --data-urlencode "tag_name=%TAG_NAME%" \
    --data-urlencode "date_format=%DATE_FORMAT%" \
    --data-urlencode "start_time=%START_TIME%" \
    --data-urlencode "end_time=%END_TIME%" \
    --data-urlencode "limit=%LIMIT%" \
    --data-urlencode "offset=%OFFSET%"

:: Return Format
:: {
::     "success":true,
::     "reason":"success",
::     "data":{
::         "columns":[
::             {"name":"NAME","type":5,"length":80},
::             {"name":"TIME","type":5,"length":4096},
::             {"name":"VALUE","type":20,"length":17}
::         ],
::         "rows":[
::             ["sensor1","2021-01-06 17:00:00 006:000:000",2],
::             ["sensor1","2021-01-06 17:00:00 007:000:000",1],
::             ["sensor1","2021-01-06 17:00:00 008:000:000",1.5],
::             ["sensor1","2021-01-06 17:00:00 009:000:000",2],
::             ["sensor1","2021-01-06 18:00:00 001:000:000",2],
::             ["sensor1","2021-01-06 18:00:00 002:000:000",2.5],
::             ["sensor1","2021-01-06 18:00:00 003:000:000",2],
::             ["sensor1","2021-01-06 20:00:04 000:000:000",2],
::             ["sensor1","2021-01-06 20:00:05 000:000:000",2.5],
::             ["sensor1","2021-01-06 20:00:06 000:000:000",2]
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - DATA GET with descent by time

set TAG_NAME=sensor1,sensor2
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set START_TIME=2021-01-06 17:00:00 000:000:000
set END_TIME=2021-01-06 21:00:00 000:000:000
set DIRECTION=1

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%" \
    --data-urlencode "tag_name=%TAG_NAME%" \
    --data-urlencode "date_format=%DATE_FORMAT%" \
    --data-urlencode "start_time=%START_TIME%" \
    --data-urlencode "end_time=%END_TIME%" \
    --data-urlencode "direction=%DIRECTION%"

:: Return Format
:: {
::     "success":true,
::     "reason":"success",
::     "data":{
::         "columns":[
::             {"name":"NAME","type":5,"length":80},
::             {"name":"TIME","type":5,"length":4096},
::             {"name":"VALUE","type":20,"length":17}
::         ],
::         "rows":[
::             ["sensor2","2021-01-06 20:00:06 000:000:000",2],
::             ["sensor1","2021-01-06 20:00:06 000:000:000",2],
::             ["sensor2","2021-01-06 20:00:05 000:000:000",2.5],
::             ["sensor1","2021-01-06 20:00:05 000:000:000",2.5],
::             ["sensor2","2021-01-06 20:00:04 000:000:000",2],
::             ["sensor1","2021-01-06 20:00:04 000:000:000",2],
::             ["sensor2","2021-01-06 18:00:00 003:000:000",2],
::             ["sensor1","2021-01-06 18:00:00 003:000:000",2],
::             ["sensor2","2021-01-06 18:00:00 002:000:000",2.5],
::             ["sensor1","2021-01-06 18:00:00 002:000:000",2.5],
::             ["sensor2","2021-01-06 18:00:00 001:000:000",2],
::             ["sensor1","2021-01-06 18:00:00 001:000:000",2],
::             ["sensor2","2021-01-06 17:00:05 000:000:000",2],
::             ["sensor2","2021-01-06 17:00:04 000:000:000",1.5],
::             ["sensor2","2021-01-06 17:00:03 000:000:000",1],
::             ["sensor2","2021-01-06 17:00:02 000:000:000",2],
::             ["sensor2","2021-01-06 17:00:01 000:000:000",1.5],
::             ["sensor1","2021-01-06 17:00:00 009:000:000",2],
::             ["sensor1","2021-01-06 17:00:00 008:000:000",1.5],
::             ["sensor1","2021-01-06 17:00:00 007:000:000",1],
::             ["sensor1","2021-01-06 17:00:00 006:000:000",2],
::             ["sensor1","2021-01-06 17:00:00 005:000:000",1.5],
::             ["sensor1","2021-01-06 17:00:00 004:000:000",1],
::             ["sensor1","2021-01-06 17:00:00 003:000:000",2],
::             ["sensor1","2021-01-06 17:00:00 002:000:000",1.5],
::             ["sensor1","2021-01-06 17:00:00 001:000:000",1],
::             ["sensor2","2021-01-06 17:00:00 000:000:000",1]
::         ]
::     }
:: }