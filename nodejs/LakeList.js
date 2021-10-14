// Example For Get Lake List API by using request in nodejs
// written by yeony kim

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const express = require('express');
const app = express();
const API_KEY = "YOUR_API_TOKEN";
const URL = "https://api.machlake.com/lakes"

// CASE - GET LAKE List

app.get(
    '/get_lake_list', function(req, res) {
        var request = require('request');
        var option = {
            url: URL,
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY
            },
        };
        request.get( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"lake":[{"lake_id":"YOUR_LAKE_ID","lake_info":{"lake_name":"sample_lake","lake_plan":"basic","region":"ap-northeast-2","timezone":"Asia/Seoul"}}],"mount":[],"share":[]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/get_lake_list is result for get LAKE list')
})