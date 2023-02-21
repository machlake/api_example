chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Get Tag List API by using curl in window script
:: written by yeony kim
:: sensor1, sensor2 is applied in lake

set API_KEY=YOUR_API_KEY
set LAKE_ID=YOUR_LAKE_ID
set CLOUD_VENDOR=YOUR_CLOUD_VENDOR
set CLOUD_REGION=YOUR_CLOUD_REGION
set TAG_NAME=YOUR_TAG_NAME

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set URL="https://%CLOUD_VENDOR%.%CLOUD_REGION%.machlake.com/v1/lakes/%LAKE_ID%/values"

set SELECT_TYPE=stat

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Select Tag

set TAG_NAME=sensor1

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%" \
    --data-urlencode "name=%TAG_NAME%"

:: Return Format / Example For 
:: {
::     "success": true,
::     "reason": "success",
::     "data": {
::         "columns": [
::             {"name":"NAME","type":5,"length":100},
::             {"name":"ROW_COUNT","type":112,"length":20},
::             {"name":"MIN_VALUE","type":20,"length":17},
::             {"name":"MAX_VALUE","type":20,"length":17},
::             {"name":"MIN_TIME","type":5,"length":4096},
::             {"name":"MAX_TIME","type":5,"length":4096},
::             {"name":"MIN_VALUE_TIME","type":5,"length":4096},
::             {"name":"MAX_VALUE_TIME","type":5,"length":4096},
::             {"name":"RECENT_ROW_TIME","type":5,"length":4096}
::         ],
::         "rows": [
::             ["sensor1",103277000,0,3999,"2022-07-05 14:14:08","2022-07-06 12:15:11","2022-07-06 12:15:04","2022-07-06 12:14:35","2022-07-06 12:15:11"]
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Select Tag with date_format

set TAG_NAME=sensor1
:: MILLISECOND
set DATE_FORMAT=MS

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%"  \
    --data-urlencode "tag_name=%TAG_NAME%" \
    --data-urlencode "date_format=%DATE_FORMAT%"

:: Return Format
:: {
::     "success": true,
::     "reason": "success",
::     "data": {
::         "columns": [
::             {"name":"NAME","type":5,"length":100},
::             {"name":"ROW_COUNT","type":112,"length":20},
::             {"name":"MIN_VALUE","type":20,"length":17},
::             {"name":"MAX_VALUE","type":20,"length":17},
::             {"name":"MIN_TIME","type":12,"length":20},
::             {"name":"MAX_TIME","type":12,"length":20},
::             {"name":"MIN_VALUE_TIME","type":12,"length":20},
::             {"name":"MAX_VALUE_TIME","type":12,"length":20},
::             {"name":"RECENT_ROW_TIME","type":12,"length":20}
::         ],
::         "rows": [
::             ["sensor1",103277006,0,3999,1675142048271,1676596324000,1675653288184,1675653301116,1676596324000]
::         ]
::     }
:: }

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Select Tag about not exist

set TAG_NAME=OTHER_NAME

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% \
    --data-urlencode "type=%SELECT_TYPE%"  \
    --data-urlencode "tag_name=%TAG_NAME%"

:: Return Format
:: {
::     "success": true,
::     "reason": "success",
::     "data": {
::         "columns": [
::             {"name":"NAME","type":5,"length":100},
::             {"name":"ROW_COUNT","type":112,"length":20},
::             {"name":"MIN_VALUE","type":20,"length":17},
::             {"name":"MAX_VALUE","type":20,"length":17},
::             {"name":"MIN_TIME","type":5,"length":4096},
::             {"name":"MAX_TIME","type":5,"length":4096},
::             {"name":"MIN_VALUE_TIME","type":5,"length":4096},
::             {"name":"MAX_VALUE_TIME","type":5,"length":4096},
::             {"name":"RECENT_ROW_TIME","type":5,"length":4096}
::         ],
::         "rows": []
::     }
:: }
