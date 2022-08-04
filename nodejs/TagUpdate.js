// Example For Update Tag API by using request in nodejs
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "YOUR_LAKE_ID"
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";

var request = require('request');

// CASE - Tag Name Change SRC to TAR / Tag Name Change Error when Not exist
var Data = {
    name: 'sensor1',
    columns: [{col_name: "name", value: "sensor10"}]
}
request.put({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/tags`, 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        // {"data":{"name":"sensor10"},"status":"success"} or {"message":"no such name : sensor1","status":"error"}
        console.log(body)
    })
