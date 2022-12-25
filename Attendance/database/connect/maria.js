// // Maria DB 접속 정보 
// const maria = require('mysql');

// const conn = maria.createConnection({
//     host : 'localhost',
//     port : 3306,
//     user : 'root',
//     password : '00000000',
//     database: 'user_test1'
// });
// conn.connect();

// conn.query('select * from user', function (err, rows, fields) {
//     connection.end();
//     if (!err) {
//         console.log(rows);
//         console.log(fields);
//         var result = 'rows : ' + JSON.stringify(rows) + '<br><br>' +
//             'fields : ' + JSON.stringify(fields);
//         res.send(result);
//     } else {
//         console.log('query error : ' + err);
//         res.send(err);
//     }
// });


// conn.end();

// module.exports = conn;
var express = require('express');
var router = express.Router();

var mysql = require('mysql');

router.get('/', function (req, res, next) {
    var connection = mysql.createConnection({
        host: 'localhost',
        post: 3306,
        user: 'root',
        password: '00000000',
        database: 'user_test1'
    });
    connection.connect();
    connection.query('select * from user', function (err, rows, fields) {
        connection.end();
        if (!err) {
            console.log(rows);
            console.log(fields);
            var result = 'rows : ' + JSON.stringify(rows) + '<br><br>' +
                'fields : ' + JSON.stringify(fields);
            res.send(result);
        } else {
            console.log('query error : ' + err);
            res.send(err);
        }
    });
});

module.exports = router;