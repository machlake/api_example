// Example For Get Lake List API by using request in nodejs
// written by yeony kim

// process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const API_KEY = "YOUR_API_TOKEN";
const URL = "https://api.machlake.com/v1/lakes";

var request = require('request');

/* ------------------------------------------------------------------------------------------------- */

// CASE - GET LAKE List

request.get({
    url: URL, 
    headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success" : true,
        //     "reason"  : "get list success",
        //     "data": [
        //         {
        //             "lake_id" : "{lake_id}",
        //             "lake_info" : {
        //                 "lake_name"    : "sample_lake",
        //                 "lake_plan"    : "basic",
        //                 "region"       : "aws1.kor",
        //                 "timezone"     : "Asia/Seoul"
        //             }
        //         },
        //         ......
        //     ]
        // }
    })
