// app.js는 화면 구현 (frontend) + backend를 합쳐주는곳  
// HTML은 기능을 불러만 오면 된다.

const express = require('express');
// { engine }는 express-handlebars를 쓰기위해 선언한것
// {}는 모듈이다. 
const { engine } = require('express-handlebars');
const myconnection = require('express-myconnection');

// 좀더 찾아보기
const bodyParser = require('body-parser');
const mysql = require('mysql');
//path는 파일의 위치 조정을 하기 위한 모듈
const path = require('path');
// margon은 서버의 로그 관리를 위한 모듈
const logger = require('morgan');

const app = express();

app.set('port', 4000);
// view로 사용하고자 하는 파일의 상대적 위치를 설정해주는 역할
// index.html의 상대적 위치를 선언(가장 상위 폴더에서의 상대적 역할)
app.set('views', path.join(__dirname, '/frontend/view/index.html'));
// viwe의 engine를 html로 선언
app.set('view engine', 'html');

app.use(logger('dev'));
// express의 안에 있는 json을 사용하겠다고 선언
app.use(express.json());
// 나중에 더 찾기
app.use(express.urlencoded({ extended : false}));
// 정규화 시킨다. 
// 현재 위치에서 /frontend/public에 있는것을 정규화 시킨다.
app.use(express.static(path.join(__dirname, '/frontend/public')));

app.use(myconnection(mysql,{
    host : 'localhost',
    user : 'root',
    password : '00000000',
    database : 'user_test1'
}))


app.listen(app.get('port'), () =>{
    console.log('현재 포트 : ', app.get('port'));
})

// router폴더의 index.js를 indexRouter라는 것으로 선언
// router의 index.js를 불러온다.
var indexRouter = require('./backend/router/index.js');
// /가 homePage를 나타내는것 
// 화면을 렌더링 하는것
// index.js에서 렌더시켜주는 index.html을 홈페이지(처음 열리는 페이지로 지정)
// 즉 homepage를 열었을때 index.html를 지정해주는것
app.use('/', indexRouter);

module.exports = app;