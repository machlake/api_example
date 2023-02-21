// Example For Get Tag List API by using request in nodejs

// process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;

const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const URL =  `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/tags`;

var request = require('request');


/* ------------------------------------------------------------------------------------------------- */

// CASE - Select Tag with limit

request.get({
    url: URL, 
    qs: {
        limit: 3
    },
    headers: {
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success": true,
        //     "reason": "get tag meta list success",
        //     "data":{
        //         "tag":[
        //             {"name":"sensor1"},
        //             {"name":"sensor2"},
        //             {"name":"door1"}
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE -  Select Tag with Limit and Offset

request.get({
    url: URL, 
    qs: {
        limit: 1,
        offset: 1
    },
    headers: {
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success": true,
        //     "reason": "get tag meta list success",
        //     "data":{
        //         "tag":[
        //             {"name":"sensor2"}
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE -  Select Tag with name hint

request.get({
    url: URL, 
    qs: {
        name: "door"
    },
    headers: {
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success": true,
        //     "reason": "get tag meta list success",
        //     "data":{
        //         "tag":[
        //             {"name":"door1"}
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE -  Select Tag about not exist

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
        // {
        //     "success": true,
        //     "reason": "get tag meta list success",
        //     "data":{
        //         "tag":[]
        //     }
        // }
    })
