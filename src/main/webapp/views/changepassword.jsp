<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/login.css">
        <style>
    span{
  color: red;
}
    </style>
</head>
<body>
  <form id="form"  action="/shop/changepass"  method="post" >
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
                        <h2>Đổi mật khẩu</h2>
                    </div>
                    <div class="input-group">
                        <input type="text" class=" form-control-lg fs-6 input"
                            placeholder=" " name="userName"  value ="${list.USERNAME}" readonly>
                        <label for="" class="label">Tài khoản</label>
                    </div>
                    <div class="input-group">
                        <input name="password" type="password" class="form-control-lg fs-6 input"
                            placeholder=" ">
                        <label for="" class="label">Mật khẩu hiện tại</label>
                    </div>
                    <span class="mt-2">${message1}</span>
                    <div class="input-group">
                          <input name="newPassword" type="password" class="form-control-lg fs-6 input"
                            placeholder=" ">
                        <label for="" class="label">Mật khẩu mới</label>
                    </div>
                    <span class="mt-2">${message2}</span>
                    <div class="input-group">
                        <input name="reterNewPassword" type="password" class="form-control-lg fs-6 input"
                            placeholder=" ">
                        <label for="" class="label">Xác nhận</label>
                    </div>
                    <span class="mt-2">${message3}</span>
                    <div class="input-group d-flex justify-content-between">
                        <div class="forgot">
                            <small><a href="/shop/forgotpass1">Forgot Password?</a></small>
                        </div>
                        <div class="forgot">
                            <small><a href="/shop">Quay lại trang chủ</a></small>
                        </div>
                    </div>
                    <div class="input-group">
                        <button class="btn btn-lg btn-primary w-100 fs-6" >Đổi mật khẩu</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </form>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<c:if test="${formSubmitted}">
     <script>
     Swal.fire({
         icon: 'success',
         title: 'Cập Nhật Thành Công',
         showConfirmButton: false,
         timer: 1500
     });
     setTimeout(function() {
    	 window.location.href = "/shop/login"; 
     }, 2200);
   
    // Thay đổi "/shop/login" thành URL của trang đăng nhập của bạn
    setTimeout(function() {
        window.location.href = "/shop/login"; // Chuyển hướng đến trang đăng nhập
    }, 1500);
    </script>
    </c:if>
</body>
</html>