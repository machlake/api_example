// Example For Get Tag View API by using request in nodejs

// process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;

const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const TAG_NAME = "YOUR_TAG";

var request = require('request');
request.get({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/tag`, 
    qs: {'name': TAG_NAME},
    headers: {
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        console.log(body)
    })
