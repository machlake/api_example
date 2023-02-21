// Example For Select Tag Stat Data for tag API by using request in node js

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const CLOUD_VENDOR="CLOUD_VENDOR";
const CLOUD_REGION="CLOUD_REGION";
const URL =  `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/v1/lakes/${LAKE_ID}/values`;

const SELECT_TYPE="stat";

var request = require('request');


/* ------------------------------------------------------------------------------------------------- */

// CASE - Select Tag

request.get({
    url: URL, 
    qs: {
        type: SELECT_TYPE, 
        tag_name: "sensor1"
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
        //     "data": {
        //         "columns": [
        //             {"name":"NAME","type":5,"length":100},
        //             {"name":"ROW_COUNT","type":112,"length":20},
        //             {"name":"MIN_VALUE","type":20,"length":17},
        //             {"name":"MAX_VALUE","type":20,"length":17},
        //             {"name":"MIN_TIME","type":5,"length":4096},
        //             {"name":"MAX_TIME","type":5,"length":4096},
        //             {"name":"MIN_VALUE_TIME","type":5,"length":4096},
        //             {"name":"MAX_VALUE_TIME","type":5,"length":4096},
        //             {"name":"RECENT_ROW_TIME","type":5,"length":4096}
        //         ],
        //         "rows": [
        //             ["sensor1",103277000,0,3999,"2022-07-05 14:14:08","2022-07-06 12:15:11","2022-07-06 12:15:04","2022-07-06 12:14:35","2022-07-06 12:15:11"]
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - Select Tag with date_format

request.get({
    url: URL, 
    qs: {
        type: SELECT_TYPE, 
        tag_name: "sensor1",
        date_format: "MS" // MILLISECOND
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
        //     "data": {
        //         "columns": [
        //             {"name":"NAME","type":5,"length":100},
        //             {"name":"ROW_COUNT","type":112,"length":20},
        //             {"name":"MIN_VALUE","type":20,"length":17},
        //             {"name":"MAX_VALUE","type":20,"length":17},
        //             {"name":"MIN_TIME","type":12,"length":20},
        //             {"name":"MAX_TIME","type":12,"length":20},
        //             {"name":"MIN_VALUE_TIME","type":12,"length":20},
        //             {"name":"MAX_VALUE_TIME","type":12,"length":20},
        //             {"name":"RECENT_ROW_TIME","type":12,"length":20}
        //         ],
        //         "rows": [
        //             ["sensor1",103277006,0,3999,1675142048271,1676596324000,1675653288184,1675653301116,1676596324000]
        //         ]
        //     }
        // }
    })

/* ------------------------------------------------------------------------------------------------- */

// CASE - Select Tag about not exist

request.get({
    url: URL, 
    qs: {
        type: SELECT_TYPE, 
        tag_name: "OTHER_NAME"
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
        //     "data": {
        //         "columns": [
        //             {"name":"NAME","type":5,"length":100},
        //             {"name":"ROW_COUNT","type":112,"length":20},
        //             {"name":"MIN_VALUE","type":20,"length":17},
        //             {"name":"MAX_VALUE","type":20,"length":17},
        //             {"name":"MIN_TIME","type":5,"length":4096},
        //             {"name":"MAX_TIME","type":5,"length":4096},
        //             {"name":"MIN_VALUE_TIME","type":5,"length":4096},
        //             {"name":"MAX_VALUE_TIME","type":5,"length":4096},
        //             {"name":"RECENT_ROW_TIME","type":5,"length":4096}
        //         ],
        //         "rows": []
        //     }
        // }
    })
