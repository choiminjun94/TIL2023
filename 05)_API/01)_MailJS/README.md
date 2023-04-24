# 04.16

## Mail JS 사용하기 

## 01. EmailJS HomePage 가입 및 테스트 메일 발송

### 01. 사이트 가입
URL : https://www.emailjs.com/ 
> 입력 사항
>> 01. 이름<br>
>> 02. 이메일<br> 
>> 03. 비밀번호<br>
>> 04. 로봇 인증

![1](https://user-images.githubusercontent.com/60457431/233301486-de38bdf1-e861-4209-81d7-3a45a40dd500.png)

### 02. 메일 서버 추가
> add new Server 클릭 → 사용 이메일 선택

![2](https://user-images.githubusercontent.com/60457431/233303581-0904c933-4114-439a-84d5-c9e20900a7ce.png)
![3](https://user-images.githubusercontent.com/60457431/233303932-1a2a9147-d94e-4694-bfd7-e0d5c8879a5b.png)

### 03. 메일 서버 생성 
> Connect Account → Undefined Connect에서 Connected ad '이메일주소'나오는거 확인' → Create Service Click

![4](https://user-images.githubusercontent.com/60457431/233307544-8a920ef2-4caa-4d8e-bb79-9c8b76a4f96c.png)
![5](https://user-images.githubusercontent.com/60457431/233307564-34de524d-53e7-498b-b87c-393a988b4456.png)

### 04. 메일 탬플릿 생성 및 저장
> Email Templates Click → 보내고자 하는 메일 양식 작성 → Save → Test it Click 

![6](https://user-images.githubusercontent.com/60457431/233311657-1fe9c1e0-cbf7-4bcc-baf4-f47c027e1c85.png)
![7](https://user-images.githubusercontent.com/60457431/233311668-fff5049c-2727-41f9-abe0-c608bc356397.png)

### 05. 테스트 메일 작성

![8](https://user-images.githubusercontent.com/60457431/233312369-440b0ae7-7528-4133-8b1c-ce97abb72f5c.png)

### 06. Docs에서 Browser Script 가져오기

URL : https://www.emailjs.com/docs/sdk/installation/

```HTML

<script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
</script>
<script type="text/javascript">
   (function(){
      emailjs.init("YOUR_PUBLIC_KEY");
   })();
</script>

```

### YOUR_PUBLIC_KEY 가져오기

EmailJS 메인 홈페이지 → Account → API Keys

### 07. HTML 작성

```HTML
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="./index.js"></script>
    <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
    </script>
    <script type="text/javascript">
        (function(){
        emailjs.init("YOUR_PUBLIC_KEY");
        })();
    </script>
</head>
<body>
    <div>
        <input type="text" id="from_name" placeholder="Name" required><br/>
        <input type="email" id="email_id" placeholder="Email" required><br/>
        <textarea id="message" placeholder="Message" id="" cols="30" rows="10"></textarea>
        <br/>
        <button onclick="SendMail()">Send</button>
    </div>
</body>
</html>

```

### 08. JS 작성

```JS

function SendMail(){
    var params = {
        from_name : document.getElementById("from_name").value,
        email_id : document.getElementById("email_id").value,
        message : document.getElementById("message").value
    }
    emailjs.send("service_xown5ck", "template_7w7kpwi", params).then(function (res){
        console.log("Success !" + res.status);
    })
}

```


