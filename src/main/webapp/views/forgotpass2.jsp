<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/login.css">
    <title>Quên mật khẩu</title>
</head>

<body>
<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="row border rounded-5 p-3 bg-white shadow box-area">
        <div class="col-md-4 rounded-4 d-flex justify-content-center align-items-center flex-column left-box"
             style="background: linear-gradient(45deg, #858383, #abbaab);">
            <div class="featured-image mb-3">
                <img src="/img/1.png" class="img-fluid" style="width: 250px;">
            </div>
        </div>
        <div class="col-md-8 right-box">
            <div class="row align-items-center">
                <div class="header-text mb-4">
                    <h2>Nhập OTP</h2>
                </div>
                <form action="/shop/forgotpass3" method="post">
                    <h6 class=" text-danger">${error}</h6>
                    <div class="input-group">
                        <input type="text" class="form-control-lg fs-6 input" placeholder=" " name="otpEmail" required>
                        <label for="" class="label">OTP</label>
                    </div>
                    <input type="hidden" name="emailUser" value="${email}" />
                    <div class="input-group">
                        <button class="btn btn-lg btn-primary w-100 fs-6" type="submit">Xác nhận OTP</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

</html>
