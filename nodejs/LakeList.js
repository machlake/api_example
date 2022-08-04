// Example For Get Lake List API by using request in nodejs
// written by yeony kim

// process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const API_KEY = "YOUR_API_TOKEN";

var request = require('request');

// CASE - GET LAKE List
request.get({
    url: "https://api.machlake.com/lakes", 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        // {"data":{"lake":[{"lake_id":"YOUR_LAKE_ID","lake_info":{"lake_name":"sample_lake","lake_plan":"basic","region":"ap-northeast-2","timezone":"Asia/Seoul"}}],"mount":[],"share":[]},"status":"success"}
        console.log(body)
    })
