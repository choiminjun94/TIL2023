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

### 금일 공부한 CSS 정리

``` js

position : 요소에 사용되는 위치 지정 방법의 유형
    static : 정적, top, bottom, left 및 right 속성의 영향을 받지 않습니다
    relative : 상대적으로 배치된 요소의 위쪽, 오른쪽, 아래쪽 및 왼쪽 속성을 설정하면 원래 위치에서 벗어나 조정 
    fixed : 페이지가 스크롤되더라도 항상 같은 위치에 유지됩니다. 위쪽, 오른쪽, 아래쪽 및 왼쪽 속성은 요소를 배치하는 데 사용됩니다.
    absolute :  가까운 위치에 있는 조상을 기준으로 위치가 지정 절대 위치 지정 요소에 위치 지정 조상이 없으면 문서 본문을 사용하고 페이지 스크롤과 함께 이동합니다

padding :  요소의 네 방향 안쪽 여백 영역을 설정

margin : 요소의 네 방향 바깥 여백 영역을 설정

overflow : 요소의 박스에 내용이 더 길 때 어떻게 보일지 선택하는 속성입니다.
    visible: 기본값으로 내용이 더 길어도 그대로 보입니다. 
    hidden : 내용이 넘치면 자릅니다. 자른 부분은 보이지 않습니다.
    scroll : 내용이 넘치지 않아도 항상 스크롤바가 보입니다.
    auto : 내용이 잘릴 때만 스크롤바가 보입니다.

```

### 화면 
![image](https://user-images.githubusercontent.com/60457431/210572470-74a9e5b5-201c-47ea-9156-4ef93340ac11.png)

### 2023.01.05

> 기존 폰트 구글 폰트로 수정
