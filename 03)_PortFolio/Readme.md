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


### 화면 
![image](https://user-images.githubusercontent.com/60457431/210572470-74a9e5b5-201c-47ea-9156-4ef93340ac11.png)
