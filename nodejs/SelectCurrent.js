// Example For Select Current Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const express = require('express');
const app = express();
const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="c5ehcdmcb0jc72ia6pug"
const URL ="https://" + LAKE_ID +".machlake.com/lakes/values/current";

// CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

app.get(
    '/select_current_date_with_nano_time_date_string', function(req, res) {
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
                console.log(body) // {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-07 02:00:00 009:000:000","VALUE":2}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - Current DATA GET with another value form

app.get(
    '/select_current_date_with_nano_time_date_string_another_form', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor1,sensor2')
        QueryParams.set('date_format', 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn')
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
                console.log(body) // {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":{"TIME":["2021-01-07 02:00:00 009:000:000"],"VALUE":[2]}},{"tag_name":"sensor1","data":{"TIME":["2021-01-06 20:00:06 000:000:000"],"VALUE":[2]}}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/select_current_date_with_nano_time_date_string is result for select current data with nano date time string')
    console.log('http://127.0.0.1:8888/select_current_date_with_nano_time_date_string_another_form is result for select current data with nano date time string with value return form = 1')
})