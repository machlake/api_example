// Example For Delete Calculated Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";

var request = require('request');

// CASE - Delete Calculated Data
var Data = {
    base_time: "2021-01-06 18:00:00 000:000:000"
}
request.delete({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/calculated`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body)
    })


// CASE - Delete Calculated Data WITH second time stamp
var Data = {
    base_time: "1609930800"
}
request.delete({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/calculated`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body)
    })
