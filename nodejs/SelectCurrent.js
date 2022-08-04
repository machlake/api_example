// Example For Select Current Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const TAG_NAME = "YOUR_TAG";
const URL = `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/current`;

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
        // {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-07 02:00:00 009:000:000","VALUE":2}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}
        console.log(body)
    })


// CASE - Current DATA GET with another value form
request.get({
    url: URL, 
    qs: {
        tag_name: TAG_NAME,
        date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
        value_return_form: 1
    },
    headers: {
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        // {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":{"TIME":["2021-01-07 02:00:00 009:000:000"],"VALUE":[2]}},{"tag_name":"sensor1","data":{"TIME":["2021-01-06 20:00:06 000:000:000"],"VALUE":[2]}}]},"status":"success"}
        console.log(body)
    })
