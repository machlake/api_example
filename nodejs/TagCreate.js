// Example For Create Tag API by using request in nodejs
// written by yeony kim

// process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "YOUR_LAKE_ID"
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";

var request = require('request');

// CASE - create TAG / tag duplicate error
var Data = {
    tag: [['sensor1'], ['t_sensor1'], ['t_sensor2']],
}
request.post({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/tags`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        // {"data":{"success_count":2,"tag":[{"name":"sensor1"},{"name":"sensor2"}]},"status":"success"} or {"message":"Metadata key (sensor2) of TAGDATA table is already inserted.","status":"error"}
        console.log(body)
    })
