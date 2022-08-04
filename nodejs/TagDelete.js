// Example For Delete Tag API by using request in nodejs
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const TAG_NAME = "YOUR_TAG";
const URL = `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/tags`;

var request = require('request');

// CASE - delete tag
var Data = Data = {
    name: TAG_NAME,
}
request.delete({
    url: URL, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        // {"data":{},"status":"success"}
        console.log(body)
    })


// CASE - delete error when no exist tag name
var Data = Data = {
    name: 'wrong_name',
}
request.delete({
    url: URL, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        // {"message":"no such name : wrong_name","status":"error"}
        console.log(body)
    })
