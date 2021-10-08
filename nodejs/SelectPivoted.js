// Example For Select Pivoted Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const express = require('express');
const app = express();
const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="c5ehcdmcb0jc72ia6pug"
const URL ="https://" + LAKE_ID +".machlake.com/lakes/values/pivoted";

// CASE - Pivoted DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

app.get(
    '/select_pivoted_date_with_nano_time_date_string', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor1,sensor2')
        QueryParams.set('calc_mode', 'min')
        QueryParams.set('date_format', 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn')
        QueryParams.set('start_time', '2021-01-06 17:00:00 000:000:000')
        QueryParams.set('end_time', '2021-01-06 21:00:00 000:000:000')

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
                console.log(body) // {"data":{"calc_mode":"MIN","columns":[{"name":"TIME","type":5,"length":4096},{"name":"sensor1","type":20,"length":17},{"name":"sensor2","type":20,"length":17}],"samples":[{"data":[{"TIME":"2021-01-06 17:00:00 000:000:000","sensor1":1,"sensor2":1},{"TIME":"2021-01-06 17:00:01 000:000:000","sensor1":null,"sensor2":1.5},{"TIME":"2021-01-06 17:00:02 000:000:000","sensor1":null,"sensor2":2},{"TIME":"2021-01-06 17:00:03 000:000:000","sensor1":null,"sensor2":1},{"TIME":"2021-01-06 17:00:04 000:000:000","sensor1":null,"sensor2":1.5},{"TIME":"2021-01-06 17:00:05 000:000:000","sensor1":null,"sensor2":2},{"TIME":"2021-01-06 18:00:00 000:000:000","sensor1":2,"sensor2":2},{"TIME":"2021-01-06 20:00:04 000:000:000","sensor1":2,"sensor2":2},{"TIME":"2021-01-06 20:00:05 000:000:000","sensor1":2.5,"sensor2":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","sensor1":2,"sensor2":2}]}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - Pivoted DATA GET with another value form

app.get(
    '/select_pivoted_date_with_nano_time_date_string_another_form', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor1,sensor2')
        QueryParams.set('calc_mode', 'cnt')
        QueryParams.set('date_format', 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn')
        QueryParams.set('start_time', '2021-01-06 17:00:00 000:000:000')
        QueryParams.set('end_time', '2021-01-06 21:00:00 000:000:000')
        QueryParams.set('value_return_form', 1)

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
                console.log(body) // {"data":{"calc_mode":"COUNT","columns":[{"name":"TIME","type":5,"length":4096},{"name":"sensor1","type":12,"length":20},{"name":"sensor2","type":12,"length":20}],"samples":[{"data":{"TIME":["2021-01-06 17:00:00 000:000:000","2021-01-06 17:00:01 000:000:000","2021-01-06 17:00:02 000:000:000","2021-01-06 17:00:03 000:000:000","2021-01-06 17:00:04 000:000:000","2021-01-06 17:00:05 000:000:000","2021-01-06 18:00:00 000:000:000","2021-01-06 20:00:04 000:000:000","2021-01-06 20:00:05 000:000:000","2021-01-06 20:00:06 000:000:000"],"sensor1":[9,0,0,0,0,0,3,1,1,1],"sensor2":[1,1,1,1,1,1,3,1,1,1]}}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/select_pivoted_date_with_nano_time_date_string is result for select pivoted data with nano date time string')
    console.log('http://127.0.0.1:8888/select_pivoted_date_with_nano_time_date_string_another_form is result for select pivoted data with nano date time string with value return form = 1 and calc_mode = cnt')
})