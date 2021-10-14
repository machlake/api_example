// Example For Create LAKE API by using request in nodejs
// written by yeony kim

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const express = require('express');
const app = express();
const API_KEY = "YOUR_API_TOKEN";
const URL = "https://api.machlake.com/lakes";

// CASE - create LAKE

app.get(
    '/create_lake', function(req, res) {
        const Data = {
            lake_id:"",
            lake_info:{
                lake_name:"sample_lake",
                lake_plan:"basic",
                owner:"YOUR_MACHLAKE_ID",
                region:"ap-northeast-2",
                timezone:"Asia/Seoul",
                storage_size:20
            },
            tag_schema:[
                {col_name:"name",col_type:"varchar",col_length:40}
            ],
            value_schema:[
                {col_name:"time",col_type:"datetime"},
                {col_name:"value",col_type:"double"}
            ]
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
                console.log(body) // {"data":"YOUR_LAKE_ID","status":"success"}
            } else {
                console.log(error)
            }
        })
    }
)

app.listen(8888, function() {
    console.log('http://127.0.0.1:8888/create_lake is result for create LAKE')
})