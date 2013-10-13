var mysql = require('mysql');
var http = require('http');
var express = require('express');
var md5 = require('MD5');
var app = express();
var salt = '&Ju|!4n&';

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'Kloset'
});

console.log('here we go Okt11');

function login(_email, _password, launchLogin) {
	console.log('login');
    var json = null;
    _password = md5(_password + salt);
    connection.query('SELECT * FROM users WHERE users.email = ? AND users.password = ?', [_email, _password], function (err, results) {
        console.log('login err');
        console.log(err);
        console.log('login result');
        console.log(results);
        if (err) {
            launchLogin('error', 404);
        }
        if (results[0]) {
            json = {'email': results[0].email, 'name': results[0].name, 'idUser': results[0].id};
            launchLogin(json, 200);
        } else {
            launchLogin('user doesn\'t exist', 400);
        }
    });
}

function register(_email, _password, _name, launchRegister) {
    var json = null;
    _password = md5(_password + salt);
    connection.query('INSERT INTO users (email, password, name) VALUES (?, ?, ?)', [_email, _password, _name], function (err, results) {
        console.log('register err');
        console.log(err);
        console.log('register result');
        console.log(results);
        if (err) {
            launchRegister(err, 404);
        } else if (results.affectedRows === 1) {
            launchRegister('success', 200);
        }
    });
}

function getClothesOfUser(_id, getClothes) {
    var json = [];
    var query = 'SELECT clothes.* FROM clothes, users WHERE users.id = clothes.id_user AND users.id = '  + [_id];
    console.log(' query : ' + query);
    connection.query(query, function (err, results) {
        if (err) {
            getClothes('error', 404);
        }
        if (results[0]) {
            for (var i = 0; i < results.length; i++) {
                json.push({'id': +results[i].id, 'name': results[i].name, 'link': results[i].link, 'color': results[i].color, 'style': results[i].style, 'type': results[i].type});
            }
            getClothes(json, 200);
        } else {
            getClothes('You have no clothes for the moment :)', 400);
        }
    });
}

/*function passwordLost(_email, _password, updatePwd) {
 var json = null;
 _password = md5(_password + salt);
 connection.query('USE Kloset');
 connection.query('UPDATE users SET password = ? WHERE email = ?', [_password, _email], function (err, results) {
 if (err) throw err;
 updatePwd(json);
 });
 }*/

function sendResponse(res, body, statusCode) {
    res.json(statusCode, body);
}

app.get('/connection', function (req, res) {
    console.log('connection');
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    res.type('application/json');

    login(req.query.email, req.query.password, function (body, statusCode) {
        sendResponse(res, body, statusCode);
    });
});

app.get('/register', function (req, res) {
    console.log('register');
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    res.type('application/json');

    register(req.query.email, req.query.password, req.query.name, function (body, statusCode) {
        sendResponse(res, body, statusCode);
    });
});

app.get('/passwordLost', function (req, res) {
    console.log('Password Lost');
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    res.type('application/json');

    passwordLost(req.query.email, req.query.password, function (body) {
        sendResponse(res, body);
    });
});

app.get('/getClothesOfUser', function (req, res) {
    console.log('getClothesOfUser');
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    res.type('application/json');

    getClothesOfUser(req.query.idUser, function (body, statusCode) {
        sendResponse(res, body, statusCode);
    });
});

app.listen(3000);
