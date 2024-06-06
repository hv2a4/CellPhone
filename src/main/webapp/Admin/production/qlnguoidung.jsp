<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<body>

<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Danh sách</h2>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary float-end mr-3 px-5"
                        data-bs-toggle="modal" data-bs-target="#them">Thêm
                </button>
                <!-- Modal -->
                <div class="modal fade " id="them" tabindex="-1"
                     aria-labelledby="themLabel" aria-hidden="true">
                    <div class="modal-dialog  modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="themLabel">Thêm</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <%--@elvariable id="userItem" type="ch"--%>
                                <form:form action="/admin/user" modelAttribute="userItem" method="post"
                                           onsubmit="return validateForm()"
                                           class="form-horizontal form-label-left" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <!-- Username -->
                                            <div class="form-group ">
                                                <label class="control-label">Tài khoản</label>
                                                <form:input path="USERNAME" id="USERNAME" class="form-control"
                                                            placeholder=""/>
                                                <div id="usernameError" style="color: red;"></div>
                                            </div>

                                            <!-- Phone -->
                                            <div class="form-group ">
                                                <label class="control-label">Số điện thoại</label>
                                                <form:input path="PHONE_NUMBER" id="PHONE_NUMBER" class="form-control"
                                                            placeholder=""/>
                                                <div id="phoneError" style="color: red;"></div>
                                            </div>
                                            <!-- Password -->
                                            <div class="form-group ">
                                                <label class="control-label">Mật khẩu</label>
                                                <form:password path="PASSWORD" id="password" class="form-control"
                                                               placeholder=""/>
                                                <div id="passwordEmtypt" style="color: red;"></div>
                                            </div>
                                            <!-- Confirm Password -->
                                            <div class="form-group ">
                                                <label class="control-label">Nhập lại</label>
                                                <input type="password" class="form-control" id="confirmPassword"
                                                       placeholder="" name="config-password">
                                                <div id="passwordError" style="color: red;"></div>
                                            </div>


                                            <!-- Giới tính -->
                                            <div class="form-group mb-3">
                                                <label class="control-label">Giới tính</label>
                                                <div class="ms-4 d-flex justify-content-between">
                                                    <form:radiobuttons path="GENDER" id="gender" items="${gender}"
                                                                       cssClass="form-check-input "
                                                                       elementCssClass="form-check form-check-inline"/>
                                                </div>
                                                <div id="genderError" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <!-- Họ và tên -->
                                            <div class="form-group ">
                                                <label class="control-label">Họ và tên</label>
                                                <form:input path="FULLNAME" id="FULLNAME" class="form-control"
                                                            placeholder=""/>
                                                <div id="fullnameError" style="color: red;"></div>
                                            </div>
                                            <!-- Email -->
                                            <div class="form-group ">
                                                <label class="control-label">Email</label>
                                                <form:input path="EMAIL" id="EMAIL" class="form-control"/>
                                                <div id="emailError" style="color: red;"></div>
                                            </div>
                                            <!-- Bậc-->
                                            <div class="form-group">
                                                <label class="control-label">Bậc</label>
                                                <form:select path="rank.ID" id="rank" class="form-control">
                                                    <form:option value="">Chọn bậc</form:option>
                                                    <form:options items="${fillRank}" />
                                                </form:select>
                                                <div id="rankError" style="color: red;"></div>
                                            </div>

                                            <!-- Hình ảnh -->
                                            <div class="form-group">
                                                <label class="control-label">Hình ảnh</label>
                                                <input type="file" class="form-control" aria-label="file example"
                                                       name="photo_file" id="AVATAR">
                                                <input name="AVATAR" type="hidden"/>
                                                <div id="avatarError" style="color: red;"></div>
                                            </div>
                                            <!-- Vai trò -->
                                            <div class="form-group">
                                                <label class="control-label">Vai trò</label>
                                                <form:select path="ROLE" id="ROLE" class="form-control">
                                                    <form:option value="">Chọn vai trò</form:option>
                                                    <form:options items="${fillRole}"/>
                                                </form:select>
                                                <div id="roleError" style="color: red;"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                        </button>
                                        <button class="btn btn-primary" formaction="/admin/create-admin" type="submit">
                                            Create
                                        </button>
                                    </div>
                                </form:form>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <table id="datatable-responsive"
                                   class="table table-striped table-bordered dt-responsive nowrap"
                                   cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Tên</th>
                                    <th>Tài khoản</th>
                                    <th>Email</th>
                                    <th>Số điện thoại</th>
                                    <th>Trạng thái</th>
                                    <th>Hoạt động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${fillTableUser}" varStatus="stt">
                                    <tr>
                                        <td data-bs-toggle="modal"
                                            data-bs-target="#exampleModal_${stt.index + 1}">${stt.index + 1}</td>
                                        <td data-bs-toggle="modal"
                                            data-bs-target="#exampleModal_${stt.index + 1}">${item.FULLNAME}</td>
                                        <td>${item.USERNAME}</td>
                                        <td>${item.EMAIL}</td>
                                        <td>${item.PHONE_NUMBER}</td>
                                        <td>${item.STATUS ? "Hoạt động" : "Đã khóa"}</td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${!item.ROLE && item.STATUS}">
                                                    <a class="btn btn-success" style="width: 100px"
                                                       href="/admin/authorize/${item.USERNAME}">Cấp quyền
                                                    </a>
                                                </c:when>
                                                <c:when test="${!item.STATUS}">
                                                    <a class="btn btn-warning" style="width: 100px"
                                                       href="/admin/unlock/${item.USERNAME}">Mở khóa
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <button class="btn btn-primary" style="width: 100px"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#exampleModal_${stt.index + 1}">Chi tiết
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                    </tr>
                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModal_${stt.index + 1}" tabindex="-1"
                                         aria-labelledby="exampleModalLabel_${stt.index + 1}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5 fw-bold"
                                                        id="exampleModalLabel_${stt.index + 1}">Chi tiết</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <h2>Tên: ${item.FULLNAME}</h2>
                                                    <h2>Ảnh: ${item.AVATAR}</h2>
                                                    <h2>Tài khoản: ${item.USERNAME}</h2>
                                                    <h2>Email: ${item.EMAIL}</h2>
                                                    <h2>Số điện thoại: ${item.PHONE_NUMBER}</h2>
                                                    <c:choose>
                                                        <c:when test="${item.GENDER == 'NAM'}">
                                                            <h2>Giới tính: Nam</h2>
                                                        </c:when>
                                                        <c:when test="${item.GENDER == 'NU'}">
                                                            <h2>Giới tính: Nữ</h2>
                                                        </c:when>
                                                        <c:when test="${item.GENDER == 'KHAC'}">
                                                            <h2>Giới tính: Khác</h2>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <h2>Giới tính: Không xác định</h2>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <h2>Bậc: ${item.rank.NAME}</h2>
                                                    <h2>Quyền: ${item.ROLE ? "Admin":"User"}</h2>
                                                    <h2>Ngày tạo: ${item.CREATE_AT}</h2>
                                                    <h2>Ngày cập nhật: <fmt:formatDate value="${item.UPDATE_AT}"
                                                                                       pattern="yyyy-MM-dd"/></h2>
                                                    <h2>Trạng thái: ${item.STATUS ? "Hoạt động": "Đã khóa"}</h2>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-primary"
                                                            data-bs-dismiss="modal">Close
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function validatePassword() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var errorDiv = document.getElementById("passwordError");
        var passwordEmtypt = document.getElementById("passwordEmtypt");
        var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;

        // Reset errors
        errorDiv.innerText = "";
        passwordEmtypt.innerText = "";

        if (password.trim() === "") {
            passwordEmtypt.innerText = "Mật khẩu không được bỏ trống";
            return false;
        }

        if (!passwordPattern.test(password)) {
            passwordEmtypt.innerText = "Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường và chữ số";
            return false;
        }

        if (confirmPassword !== password) {
            errorDiv.innerText = "Mật khẩu xác nhận không khớp";
            return false;
        }

        // If all validations pass
        return true;
    }

    function validateForm() {
        var isValid = true;

        // Validate Username
        var username = document.getElementById("USERNAME").value;
        var usernameError = document.getElementById("usernameError");
        if (username.trim() === "") {
            usernameError.innerText = "Tên người dùng không được trống";
            isValid = false;
        } else {
            usernameError.innerText = "";
        }

        // Validate Fullname
        var fullname = document.getElementById("FULLNAME").value;
        var fullnameError = document.getElementById("fullnameError");
        if (fullname.trim() === "") {
            fullnameError.innerText = "Họ và tên không được trống";
            isValid = false;
        } else {
            fullnameError.innerText = "";
        }

        // Validate Email
        var email = document.getElementById("EMAIL").value;
        var emailError = document.getElementById("emailError");
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email.trim() === "" || !emailPattern.test(email)) {
            emailError.innerText = "Email không hợp lệ";
            isValid = false;
        } else {
            emailError.innerText = "";
        }

        // Validate Phone Number
        var phoneNumber = document.getElementById("PHONE_NUMBER").value;
        var phoneError = document.getElementById("phoneError");
        var phonePattern = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[1-9]|9[0-9])[0-9]{7}$/;
        if (phoneNumber.trim() === "" || !phonePattern.test(phoneNumber)) {
            phoneError.innerText = "Số điện thoại không hợp lệ";
            isValid = false;
        } else {
            phoneError.innerText = "";
        }

        // Validate Role
        var role = document.getElementById("ROLE").value;
        var roleError = document.getElementById("roleError");
        if (role.trim() === "") {
            roleError.innerText = "Vai trò không được trống";
            isValid = false;
        } else {
            roleError.innerText = "";
        }
        //Validate rank
        var rank = document.getElementById("rank").value;
        var rankError = document.getElementById("rankError");
        if (rank.trim() === "") {
            rankError.innerText = "Bậc không được bỏ trống";
            isValid = false;
        } else {
            rankError.innerText = "";
        }
        // Validate Avatar
        var avatar = document.getElementById("AVATAR").value;
        var avatarError = document.getElementById("avatarError");
        if (avatar.trim() === "") {
            avatarError.innerText = "Hình ảnh không được trống";
            isValid = false;
        } else {
            avatarError.innerText = "";
        }

        // Validate Gender
        var genderError = document.getElementById("genderError");
        var genders = document.getElementsByName("GENDER");
        var genderSelected = false;
        for (var i = 0; i < genders.length; i++) {
            if (genders[i].checked) {
                genderSelected = true;
                break;
            }
        }
        if (!genderSelected) {
            genderError.innerText = "Vui lòng chọn giới tính";
            isValid = false;
        } else {
            genderError.innerText = "";
        }

        // Validate Password
        if (!validatePassword()) {
            isValid = false;
        }

        return isValid;
    }
</script>
</body>
</html>