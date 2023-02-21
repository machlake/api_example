// Example For Create Tag API by using request in nodejs
// written by yeony kim

// process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "YOUR_LAKE_ID"
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const URL =  `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/tags`;


var request = require('request');


/* ------------------------------------------------------------------------------------------------- */

//  CASE - create TAG

var Data = {
    tag: [
        ["sensor1"], 
        ["sensor2"]
    ]
}

request.post({
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
        //     "success":true,
        //     "reason":"create tag success",
        //     "data":{
        //         "success_count":2,
        //         "tag":[
        //             {"name":"sensor1"},
        //             {"name":"sensor2"}
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

//  CASE - create TAG with addition columns

var Data = {
    tag: [
        ["sensor01", "3F-101"],
        ["sensor02", "3F-102"]
    ]
}

request.post({
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
        //     "success":true,
        //     "reason":"create tag success",
        //     "data":{
        //         "success_count":2,
        //         "tag":[
        //             {
        //                 "location":"3F-101",
        //                 "name":"sensor01"
        //             },
        //             {
        //                 "location":"3F-102",
        //                 "name":"sensor02"
        //             }
        //         ]
        //     }
        // }        
    })

/* ------------------------------------------------------------------------------------------------- */

//  CASE - Create exist Tag

var Data = {
    tag: [
        ["sensor1"]
    ]
}

request.post({
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
        // status code:400 Bad Request
        // {
        //     "success":false,
        //     "reason":"Metadata key (sensor1) of TAGDATA table is already inserted."
        // }
    })
