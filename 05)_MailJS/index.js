function SendMail(){
    var params = {
        form_name : document.getElementById("fullName").value,
        email_id : document.getElementById("email_id").value,
        message : document.getElementById("message").value
    }
    emailjs.send("service_xown5ck", "template_7w7kpwi", params).then(function (res){
        console.log("Success !" + res.status);
    })
}