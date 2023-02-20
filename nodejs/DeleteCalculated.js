// Example For Delete Calculated Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";

const DELETE_TYPE = "calc";

var request = require('request');

/* ------------------------------------------------------------------------------------------------- */

// CASE - Delete Calculated Data

var BASE_TIME="2021-01-06 18:00:00 000:000:000"; // or BASE_TIME="1609930800"

request.delete({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/values`, 
    qs: {
        type: DELETE_TYPE,
        base_time: BASE_TIME
    },
    headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY
    }},
    function(error, response, body) {
        console.log(body)
    })
