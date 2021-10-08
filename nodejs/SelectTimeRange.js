// Example For Select Data by Time Range for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const express = require('express');
const app = express();
const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="c5ehcdmcb0jc72ia6pug"
const URL ="https://" + LAKE_ID +".machlake.com/lakes/values/time_range";

// CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

app.get(
    '/select_time_range_with_nano_time_date_string', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor1,sensor2')
        QueryParams.set('date_format', 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn')

        var option = {
            url: URL + "?" + QueryParams.toString(),
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY
            },
        };
        request.get( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"columns":[{"length":4096,"name":"MIN","type":5},{"length":4096,"name":"MAX","type":5}],"samples":[{"data":[{"MAX":"2021-01-07 02:00:00 009:000:000","MIN":"2021-01-06 17:00:00 000:000:000"}],"tag_name":"sensor2"},{"data":[{"MAX":"2021-01-06 20:00:06 000:000:000","MIN":"2021-01-06 17:00:00 001:000:000"}],"tag_name":"sensor1"}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - Current DATA GET with date format nanosecond timestamp

app.get(
    '/select_time_range_with_nano_timestamp_string', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor1,sensor2')
        QueryParams.set('date_format', 'NANOSECOND')

        var option = {
            url: URL + "?" + QueryParams.toString(),
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY
            },
        };
        request.get( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"columns":[{"length":20,"name":"MIN","type":12},{"length":20,"name":"MAX","type":12}],"samples":[{"data":[{"MAX":1609952400009000000,"MIN":1609920000000000000}],"tag_name":"sensor2"},{"data":[{"MAX":1609930806000000000,"MIN":1609920000001000000}],"tag_name":"sensor1"}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/select_raw_with_nano_date_time_string is result for select time range data with nano date time string')
    console.log('http://127.0.0.1:8888/select_time_range_with_nano_timestamp_string is result for select time range data with nano timestamp string')
})