// Example For Get Tag View API by using request in nodejs
// written by yeony kim
// sensor1, sensor2 is applied in lake

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const express = require('express');
const app = express();
const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "YOUR_LAKE_ID"
const URL = "https://" + LAKE_ID + ".machlake.com/lakes/tag";

// CASE - Get Tag Information

app.get(
    '/get_tag_view_no_tag_name', function(req, res) {
        var request = require('request');
        const QueryParams = new URLSearchParams()

        QueryParams.set("name", "sensor")
        var option = {
            url: URL + "?" + QueryParams.toString(),
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY
            },
        };
        request.get(option, function(error, response, body) {
            if (!error && response.statusCode === 200) {
                res.writeHead(200);
                res.end(body);
                console.log(body)
            } else {
                console.log('error');
                console.log(error, response)
                if (response !== undefined) {
                    res.writeHead(200);
                    res.end(body);
                    console.log(body) // {"message":"no such name : sensor","status":"error"}
                }
            }
        })
    }
)

// CASE - Get Tag Information

app.get(
    '/get_tag_view_tag_name', function(req, res) {
        var request = require('request');
        const QueryParams = new URLSearchParams()

        QueryParams.set("name", "sensor1")
        var option = {
            url: URL + "?" + QueryParams.toString(),
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY
            },
        };
        request.get(option, function(error, response, body) {
            if (!error && response.statusCode === 200) {
                res.writeHead(200);
                res.end(body);
                console.log(body)
            } else {
                console.log('error');
                console.log(error, response)
                if (response !== undefined) {
                    res.writeHead(200);
                    res.end(body);
                    console.log(body) // {"data":{"name":"sensor1"},"status":"success"}
                }
            }
        })
    }
)


app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/get_tag_view_no_tag_name is result for tag name not exist in lake')
    console.log('http://127.0.0.1:8888/get_tag_view_tag_name is result for tag name exsit in lake')
})