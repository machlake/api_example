// Example For Select Raw Data for tag API by using request in node js

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const URL =  `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/values`;

var request = require('request');

const SELECT_TYPE="raw";


/* ------------------------------------------------------------------------------------------------- */

// CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn

request.get({
    url: URL, 
    qs: { 
        type: SELECT_TYPE, 
        tag_name: "sensor1",
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
        //     "success":true,
        //     "reason":"success",
        //     "data":{
        //         "columns":[
        //             {"name":"NAME","type":5,"length":80},
        //             {"name":"TIME","type":5,"length":4096},
        //             {"name":"VALUE","type":20,"length":17}
        //         ],
        //         "rows":[
        //             ["sensor1","2021-01-06 17:00:00 001:000:000",1],
        //             ["sensor1","2021-01-06 17:00:00 002:000:000",1.5],
        //             ["sensor1","2021-01-06 17:00:00 003:000:000",2],
        //             ["sensor1","2021-01-06 17:00:00 004:000:000",1],
        //             ["sensor1","2021-01-06 17:00:00 005:000:000",1.5],
        //             ["sensor1","2021-01-06 17:00:00 006:000:000",2],
        //             ["sensor1","2021-01-06 17:00:00 007:000:000",1],
        //             ["sensor1","2021-01-06 17:00:00 008:000:000",1.5],
        //             ["sensor1","2021-01-06 17:00:00 009:000:000",2],
        //             ["sensor1","2021-01-06 18:00:00 001:000:000",2],
        //             ["sensor1","2021-01-06 18:00:00 002:000:000",2.5],
        //             ["sensor1","2021-01-06 18:00:00 003:000:000",2]
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS

request.get({
    url: URL, 
    qs: { 
        type: SELECT_TYPE, 
        tag_name: "sensor1",
        date_format: "YYYY-MM-DD HH24:MI:SS",
        start_time: "2021-01-06 17:00:00",
        end_time: "2021-01-06 21:00:00"
    },
    headers: {
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success":true,
        //     "reason":"success",
        //     "data":{
        //         "columns":[
        //             {"name":"NAME","type":5,"length":80},
        //             {"name":"TIME","type":5,"length":4096},
        //             {"name":"VALUE","type":20,"length":17}
        //         ],
        //         "rows":[
        //             ["sensor1","2021-01-06 17:00:00",1],
        //             ["sensor1","2021-01-06 17:00:00",1.5],
        //             ["sensor1","2021-01-06 17:00:00",2],
        //             ["sensor1","2021-01-06 17:00:00",1],
        //             ["sensor1","2021-01-06 17:00:00",1.5],
        //             ["sensor1","2021-01-06 17:00:00",2],
        //             ["sensor1","2021-01-06 17:00:00",1],
        //             ["sensor1","2021-01-06 17:00:00",1.5],
        //             ["sensor1","2021-01-06 17:00:00",2],
        //             ["sensor1","2021-01-06 18:00:00",2],
        //             ["sensor1","2021-01-06 18:00:00",2.5],
        //             ["sensor1","2021-01-06 18:00:00",2]
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - DATA GET with date format YYYY-MM-DD HH24:MI:SS, data inserted with date skip mmm:uuu:nnn

request.get({
    url: URL, 
    qs: { 
        type: SELECT_TYPE, 
        tag_name: "sensor2",
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
        //     "success":true,
        //     "reason":"success",
        //     "data":{
        //         "columns":[
        //             {"name":"NAME","type":5,"length":80},
        //             {"name":"TIME","type":5,"length":4096},
        //             {"name":"VALUE","type":20,"length":17}
        //         ],
        //         "rows":[
        //             ["sensor2","2021-01-06 17:00:00 000:000:000",1],
        //             ["sensor2","2021-01-06 17:00:01 000:000:000",1.5],
        //             ["sensor2","2021-01-06 17:00:02 000:000:000",2],
        //             ["sensor2","2021-01-06 17:00:03 000:000:000",1],
        //             ["sensor2","2021-01-06 17:00:04 000:000:000",1.5],
        //             ["sensor2","2021-01-06 17:00:05 000:000:000",2],
        //             ["sensor2","2021-01-06 18:00:00 001:000:000",2],
        //             ["sensor2","2021-01-06 18:00:00 002:000:000",2.5],
        //             ["sensor2","2021-01-06 18:00:00 003:000:000",2],
        //             ["sensor2","2021-01-06 20:00:04 000:000:000",2],
        //             ["sensor2","2021-01-06 20:00:05 000:000:000",2.5],
        //             ["sensor2","2021-01-06 20:00:06 000:000:000",2]
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - DATA GET with UTC-0 timezone

request.get({
    url: URL, 
    qs: { 
        type: SELECT_TYPE, 
        timezone: "Africa/Abidjan", 
        tag_name: "sensor2",
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
        //     "success":true,
        //     "reason":"success",
        //     "data":{
        //         "columns":[
        //             {"name":"NAME","type":5,"length":80},
        //             {"name":"TIME","type":5,"length":4096},
        //             {"name":"VALUE","type":20,"length":17}
        //         ],
        //         "rows":[
        //             ["sensor2","2021-01-06 17:00:00 007:000:000",1],
        //             ["sensor2","2021-01-06 17:00:00 008:000:000",1.5],
        //             ["sensor2","2021-01-06 17:00:00 009:000:000",2]
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - DATA GET with local timezone, data inserted UTC-0 timezone setting

request.get({
    url: URL, 
    qs: { 
        type: SELECT_TYPE, 
        tag_name: "sensor2",
        date_format: "YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn",
        start_time: "2021-01-07 02:00:00 000:000:000",
        end_time: "2021-01-07 12:00:00 000:000:000"
    },
    headers: {
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success":true,
        //     "reason":"success",
        //     "data":{
        //         "columns":[
        //             {"name":"NAME","type":5,"length":80},
        //             {"name":"TIME","type":5,"length":4096},
        //             {"name":"VALUE","type":20,"length":17}
        //         ],
        //         "rows":[
        //             ["sensor2","2021-01-07 02:00:00 007:000:000",1],
        //             ["sensor2","2021-01-07 02:00:00 008:000:000",1.5],
        //             ["sensor2","2021-01-07 02:00:00 009:000:000",2]
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - DATA GET with limit and offset

request.get({
    url: URL, 
    qs: { 
        type: SELECT_TYPE, 
        tag_name: "sensor1",
        date_format: "YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn",
        start_time: "2021-01-06 17:00:00 000:000:000",
        end_time: "2021-01-06 21:00:00 000:000:000",
        limit: 10,
        offset: 5
    },
    headers: {
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success":true,
        //     "reason":"success",
        //     "data":{
        //         "columns":[
        //             {"name":"NAME","type":5,"length":80},
        //             {"name":"TIME","type":5,"length":4096},
        //             {"name":"VALUE","type":20,"length":17}
        //         ],
        //         "rows":[
        //             ["sensor1","2021-01-06 17:00:00 006:000:000",2],
        //             ["sensor1","2021-01-06 17:00:00 007:000:000",1],
        //             ["sensor1","2021-01-06 17:00:00 008:000:000",1.5],
        //             ["sensor1","2021-01-06 17:00:00 009:000:000",2],
        //             ["sensor1","2021-01-06 18:00:00 001:000:000",2],
        //             ["sensor1","2021-01-06 18:00:00 002:000:000",2.5],
        //             ["sensor1","2021-01-06 18:00:00 003:000:000",2],
        //             ["sensor1","2021-01-06 20:00:04 000:000:000",2],
        //             ["sensor1","2021-01-06 20:00:05 000:000:000",2.5],
        //             ["sensor1","2021-01-06 20:00:06 000:000:000",2]
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - DATA GET with descent by time

request.get({
    url: URL, 
    qs: { 
        type: SELECT_TYPE, 
        tag_name: "sensor1,sensor2",
        date_format: "YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn",
        start_time: "2021-01-06 17:00:00 000:000:000",
        end_time: "2021-01-06 21:00:00 000:000:000",
        direction: 1
    },
    headers: {
        "x-api-key": API_KEY
    }}, 
    function(error, response, body) {
        console.log(body);
        // Return Format
        // {
        //     "success":true,
        //     "reason":"success",
        //     "data":{
        //         "columns":[
        //             {"name":"NAME","type":5,"length":80},
        //             {"name":"TIME","type":5,"length":4096},
        //             {"name":"VALUE","type":20,"length":17}
        //         ],
        //         "rows":[
        //             ["sensor2","2021-01-06 20:00:06 000:000:000",2],
        //             ["sensor1","2021-01-06 20:00:06 000:000:000",2],
        //             ["sensor2","2021-01-06 20:00:05 000:000:000",2.5],
        //             ["sensor1","2021-01-06 20:00:05 000:000:000",2.5],
        //             ["sensor2","2021-01-06 20:00:04 000:000:000",2],
        //             ["sensor1","2021-01-06 20:00:04 000:000:000",2],
        //             ["sensor2","2021-01-06 18:00:00 003:000:000",2],
        //             ["sensor1","2021-01-06 18:00:00 003:000:000",2],
        //             ["sensor2","2021-01-06 18:00:00 002:000:000",2.5],
        //             ["sensor1","2021-01-06 18:00:00 002:000:000",2.5],
        //             ["sensor2","2021-01-06 18:00:00 001:000:000",2],
        //             ["sensor1","2021-01-06 18:00:00 001:000:000",2],
        //             ["sensor2","2021-01-06 17:00:05 000:000:000",2],
        //             ["sensor2","2021-01-06 17:00:04 000:000:000",1.5],
        //             ["sensor2","2021-01-06 17:00:03 000:000:000",1],
        //             ["sensor2","2021-01-06 17:00:02 000:000:000",2],
        //             ["sensor2","2021-01-06 17:00:01 000:000:000",1.5],
        //             ["sensor1","2021-01-06 17:00:00 009:000:000",2],
        //             ["sensor1","2021-01-06 17:00:00 008:000:000",1.5],
        //             ["sensor1","2021-01-06 17:00:00 007:000:000",1],
        //             ["sensor1","2021-01-06 17:00:00 006:000:000",2],
        //             ["sensor1","2021-01-06 17:00:00 005:000:000",1.5],
        //             ["sensor1","2021-01-06 17:00:00 004:000:000",1],
        //             ["sensor1","2021-01-06 17:00:00 003:000:000",2],
        //             ["sensor1","2021-01-06 17:00:00 002:000:000",1.5],
        //             ["sensor1","2021-01-06 17:00:00 001:000:000",1],
        //             ["sensor2","2021-01-06 17:00:00 000:000:000",1]
        //         ]
        //     }
        // }
    })
