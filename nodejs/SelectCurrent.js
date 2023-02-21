// Example For Select Current Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const URL = `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/values`;

var request = require('request');

const TAG_NAME = "sensor1,sensor2";
const SELECT_TYPE="current";


/* ------------------------------------------------------------------------------------------------- */

// CASE - Current DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

request.get({
    url: URL, 
    qs: {
        type: SELECT_TYPE,
        tag_name: TAG_NAME,
        date_format: "YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
    },
    headers: {
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success": true,
        //     "reason": "success",
        //     "data":{
        //         "columns":[
        //             {"name":"NAME","type":5,"length":80},
        //             {"name":"TIME","type":5,"length":4096},
        //             {"name":"VALUE","type":20,"length":17}
        //         ],
        //         "rows":[
        //             ["sensor2","2021-01-07 02:00:00 009:000:000",2],
        //             ["sensor1","2021-01-06 20:00:06 000:000:000",2]
        //         ]
        //     }
        // }
    })
