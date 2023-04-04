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
