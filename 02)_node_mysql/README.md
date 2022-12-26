# 2022.12.25 

## 출석체크 프로그램 
<br/>

## Node 새로운 프로젝트 만들기 

```js
npm init -yes

```

### 1) 패키지 설치 

``` js 
npm install mysql --save
npm install express  --sav
npm install express-handlebars --save
npm install express-myconnection
npm install body-parser
npm install nodemon
``` 

### 1.1) 패키지 설명 

``` js

express : 서버를 구성할 수 있게 만들어주는 클래스와 라이브러리의 집합체 

``` 

``` js

express-handlebars : 화면을 표현 할 수 있는 템플릿 엔진 (handlebars와 ejs를 선택)
장점 : 컴파일 단계에서 코드가 해석이 되므로, 클라이언트에서 따로 코드를 해석하는 단계가 필요없다. 
그러므로 로딩이 빠르다.

참고 : https://velog.io/@parkoon/%EC%8B%A4%EB%AC%B4%EC%97%90%EC%84%9C-Handlebars-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0-feat-express

```

``` js 

express-myconnection : 요청/응답 수명 주기 동안 MySQL 연결을 위한 일관된 API를 제공합니다.

``` 

``` js 

body-parser : 미들웨어이다. 즉, 요청(request)과 응답(response) 사이에서 공통적인 기능을 수행하는 소프트웨어이다. 그렇다면 역할은 무엇일까? 바로 요청의 본문을 지정한 형태로 파싱해주는 미들웨어이다.

```

### 1.2) Package.json 

![image](https://user-images.githubusercontent.com/60457431/209468904-f606b601-e961-4ad9-b403-230273558c31.png)

### 2) gitignore 작성

![image](https://user-images.githubusercontent.com/60457431/209468310-fd2e6866-9c97-4082-9aaf-f02c84f9649d.png)

## git ignore 적용 안될때 

``` js
git rm -r --cached .
git add .
git commit -am "멘트 "
``` 

## package.json scripts 수정

![image](https://user-images.githubusercontent.com/60457431/209468925-afbb0f5a-9b2d-4e69-b109-be0a76dc86a6.png)

## 포트 확인

``` js 

const express = require('express');
const { engine } = require('express-handlebars');
const myconnection = require('express-myconnection');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
app.set('port', 4000);

app.listen(app.get('port'), () =>{
    console.log('현재 포트 : ', app.get('port'));
})

```
![image](https://user-images.githubusercontent.com/60457431/209468940-ec4b710c-9c82-4f19-a24b-cb8eb52dad1c.png)

# 2022.12.26 

### 설치한 모듈 

```js 

npm install morgan --save
npm install path --save

``` 
### 파일 구성 

// 사진 추가 

### router 폴더의 역할 
``` js

CRUD를 위한 폴더 
index.js의 역할은 index.html를 렌더 해주지 위한 코드

``` 

``` js 

var express = require('express');
// express의 안에 있는 Router기능 사용하기 위해 router를 선언
// ()는 함수를 표현
var router = express.Router();
// 선언한 Path를 import 
const path = require('path');

// Get home Page. 

// .get는 렌더할때 사용
// function(req,res,next)는 우리가 요청하거나 이후에 어떤것을 할지 선언
router.get('/', function(req,res,next){
    // sendFile 파일 불러와서 렌더링 역할을 한다
    //path.join은 상대적 위치를 조정할때 사용 
    // __dirname은 현재 있는 파일의 위치
    res.sendFile(path.join(__dirname+'../../../frontend/view/index.html'));
})

// router를 모듈화 
// 다른 페이지에서 index를 가지고 router만 선언할수 있는 해주는 역할이다.
module.exports = router


```

### app.js의 역할 

```js 

app.js는 화면 구현 (frontend) + backend를 합쳐주는곳  
HTML은 기능을 불러만 오면 된다.


```

```js 

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
``` 

### 화면이 구현되는 과정 

```js 

1) app.js가 가장 먼저 실행 
2) 모듈이 설치 
3) const app = express()를 실행 // express를 app이라는 변수에 선언
4) 포트 설정 
5) index.html의 상대적 위치 선언 
6) 화면을 구성하는 엔진을 HTML로 선언 
7) app.use(logger('dev'));
   // express의 안에 있는 json을 사용하겠다고 선언
   app.use(express.json());
   // 나중에 더 찾기
   app.use(express.urlencoded({ extended : false}));
   실행 이 부분은 좀더 찾아보기 
8) /frontend/public를 정규화 시킨다. 
9) mysql의 선언
10) 포트 정보보기 
11) index.js를 indexRouter라는 변수에 선언
12) 화면을 렌더링 실시

```