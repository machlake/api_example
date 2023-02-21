// Example For Delete Tag API by using request in nodejs
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const URL =  `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/tags`;

var request = require('request');


/* ------------------------------------------------------------------------------------------------- */

// CASE - delete tag

request.delete({
    url: URL, 
    headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY
    },
    qs: {
        name: "sensor1"
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success":true,
        //     "reason":"delete tag meta success"
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - delete error when no exist tag name

request.delete({
    url: URL, 
    headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY
    },
    qs: {
        name: "sensor1"
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // status code:400 Bad Request
        // {
        //     "success":false,
        //     "reason":"no such name:wrong_name"
        // }
    })
