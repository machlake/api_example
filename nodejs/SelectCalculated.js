// Example For Select Calculated Data for tag API by using request in node js
// written by yeony kim
// sensor1, sensor2 is applied in lake

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const URL =  `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/values`;

const SELECT_TYPE="calc";
const TAG_NAME = "sensor1,sensor2";

var request = require('request');

/* ------------------------------------------------------------------------------------------------- */

// CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min

request.get({
    url: URL, 
    qs: {
        type: SELECT_TYPE,
        tag_name: TAG_NAME,
        calc_mode: "min",
        date_format: "YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn",
        start_time: "2021-01-06 17:00:00 000:000:000",
        end_time: "2021-01-06 21:00:00 000:000:000"
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
        //             ["sensor1","2021-01-06 17:00:00 000:000:000",1],
        //             ["sensor2","2021-01-06 17:00:00 000:000:000",1],
        //             ["sensor2","2021-01-06 17:00:01 000:000:000",1.5],
        //             ["sensor2","2021-01-06 17:00:02 000:000:000",2],
        //             ["sensor2","2021-01-06 17:00:03 000:000:000",1],
        //             ["sensor2","2021-01-06 17:00:04 000:000:000",1.5],
        //             ["sensor2","2021-01-06 17:00:05 000:000:000",2],
        //             ["sensor1","2021-01-06 18:00:00 000:000:000",2],
        //             ["sensor2","2021-01-06 18:00:00 000:000:000",2],
        //             ["sensor1","2021-01-06 20:00:04 000:000:000",2],
        //             ["sensor2","2021-01-06 20:00:04 000:000:000",2],
        //             ["sensor1","2021-01-06 20:00:05 000:000:000",2.5],
        //             ["sensor2","2021-01-06 20:00:05 000:000:000",2.5],
        //             ["sensor1","2021-01-06 20:00:06 000:000:000",2]
        //             ["sensor2","2021-01-06 20:00:06 000:000:000",2]
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=max and interval_value=3

request.get({
    url: URL, 
    qs: {
        type: SELECT_TYPE,
        tag_name: TAG_NAME,
        calc_mode: "max",
        date_format: "YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn",
        start_time: "2021-01-06 17:00:00 000:000:000",
        end_time: "2021-01-06 21:00:00 000:000:000",
        interval_value: 3
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
        //             ["sensor2","2021-01-06 17:00:00 000:000:000",2],
        //             ["sensor1","2021-01-06 17:00:00 000:000:000",2],
        //             ["sensor2","2021-01-06 17:00:03 000:000:000",2],
        //             ["sensor2","2021-01-06 18:00:00 000:000:000",2.5],
        //             ["sensor1","2021-01-06 18:00:00 000:000:000",2.5],
        //             ["sensor2","2021-01-06 20:00:03 000:000:000",2.5],
        //             ["sensor1","2021-01-06 20:00:03 000:000:000",2.5],
        //             ["sensor2","2021-01-06 20:00:06 000:000:000",2],
        //             ["sensor1","2021-01-06 20:00:06 000:000:000",2]
        //         ]
        //     }
        // }
    })


// CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min and interval_type=m and interval_value=90
request.get({
    url: URL, 
    qs: {
        type: SELECT_TYPE,
        tag_name: TAG_NAME,
        calc_mode: "min",
        date_format: "YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn",
        start_time: "2021-01-06 17:00:00 000:000:000",
        end_time: "2021-01-06 21:00:00 000:000:000",
        interval_type: "m",
        interval_value: 90
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
        //             {"name":"VALUE","type":12,"length":20}
        //         ],
        //         "rows":[
        //             ["sensor1","2021-01-06 16:30:00 000:000:000",1],
        //             ["sensor2","2021-01-06 16:30:00 000:000:000",1],
        //             ["sensor1","2021-01-06 18:00:00 000:000:000",1],
        //             ["sensor2","2021-01-06 18:00:00 000:000:000",1],
        //             ["sensor1","2021-01-06 19:30:00 000:000:000",1],
        //             ["sensor2","2021-01-06 19:30:00 000:000:000",1],
        //         ]
        //     }
        // }
    })
