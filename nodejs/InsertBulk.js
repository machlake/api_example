// Example For Insert Bulk Data for tag API by using request in nodejs
// written by yeony kim
// sensor1, sensor2 is applied in lake

process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const express = require('express');
const app = express();
const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="c5ehcdmcb0jc72ia6pug"
const URL ="https://" + LAKE_ID +".machlake.com/lakes/values/bulk";

// CASE - Insert Bulk Data with nano date time string format

app.get(
    '/insert_bulk_with_nano_date_time_string', function(req, res) {
        const Data = {
            date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
            values: [["sensor1","2021-01-06 18:00:00 001:000:000", 2.0], ["sensor1","2021-01-06 18:00:00 002:000:000", 2.5], ["sensor1","2021-01-06 18:00:00 003:000:000", 2.0], ["sensor2","2021-01-06 18:00:00 001:000:000", 2.0], ["sensor2","2021-01-06 18:00:00 002:000:000", 2.5], ["sensor2","2021-01-06 18:00:00 003:000:000", 2.0]]
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
                console.log(body) // {"data":{"fail":0,"success":6},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - Insert Bulk Data with nano date time string format

app.get(
    '/insert_bulk_with_nano_timestamp', function(req, res) {
        const Data = {
            date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
            values: [["sensor1", 1609930804000000000, 2.0], ["sensor1", 1609930805000000000, 2.5], ["sensor1", 1609930806000000000, 2.0], ["sensor2", 1609930804000000000, 2.0], ["sensor2", 1609930805000000000, 2.5], ["sensor2", 1609930806000000000, 2.0]]
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
                console.log(body) // {"data":{"fail":0,"success":6},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/insert_bulk_with_nano_date_time_string is result for insert bulk data with nano date time string')
    console.log('http://127.0.0.1:8888/insert_bulk_with_nano_timestamp is result for insert bulk data with nano timestamp')
})