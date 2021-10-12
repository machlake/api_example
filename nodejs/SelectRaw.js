// Example For Select Raw Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const express = require('express');
const app = express();
const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID"
const URL ="https://" + LAKE_ID +".machlake.com/lakes/values/raw";

// CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

app.get(
    '/select_raw_with_nano_date_time_string', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor1')
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
                console.log(body) // {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 001:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 002:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:00 004:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 005:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 006:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:00 007:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 008:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 009:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 001:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 002:000:000","VALUE":2.5},{"TIME":"2021-01-06 18:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS

app.get(
    '/select_raw_with_date_time_string', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor1')
        QueryParams.set('date_format', 'YYYY-MM-DD HH24:MI:SS')
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
                console.log(body) // {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00","VALUE":1},{"TIME":"2021-01-06 17:00:00","VALUE":1.5},{"TIME":"2021-01-06 17:00:00","VALUE":2},{"TIME":"2021-01-06 17:00:00","VALUE":1},{"TIME":"2021-01-06 17:00:00","VALUE":1.5},{"TIME":"2021-01-06 17:00:00","VALUE":2},{"TIME":"2021-01-06 17:00:00","VALUE":1},{"TIME":"2021-01-06 17:00:00","VALUE":1.5},{"TIME":"2021-01-06 17:00:00","VALUE":2},{"TIME":"2021-01-06 18:00:00","VALUE":2},{"TIME":"2021-01-06 18:00:00","VALUE":2.5},{"TIME":"2021-01-06 18:00:00","VALUE":2},{"TIME":"2021-01-06 20:00:04","VALUE":2},{"TIME":"2021-01-06 20:00:05","VALUE":2.5},{"TIME":"2021-01-06 20:00:06","VALUE":2}]}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS, data inserted with date skip mmm:uuu:nnn

app.get(
    '/select_raw_with_date_time_string_skip_under', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor2')
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
                console.log(body) // {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:01 000:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:02 000:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:03 000:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:04 000:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:05 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 001:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 002:000:000","VALUE":2.5},{"TIME":"2021-01-06 18:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS and with UTC-0 timezone

app.get(
    '/select_raw_with_date_time_string_with_utc0', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor2')
        QueryParams.set('date_format', 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn')
        QueryParams.set('start_time', '2021-01-06 17:00:00 000:000:000')
        QueryParams.set('end_time', '2021-01-06 21:00:00 000:000:000')

        var option = {
            url: URL + "?" + QueryParams.toString(),
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY,
                "Use-Timezone": "Africa/Abidjan"
            },
        };
        request.get( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 17:00:00 007:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 008:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 009:000:000","VALUE":2}]}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn and limit / offset / direction / value_retrun_form=0

app.get(
    '/select_raw_with_date_time_string_with_variety_setting', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor1,sensor2')
        QueryParams.set('date_format', 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn')
        QueryParams.set('start_time', '2021-01-06 17:00:00 000:000:000')
        QueryParams.set('end_time', '2021-01-06 21:00:00 000:000:000')
        QueryParams.set('limit', 10)
        QueryParams.set('offset', 5)
        QueryParams.set('direction', 0)
        QueryParams.set('value_return_form', 0)

        var option = {
            url: URL + "?" + QueryParams.toString(),
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY,
            },
        };
        request.get( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 006:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:00 007:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:00 008:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:00 009:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 001:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 002:000:000","VALUE":2.5},{"TIME":"2021-01-06 18:00:00 003:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn and limit / offset / direction / value_retrun_form=0

app.get(
    '/select_raw_with_date_time_string_with_other_variety_setting', function(req, res) {
        var request = require('request');

        const QueryParams = new URLSearchParams()
        
        QueryParams.set('tag_name', 'sensor1,sensor2')
        QueryParams.set('date_format', 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn')
        QueryParams.set('start_time', '2021-01-06 17:00:00 000:000:000')
        QueryParams.set('end_time', '2021-01-06 21:00:00 000:000:000')
        QueryParams.set('direction', 1)
        QueryParams.set('value_return_form', 1)

        var option = {
            url: URL + "?" + QueryParams.toString(),
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY,
            },
        };
        request.get( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"calc_mode":"raw","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":{"TIME":["2021-01-06 20:00:06 000:000:000","2021-01-06 20:00:05 000:000:000","2021-01-06 20:00:04 000:000:000","2021-01-06 18:00:00 003:000:000","2021-01-06 18:00:00 002:000:000","2021-01-06 18:00:00 001:000:000","2021-01-06 17:00:05 000:000:000","2021-01-06 17:00:04 000:000:000","2021-01-06 17:00:03 000:000:000","2021-01-06 17:00:02 000:000:000","2021-01-06 17:00:01 000:000:000","2021-01-06 17:00:00 000:000:000"],"VALUE":[2,2.5,2,2,2.5,2,2,1.5,1,2,1.5,1]}},{"tag_name":"sensor1","data":{"TIME":["2021-01-06 20:00:06 000:000:000","2021-01-06 20:00:05 000:000:000","2021-01-06 20:00:04 000:000:000","2021-01-06 18:00:00 003:000:000","2021-01-06 18:00:00 002:000:000","2021-01-06 18:00:00 001:000:000","2021-01-06 17:00:00 009:000:000","2021-01-06 17:00:00 008:000:000","2021-01-06 17:00:00 007:000:000","2021-01-06 17:00:00 006:000:000","2021-01-06 17:00:00 005:000:000","2021-01-06 17:00:00 004:000:000","2021-01-06 17:00:00 003:000:000","2021-01-06 17:00:00 002:000:000","2021-01-06 17:00:00 001:000:000"],"VALUE":[2,2.5,2,2,2.5,2,2,1.5,1,2,1.5,1,2,1.5,1]}}]},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/select_raw_with_nano_date_time_string is result for select raw data with nano date time string')
    console.log('http://127.0.0.1:8888/select_raw_with_date_time_string is result for select raw data with date time string')
    console.log('http://127.0.0.1:8888/select_raw_with_date_time_string_skip_under is result for select raw data with nano date time string but instered unly date time string that does not contain under second')
    console.log('http://127.0.0.1:8888/select_raw_with_date_time_string_with_utc0 is result for select raw data with nano date time string and utc-0')
    console.log('http://127.0.0.1:8888/select_raw_with_date_time_string_with_variety_setting is result for select raw data with nano date time string and limit=10, offset=0, direction=0, value_return_form=0')
    console.log('http://127.0.0.1:8888/select_raw_with_date_time_string_with_variety_setting is result for select raw data with nano date time string and limit=10, offset=0, direction=0, value_return_form=0')
    console.log('http://127.0.0.1:8888/select_raw_with_date_time_string_with_other_variety_setting is result for select raw data with nano date time string and direction=1, value_return_form=1')
})