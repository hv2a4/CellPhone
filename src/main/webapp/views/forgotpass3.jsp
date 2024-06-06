<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/login.css">
    <title>Đổi mật khẩu</title>
</head>

<body>
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
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">
                            ${error}
                    </div>
                </c:if>
                <form method="post" action="/shop/changePassword">
                    <input type="hidden" name="emailUser" value="${email}">
                    <input type="hidden" name="otpEmail" value="${otp}">
                    <div class="input-group">
                        <input type="password" class="form-control-lg fs-6 input"
                               placeholder=" " name="password" required>
                        <label for="" class="label">Mật khẩu mới</label>
                    </div>
                    <div class="input-group">
                        <input type="password" class="form-control-lg fs-6 input"
                               placeholder=" " name="config_password" required>
                        <label for="" class="label">Xác nhận mật khẩu mới</label>
                    </div>
                    <div class="input-group">
                        <button class="btn btn-lg btn-primary w-100 fs-6">Đổi mật khẩu</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
