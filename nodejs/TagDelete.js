// Example For Delete Tag API by using curl in window script
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
    '/delete_tag_name_sensor1', function(req, res) {
        const Data = {
            name: 'sensor1',
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
        request.delete( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{},"status":"success"} or {"message":"no such name : sensor1","status":"error"}
            } else {
                console.log(error)
            }
        })
    }
)

app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/delete_tag_name_sensor1 is result for delete sensor1 tag')
})