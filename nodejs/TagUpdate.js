// Example For Update Tag API by using request in nodejs
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "YOUR_LAKE_ID"
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const URL =  `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/tags`;

var request = require('request');


/* ------------------------------------------------------------------------------------------------- */

// CASE - Update Tag Name

var Data = {
    name: "sensor1",
    columns: [
        {col_name: "name", value: "sensor10"}
    ]
}

request.put({
    url: URL, 
    headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success": true,
        //     "reason": "update tag meta success",
        //     "data":{"name":"sensor10"}
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - Update Tag additional column
// columns
// name (varchar, 80), location (varchar, 40)

var Data = {
    name: "sensor2",
    columns: [
        {col_name: "location", value: "4F-101"}
    ]
}

request.put({
    url: URL, 
    headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success": true,
        //     "reason": "update tag meta success",
        //     "data": {
        //         "location": "4F-101",
        //         "name": "sensor02"
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - Update Tag when not exist tag

var Data = {
    name: "wrong_name",
    columns: [
        {col_name: "location", value: "4F-102"}
    ]
}

request.put({
    url: URL, 
    headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // status code : 400 Bad Request
        // {
        //     "success": false,
        //     "reason": "no such name : wrong_name"
        // }
    })
