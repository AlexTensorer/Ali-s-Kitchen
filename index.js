// Load environnement variables
require("dotenv/config");

// Third party dependencies
const express = require("express");
const cors = require("cors");
const path = require('path');
const flash = require('connect-flash');

// Local dependencies
const router = require("./app/router");
const exp = require("constants");
const { addUsersTolocals, initSession } = require('./middlewares/initSession');

// Create app
const app = express();

// Add CORS MW
app.use(cors("*")); // Allège politique Cross-Origin

// Serve front assets
// app.use(express.static("dist"));

// Add body parsers
app.use(express.urlencoded({ extended : false }));

// Setup view engine
app.set('view engine', 'ejs');
const viewsDirectory = path.join(__dirname, 'app/views');
app.set('views', viewsDirectory);

app.use(initSession);

app.use(addUsersTolocals);

// Plug router
app.use(router);

// Start app
const BASE_URL = process.env.BASE_URL
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
    console.log(`Listening on ${BASE_URL}:${PORT} `);
})