// Example For Update Tag API by using curl in nodejs
// written by yeony kim
// sensor1, sensor2 is applied in lake

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const express = require('express');
const app = express();
const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "c5ehcdmcb0jc72ia6pug"
const URL = "https://" + LAKE_ID + ".machlake.com/lakes/tags";

// CASE - Tag Name Change SRC to TAR / Tag Name Change Error when Not exist

app.get(
    '/update_tag_name_1t10', function(req, res) {
        const Data = {
            name: 'sensor1',
            columns: [{col_name: "name", value: "sensor10"}]
        }
        var request = require('request');
        var option = {
            url: URL,
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY
            },
            body: JSON.stringify(Data)
        };
        request.put( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"name":"sensor10"},"status":"success"} or {"message":"no such name : sensor1","status":"error"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - Tag Name Change TAR to SRC / Tag Name Change Error when Not exist

app.get(
    '/update_tag_name_10t1', function(req, res) {
        const Data = {
            name: 'sensor10',
            columns: [{col_name: "name", value: "sensor1"}]
        }
        var request = require('request');
        var option = {
            url: URL,
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY
            },
            body: JSON.stringify(Data)
        };
        request.put( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"name":"sensor1"},"status":"success"} or {"message":"no such name : sensor1","status":"error"}
            } else {
                console.log(error)
            }
        })
    }
)


app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/update_tag_name_1t10 is result for update tag name that sensor1 to sensor10')
    console.log('http://127.0.0.1:8888/update_tag_name_10t1 is result for update tag name that sensor10 to sensor1')
})