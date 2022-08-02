// Example For Get Tag List API by using request in nodejs

const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";

// process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;
var request = require('request');
request.get({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/tags`, 
    qs: { offset: 0, limit: 1},
    headers: {
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        console.log(body)
    })

