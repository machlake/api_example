// Example For Select Calculated Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const express = require('express');
const app = express();
const API_KEY ="E35Bx97pfmCuOx14B825JyrtolHhEEGxCxCj2fRBk6CiDy5-uLnL6gTOeP-Nl8RcQvdO044jyc610SPhM-Fnv6J0Gj2wlPsfgqJwJEO8efYa0";
const LAKE_ID ="c5ehcdmcb0jc72ia6pug"
const URL ="https://" + LAKE_ID +".machlake.com/lakes/values/calculated";

// CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min

app.get(
    '/select_calculated_date_with_nano_time_date_string', function(req, res) {
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
                console.log(body) // {"data":{"calc_mode":"MIN","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]},{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:01 000:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:02 000:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:03 000:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:04 000:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:05 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=max and interval_value=3

app.get(
    '/select_calculated_date_with_nano_time_date_string_with_max_option', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor1,sensor2')
        QueryParams.set('calc_mode', 'max')
        QueryParams.set('date_format', 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn')
        QueryParams.set('start_time', '2021-01-06 17:00:00 000:000:000')
        QueryParams.set('end_time', '2021-01-06 21:00:00 000:000:000')
        QueryParams.set('interval_value', 3)

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
                console.log(body) // {"data":{"calc_mode":"MAX","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:03 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:03 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:03 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min and interval_type=m and interval_value=90

app.get(
    '/select_calculated_date_with_nano_time_date_string_with_max_interval_option', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor1,sensor2')
        QueryParams.set('calc_mode', 'max')
        QueryParams.set('date_format', 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn')
        QueryParams.set('start_time', '2021-01-06 17:00:00 000:000:000')
        QueryParams.set('end_time', '2021-01-06 21:00:00 000:000:000')
        QueryParams.set('interval_type', 'm')
        QueryParams.set('interval_value', 90)

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
                console.log(body) // {"data":{"calc_mode":"MAX","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 16:30:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 19:30:00 000:000:000","VALUE":2.5}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 16:30:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 19:30:00 000:000:000","VALUE":2.5}]}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/select_current_date_with_nano_time_date_string is result for select calculated data with nano date time string with calc_mode=min')
    console.log('http://127.0.0.1:8888/select_calculated_date_with_nano_time_date_string_with_max_option is result for select calculated data with nano date time string with calc_mode=max and interval_value=3')
    console.log('http://127.0.0.1:8888/select_calculated_date_with_nano_time_date_string_with_max_interval_option is result for select calculated data with nano date time string with calc_mode=max and interval_type=m interval_value=90')
})