<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Login |</title>
</head>

<body>
<form action="/shop/login" method="post">
<div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="row border rounded-5 p-3 bg-white shadow box-area">
            <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box"
                style="background: linear-gradient(45deg, #858383, #abbaab);">
                <div class="featured-image mb-3">
                    <img src="/img/1.png" class="img-fluid" style="width: 250px;">
                </div>
               </div>
            <div class="col-md-6 right-box">
                <div class="row align-items-center">
                    <div class="header-text mb-4">
                        <h2>Đăng nhập</h2>
                        
                    </div>
                    <div class="input-group">
                        <input name="userName" type="text" class=" form-control-lg fs-6 input"
                            placeholder=" "  value="${userCookie != null ? userCookie : ''}">
                        <label for="" class="label">Tài khoản</label>
                    </div>
                    <div class="input-group">
                        <input name="password" type="password" class="form-control-lg fs-6 input"
                            placeholder=" ">
                        <label for="" class="label">Mật khẩu</label>
                    </div>
                    <div class="input-group mb-2 d-flex justify-content-between">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="formCheck" name="rememberMe">
                            <label for="formCheck" class="form-check-label text-secondary"><small>Nhớ tôi</small></label>
                        </div>
                        <div class="forgot">
                            <small><a href="/shop/forgotpass1">Quên mật khẩu?</a></small>
                        </div>
                    </div>
                    <div class="input-group">
                        <button class="btn btn-lg btn-primary w-100 fs-6" >Đăng nhập</button>
                    </div>
                    <div class="input-group mb-3">
                    </div>
                    <div class="row">
                    
                        <small>Chưa có tài khoản? <a href="/shop/register">Đăng ký</a></small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <c:choose>
      <c:when test="${message}">
           <script>
           Swal.fire({
               icon: 'error',
               title: 'Đăng Nhập Thất Bại',
               showConfirmButton: false,
               timer: 800
           });
           
           setTimeout(function() {
          	 window.location.href = "/shop/login"; 
           }, 1000);
           </script>
         
      </c:when>
      <c:when test="${messages}">
       <script>
           Swal.fire({
               icon: 'error',
               title: 'Tài khoản không còn hoạt động',
               showConfirmButton: false,
               timer: 800
           });
           
           setTimeout(function() {
          	 window.location.href = "/shop/login"; 
           }, 1000);
           </script>
      </c:when>
      <c:when test="${messagesCheck}">
       <script>
           Swal.fire({
               icon: 'success',
               title: 'Đăng Nhập Thành Công',
               showConfirmButton: false,
               timer: 800
           });
           
           setTimeout(function() {
          	 window.location.href = "/shop"; 
           }, 1000);
           </script>
      </c:when>
      <c:when test="${messagesCheckRole}">
       <script>
           Swal.fire({
               icon: 'success',
               title: 'Đăng Nhập Thành Công',
               showConfirmButton: false,
               timer: 800
           });
           
           setTimeout(function() {
          	 window.location.href = "/admin"; 
           }, 1000);
           </script>
      </c:when>
    </c:choose>
</body>
</html>