<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/Admin/production/head.jsp"></jsp:include>
<head>
<style>
.avatar-rounded {
	height: 300px;
	width: 300px;
	border-radius: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="mt-4">Profile</h2>
		<div class="row mt-4">
			<div class="row mt-4">
				<div class="col-md-12 text-center">
					<div class="d-flex flex-column align-items-center">
						<img id="avatar" src="/Admin/production/images/prod-3.jpg"
							class="img-fluid img-thumbnail avatar-rounded" alt="Avatar">
						<div class="mt-2">
							<input type="file" class="form-control"
								style="width: 86px; margin-left: auto; margin-right: auto;">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<table class="table">
				<tr>
					<th>Tài khoản:</th>
					<td>username</td>
				</tr>
				<tr>
					<th>Tên:</th>
					<td>
						<input value="Nguyễn Văn A" class="form-control">
					</td>
				</tr>
				<tr>
					<th>Email:</th>
					<td>
						<input value="a@gmail.com" class="form-control">
					</td>
				</tr>
				<tr>
					<th>Số điện thoại:</th>
					<td>
						<input value="0987654321" class="form-control">
					</td>
				</tr>
				<tr>
					<th>Quyền:</th>
					<td>User</td>
				</tr>
				<tr>
					<th>Ngày tạo:</th>
					<td>21/05/2024</td>
				</tr>
				<tr>
					<th>Ngày cập nhật gần nhất:</th>
					<td>22/05/2024</td>
				</tr>
			</table>
			<div>
			<button class="btn btn-primary d-inline float-right">Cập nhật</button>
			</div>
		</div>
	</div>
</body>
</html>