const express = require('express');
var app = express();
let router = require('./routes/router.js');



const port = process.env.PORT || 3000
app.listen(port, ()=> console.log(`Listening on port ${port}...`));