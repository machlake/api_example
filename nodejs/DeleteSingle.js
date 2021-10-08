// Example For Delete Single Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const express = require('express');
const app = express();
const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="c5ehcdmcb0jc72ia6pug"
const URL ="https://" + LAKE_ID +".machlake.com/lakes/values/raw";

// CASE - DELETE TAG DATA WITH TIME String

app.get(
    '/delete_data_with_date_string', function(req, res) {
        var request = require('request');

        const Data = {
            tag_name: 'sensor1',
            base_time: "2021-01-06 18:00:00 000:000:000"
        }
        
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
                console.log(body) // {"data":{},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - DELETE TAG DATA WITH second time stamp

app.get(
    '/delete_data_with_timestamp', function(req, res) {
        var request = require('request');

        const Data = {
            tag_name: 'sensor2',
            base_time: "1609930800"
        }
        
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
                console.log(body) // {"data":{},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/delete_data_with_date_string is result for delete tag data with date time string')
    console.log('http://127.0.0.1:8888/delete_data_with_timestamp is result for delete tag data with timestamp')
})