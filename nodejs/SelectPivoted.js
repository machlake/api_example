// Example For Select Pivoted Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID"
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const TAG_NAME = "YOUR_TAG";
const URL = `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/pivoted`;

var request = require('request');

// CASE - Pivoted DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn
request.get({
    url: URL, 
    qs: {
        tag_name: TAG_NAME,
        calc_mode: 'min',
        date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
        start_time: '2021-01-06 17:00:00 000:000:000',
        end_time: '2021-01-06 21:00:00 000:000:000'
    },
    headers: {
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        // {"data":{"calc_mode":"MIN","columns":[{"name":"TIME","type":5,"length":4096},{"name":"sensor1","type":20,"length":17},{"name":"sensor2","type":20,"length":17}],"samples":[{"data":[{"TIME":"2021-01-06 17:00:00 000:000:000","sensor1":1,"sensor2":1},{"TIME":"2021-01-06 17:00:01 000:000:000","sensor1":null,"sensor2":1.5},{"TIME":"2021-01-06 17:00:02 000:000:000","sensor1":null,"sensor2":2},{"TIME":"2021-01-06 17:00:03 000:000:000","sensor1":null,"sensor2":1},{"TIME":"2021-01-06 17:00:04 000:000:000","sensor1":null,"sensor2":1.5},{"TIME":"2021-01-06 17:00:05 000:000:000","sensor1":null,"sensor2":2},{"TIME":"2021-01-06 18:00:00 000:000:000","sensor1":2,"sensor2":2},{"TIME":"2021-01-06 20:00:04 000:000:000","sensor1":2,"sensor2":2},{"TIME":"2021-01-06 20:00:05 000:000:000","sensor1":2.5,"sensor2":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","sensor1":2,"sensor2":2}]}]},"status":"success"}
        console.log(body)
    })


// CASE - Pivoted DATA GET with another value form
request.get({
    url: URL, 
    qs: {
        tag_name: TAG_NAME,
        calc_mode: 'cnt',
        date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
        start_time: '2021-01-06 17:00:00 000:000:000',
        end_time: '2021-01-06 21:00:00 000:000:000',
        value_return_form: 1
    },
    headers: {
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        // {"data":{"calc_mode":"COUNT","columns":[{"name":"TIME","type":5,"length":4096},{"name":"sensor1","type":12,"length":20},{"name":"sensor2","type":12,"length":20}],"samples":[{"data":{"TIME":["2021-01-06 17:00:00 000:000:000","2021-01-06 17:00:01 000:000:000","2021-01-06 17:00:02 000:000:000","2021-01-06 17:00:03 000:000:000","2021-01-06 17:00:04 000:000:000","2021-01-06 17:00:05 000:000:000","2021-01-06 18:00:00 000:000:000","2021-01-06 20:00:04 000:000:000","2021-01-06 20:00:05 000:000:000","2021-01-06 20:00:06 000:000:000"],"sensor1":[9,0,0,0,0,0,3,1,1,1],"sensor2":[1,1,1,1,1,1,3,1,1,1]}}]},"status":"success"}
        console.log(body)
    })
