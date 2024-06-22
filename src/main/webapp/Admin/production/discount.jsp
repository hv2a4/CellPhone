<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<body>

<div class="">
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Danh Sách</h2>

                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary float-end mr-3 px-5"
                            data-bs-toggle="modal" data-bs-target="#them">Thêm
                    </button>
                    <!-- Modal -->
                    <div div class="modal fade " id="them" tabindex="-1"
                         aria-labelledby="themLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="themLabel">Tạo mã mới</h1>
                                    <button type="button" class="btn-close"
                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="discountCodeForm" method="POST"
                                          action="/admin/discount_code/create"
                                          class="form-horizontal form-label-left">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Mã giảm giá</label> <input
                                                        type="text" name="CODE" class="form-control" id="CODE"
                                                        placeholder="ABCDEFJASDLKFJ"/> <small
                                                        class="text-danger" id="CODE_error"></small>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Phần trăm giảm</label> <input
                                                        min="0" max="100" type="number" step="1"
                                                        name="PERCENTAGE" id="PERCENTAGE" class="form-control"
                                                        placeholder=""/> <small class="text-danger"
                                                                                id="PERCENTAGE_error"></small>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Áp dụng cho đơn tối
                                                        thiểu</label> <input min="0" step="1" type="number"
                                                                             name="MINIMUM" id="MINIMUM"
                                                                             class="form-control"
                                                                             placeholder=""/> <small class="text-danger"
                                                                                                     id="MINIMUM_error"></small>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Số lượng</label> <input
                                                        type="number" min="0" step="1" name="QUANTITY"
                                                        id="QUANTITY" class="form-control"/> <small
                                                        class="text-danger" id="QUANTITY_error"></small>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Bậc</label> <select
                                                        name="rank" id="rank" class="form-select">
                                                    <c:forEach var="item" items="${list_rank}">
                                                        <option value="${item.ID}">${item.NAME}</option>
                                                    </c:forEach>
                                                </select> <small id="rank_error" class="text-danger"></small>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Ngày bắt đầu</label> <input
                                                        name="START_DATE" id="START_DATE" class="form-control"
                                                        type="datetime-local" placeholder=""/> <small
                                                        id="START_DATE_error" class="text-danger"></small>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Ngày kết thúc</label> <input
                                                        name="EXPIRY_DATE" id="EXPIRY_DATE" class="form-control"
                                                        type="datetime-local"/> <small id="EXPIRY_DATE_error"
                                                                                       class="text-danger"></small>
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
                                <table class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0"
                                       width="100%">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Bậc áp dụng</th>
                                        <th>Mã giảm giá</th>
                                        <th>Ngày bắt đầu</th>
                                        <th>Ngày kết thúc</th>
                                        <th>Giảm</th>
                                        <th>Số lượng</th>
                                        <th>Đơn tối thiểu</th>
                                        <th>Hoạt động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageDiscountCode.content}" var="item" varStatus="loop">
                                        <tr>
                                            <td>${loop.index +1 }</td>
                                            <td>${item.CODE }</td>
                                            <td>${item.getRank().getNAME()}</td>
                                                <%--  <td>${item.START_DATE }</td> --%>
                                            <td id="startDateTime">
                                                <fmt:formatDate value="${item.startDateAsDate}"
                                                                pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </td>
                                            <td id="expiryDateTime">
                                                <fmt:formatDate value="${item.expiryDateAsDate}"
                                                                pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </td>
                                            <td>
                                                <fmt:formatNumber pattern="###">${item.PERCENTAGE }</fmt:formatNumber> %
                                            </td>
                                            <td>
                                                <fmt:formatNumber pattern="###,###">${item.QUANTITY }</fmt:formatNumber>
                                            </td>
                                            <td><fmt:formatNumber pattern="###,###">
                                                ${item.MINIMUM }</fmt:formatNumber> đ
                                            </td>
                                            <td class="text-center"><i
                                                    class="fa-solid fa-pen-to-square fs-4 mr-3"
                                                    onclick="getdiscount_codeById(${item.ID })"></i> <i
                                                    class="fa-solid fa-trash fs-4 "
                                                    onclick="modelDelete(${item.ID })"></i>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- Modal Update-->
                                <div class="modal fade" id="updateModel" tabindex="-1"
                                     aria-labelledby="updateLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="updateLabel">Cập nhật</h1>
                                                <button type="button" class="btn-close"
                                                        data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form id="discountCodeFormUpdate" method="POST"
                                                      action="/admin/discount_code/update"
                                                      class="form-horizontal form-label-left">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <input type="hidden" name="ID" id="ID_update">
                                                            <div class="form-group">
                                                                <label class="control-label">Mã giảm giá</label> <input
                                                                    readonly type="text" name="CODE"
                                                                    class="form-control"
                                                                    id="CODE_update" placeholder=""/> <small
                                                                    class="text-danger" id="CODE_update_error"></small>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label">Phần trăm giảm</label>
                                                                <input
                                                                        min="0" max="100" type="number" step="1"
                                                                        name="PERCENTAGE" id="PERCENTAGE_update"
                                                                        class="form-control" placeholder=""/> <small
                                                                    class="text-danger"
                                                                    id="PERCENTAGE_update_error"></small>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label">Áp dụng cho đơn
                                                                    tối thiểu</label> <input min="0" step="1"
                                                                                             type="number"
                                                                                             name="MINIMUM"
                                                                                             id="MINIMUM_update"
                                                                                             class="form-control"
                                                                                             placeholder=""/> <small
                                                                    class="text-danger"
                                                                    id="MINIMUM_update_error"></small>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label">Số lượng</label> <input
                                                                    type="number" min="0" step="1" name="QUANTITY"
                                                                    id="QUANTITY_update" class="form-control"/> <small
                                                                    class="text-danger"
                                                                    id="QUANTITY_update_error"></small>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label">Bậc</label> <select
                                                                    name="rank" id="rank_update" class="form-select">
                                                                <c:forEach var="item" items="${list_rank}">
                                                                    <option value="${item.ID}">${item.NAME}</option>
                                                                </c:forEach>
                                                            </select> <small id="rank_update_error"
                                                                             class="text-danger"></small>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label">Ngày bắt đầu</label> <input
                                                                    name="START_DATE" id="START_DATE_update"
                                                                    class="form-control" type="date" placeholder=""/>
                                                                <small
                                                                        id="START_DATE_update_error"
                                                                        class="text-danger"></small>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label">Ngày kết thúc</label>
                                                                <input
                                                                        name="EXPIRY_DATE" id="EXPIRY_DATE_update"
                                                                        class="form-control" type="date"/> <small
                                                                    id="EXPIRY_DATE_update_error"
                                                                    class="text-danger"></small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Close
                                                        </button>
                                                        <button type="submit" class="btn btn-primary">Update</button>
                                                    </div>
                                                </form>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- Model delete -->
                                <div class="modal fade" id="delete" tabindex="-1"
                                     aria-labelledby="deleteLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="deleteLabel">Xác nhận
                                                    xóa</h1>
                                                <button type="button" class="btn-close"
                                                        data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body text-left" id="thongbao"></div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Close
                                                </button>
                                                <button type="button" class="btn btn-danger"
                                                        id="deleteButton">Delete
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </td>
                            </div>
                        </div>
                        <c:if test="${pageDiscountCode.totalPages!=1}">
                            <div class="text-right">
                                <c:forEach var="item" begin="1"
                                           end="${pageDiscountCode.totalPages}" step="1">
                                    <a class="btn btn-primary"
                                       href="/admin/discount?pages=${item}">${item}</a>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:if test="${message eq 'Đã xóa'}">
    <script>
        Swal.fire({
            icon: 'success',
            title: '${message}',
            showConfirmButton: false,
            timer: 1000
        });

        setTimeout(function () {
            window.location.href = "/admin/discount";
        }, 1800);
        // Thay đổi "/shop/login" thành URL của trang đăng nhập của bạn
    </script>
</c:if>
<c:if test="${message eq 'Không thể xóa'}">
    <script>
        Swal.fire({
            icon: 'error',
            title: '${message}',
            showConfirmButton: false,
            timer: 1000
        });

        setTimeout(function () {
            window.location.href = "/admin/discount";
        }, 1001);
        // Thay đổi "/shop/login" thành URL của trang đăng nhập của bạn
    </script>
</c:if>

	<script>
		function modelDelete(id) {
        $.ajax({
            type: "GET",
            url: "/admin/ajax/getdiscount_code/" + id,
            success: function (discount_code) {
                // Đổ dữ liệu vào modal
                $("#thongbao").text("Bạn có muốn xóa mã code " + discount_code.code);
                var modal = new bootstrap.Modal(document.getElementById('delete'));
                modal.show();

                // Xử lý khi nhấn nút Delete
                $("#deleteButton").on("click", function () {
                    window.location.href = "/admin/discount_code/delete?id=" + discount_code.id;
                });
            },
            error: function (xhr, status, error) {
                console.log("Error: " + error);
            }
        });
    }
	</script>

<script>
    function getdiscount_codeById(id) {
        $.ajax({
            type: "GET",
            url: "/admin/ajax/getdiscount_code/" + id,
            success: function (discount_code) {
                // Đổ dữ liệu vào form:form
                $("#ID_update").val(discount_code.id);
                $("#CODE_update").val(discount_code.code);
                $("#QUANTITY_update").val(discount_code.quantity);
                $("#PERCENTAGE_update").val(discount_code.percentage);
                $("#MINIMUM_update").val(discount_code.minimum);

                $("#START_DATE_update").val(discount_code.start_DATE);
                $("#EXPIRY_DATE_update").val(discount_code.expiry_DATE);

                $("#rank_update option").each(function () {
                    if ($(this).val() == discount_code.rank.id) {
                        $(this).prop("selected", true);
                    }
                });
                $("#percentage").val(discount_code.percentage);
                $("#minimun").val(discount_code.minimum);
                $("#quantity").val(discount_code.quantity);
                var modal = new bootstrap.Modal(document
                    .getElementById('updateModel'));
                modal.show();
            },
            error: function (xhr, status, error) {
                console.log("Error: " + error);
            }
        });
    }

	</script>


	<script>
// Bắt lỗi thêm 
    $(document).ready(function () {
        $('#discountCodeForm').submit(function (event) {
            event.preventDefault(); // Ngăn chặn việc submit form mặc định
            // Lấy giá trị của các trường ngày tháng
            let startDate = new Date($('#START_DATE').val());
            let expiryDate = new Date($('#EXPIRY_DATE').val());
            let today = new Date();
            today.setHours(0, 0, 0, 0); // Đặt thời gian về 00:00:00 để so sánh chính xác

            // Kiểm tra START_DATE không được là ngày trước ngày hôm nay
            if (startDate <= today) {
                $('#START_DATE_error').text("Ngày bắt đầu phải sau ngày hiện tại.");
                return;
            } else {
                $('#START_DATE_error').text("");
            }

            // Kiểm tra EXPIRY_DATE phải sau ngày START_DATE
            if (expiryDate <= startDate) {
                $('#EXPIRY_DATE_error').text("Ngày kết thúc phải sau ngày bắt đầu.");
                return;
            } else {
                $('#EXPIRY_DATE_error').text("");
            }
            let formData = new FormData(this);
            $.ajax({
                type: 'POST',
                url: '/admin/discount_code/create',
                data: formData,
                contentType: false,
                processData: false,
                success: function (response) {
                    if (response.status === 'success') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Hoàn tất',
                            showConfirmButton: false,
                            timer: 1050
                        });

                        setTimeout(function () {
                            window.location.href = '/admin/discount'; // Điều hướng tới trang danh sách người dùng
                        }, 1600);
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Trùng mã',
                            showConfirmButton: false,
                            timer: 1050
                        });
                    }
                },
                error: function (response) {
                    let errors = response.responseJSON;
                    $.each(errors, function (key, value) {
                        if ($('#rank').val() === "") {
                            $('#rank_errors').text("Vui lòng chọn bậc !");
                        }
                        $('#' + key + '_error').text(value); // Hiển thị lỗi trong thẻ span
                    });
                }
            });
        });
    });
    // Bắt lỗi cập nhật
    $(document).ready(function () {
        $('#discountCodeFormUpdate').submit(function (event) {
            event.preventDefault(); // Ngăn chặn việc submit form mặc định
            // Lấy giá trị của các trường ngày tháng
            let startDate = new Date($('#START_DATE_update').val());
            let expiryDate = new Date($('#EXPIRY_DATE_update').val());
            let today = new Date();
            today.setHours(0, 0, 0, 0); // Đặt thời gian về 00:00:00 để so sánh chính xác

            // Kiểm tra START_DATE không được là ngày trước ngày hôm nay
            if (startDate <= today) {
                $('#START_DATE_update_error').text("Ngày bắt đầu phải sau ngày hiện tại.");
                return;
            } else {
                $('#START_DATE_update_error').text("");
            }

            // Kiểm tra EXPIRY_DATE phải sau ngày START_DATE
            if (expiryDate <= startDate) {
                $('#EXPIRY_DATE_update_error').text("Ngày kết thúc phải sau ngày bắt đầu.");
                return;
            } else {
                $('#EXPIRY_DATE_update_error').text("");
            }

            let formData = new FormData(this);
            $.ajax({
                type: 'POST',
                url: '/admin/discount_code/update',
                data: formData,
                contentType: false,
                processData: false,
                success: function (response) {
                    if (response.status === 'success') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Hoàn tất',
                            showConfirmButton: false,
                            timer: 1050
                        });

                        setTimeout(function () {
                            window.location.href = '/admin/discount'; // Điều hướng tới trang danh sách người dùng
                        }, 1600);
                    }
                },
                error: function (response) {
                    let errors = response.responseJSON;
                    $.each(errors, function (key, value) {
                        if ($('#rank').val() === "") {
                            $('#rank_update_errors').text("Vui lòng chọn bậc !");
                        }
                        $('#' + key + '_update_error').text(value); // Hiển thị lỗi trong thẻ span
                    });
                }
            });
        });
    });
</script>
</body>
</html>