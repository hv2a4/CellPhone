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
									<h1 class="modal-title fs-5" id="themLabel">Thêm dung
										lượng mới</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form class="form-horizontal form-label-left" method="POST"
										action="/admin/storage/create">
										<div class="form-group ">
											<label class="control-label">Dung lượng</label> <input required="required"
												name="GB" class="form-control" placeholder="" />
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
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
											<th>Mã</th>
											<th>Tên</th>
											<th class="text-center">Hoạt động</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${pageStorage.content}">
											<tr>
												<td>${item.ID }</td>
												<td><fmt:formatNumber pattern="###,###">
													${item.GB }</fmt:formatNumber> GB</td>
												<td class="text-center"><i
													onclick="getstorageById(${item.ID })"
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
												<form class="form-horizontal form-label-left" method="POST"
													action="/admin/storage/update">
													<div class="row text-left">
														<div class="form-group">
															<input required="required" id="storageId"
																value="${storageUpdate.ID}" name="ID" type="hidden"
																class="form-control" />
														</div>
														<div class="form-group">
															<label class="control-label">Dung lượng</label> <input
																required="required" id="storageGB" name="GB" type="text"
																class="form-control" placeholder="" />
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary">Update</button>
													</div>
												</form>
											</div>

										</div>
									</div>
								</div>
							</div>
							<c:if test="${pageStorage.totalPages!=1}">
								<div class="text-right">
									<c:forEach var="item" begin="1" end="${pageStorage.totalPages}"
										step="1">
										<a class="btn btn-primary" href="/admin/storage?pages=${item}">${item}</a>
									</c:forEach>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function getstorageById(id) {
		    $.ajax({
		        type: "GET",
		        url: "/admin/ajax/getstorage/" + id,
		        success: function(storage) {
		            // Đổ dữ liệu vào form
		            $("#storageId").val(storage.id);
		            $("#storageGB").val(storage.gb); 
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
		        url: "/admin/ajax/getstorage/" + id,
		        success: function(storage) {
		        	  // Đổ dữ liệu vào modal
	                $("#thongbao").text("Bạn có muốn xóa dung lượng: " + storage.gb+" GB");
	                var modal = new bootstrap.Modal(document.getElementById('delete'));
	                modal.show();
	                
	                // Xử lý khi nhấn nút Delete
	                $("#deleteButton").on("click", function() {
	                    window.location.href = "/admin/storage/delete?id=" + storage.id;
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
				timer : 1000
			});

			setTimeout(function() {
				window.location.href = "/admin/storage";
			}, 1001);
			// Thay đổi "/shop/login" thành URL của trang đăng nhập của bạn
		</script>
	</c:if>
	<c:if test="${message eq 'Trùng GB'}">
		<script>
			Swal.fire({
				icon : 'error',
				title : '${message}',
				showConfirmButton : false,
				timer : 1000
			});
			setTimeout(function() {
				window.location.href = "/admin/storage";
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
				window.location.href = "/admin/storage";
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
				window.location.href = "/admin/storage";
			}, 1001);
			// Thay đổi "/shop/login" thành URL của trang đăng nhập của bạn
		</script>
	</c:if>
</body>
</html>