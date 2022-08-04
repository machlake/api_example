// Example For Delete All Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";

var request = require('request');

// CASE - Delete All Data
request.delete({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/raw`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        console.log(body)
    })
