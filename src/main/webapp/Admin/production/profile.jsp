<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<form:form id="uploadForm" method="post"  modelAttribute="item" name="UserProfile"
                             class="form mt-5"
                            action="/admin/profile"   enctype="multipart/form-data">
		<h2 class="mt-4">Profile</h2>
		<div class="row mt-4">
			<div class="row mt-4">
				<div class="col-md-12 text-center">
					<div class="d-flex flex-column align-items-center">
						<img id="imagePreview" src="/images-user/${list.AVATAR}"
							class="img-fluid img-thumbnail avatar-rounded" alt="Avatar">
						<div class="mt-2">
							<input  id="imageUpload" type="file" class="form-control"
							name="photo_file" 	style="width: 86px; margin-left: auto; margin-right: auto;">
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
						 <form:input path="FULLNAME" class="input form-control" value="${list.FULLNAME}" placeholder=" "  />
                         <small style=" color: red;"><form:errors path="FULLNAME"></form:errors></small>  
					</td>
				</tr>
				<tr>
					<th>Email:</th>
					<td>
						 <form:input path="EMAIL" class="input form-control" value="${list.EMAIL}" placeholder=" "  />
                         <small style=" color: red;"><form:errors path="EMAIL"></form:errors></small> 
					</td>
				</tr>
				<tr>
					<th>Số điện thoại:</th>
					<td>
						    <form:input path="PHONE_NUMBER" class="input form-control" value="${list.PHONE_NUMBER}" placeholder=" "  />
                            <small style=" color: red;"><form:errors path="PHONE_NUMBER"></form:errors></small>
					</td>
				</tr>
				<tr>
					<th>Quyền:</th>
					<td>${list.ROLE==true?'Admin':'user'}</td>
				</tr>
				<tr>
					<th>Ngày tạo:</th>
					<td><fmt:formatDate value="${list.CREATE_AT}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<th>Ngày cập nhật gần nhất:</th>
					<td><fmt:formatDate value="${list.CREATE_AT}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</table>
			 <form:hidden path="PASSWORD" value="${list.PASSWORD}"/>
              <small style=" color: red;"><form:errors path="PASSWORD"></form:errors></small>
               <form:hidden path="ROLE" value="${list.ROLE}"/>
              <small style=" color: red;"><form:errors path="ROLE"></form:errors></small>
               <form:hidden path="GENDER" value="${list.GENDER}"/>
              <small style=" color: red;"><form:errors path="GENDER"></form:errors></small>
               <form:hidden path="USERNAME" value="${list.USERNAME}"/>
              <small style=" color: red;"><form:errors path="USERNAME"></form:errors></small>
			<div>
			<button class="btn btn-primary d-inline float-right">Cập nhật</button>
			</div>
		</div>
		</form:form>
	</div>
	<script src="/js/imgUpload.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
       <script>
        document.getElementById('uploadForm').addEventListener('submit', function(event) {
            var imageUpload = document.getElementById('imageUpload');
            if (imageUpload.files.length === 0) {
                event.preventDefault(); // Ngăn chặn form submit
                Swal.fire({
                    icon: 'warning',
                    title: 'Vui lòng chọn ảnh để cập nhật',
                    showConfirmButton: false,
                    timer: 1500
                });
                
                
            }
        });
    </script>
	<c:if test="${profileAdminSuccess}">
     <script>
     Swal.fire({
         icon: 'success',
         title: 'Cập Nhật Thành Công',
         showConfirmButton: false,
         timer: 1500
     });
     
    
    // Thay đổi "/shop/login" thành URL của trang đăng nhập của bạn
    </script>
    </c:if>
</body>
</html>