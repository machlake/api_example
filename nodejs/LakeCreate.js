// Example For Create LAKE API by using request in nodejs
// written by yeony kim

// process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const API_KEY = "YOUR_API_TOKEN";

var request = require('request');

// CASE - create LAKE
var  Data = {
    lake_id:"",
    lake_info:{
        lake_name:"sample_lake",
        lake_plan:"basic",
        owner:"YOUR_MACHLAKE_ID",
        region:"YOUR_REGION",
        timezone:"YOUR_TIMEZONE",
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

request.post({
    url: "https://api.machlake.com/lakes", 
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body)
    })
