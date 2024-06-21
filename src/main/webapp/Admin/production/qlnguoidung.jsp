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
                                      class="form-horizontal form-label-left"
                                      enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <!-- Username -->
                                            <div class="form-group">
                                                <label class="control-label">Tài khoản</label> <input
                                                    type="text" name="USERNAME" id="USERNAME"
                                                    class="form-control" placeholder=""/>
                                                <div class="text-danger" id="USERNAME_error"></div>
                                            </div>

                                            <!-- Password -->
                                            <div class="form-group">
                                                <label class="control-label">Mật khẩu</label> <input
                                                    type="password" name="PASSWORD" id="PASSWORD"
                                                    class="form-control" placeholder=""/>
                                                <div class="text-danger" id="PASSWORD_error"></div>
                                            </div>
                                            <!-- Confirm Password -->
                                            <div class="form-group">
                                                <label class="control-label">Nhập lại mật khẩu</label> <input
                                                    type="password" class="form-control" id="confirmPassword"
                                                    placeholder="" name="config-password"/>
                                                <div class="text-danger" id="passwordError"></div>
                                            </div>
                                            <!-- Giới tính -->
                                            <div class="form-group mb-3">
                                                <label class="control-label">Giới tính</label>
                                                <div class="ms-4 d-flex justify-content-between">
                                                    <c:forEach items="${gender}" var="genderOption"
                                                               varStatus="status">
                                                        <label class="form-check form-check-inline"> <input
                                                                class="form-check-input" type="radio" name="GENDER"
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
                                                <label class="control-label">Họ và tên</label> <input
                                                    type="text" name="FULLNAME" id="FULLNAME"
                                                    class="form-control" placeholder=""/>
                                                <div class="text-danger" id="FULLNAME_error"></div>
                                            </div>
                                            <!-- Email -->
                                            <div class="form-group">
                                                <label class="control-label">Email</label> <input
                                                    type="email" name="EMAIL" id="EMAIL" class="form-control"/>
                                                <div class="text-danger" id="EMAIL_error"></div>
                                            </div>
                                            <!-- Phone -->
                                            <div class="form-group">
                                                <label class="control-label">Số điện thoại</label> <input
                                                    type="text" name="PHONE_NUMBER" id="PHONE_NUMBER"
                                                    class="form-control" placeholder=""/>
                                                <div class="text-danger" id="PHONE_NUMBER_error"></div>
                                            </div>
                                            <!-- Hình ảnh -->
                                            <div class="form-group">
                                                <label class="control-label">Hình ảnh</label> <input
                                                    type="file" name="photo_file" id="AVATAR"
                                                    class="form-control" aria-label="file example"/>
                                                <div class="text-danger" id="AVATAR_error"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close
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
                            <table
                                    class="table table-striped table-bordered dt-responsive nowrap"
                                    cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Hình ảnh</th>
                                    <th>Tên</th>
                                    <th>Tài khoản</th>
                                    <th>Email</th>
                                    <th>Số điện thoại</th>
                                    <th>Trạng thái</th>
                                    <th>Hoạt động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${pageUser.content}"
                                           varStatus="stt">
                                    <tr>
                                        <td data-bs-toggle="modal"
                                            data-bs-target="#exampleModal_${stt.index + 1}">${stt.index + 1}</td>

                                        <td style="width: 120px; height: 120px;"><img alt=""
                                          data-bs-toggle="modal"
                                          data-bs-target="#exampleModal_${stt.index + 1}"
                                          src="/images-user/${item.AVATAR}"
                                          style="width: 100%; height: 100%; object-fit: cover;">
                                        </td>

                                        <td data-bs-toggle="modal"
                                            data-bs-target="#exampleModal_${stt.index + 1}">${item.FULLNAME}</td>
                                        <td>${item.USERNAME}</td>
                                        <td>${item.EMAIL}</td>
                                        <td>${item.PHONE_NUMBER}</td>
                                        <td>${item.STATUS ? "Hoạt động" : "Đã khóa"}</td>
                                        <td class="text-center"><c:choose>
                                            <c:when test="${!item.ROLE && item.STATUS}">
                                                <a class="btn btn-success khoa-btn"
                                                   onclick="xacNhanKhoaMoKhoa('khoa', '${item.USERNAME}')"
                                                   style="width: 100px; color: #fff;">Khóa</a>
                                            </c:when>
                                            <c:when test="${!item.ROLE && !item.STATUS}">
                                                <a class="btn btn-warning moKhoa-btn"
                                                   onclick="xacNhanKhoaMoKhoa('moKhoa', '${item.USERNAME}')"
                                                   style="width: 100px; color: #fff;">Mở khóa</a>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-danger" style="width: 100px"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#xoaNguoiDung_${item.USERNAME}">
                                                    Vô hiệu
                                                </button>
                                            </c:otherwise>
                                        </c:choose></td>
                                    </tr>

                                    <div class="modal fade" id="xoaNguoiDung_${item.USERNAME}"
                                         tabindex="-1"
                                         aria-labelledby="exampleModalLabel_${item.USERNAME}"
                                         aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5 fw-bold"
                                                        id="exampleModalLabel_${stt.index + 1}">Vô hiệu hóa
                                                        tài khoản</h1>
                                                    <button type="button" class="btn-close"
                                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <h2>Bạn có chắc muốn vô hiệu hóa tài khoản
                                                            ${item.USERNAME } này hay không?</h2>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">Close
                                                    </button>
                                                    <a class="btn btn-primary" style="color: #fff;"
                                                       href="/admin/delete/${item.USERNAME}">Xác nhận</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModal_${stt.index + 1}"
                                         tabindex="-1"
                                         aria-labelledby="exampleModalLabel_${stt.index + 1}"
                                         aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5 fw-bold"
                                                        id="exampleModalLabel_${stt.index + 1}">Chi tiết</h1>
                                                    <button type="button" class="btn-close"
                                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <h2>Tên: ${item.FULLNAME}</h2>
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
                                                    <c:forEach var="adr" items="${item.addresses}">
                                                        <c:if test="${!item.ROLE}">
                                                            <h2>Địa chỉ: ${adr.ADDRESS}</h2>
                                                        </c:if>
                                                    </c:forEach>

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
                        <c:if test="${pageUser.totalPages!=1}">
                            <div class="text-right">
                                <c:forEach var="item" begin="1" end="${pageUser.totalPages}"
                                           step="1">
                                    <a class="btn btn-primary" href="/admin/user?pages=${item}">${item}</a>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<c:if test="${not empty message}">
    <script>
        var message = "${message}";
        var messageType = "${messageType}";
        var icon = messageType === "success" ? "success" : "error";

        Swal.fire({
            icon: icon,
            title: message,
            showConfirmButton: false,
            timer: 1800
        }).then(() => {
            if (messageType === "success") {
                window.location.href = "/shop/login";
            } else {
                window.location.href = "/admin/user";
            }
        });
    </script>
</c:if>

<script>
    function xacNhanKhoaMoKhoa(hanhDong, tenTaiKhoan) {
        Swal.fire({
            title: "Bạn có chắc chắn không?",
            text: "Bạn sẽ không thể hoàn tác hành động này!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: hanhDong === "khoa" ? "Có, khóa nó!" : "Có, mở khóa nó!"
        }).then((result) => {
            if (result.isConfirmed) {
                // Gửi yêu cầu đến máy chủ để thực hiện khóa hoặc mở khóa tùy theo hành động
                $.ajax({
                    type: "GET",
                    url: hanhDong === "khoa" ? "/admin/authorize/" + tenTaiKhoan : "/admin/unlock/" + tenTaiKhoan,
                    success: function (response) {
                        if (response.status !== 'success') {
                            Swal.fire({
                                title: "Thành công!",
                                text: "Người dùng đã được " + (hanhDong === "khoa" ? "khóa." : "mở khóa."),
                                icon: "success"
                            }).then(() => {
                                location.reload();
                            });
                            // Thực hiện cập nhật giao diện hoặc các thao tác khác sau khi thực hiện thành công
                        }
                    },
                    error: function (xhr, status, error) {
                        if (xhr.status === 404) {
                            Swal.fire({
                                title: "Lỗi!",
                                text: "Không tìm thấy trang yêu cầu.",
                                icon: "error"
                            });
                        } else if (xhr.status === 500) {
                            Swal.fire({
                                title: "Lỗi!",
                                text: "Lỗi máy chủ nội bộ.",
                                icon: "error"
                            });
                        } else {
                            Swal.fire({
                                title: "Lỗi!",
                                text: "Có lỗi xảy ra: " + error,
                                icon: "error"
                            });
                        }
                    }

                });
            }
        });
    }

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
                    } else {
                        $('#USERNAME_error').text('');

                        // Kiểm tra mật khẩu có khớp hay không
                        if ($.trim($('#PASSWORD').val()) !== $.trim($('#confirmPassword').val())) {
                            $('#passwordError').text('Mật khẩu và xác nhận mật khẩu không khớp!');
                            return; // Ngăn chặn việc tiếp tục nếu mật khẩu không khớp
                        } else {
                            $('#passwordError').text('');
                        }

                        // Tên người dùng không tồn tại và mật khẩu khớp, tiếp tục gửi form
                        $.ajax({
                            type: 'POST',
                            url: '/admin/create-admin',
                            data: formData,
                            contentType: false,
                            processData: false,
                            success: function (response) {
                                if (response.status === 'success') {
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Thêm người dùng thành công',
                                        showConfirmButton: false,
                                        timer: 1050
                                    });
                                    setTimeout(function () {
                                        window.location.href = '/admin/user';
                                    }, 1600);
                                }
                            },
                            error: function (response) {
                                console.log('Lỗi khi gửi request:', response);
                                let errors = response.responseJSON;
                                // Xóa các thông báo lỗi cũ
                                $('.text-danger').text('');
                                // Hiển thị các thông báo lỗi mới
                                $.each(errors, function (key, value) {
                                    $('#' + key + '_error').text(value);
                                });

                                // kiểm tra avatar có trống hay không
                                if ($('#AVATAR').val() === "") {
                                    $('#AVATAR_error').text('Vui lòng chọn ảnh đại diện!');
                                } else {
                                    $('#AVATAR_error').text('');
                                }
                            }
                        });
                    }
                },
                error: function (xhr) {
                    console.error('Lỗi khi kiểm tra tên người dùng:', xhr.responseText);
                }
            });
        });
    });

</script>

</body>
</html>