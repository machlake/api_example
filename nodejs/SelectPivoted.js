// Example For Select Pivoted Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID"
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const URL = `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/values`;

var request = require('request');

const TAG_NAME = "sensor1,sensor2";
const SELECT_TYPE="pivot";


/* ------------------------------------------------------------------------------------------------- */

// CASE - Pivoted DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

request.get({
    url: URL, 
    qs: {
        type: SELECT_TYPE,
        tag_name: TAG_NAME,
        calc_mode: 'min',
        date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
        start_time: '2021-01-06 17:00:00 000:000:000',
        end_time: '2021-01-06 21:00:00 000:000:000'
    },
    headers: {
        'x-api-key': API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success": true,
        //     "reason": "success",
        //     "data":{
        //         "columns":[
        //             {"name":"TIME","type":5,"length":4096},
        //             {"name":"sensor1","type":20,"length":17},
        //             {"name":"sensor2","type":20,"length":17}
        //         ],
        //         "rows":[
        //             ["2021-01-06 17:00:00 000:000:000",1,1],
        //             ["2021-01-06 17:00:01 000:000:000",null,1.5],
        //             ["2021-01-06 17:00:02 000:000:000",null,2],
        //             ["2021-01-06 17:00:03 000:000:000",null,1],
        //             ["2021-01-06 17:00:04 000:000:000",null,1.5],
        //             ["2021-01-06 17:00:05 000:000:000",null,2],
        //             ["2021-01-06 18:00:00 000:000:000",2,2],
        //             ["2021-01-06 20:00:04 000:000:000",2,2],
        //             ["2021-01-06 20:00:05 000:000:000",2.2.5],
        //             ["2021-01-06 20:00:06 000:000:000",2,2]
        //         ]
        //     }
        // }
    })
