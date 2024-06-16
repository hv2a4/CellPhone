<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<body>
	<div class="clearfix"></div>
	<div class="row">
		<div class="col-md-12 col-sm-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>Danh Sách</h2>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary float-end mr-3 px-5"
						data-bs-toggle="modal" data-bs-target="#them">Thêm</button>
					<!-- Modal -->
					<div div class="modal fade " id="them" tabindex="-1"
						aria-labelledby="themLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="themLabel">Thêm trạng thái đơn hàng mới</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form:form class="form-horizontal form-label-left"
										method="POST" modelAttribute="status_order"
										action="/admin/status_order/create">
										<div class="form-group ">
											<label class="control-label">Tên trạng thái đơn hàng</label>
											<form:input path="STATUS" cssClass="form-control"
												placeholder="" />
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">Create</button>
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
											<th>Mã trạng thái đơn hàng</th>
											<th>Tên trạng thái đơn hàng</th>
											<th class="text-center">Hoạt động</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${list_status_order}">
											<tr>
												<td>${item.ID }</td>
												<td>${item.STATUS }</td>
												<td class="text-center"><i
													onclick="getstatus_orderById(${item.ID })"
													class="fa-solid fa-pen-to-square fs-4 mr-3"></i> <i
													onclick="modelDelete(${item.ID })"
													class="fa-solid fa-trash fs-4 "></i></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- Modal Delete-->
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
													data-bs-dismiss="modal">Close</button>
												<button type="button" class="btn btn-danger"
													id="deleteButton">Delete</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal Update-->
								<div class="modal fade" id="updateModel" tabindex="-1"
									aria-labelledby="updateLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="updateLabel">Cập nhật</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<form:form class="form-horizontal form-label-left"
													method="POST" modelAttribute="status_orderUpdate"
													action="/admin/status_order/update">
													<div class="row text-left">
														<div class="form-group">
															<form:input id="status_orderId" value="${status_orderUpdate.ID}"
																path="ID" type="hidden" class="form-control" />
														</div>
														<div class="form-group">
															<label class="control-label">Tên trạng thái đơn hàng</label>
															<form:input id="status_orderName" path="STATUS" type="text"
																class="form-control" placeholder="" />
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary">Update</button>
													</div>
												</form:form>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function getstatus_orderById(id) {
		    $.ajax({
		        type: "GET",
		        url: "/admin/ajax/getstatus_order/" + id,
		        success: function(status_order) {
		            // Đổ dữ liệu vào form:form
		            $("#status_orderId").val(status_order.id);
		            $("#status_orderName").val(status_order.status); 
		            var modal = new bootstrap.Modal(document
							.getElementById('updateModel'));
					modal.show();
		        },
		        error: function(xhr, status, error) {
		            console.log("Error: " + error);
		        }
		    });
		}
		
		function modelDelete(id) {
		    $.ajax({
		        type: "GET",
		        url: "/admin/ajax/getstatus_order/" + id,
		        success: function(status_order) {
		        	  // Đổ dữ liệu vào modal
	                $("#thongbao").text("Bạn có muốn xóa trạng thái đơn hàng " + status_order.status);
	                var modal = new bootstrap.Modal(document.getElementById('delete'));
	                modal.show();
	                
	                // Xử lý khi nhấn nút Delete
	                $("#deleteButton").on("click", function() {
	                    window.location.href = "/admin/status_order/delete?id=" + status_order.id;
	                });
		        },
		        error: function(xhr, status, error) {
		            console.log("Error: " + error);
		        }
		    });
		}
	</script>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<c:if test="${message eq 'Hoàn tất'}">
		<script>
			Swal.fire({
				icon : 'success',
				title : '${message}',
				showConfirmButton : false,
				timer : 1500
			});

			setTimeout(function() {
				window.location.href = "/admin/status_order";
			}, 1800);
			// Thay đổi "/shop/login" thành URL của trang đăng nhập của bạn
		</script>
	</c:if>
	<c:if test="${message eq 'Không được để trống tên'}">
		<script>
			Swal.fire({
				icon : 'error',
				title : '${message}',
				showConfirmButton : false,
				timer : 1500
			});

			setTimeout(function() {
				window.location.href = "/admin/status_order";
			}, 1800);
			// Thay đổi "/shop/login" thành URL của trang đăng nhập của bạn
		</script>
	</c:if>
	<c:if test="${message eq 'Trùng tên'}">
		<script>
			Swal.fire({
				icon : 'error',
				title : '${message}',
				showConfirmButton : false,
				timer : 1500
			});
			setTimeout(function() {
				window.location.href = "/admin/status_order";
			}, 1001);
			// Thay đổi "/shop/login" thành URL của trang đăng nhập của bạn
		</script>
	</c:if>
	<c:if test="${message eq 'Đã xóa'}">
		<script>
			Swal.fire({
				icon : 'success',
				title : '${message}',
				showConfirmButton : false,
				timer : 1000
			});
			setTimeout(function() {
				window.location.href = "/admin/status_order";
			}, 1001);
			// Thay đổi "/shop/login" thành URL của trang đăng nhập của bạn
		</script>
	</c:if>
	<c:if test="${message eq 'Không thể xóa'}">
		<script>
			Swal.fire({
				icon : 'error',
				title : '${message}',
				showConfirmButton : false,
				timer : 1000
			});

			setTimeout(function() {
				window.location.href = "/admin/status_order";
			}, 1001);
			// Thay đổi "/shop/login" thành URL của trang đăng nhập của bạn
		</script>
	</c:if>
</body>
</html>