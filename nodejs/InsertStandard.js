// Example For Insert Standard Data for tag API by using request in nodejs
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";

var request = require('request');

// CASE - Insert Data with nano date time string format
var Data = {
    tag_name: 'sensor1',
    date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
    values: [["2021-01-06 17:00:00 001:000:000", 1.0], ["2021-01-06 17:00:00 002:000:000", 1.5], ["2021-01-06 17:00:00 003:000:000", 2.0]]
}
request.post({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/standard`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body)
    })


// CASE - Insert Data with time format is empty but data format in data is nano date time string
var Data = {
    tag_name: 'sensor1',
    values: [["2021-01-06 17:00:00 004:000:000", 1.0], ["2021-01-06 17:00:00 005:000:000", 1.5], ["2021-01-06 17:00:00 006:000:000", 2.0]]
}
request.post({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/standard`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body)
    })


// CASE - Insert Data with utc-0 time zone and time format is empty but data format in data is nano date time string
var Data = {
    tag_name: 'sensor1',
    values: [["2021-01-06 8:00:00 007:000:000", 1.0], ["2021-01-06 8:00:00 008:000:000", 1.5], ["2021-01-06 8:00:00 009:000:000", 2.0]]
}
request.post({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/standard`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY,
        'Use-Timezone': 'Africa/Abidjan'
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body)
    })


// CASE - Insert Data with date time string format
var Data = {
    tag_name: 'sensor2',
    date_format: 'YYYY-MM-DD HH24:MI:SS',
    values: [["2021-01-06 17:00:00", 1.0], ["2021-01-06 17:00:01", 1.5], ["2021-01-06 17:00:02", 2.0]]
}
request.post({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/standard`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body)
    })


// CASE - Insert Data with nano-timestamp
var Data = {
    tag_name: 'sensor2',
    values: [[1609920003000000000, 1.0], [1609920004000000000, 1.5], [1609920005000000000, 2.0]]
}
request.post({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/standard`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body)
    })


// CASE - Insert Data with utc-0 time zone and date time string format but data format in data is nano date time string
var Data = {
    tag_name: 'sensor2',
    date_format: 'YYYY-MM-DD HH24:MI:SS',
    values: [["2021-01-06 17:00:00 007:000:000", 1.0], ["2021-01-06 17:00:00 008:000:000", 1.5], ["2021-01-06 17:00:00 009:000:000", 2.0]]
}
request.post({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/standard`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY,
        "Use-Timezone": "Africa/Abidjan"
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body)
    })
