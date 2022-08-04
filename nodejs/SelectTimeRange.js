// Example For Select Data by Time Range for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID"
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const TAG_NAME = "YOUR_TAG";
const URL = `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/time_range`;

var request = require('request');

// CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
request.get({
    url: URL, 
    qs: {
        tag_name: TAG_NAME,
        date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn'
    },
    headers: {
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        // {"data":{"columns":[{"length":4096,"name":"MIN","type":5},{"length":4096,"name":"MAX","type":5}],"samples":[{"data":[{"MAX":"2021-01-07 02:00:00 009:000:000","MIN":"2021-01-06 17:00:00 000:000:000"}],"tag_name":"sensor2"},{"data":[{"MAX":"2021-01-06 20:00:06 000:000:000","MIN":"2021-01-06 17:00:00 001:000:000"}],"tag_name":"sensor1"}]},"status":"success"}
        console.log(body)
    })


// CASE - Current DATA GET with date format nanosecond timestamp
request.get({
    url: URL, 
    qs: {
        tag_name: TAG_NAME,
        date_format: 'NANOSECOND'
    },
    headers: {
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        // {"data":{"columns":[{"length":20,"name":"MIN","type":12},{"length":20,"name":"MAX","type":12}],"samples":[{"data":[{"MAX":1609952400009000000,"MIN":1609920000000000000}],"tag_name":"sensor2"},{"data":[{"MAX":1609930806000000000,"MIN":1609920000001000000}],"tag_name":"sensor1"}]},"status":"success"}
        console.log(body)
    })
