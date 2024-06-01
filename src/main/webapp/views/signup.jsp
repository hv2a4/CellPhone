<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/login.css">
    <title>Sign Up |</title>
    <style>
    span{
  color: red;
}
    </style>
</head>

<body>
   <form id="form" action="">
        <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="row border rounded-5 p-3 bg-white shadow box-area">
            <div class="row mb-3">
                <div class="col-md-12 rounded-4 d-flex justify-content-center align-items-center flex-column left-box"
                    style="background: linear-gradient(45deg, #858383, #abbaab);">
                    <div class="featured-image mb-3">
                        <img src="/img/1.png" class="img-fluid" style="width: 250px;">
                    </div>
                </div>
            </div>
            <div class="header-text text-center">
                <h2>Đăng ký</h2>
            </div>
            <div class="col-md-6 right-box pt-0">
                <div class="row align-items-center">
                <div class="input-group">
                        <input id="userName" type="text" class="form-control-lg fs-6 input" placeholder=" ">
                        <label class="label">Tài khoản</label>
                         <span class="mt-2"></span>
                    </div>
                    
                    <div class="input-group">
                        <input id="fullName" type="text" class=" form-control-lg fs-6 input"  placeholder=" ">
                        <label class="label" for="full-name">Họ tên</label>
                        <span class="mt-2"></span>
                    </div>
                    <div class="input-group">
                        <input id="email" type="text" class="form-control-lg fs-6 input" placeholder=" ">
                        <label class="label">Email</label>
                         <span class="mt-2"></span>
                    </div>
                </div>
            </div>
            <div class="col-md-6 right-box pt-0">
                <div class="row align-items-center">
                    <!-- <div class="header-text mb-4">
                        <h2>Create Account</h2>
                        <p>Welcome back! We're happy to have you.</p>
                    </div> -->
                    <div class="input-group">
                        <input id="phoneNumber" type="text" class="form-control-lg fs-6 input" placeholder=" ">
                        <label class="label">Số điện thoại</label>
                         <span class="mt-2"></span>
                    </div>
                    <div class="input-group">
                        <input id="password" type="password" class="form-control-lg fs-6 input" placeholder=" ">
                        <label class="label">Mật khẩu</label>
                         <span class="mt-2"></span>
                    </div>
                    <div class="input-group">
                        <input id="renterPassWord" type="password" class=" form-control-lg fs-6 input" placeholder=" ">
                        <label class="label">Nhập lại</label>
                         <span class="mt-2"></span>
                    </div>
                </div>
            </div>
            <hr>
            <div class="input-group" style="margin-top: 5px;">
                <button class="btn btn-lg btn-primary w-100 fs-6 mb-2" >Đăng ký</button>
            </div>	
        </div>
        
    </div>
   </form>
    <script>
           let userName=document.getElementById('userName');
           let fullName=document.getElementById('fullName');
           let email=document.getElementById('email');
           let phoneNumber=document.getElementById('phoneNumber');
           let passWord=document.getElementById('password');
           let renterPassWord=document.getElementById('renterPassWord');
           
           function checkNumber(){
            let numberPhoneRegex = /^(032|033|034|035|036|037|038|039|096|097|098|086|083|084|085|081|082|088|091|094|070|079|077|076|078|090|093|089|056|058|092|059|099)[0-9]{7}$/;
         
            if(phoneNumber.value.trim()===""){
           phoneNumber.style.border="1px solid red";
           phoneNumber.parentElement.querySelector('span').textContent="không được đẻ trống";
           }else if(!numberPhoneRegex.test(phoneNumber.value.trim())){
            phoneNumber.style.border="1px solid red";
            phoneNumber.parentElement.querySelector('span').textContent="Số điện thoại không đúng";
           }else{
            phoneNumber.style.border="1px solid black";
            phoneNumber.parentElement.querySelector('span').textContent="";
           }
          }
          function checkUserName(){
            if(userName.value.trim()===""){
              userName.style.border="1px solid red";
              userName.parentElement.querySelector('span').textContent="không được đẻ trống";
            }else if(userName.value.length<=5){
              userName.style.border="1px solid red";
              userName.parentElement.querySelector('span').textContent="không được dưới 5 kí tự";
            }else{
              userName.style.border="1px solid black";
              userName.parentElement.querySelector('span').textContent="";
            }
          }
          function checkFullName(){
             if(fullName.value.trim()===""){
              fullName.style.border="1px solid red";
              fullName.parentElement.querySelector('span').textContent="không được đẻ trống"; 
             }else{
              fullName.style.border="1px solid black";
              fullName.parentElement.querySelector('span').textContent="";
             }
          }
          function checkEmail(){
            let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if(email.value.trim()===""){
              email.style.border="1px solid red";
              email.parentElement.querySelector('span').textContent="không được đẻ trống"; 
            }else if(!emailPattern.test(email.value.trim())){
              email.style.border="1px solid red";
              email.parentElement.querySelector('span').textContent="không đúng định dạng"; 
            }else{
              email.style.border="1px solid black";
              email.parentElement.querySelector('span').textContent=""; 
            }
          }
          function checkPassWord(){
           if(passWord.value.trim()===""){
              passWord.style.border="1px solid red";
              passWord.parentElement.querySelector('span').textContent="không được đẻ trống"; 
           }else{
              passWord.style.border="1px solid black";
              passWord.parentElement.querySelector('span').textContent=""; 
           }
          }
          function checkRenterPassWord(){
            if(renterPassWord.value.trim()===""){
              renterPassWord.style.border="1px solid red";
              renterPassWord.parentElement.querySelector('span').textContent="không được đẻ trống";
           }else if(renterPassWord.value.trim() != passWord.value.trim()){
              renterPassWord.style.border="1px solid red";
              renterPassWord.parentElement.querySelector('span').textContent="Mật khẩu nhập lại không trùng";
           }else{
            renterPassWord.style.border="1px solid black";
              renterPassWord.parentElement.querySelector('span').textContent="";
           }
          }
          form.addEventListener('submit',(event)=>{
           event.preventDefault();
           checkUserName();
           checkFullName();
           checkEmail();
          checkNumber();
          checkPassWord();
         checkRenterPassWord();
});
        </script>
</body>
</html>