// Example For Create LAKE API by using request in nodejs

// process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

const API_KEY = "YOUR_API_TOKEN";
const URL = "https://api.machlake.com/v1/lakes";

var request = require('request');

/* ------------------------------------------------------------------------------------------------- */

// CASE - create LAKE

var  Data = {
    lake_info:{
        lake_name:"sample_lake",
        lake_plan:"basic",
        region:"aws1.kor",
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

request.post({
    url: URL, 
    headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success": true,
        //     "reason": "create lake start",
        //     "data": "{lake id}"
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - create LAKE with additional column

var  Data = {
    lake_info:{
        lake_name:"sample_lake2",
        lake_plan:"basic",
        region:"aws1.kor",
        timezone:"Asia/Seoul",
        storage_size:20
    },
    tag_schema:[
        {col_name:"name",col_type:"varchar",col_length:80},
        {col_name:"location",col_type:"varchar",col_length:40}
    ],
    value_schema:[
        {col_name:"time",col_type:"datetime"},
        {col_name:"value",col_type:"double"},
        {col_name:"worktime",col_type:"integer"}
    ]
}

request.post({
    url: URL, 
    headers: {
        "Content-Type": "application/json",
        "x-api-key": API_KEY
    },
    body: JSON.stringify(Data)
    }, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success": true,
        //     "reason": "create lake start",
        //     "data": "{lake id}"
        // }
    })
