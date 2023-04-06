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
