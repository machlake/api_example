// Example For Get Tag List API by using request in nodejs
// written by yeony kim
// sensor1, sensor2 is applied in lake

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const express = require('express');
const app = express();
const API_KEY = "YOUR_API_KEY";
const LAKE_ID = "YOUR_LAKE_ID"
const URL = "https://" + LAKE_ID + ".machlake.com/lakes/tags";

// CASE - Select Tag

app.get(
    '/get_tag_list_with_name', function(req, res) {
        const QueryParams = new URLSearchParams()

        QueryParams.set("name", "sensor1")
        var request = require('request');
        var option = {
            url: URL + "?" + QueryParams.toString(),
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY
            }
        };
        request.get(option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"tag":[{"name":"sensor1"}]},"status":"success"}
            }
        })
    }
)

// CASE - Select Tag with SQL Limit

app.get(
    '/get_tag_list_with_name_limit', function(req, res) {
        const QueryParams = new URLSearchParams()

        QueryParams.set("name", "sensor")
        QueryParams.set("limit", 1)
        var request = require('request');
        var option = {
            url: URL + "?" + QueryParams.toString(),
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY
            }
        };
        request.get(option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"tag":[{"name":"sensor1"}]},"status":"success"}
            }
        })
    }
)

// CASE - Select Tag with SQL Limit and SQL Offset

app.get(
    '/get_tag_list_with_name_limit_offset', function(req, res) {
        const QueryParams = new URLSearchParams()

        QueryParams.set("name", "sensor")
        QueryParams.set("limit", 1)
        QueryParams.set("offset", 1)
        var request = require('request');
        var option = {
            url: URL + "?" + QueryParams.toString(),
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY
            }
        };
        request.get(option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"tag":[{"name":"sensor2"}]},"status":"success"}
            }
        })
    }
)

// CASE - Select Tag about not exist

app.get(
    '/get_tag_list_with_error_name', function(req, res) {
        const QueryParams = new URLSearchParams()

        QueryParams.set("name", "other_name")
        var request = require('request');
        var option = {
            url: URL + "?" + QueryParams.toString(),
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY
            }
        };
        request.get(option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"tag":[]},"status":"success"}
            }
        })
    }
)

app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/get_tag_list_with_name is result for tag name that contain sensor in lake')
    console.log('http://127.0.0.1:8888/get_tag_list_with_name_limit is result for tag name that contain sensor in lake with limit 1')
    console.log('http://127.0.0.1:8888/get_tag_list_with_name_offset is result for tag name that contain sensor in lake with limit 1 offset 1')
    console.log('http://127.0.0.1:8888/get_tag_list_with_error_name is result for tag name that contain no in lake')
})