var createError = require('http-errors');
var express = require('express');
var path = require('path')
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();
// maria DB connect
const maria = require('./database/connect/maria');
//const { appendFile } = require('fs');
//maria.connect();

//view engine setup

app.set('view', path.join(__dirname, 'view'));
app.set('view engine', 'jade');

