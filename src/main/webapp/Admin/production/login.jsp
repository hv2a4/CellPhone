<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="/Admin/production/css/login.css">
<title>Login |</title>
</head>
<body>
	<div
		class="container d-flex justify-content-center align-items-center min-vh-100">
		<div class="row border rounded-5 p-3 bg-white shadow box-area">
			<div
				class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box"
				style="background: linear-gradient(45deg, #858383, #abbaab);">
				<div class="featured-image mb-3">
					<img src="/Admin/production/images/1.png" class="img-fluid"
						style="width: 250px;">
				</div>
				<p class="text-white fs-2"
					style="font-family: 'Courier New', Courier, monospace; font-weight: 600;">Get
					Verified</p>
				<small class="text-white text-wrap text-center"
					style="width: 17rem; font-family: 'Courier New', Courier, monospace;">Join
					our community of watch enthusiasts and collectors.</small>
			</div>
			<div class="col-md-6 right-box">
				<div class="row align-items-center">
					<div class="header-text mb-4">
						<h2>Hello,Again</h2>
						<p>We are happy to have you back.</p>
					</div>
					<div class="input-group">
						<input type="text" class=" form-control-lg fs-6 input"
							placeholder=" "> <label for="" class="label">User
							name</label>
					</div>
					<div class="input-group">
						<input type="password" class="form-control-lg fs-6 input"
							placeholder=" "> <label for="" class="label">Password</label>
					</div>
					<div class="input-group mb-2 d-flex justify-content-between">
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="formCheck">
							<label for="formCheck" class="form-check-label text-secondary"><small>Remember
									Me</small></label>
						</div>
						<div class="forgot">
							<small><a href="#">Forgot Password?</a></small>
						</div>
					</div>
					<div class="input-group">
						<button class="btn btn-lg btn-primary w-100 fs-6">Login</button>
					</div>
					<div class="input-group mb-3">
						<button class="btn btn-lg btn-light w-100 fs-6">
							<img src="/Admin/production/images/google.png"
								style="width: 20px" class="me-2"><small>Sign In
								with Google</small>
						</button>
					</div>
					<div class="row">
						<small>Don't have account? <a href="#">Sign Up</a></small>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>