<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/login.css">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <title>Sign Up |</title>
    <style>
    span{
  color: red;
}
    </style>
    
</head>

<body>
    
    
     <form:form id="signupForm" action="/shop/register"  method="post" modelAttribute="item" enctype="multipart/form-data">
     
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
                       <form:input path="USERNAME" class=" form-control-lg fs-6 input"  placeholder=" " />
                        <label class="label">Tài khoản</label>
                         <span class="mt-2"><form:errors path="USERNAME"></form:errors>${messages}</span>
                    </div>
                    
                    <div class="input-group">
                        
                        <form:input id="fullName" path="FULLNAME" class=" form-control-lg fs-6 input"  placeholder=" " />
                        <label class="label" for="full-name">Họ tên</label>
                        <span class="mt-2"><form:errors path="FULLNAME"></form:errors></span>
                    </div>
                    <div class="input-group">
                         <form:input id="email" path="EMAIL" class=" form-control-lg fs-6 input"  placeholder=" " />
                        <label class="label">Email</label>
                         <span class="mt-2"><form:errors path="EMAIL"></form:errors>${messageEmail}</span>
                    </div>
                   <div class=" form-check mt-3">
    <div class="g-recaptcha" data-sitekey="6Ldic9opAAAAANQLYMn3UmCMdmET4chfi2qvRnkc"></div>
         <span>${name}</span>
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
                        <form:input id="phoneNumber" path="PHONE_NUMBER" class=" form-control-lg fs-6 input"  placeholder=" " />
                        <label class="label">Số điện thoại</label>
                         <span class="mt-2"><form:errors path="PHONE_NUMBER"></form:errors>${messageNumberPhone}</span>
                    </div>
                    <div class="input-group">
                         <form:input id="password" path="PASSWORD" type="password" class=" form-control-lg fs-6 input"  placeholder=" " />
                        <label class="label">Mật khẩu</label>
                         <span class="mt-2"><form:errors path="PASSWORD"></form:errors></span>
                    </div>
                    <div class="input-group">
                        <form:input path="" id="password" name="renterPassWord" type="password" class=" form-control-lg fs-6 input" placeholder=" "/>
                        <label class="label">Nhập lại</label>
                         <span class="mt-2">${message}</span>
                    </div>
                     <form:hidden path="rank.ID" />
                     
                </div>
            </div>
            <hr>
            <div class="input-group" style="margin-top: 5px;">
                <button id="submitBtn" class="btn btn-lg btn-primary w-100 fs-6 mb-2" >Đăng ký</button>
            </div>
        
            	
            
            
        </div>
         <form:hidden path="ROLE" value="false"/>
              <small style=" color: red;"><form:errors path="ROLE"></form:errors></small>
               <form:hidden path="GENDER" value="NAM"/>
              <small style=" color: red;"><form:errors path="GENDER"></form:errors></small>
    </div>
         
     </form:form>
     
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<c:if test="${registrationSuccess}">
     <script>
     Swal.fire({
         icon: 'success',
         title: 'Đăng Ký Thành Công',
         showConfirmButton: false,
         timer: 1500
     });
     
     setTimeout(function() {
    	 window.location.href = "/shop/login"; 
     }, 1800);
    // Thay đổi "/shop/login" thành URL của trang đăng nhập của bạn
    </script>
    </c:if>
   
        
    
</body>
</html>