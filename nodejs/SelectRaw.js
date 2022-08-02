// Example For Select Raw Data for tag API by using request in node js

const API_KEY ="YOUR_API_TOKEN";
const LAKE_ID ="YOUR_LAKE_ID";
const TAG_NAME="YOUR_TAG_NAME";

// process.env.NODE_TLS_REJECT_UNAUTHORIZED ="0";
var request = require('request');
request.get({
    url: `https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/raw`, 
    qs: { 
        tag_name: TAG_NAME,
        date_format: 'YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn',
        start_time: '2021-01-06 17:00:00 000:000:000',
        end_time: '2021-01-06 21:00:00 000:000:000',
        limit: 10,
        offset: 5,
        direction: 0,
        value_return_form: 0
    },
    headers: {
        'x-api-key': API_KEY,
        "Use-Timezone": "Asia/Seoul"
    }}, 
    function(error, response, body) {
        console.log(body)
    })

