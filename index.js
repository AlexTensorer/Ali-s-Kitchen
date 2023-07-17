// Load environnement variables
require("dotenv/config");

// Third party dependencies
const express = require("express");
const path = require('path');
const methodOverride = require('method-override');
const flash = require("connect-flash");


// Local dependencies
const router = require("./app/router");
const { addUsersTolocals, initSession, flashMiddleware } = require('./middlewares/initSession');

// Create app
const app = express();

// Add flash MW
app.use(flash());

// Serve front assets
// app.use(express.static("dist"));

// Add body parsers
app.use(express.urlencoded({ extended : false }));
app.use(methodOverride('_method'));

// Setup view engine
app.set('view engine', 'ejs');
const viewsDirectory = path.join(__dirname, 'app/views');
app.set('views', viewsDirectory);

app.use(initSession);

app.use(addUsersTolocals);

app.use(flashMiddleware);

// Plug router
app.use(router);

// Start app
const BASE_URL = process.env.BASE_URL
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
    console.log(`Listening on ${BASE_URL}:${PORT} `);
})

module.exports = app;