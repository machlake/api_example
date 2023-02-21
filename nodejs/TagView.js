// Example For Get Tag View API by using request in nodejs

// process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;

const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const URL =  `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/tag`;

var request = require('request');


/* ------------------------------------------------------------------------------------------------- */

// CASE - Get Tag Information

request.get({
    url: URL, 
    qs: {
        name: "sensor1"
    },
    headers: {
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success": true,
        //     "reason": "get tag meta success",
        //     "data": {"name": "sensor01"}
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - Get Tag Information when no exist tag name

request.get({
    url: URL, 
    qs: {
        name: "wrong_name"
    },
    headers: {
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // status code : 400 Bad Request
        // {
        //     "success": false,
        //     "reason": "no such name : wrong_name"
        // }
    })
