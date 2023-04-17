# 0404 

## 간단한 HTML과 CSS로 자기 소개 만들기 !

### CSS Image 가운데 정렬 
 
 ``` html
 
 display : block;
 margin-left : auto;
 margin-right : auto;

ex) 
  <img src="./img/lion.png" alt="프로필사진" style="width: 200px; display: block; margin-right: auto; margin-left: auto;">
    <h3>Minjun</h3>
    <p>Front-end Developer</p>

 ```

 ### text 자간 간격 만들기 ! 

 ``` html 

<p style="letter-spacing: 8px;">

 ```

 ###  종합 정리

``` html 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <p style="text-align: center;">안녕하세요 밑를 누르시면 저의 블로그로 이동이 가능합니다.
        <br/> 
        <br/>
        <a href="https://duridan-program.tistory.com/">
            블로그로 이동
        </a>
    </p>

    <!-- 이미지 가운데 정렬 -->
    <img src="./img/lion.png" alt="프로필사진" style="width: 200px; display: block; margin-right: auto; margin-left: auto;">
    <!-- font 스타일 -->
    <!-- letter-space : 자간 조절 -->
    <h3 style="text-align: center; letter-spacing: 8px;  font-size: 36px; font-weight: bold;">Minjun</h3>
    <!-- 글자 가운데 정렬 -->
    <p style="text-align: center; font-weight: bold;">Front-end Developer</p>
    <!--  -->
    <p style="text-align:center; font-weight: 500;">私は2023年にもう一同日本で仕事をするつもりだ！</p>

</body>
</html>

```
![image](https://user-images.githubusercontent.com/60457431/229813697-33a3aa51-24ce-4939-b553-c3d344e91043.png)

# 0406

## CSS 파일 적용

CSS는 사용하기 위해서는 .css의 파일 생성하면 된다. 
생성한 CSS를 적용하기 위해서는 아래와 같이 하면 된다.

``` html 

<head>
        <link rel="stylesheet" href="../CSS/main.css">
</head>

```

## CSS 선언

CSS를 선언하는 방법은 3가지가 있다. 
1. class
2. tag
3. id

높은 우선순위인것은 

id > class > tag 순이다. 
밑에  코드에서 확인

### CSS 파일

``` CSS

/* clsss */
/* class는 스타일을 묶는 단위 */
.profile{
    width: 200px; 
    display: block; 
    margin-right: auto; 
    margin-left: auto;
}

/* Class말고 다르게 스타일 넣기*/

/* 태그 전체에 적용 */
p {
    text-align:center; 
    font-weight: 500;
    color: blueviolet;
}
/* ID 적용 - 요즘엔 크게 쓰지 않는다.*/
#Id_test {
    text-align:center; 
    font-weight: 500;
}

```
### html 파일
``` HTML

 <!-- 이미지 가운데 정렬 -->
    <img src="./img/lion.png" alt="프로필사진" class="profile">
    <!-- font 스타일 -->
    <!-- letter-space : 자간 조절 -->
    <h3 class="mainName">Minjun</h3>
    <!-- 글자 가운데 정렬 -->
    <p id="Id_test" class="jab">Front-end Developer</p>
    <!--  -->
    <p>私は2023年にもう一同日本で仕事をするつもりだ！</p>

```

![image](https://user-images.githubusercontent.com/60457431/230487454-78182b73-d6ce-4bff-8664-7efefcc52bff.png)

## BOX 디자인

```CSS

.box{
    text-align:center; 
    width: 500px;
    background-color: cadetblue;
    /* 상하좌우 여백 지정 */
    margin: 30px;
    /* 상하좌우 안쪽 여뱍 */
    padding: 40px;
    /* 테두리 */
    border: 4px solid black;
    /* 테두리 둥글게 */
    border-radius: 15px;

    /* 우측하단 그림자 */
    box-shadow: 5px 5px; 
    /* 가운데 정렬 */
    /*   display: block; - 가로행을 전부 차지 */
    display: block; 
    margin-right: auto; 
    margin-left: auto;
}

```

``` html

    <div class="box"><p class="boxContent">私は2023年にもう一同日本で仕事をするつもりだ！</p></div>

```

![image](https://user-images.githubusercontent.com/60457431/230493517-795ece06-bb13-4167-a78c-6cfd2a7901a6.png)

# 0411 
## 레이아웃 만들기 1 

### HTML
``` html 
   <!-- 감싸는 부분 -->
    <div class="container">
        <!-- header part  -->
        <div class="header"></div>
        <!-- 왼쪽 -->
        <div class="left-menu"></div>
        <!-- 오른쪽 -->
        <div class="content"></div>
        <div class="footer"></div>
    </div>
``` 
``` text
사실상 여기서 제일 중요한 CSS는 전부 주석처리를 해두었다.
float, clear: both 이렇게 2개만 기억하면 된다.
```
### CSS
``` css 

.container{
    width: 800px;
}
.header{
    /* 부모태그 width의 100% */
    width: 100%;
    height: 100px;
    background: red;
}
.left-menu{
    width: 20%;
    height: 400px;
    background: cornflowerblue;
    /* 요소를 붕 띄어서 왼쪽정렬 */
    float: left;
}
.content{
    width: 80%;
    height: 400px;
    background: coral;
    /* 요소를 붕 띄어서 왼쪽정렬 */
    float: right;
}
.footer{
    width: 100%;
    height: 100px;
    background: gray;
    /* float 다음에 오는 요소에게 주면 */
    /* float로 발생하는 이상한 현상 해결가능  */
    clear: both;
}

```
![image](https://user-images.githubusercontent.com/60457431/231169204-9a7f32c6-f001-4ed9-9b9f-c3b69e4d4c1a.png)

# 0417 

### inline-block란 

``` text

 display : block -> 가로로 한행을 전부 차지 
 display: inline-block; : 내 크기만큼 차지 

```

### 예시
![1](https://user-images.githubusercontent.com/60457431/232493333-a9ccbdf3-384f-4782-a8cb-8293e040be35.png)

HTML
``` html 
<body>
    <!-- 감싸는 부분 -->
    <div class="container">
        <!-- header part  -->
        <div class="header"></div>
        <!-- 왼쪽 -->
        <div class="left-menu"></div><div class="content"></div>
        <div class="footer"></div>
    </div>
</body>
```
CSS

``` CSS 

... 
.left-menu{
    width: 20%;
    height: 400px;
    background: cornflowerblue;
    /* display : block -> 가로로 한행을 전부 차지 */
    /*     display: inline-block; : 내 크기만큼 차지 */
    /* 띄어쓰기를 하는것이 문제임 */
    display: inline-block;
    
}
.content{
    width: 80%;
    height: 400px;
    background: coral;
    /* display : block -> 가로로 한행을 전부 차지 */
    /*     display: inline-block; : 내 크기만큼 차지 */
    display: inline-block;
}
....

```
그냥 display: inline-block을 할 시 HTML를 붙여하는 불편함이 있다. <br>
이를 방지 하는 방법 중 하나가 부모 태그에 font-size: 0px를 넣는것이다. 
![2](https://user-images.githubusercontent.com/60457431/232493359-a115706d-53bf-4d70-933f-f742001c9296.png)

HTML
```html 
    <div class="container" style="font-size: 0px;">
        <!-- header part  -->
        <div class="header"></div>
        <!-- 왼쪽 -->
        <div class="left-menu"></div>
         <div class="content"></div>
        <div class="footer"></div>
    </div>
``` 


