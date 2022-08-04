// Example For Select Calculated Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const TAG_NAME = "YOUR_TAG";
const URL =  `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/calculated`;

var request = require('request');

// CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min
request.get({
    url: URL, 
    qs: {
        'tag_name': TAG_NAME,
        'calc_mode': 'min',
        'date_format': 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
        'start_time': '2021-01-06 17:00:00 000:000:000',
        'end_time': '2021-01-06 21:00:00 000:000:000'
    },
    headers: {
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        // {"data":{"calc_mode":"MIN","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]},{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:01 000:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:02 000:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:03 000:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:04 000:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:05 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}
        console.log(body)
    })


// CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=max and interval_value=3
request.get({
    url: URL, 
    qs: {
        tag_name: TAG_NAME,
        calc_mode: 'max',
        date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
        start_time: '2021-01-06 17:00:00 000:000:000',
        end_time: '2021-01-06 21:00:00 000:000:000',
        interval_value: 3
    },
    headers: {
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        // {"data":{"calc_mode":"MAX","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:03 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:03 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:03 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}
        console.log(body)
    })


// CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min and interval_type=m and interval_value=90
request.get({
    url: URL, 
    qs: {
        tag_name: TAG_NAME,
        calc_mode: 'max',
        date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
        start_time: '2021-01-06 17:00:00 000:000:000',
        end_time: '2021-01-06 21:00:00 000:000:000',
        interval_type: 'm',
        interval_value: 90
    },
    headers: {
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        // {"data":{"calc_mode":"MAX","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 16:30:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 19:30:00 000:000:000","VALUE":2.5}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 16:30:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 19:30:00 000:000:000","VALUE":2.5}]}]},"status":"success"}
        console.log(body)
    })
