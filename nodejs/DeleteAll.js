// Example For Delete All Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const express = require('express');
const app = express();
const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID"
const URL ="https://" + LAKE_ID +".machlake.com/lakes/values/raw";

// CASE - Delete All Data

app.get(
    '/delete_all_data', function(req, res) {
        var request = require('request');

        const Data = {
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
    console.log('http://127.0.0.1:8888/delete_all_data is result for delete all data')
})