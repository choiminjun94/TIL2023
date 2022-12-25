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

body-parser는 미들웨어이다. 즉, 요청(request)과 응답(response) 사이에서 공통적인 기능을 수행하는 소프트웨어이다. 그렇다면 역할은 무엇일까? 바로 요청의 본문을 지정한 형태로 파싱해주는 미들웨어이다.

```

### 1.2) Package.json 

![image](https://user-images.githubusercontent.com/60457431/209468297-c52b4b89-9c26-48fe-81cd-1148e386aeb1.png)

### 2) gitignore 작성

![image](https://user-images.githubusercontent.com/60457431/209468310-fd2e6866-9c97-4082-9aaf-f02c84f9649d.png)

## git ignore 적용 안될때 

``` js
git rm -r --cached .
git add .
git commit -am "멘트 "
``` 

