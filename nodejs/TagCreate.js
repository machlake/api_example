// Example For Create Tag API by using request in nodejs
// written by yeony kim

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const express = require('express');
const app = express();
const API_KEY = "YOUR_API_TOKEN";
const LAKE_ID = "YOUR_LAKE_ID"
const URL = "https://" + LAKE_ID + ".machlake.com/lakes/tags";

// CASE - create TAG / tag duplicate error

app.get(
    '/create_tag_sensor1_2', function(req, res) {
        const Data = {
            tag: [['sensor1'], ['t_sensor1'], ['t_sensor2']],
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
        request.post( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"success_count":2,"tag":[{"name":"sensor1"},{"name":"sensor2"}]},"status":"success"} or {"message":"Metadata key (sensor2) of TAGDATA table is already inserted.","status":"error"}
            } else {
                console.log(error)
            }
        })
    }
)

app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/create_tag_sensor1_2 is result for create sensor1 and sensor2 tag')
})