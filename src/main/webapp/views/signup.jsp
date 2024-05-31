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
</head>

<body>
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
                        <input type="text" class=" form-control-lg fs-6 input" id="full-name" required placeholder=" ">
                        <label class="label" for="full-name">Họ tên</label>
                    </div>
                    <div class="input-group">
                        <input type="text" class="form-control-lg fs-6 input" placeholder=" ">
                        <label class="label">Tài khoản</label>
                    </div>
                    <div class="input-group">
                        <input type="text" class="form-control-lg fs-6 input" placeholder=" ">
                        <label class="label">Email</label>
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
                        <input type="text" class="form-control-lg fs-6 input" placeholder=" ">
                        <label class="label">Số điện thoại</label>
                    </div>
                    <div class="input-group">
                        <input type="password" class="form-control-lg fs-6 input" placeholder=" ">
                        <label class="label">Mật khẩu</label>
                    </div>
                    <div class="input-group">
                        <input type="password" class=" form-control-lg fs-6 input" placeholder=" ">
                        <label class="label">Nhập lại</label>
                    </div>
                </div>
            </div>
            <hr>
            <div class="input-group" style="margin-top: 5px;">
                <button class="btn btn-lg btn-primary w-100 fs-6 mb-2" >Đăng ký</button>
            </div>	
        </div>
        
    </div>
</body>
</html>