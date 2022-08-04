// Example For Insert Bulk Data for tag API by using request in nodejs
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";

var request = require('request');

// CASE - Insert Bulk Data with nano date time string format
var Data = {
    date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    values: [["sensor1","2021-01-06 18:00:00 001:000:000", 2.0], ["sensor1","2021-01-06 18:00:00 002:000:000", 2.5], ["sensor1","2021-01-06 18:00:00 003:000:000", 2.0], ["sensor2","2021-01-06 18:00:00 001:000:000", 2.0], ["sensor2","2021-01-06 18:00:00 002:000:000", 2.5], ["sensor2","2021-01-06 18:00:00 003:000:000", 2.0]]
}
request.post({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/bulk`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body)
    })

// CASE - Insert Bulk Data with nano date time string format
var Data = {
    values: [["sensor1", 1609930804000000000, 2.0], ["sensor1", 1609930805000000000, 2.5], ["sensor1", 1609930806000000000, 2.0], ["sensor2", 1609930804000000000, 2.0], ["sensor2", 1609930805000000000, 2.5], ["sensor2", 1609930806000000000, 2.0]]
}
request.post({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/bulk`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body)
    })
