chcp 65001 
:: Text Encoding to UTF-8 in CMD
:: Example For Select Current Data for tag API by using curl in window script
:: written by yeony kim

set API_KEY=

set CONTENT_HEADER="Content-Type: application/json"
set API_HEADER="x-api-key: %API_KEY%"
set LAKE_ID=c5ehcdmcb0jc72ia6pug
set URL="https://%LAKE_ID%.machlake.com/lakes/values/current"

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set TAG_NAME=sensor1,sensor2
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data-urlencode "tag_name=%TAG_NAME%" --data-urlencode "date_format=%DATE_FORMAT%"

:: Return Format
:: {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-07 02:00:00 009:000:000","VALUE":2}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::

:: CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set TAG_NAME=sensor1,sensor2
set DATE_FORMAT=YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
set VALUE_RETURN_FORM=1

curl -k -G %URL% -H %CONTENT_HEADER% -H %API_HEADER% --data-urlencode "tag_name=%TAG_NAME%" --data-urlencode "date_format=%DATE_FORMAT%" --data-urlencode "value_return_form=%VALUE_RETURN_FORM%"

:: Return Format
:: {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":{"TIME":["2021-01-07 02:00:00 009:000:000"],"VALUE":[2]}},{"tag_name":"sensor1","data":{"TIME":["2021-01-06 20:00:06 000:000:000"],"VALUE":[2]}}]},"status":"success"}

:: ------------------------------------------------------------------------------------------------- ::