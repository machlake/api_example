// Example For Delete Single Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY="YOUR_API_TOKEN";
const LAKE_ID="YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const URL=`https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/values`

const DELETE_TYPE="raw";

var request = require('request');

/* ------------------------------------------------------------------------------------------------- */

// CASE - DELETE TAG DATA WITH TIME String
var tag_name="sensor1";
var base_time= "2021-01-06 18:00:00 000:000:000";

request.delete({
    url: URL, 
    qs: {
        type: DELETE_TYPE,
        tag_name: tag_name,
        base_time: base_time
    },
    headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success": true,
        //     "reason": "delete value success"
        // }
    });

/* ------------------------------------------------------------------------------------------------- */

// CASE - Delete all Tag value

request.delete({
    url: URL, 
    qs: {
        type: DELETE_TYPE
    }, 
    headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success": true,
        //     "reason": "delete value success"
        // }
    });

/* ------------------------------------------------------------------------------------------------- */

// CASE - Delete Tag value when no exist tag name

var tag_name="wrong_name";

request.delete({
    url: URL, 
    qs: {
        type: DELETE_TYPE,
        tag_name: tag_name
    },
    headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(response);
        console.log(body);
        // status code : 400 Bad Request
        // {
        //     "success": false,
        //     "reason": "Metadata of TAGDATA table is not found. (Key = wrong_name)"
        // }
    });