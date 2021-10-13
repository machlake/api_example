// Example For Insert Standard Data for tag API by using request in nodejs
// written by yeony kim
// sensor1, sensor2 is applied in lake

process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const express = require('express');
const app = express();
const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const URL ="https://" + LAKE_ID +".machlake.com/lakes/values/standard";

// CASE - Insert Data with nano date time string format

app.get(
    '/insert_standard_with_nano_date_time_string', function(req, res) {
        const Data = {
            tag_name: 'sensor1',
            date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
            values: [["2021-01-06 17:00:00 001:000:000", 1.0], ["2021-01-06 17:00:00 002:000:000", 1.5], ["2021-01-06 17:00:00 003:000:000", 2.0]]
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
                console.log(body) // {"data":{"fail":0,"success":3},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - Insert Data with time format is empty but data format in data is nano date time string

app.get(
    '/insert_standard_with_nano_date_time_string_diff_setting', function(req, res) {
        const Data = {
            tag_name: 'sensor1',
            values: [["2021-01-06 17:00:00 004:000:000", 1.0], ["2021-01-06 17:00:00 005:000:000", 1.5], ["2021-01-06 17:00:00 006:000:000", 2.0]]
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
                console.log(body) // {"data":{"fail":0,"success":3},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - Insert Data with utc-0 time zone and time format is empty but data format in data is nano date time string

app.get(
    '/insert_standard_with_nano_date_time_string_utc0', function(req, res) {
        const Data = {
            tag_name: 'sensor1',
            values: [["2021-01-06 8:00:00 007:000:000", 1.0], ["2021-01-06 8:00:00 008:000:000", 1.5], ["2021-01-06 8:00:00 009:000:000", 2.0]]
        }
        var request = require('request');
        var option = {
            url: URL,
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY,
                'Use-Timezone': 'Africa/Abidjan'
            },
            body: JSON.stringify(Data)
        };
        request.post( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"fail":0,"success":3},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - Insert Data with date time string format

app.get(
    '/insert_standard_with_date_time_string', function(req, res) {
        const Data = {
            tag_name: 'sensor2',
            date_format: 'YYYY-MM-DD HH24:MI:SS',
            values: [["2021-01-06 17:00:00", 1.0], ["2021-01-06 17:00:01", 1.5], ["2021-01-06 17:00:02", 2.0]]
        }
        var request = require('request');
        var option = {
            url: URL,
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY,
            },
            body: JSON.stringify(Data)
        };
        request.post( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"fail":0,"success":3},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

// CASE - Insert Data with nano-timestamp

app.get(
    '/insert_standard_with_nano_timestamp', function(req, res) {
        const Data = {
            tag_name: 'sensor2',
            values: [[1609920003000000000, 1.0], [1609920004000000000, 1.5], [1609920005000000000, 2.0]]
        }
        var request = require('request');
        var option = {
            url: URL,
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY,
            },
            body: JSON.stringify(Data)
        };
        request.post( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"fail":0,"success":3},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)


// CASE - Insert Data with utc-0 time zone and date time string format but data format in data is nano date time string

app.get(
    '/insert_standard_with_date_time_string_diff_setting_utc0', function(req, res) {
        const Data = {
            tag_name: 'sensor2',
            date_format: 'YYYY-MM-DD HH24:MI:SS',
            values: [["2021-01-06 17:00:00 007:000:000", 1.0], ["2021-01-06 17:00:00 008:000:000", 1.5], ["2021-01-06 17:00:00 009:000:000", 2.0]]
        }
        var request = require('request');
        var option = {
            url: URL,
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': API_KEY,
                "Use-Timezone": "Africa/Abidjan"
            },
            body: JSON.stringify(Data)
        };
        request.post( option, function(error, response, body) {
            if (!error) {
                res.writeHead(200);
                res.end(body);
                console.log(body) // {"data":{"fail":0,"success":3},"status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)







app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/insert_standard_with_nano_date_time_string is result for insert standard data with nano date time string')
    console.log('http://127.0.0.1:8888/insert_standard_with_nano_date_time_string_diff_setting is result for insert standard data with nano date time string with diff settings')
    console.log('http://127.0.0.1:8888/insert_standard_with_nano_date_time_string_utc0 is result for insert standard data with nano date time string with diff settings with utc-0')
    console.log('http://127.0.0.1:8888/insert_standard_with_date_time_string is result for insert standard data with date time string')
    console.log('http://127.0.0.1:8888/insert_standard_with_nano_timestamp is result for insert standard data with nano timestamp')
    console.log('http://127.0.0.1:8888/insert_standard_with_date_time_string_diff_setting_utc0 is result for insert standard data with date time string with utc-0')
})