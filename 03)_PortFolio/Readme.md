## PortFolio 사이트 뉴리뉴얼 

### 2023.01.04

### 파일구성도

![image](https://user-images.githubusercontent.com/60457431/210572355-dcba35e1-c679-4ab9-a0fd-1b140530a975.png)


파일 추가

### Header 작업 (index.html)
``` html 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel='stylesheet' href='public/stylesheets/Portfolio.css' />
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
    <div>
        <header id="header">
            <div id="headerContainer">
                <div id="logo">Testing</div>
                    <ul id="hc">
                        <li><a href=""> About Me</a></li>
                        <li><a href="">Skills</a></li>
                        <li><a href=""> Project</a></li>
                        <li><a href="">Career</a></li>
                    </ul>
            </div>
        </header>
    </div>
</body>
</html>

```

### Portfolio.css

``` css 
body{
    position: relative;
    padding: 0;
    margin: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    font : 14px "Lucida Grande", Helvetica, Arial, sans-serif;
}
header{
    position: fixed;
    width: 100%;
    height: auto;
    top:0;
    background-color: transparent;
    z-index: 1;
}
#headerContainer{
    display: flex;
    justify-content: space-around;
    padding-left: 10px;
    font-size: 24px;
}
#hc{
    list-style: none;
    padding-left: 0px;
    display: flex;
    right: 0;
    padding-right: 40px;
    justify-content: space-between;
}
#hc a{
    text-decoration-line: none;
    color: black;
    margin-right: 20px;
    font-size: 20px;
}
#logo{
    display: flex;
    align-items: center;
}

``` 

### 화면 
![image](https://user-images.githubusercontent.com/60457431/210572470-74a9e5b5-201c-47ea-9156-4ef93340ac11.png)

## 2023.01.05

> 기존 폰트 구글 폰트로 수정

### 배너 추가 

``` html 

<body>
    <div>
        <header id="header">
            <div id="headerContainer">
                <div id="logo">MJ Books</div>
                    <ul id="hc">
                        <li><a href=""> About Me</a></li>
                        <li><a href="">Skills</a></li>
                        <li><a href=""> Project</a></li>
                        <li><a href="">Career</a></li>
                    </ul>
            </div>
        </header>
    </div>
    <div style="position: relative;">
        <img id="imageContainer" src="public/images/banner.jpg">
        <div id="myText">
            <div id="myname">최민준</div>
            <div id="MWM">프론트엔트</div>
            <p id="middletext">ㅡ</p>
            <p style="margin: 5px 0;">안녕하세요</p><p style="margin: 5px 0;">제가 좋아하는것만 하는 프론트엔드 개발자</p>
        </div>
    </div>

```

``` css 

/* 배너 */
#imageContainer {
    width: 100%;
    height: 500px;
    filter: opacity(50%);
}
#myText{
    position: absolute;
    vertical-align: middle;
    top: 50%;
    left: 50%;
    font-size: 24px;
    transform: translate(-50%,-50%);
    width:100%;
    text-align: center;
}
#myText div{
    font-size: 50px;
    font-weight: 600;
}
#myText p{
    font-weight: bold;
}
#middletext{
    color: darkblue;
}

``` 

![image](https://user-images.githubusercontent.com/60457431/210803967-1ffdbb97-d317-4073-be83-385dceef6aeb.png)

## 2023.01.06 

### aboutMe 작업

### 파일구성 

![image](https://user-images.githubusercontent.com/60457431/211126304-62fc5ce5-94b6-4097-8340-6b1ee0a7eb08.png)

### aboutMe.js 
``` js 
$(document).ready(function(){
    document.getElementById("aboutMe").innerHTML
    ='<object type="text/html" data="./view/aboutMe.html" style="width:100%; height:100%;"></object>';
    document.getElementById("aboutMe").style.height="500px"
})
```
### aboutMe.html 

``` html

<body>
    <div id="aboutMe">
        <h2 id="HeaderStyle">About Me</h2>
        <div id="myInfo">
            <!-- Name -->
            <div id="profileContainer" class="Container">
                <img id="profile" class="img1" src="../public/images/profilephoto.png"/>
                <div class="rightContainer">
                    <div>이름</div>
                    <div>최민준</div>
                </div>
            </div>
            <!--  -->
            <div class="Container">
                <img id="calendarIcon" class="img2" src="../public/images/callendar.png"/>
                <div class="rightContainer">
                    <div>생년월일</div>
                    <div>1993.06.24</div>
                </div>
            </div>
            <div class="Container">
                <img class="img1" src="../public/images/phone.png"/>
                <div class="rightContainer">
                    <div>연락처</div>
                    <div>010-3814-7827</div>
                </div>
            </div>
            <div class="Container">
                <img id="email" class="img2" src="../public/images/email.png"/>
                <div class="rightContainer">
                    <div>이메일</div>
                    <div>1020alswns@gmail.com</div>
                </div>
            </div>
            <div class="Container">
                <img id="location" class="img2" src="../public/images/location.png"/>
                <div class="rightContainer">
                    <div>주소지</div>
                    <div>서울특별시 관악구</div>
                </div>
            </div>
            <div class="Container">
                <img id="study" class="img3" src="../public/images/study.png"/>
                <div class="rightContainer">
                    <div>학력</div>
                    <div>동국대학교</div>
                    <div>(전자정보통신공학과)</div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>

```

### aboutMe.css

```css
body{
    position: relative;
    padding: 0;
    margin: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    /* font : 14px "Lucida Grande", Helvetica, Arial, sans-serif; */
    font-family: 'Hi Melody', cursive;
    font-family: 'Song Myung', serif;
}
/* Header */
header{
    position: fixed;
    width: 100%;
    height: auto;
    top:0;
    background-color: transparent;
    z-index: 1;
}
#headerContainer{
    display: flex;
    justify-content: space-around;
    padding-left: 10px;
    font-size: 24px;
}
#hc{
    list-style: none;
    padding-left: 0px;
    display: flex;
    right: 0;
    padding-right: 40px;
    justify-content: space-between;
}
#hc a{
    text-decoration-line: none;
    color: black;
    margin-right: 20px;
    font-size: 20px;
}
#logo{
    display: flex;
    align-items: center;
}
/* 배너 */
#imageContainer {
    width: 100%;
    height: 500px;
    filter: opacity(50%);
}
#myText{
    position: absolute;
    vertical-align: middle;
    top: 50%;
    left: 50%;
    font-size: 24px;
    transform: translate(-50%,-50%);
    width:100%;
    text-align: center;
}
#myname {
    font-size: 50px;
    font-weight: 600;
}
#myText p{
    font-weight: bold;
}
#middletext{
    color: darkblue;
}
``` 
### index.html

``` html

<!DOCTYPE html>
<html lang="en">
<head>
    ... 

    <script src="public/js/aboutMe.js"></script>

</head>
<body>
  ... 
    <div id="aboutMe"></div>

</body>
</html>

```

### 결과파일 
![image](https://user-images.githubusercontent.com/60457431/211126325-b1e04c11-94e9-47a3-b213-8363f51d6228.png)
