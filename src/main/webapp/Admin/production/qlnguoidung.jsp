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
                                <form id="userForm" action="/admin/create-admin" method="post"
                                      class="form-horizontal form-label-left" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <!-- Username -->
                                            <div class="form-group">
                                                <label class="control-label">Tài khoản</label>
                                                <input type="text" name="USERNAME" id="USERNAME" class="form-control"
                                                       placeholder=""/>
                                                <div class="text-danger" id="USERNAME_error"></div>
                                            </div>
                                            <!-- Phone -->
                                            <div class="form-group">
                                                <label class="control-label">Số điện thoại</label>
                                                <input type="text" name="PHONE_NUMBER" id="PHONE_NUMBER"
                                                       class="form-control" placeholder=""/>
                                                <div class="text-danger" id="PHONE_NUMBER_error"></div>
                                            </div>
                                            <!-- Password -->
                                            <div class="form-group">
                                                <label class="control-label">Mật khẩu</label>
                                                <input type="password" name="PASSWORD" id="PASSWORD"
                                                       class="form-control" placeholder=""/>
                                                <div class="text-danger" id="PASSWORD_error"></div>
                                            </div>
                                            <!-- Confirm Password -->
                                            <div class="form-group">
                                                <label class="control-label">Nhập lại mật khẩu</label>
                                                <input type="password" class="form-control" id="confirmPassword"
                                                       placeholder="" name="config-password"/>
                                                <div class="text-danger" id="passwordError"></div>
                                            </div>
                                            <!-- Giới tính -->
                                            <div class="form-group mb-3">
                                                <label class="control-label">Giới tính</label>
                                                <div class="ms-4 d-flex justify-content-between">
                                                    <c:forEach items="${gender}" var="genderOption" varStatus="status">
                                                        <label class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="GENDER"
                                                                   value="${genderOption.key}"
                                                                   <c:if test="${genderOption.key == userItem.GENDER}">checked</c:if>>
                                                                ${genderOption.value}
                                                        </label>
                                                    </c:forEach>
                                                </div>
                                                <div class="text-danger" id="GENDER_error"></div>
                                            </div>

                                        </div>
                                        <div class="col-md-6">
                                            <!-- Họ và tên -->
                                            <div class="form-group">
                                                <label class="control-label">Họ và tên</label>
                                                <input type="text" name="FULLNAME" id="FULLNAME" class="form-control"
                                                       placeholder=""/>
                                                <div class="text-danger" id="FULLNAME_error"></div>
                                            </div>
                                            <!-- Email -->
                                            <div class="form-group">
                                                <label class="control-label">Email</label>
                                                <input type="email" name="EMAIL" id="EMAIL" class="form-control"/>
                                                <div class="text-danger" id="EMAIL_error"></div>
                                            </div>
                                            <!-- Bậc -->
                                            <div class="form-group">
                                                <label class="control-label">Bậc</label>
                                                <select name="rank.ID" id="rank" class="form-control">
                                                    <option value="">Chọn bậc</option>
                                                    <c:forEach items="${fillRank}" var="rankOption" varStatus="status">
                                                        <option value="${rankOption.key}" id="rank-validate"
                                                                <c:if test="${rankOption.key == userItem.rank.ID}">selected</c:if>>
                                                                ${rankOption.value}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <div class="text-danger" id="rank_error1"></div>
                                            </div>

                                            <!-- Hình ảnh -->
                                            <div class="form-group">
                                                <label class="control-label">Hình ảnh</label>
                                                <input type="file" name="photo_file" id="AVATAR" class="form-control"
                                                       aria-label="file example"/>
                                                <div class="text-danger" id="AVATAR_error"></div>
                                            </div>
                                            <!-- Vai trò -->
                                            <div class="form-group">
                                                <label class="control-label">Vai trò</label>
                                                <select name="ROLE" id="ROLE" class="form-control">
                                                    <option value="">Chọn vai trò</option>
                                                    <c:forEach var="items" items="${fillRole}">
                                                        <option value="${items.key}">
                                                            <c:if test="${items.key == userItem.rank.ID}">selected</c:if>
                                                                ${items.value}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <div class="text-danger" id="ROLE_error"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary">Create</button>
                                    </div>
                                </form>
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
                                        <td>${item.USERNAME} </td>
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
                                                    <h2>Ngày cập nhật: ${item.UPDATE_AT}</h2>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#userForm').submit(function (event) {
            event.preventDefault(); // Ngăn chặn việc gửi form thông thường
            let formData = new FormData(this);
            let username = $('#USERNAME').val();

            // Kiểm tra sự tồn tại của tên người dùng
            $.ajax({
                type: 'GET',
                url: '/admin/check-username',
                data: {username: username},
                success: function (exists) {
                    if (exists) {
                        $('#USERNAME_error').text('Tên người dùng đã tồn tại!');

                        // Kiểm tra mật khẩu có khớp hay không
                        if ($.trim($('#PASSWORD').val()) !== $.trim($('#confirmPassword').val())) {
                            $('#passwordError').text('Mật khẩu và xác nhận mật khẩu không khớp !');
                            return; // Ngăn chặn việc tiếp tục nếu mật khẩu không khớp
                        } else {
                            $('#passwordError').text('');
                        }
                    } else {
                        // Tên người dùng không tồn tại, tiếp tục gửi form
                        $.ajax({
                            type: 'POST',
                            url: '/admin/create-admin',
                            data: formData,
                            contentType: false,
                            processData: false,
                            success: function (response) {
                                if (response.status === 'success') {
                                    window.location.href = '/admin/user'; // Điều hướng tới trang danh sách người dùng
                                }
                            },
                            error: function (response) {
                                let errors = response.responseJSON;
                                // Xóa các thông báo lỗi cũ
                                $('.text-danger').text('');
                                // Hiển thị các thông báo lỗi mới
                                $.each(errors, function (key, value) {
                                    // Kiểm tra xem người dùng đã chọn bậc chưa
                                    if ($('#rank').val() === "") {
                                        $('#rank_error1').text('Vui lòng chọn bậc !');
                                    } else {
                                        $('#rank_error1').text('');
                                    }
                                    // kiểm tra avatar có trống hay không
                                    if ($('#AVATAR').val() === "") {
                                        $('#AVATAR_error').text('Vui lòng chọn ảnh đại diện !');
                                    } else {
                                        $('#AVATAR_error').text('');
                                    }

                                    $('#' + key + '_error').text(value);
                                });
                            }
                        });
                    }
                }
            });
        });
    });
</script>

</body>
</html>