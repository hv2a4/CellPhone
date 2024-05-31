<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						data-bs-toggle="modal" data-bs-target="#them">Thêm</button>
					<!-- Modal -->
					<div div class="modal fade " id="them" tabindex="-1"
						aria-labelledby="themLabel" aria-hidden="true">
						<div class="modal-dialog  modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="themLabel">Thêm</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form class="form-horizontal form-label-left">
										<div class="row">
											<div class="col-md-6">
												<!-- Username -->
												<div class="form-group ">
													<label class="control-label">Username</label> <input
														type="text" class="form-control" placeholder="">
												</div>
												<!-- Họ và tên -->
												<div class="form-group ">
													<label class="control-label">Họ và tên</label> <input
														type="text" class="form-control" placeholder="">
												</div>
												<!-- Password -->
												<div class="form-group ">
													<label class="control-label">Mật khẩu</label> <input
														type="password" class="form-control" placeholder="">
												</div>
												<!-- Password -->
												<div class="form-group ">
													<label class="control-label">Nhập lại</label> <input
														type="password" class="form-control" placeholder="">
												</div>
												<!-- Email -->
												<div class="form-group ">
													<label class="control-label">Email</label> <input
														type="email" class="form-control"
														placeholder="nguyenvana@gmail.com">
												</div>
												<!-- Phone -->
												<div class="form-group ">
													<label class="control-label">Số điện thoại</label> <input
														type="text" class="form-control" placeholder="0123456789">
												</div>
											</div>
											<div class="col-md-6">
												<!-- Äá»a chá» -->
												<div class="form-group ">
													<label class="control-label">Äá»a chá»</label>
													<textarea name="" class="form-control" id=""></textarea>
												</div>
												<!-- Bậc-->
												<div class="form-group">
													<label class="control-label">Bậc</label> <select
														class="form-control">
														<option>VIP</option>
														<option>Diamond</option>
														<option>Silver</option>
														<option>Bronze</option>
														<option>Newbie</option>
													</select>
												</div>
												<!-- Hình ảnh -->
												<div class="form-group">
													<label class="control-label">Hình ảnh</label> <input
														type="file" class="form-control" aria-label="file example">
												</div>
												<!-- Vai trò -->
												<div class="form-group">
													<label class="control-label">Vai trò</label> <select
														class="form-control">
														<option>Admin</option>
														<option>User</option>
													</select>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Create</button>
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
											<th>Tài khoảnn</th>
											<th>Email</th>
											<th>Số điện thoại</th>
											<th>Trạng thái</th>
											<th>Hoạt động</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td data-bs-toggle="modal" data-bs-target="#exampleModal">1</td>
											<td data-bs-toggle="modal" data-bs-target="#exampleModal">Nguyễn Văn A</td>
											<td data-bs-toggle="modal" data-bs-target="#exampleModal">nguyenvana</td>
											<td data-bs-toggle="modal" data-bs-target="#exampleModal">a@123gmail.com</td>
											<td data-bs-toggle="modal" data-bs-target="#exampleModal">0987654321</td>
											<td data-bs-toggle="modal" data-bs-target="#exampleModal">Hoạt động</td>
											<td class="text-center">
												<button class="btn btn-primary">Cấp quyền</button>
											</td>
											<!-- Modal -->
											<div class="modal fade" id="exampleModal" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h1 class="modal-title fs-5 fw-bold"
																id="exampleModalLabel">Chi tiết</h1>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<h2>Tên: Nguyễn Văn A</h2>
															<h2>Ảnh: a.png</h2>
															<h2>Tài khoản: nguyenvana</h2>
															<h2>Email: a@123gmail.com</h2>
															<h2>Số điện thoại: 0987654321</h2>
															<h2>Bậc: Người mới</h2>
															<h2>Quyền: User</h2>
															<h2>Ngày tạo: 21/05/2024</h2>
															<h2>Ngày cập nhật: 22/05/2024</h2>
															<h2>Trạng thái: Hoạt động</h2>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-primary"
																data-bs-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</tr>
										<tr>
											<td data-bs-toggle="modal" data-bs-target="#exampleModal2">2</td>
											<td data-bs-toggle="modal" data-bs-target="#exampleModal2">Nguyễn
												Văn B</td>
											<td data-bs-toggle="modal" data-bs-target="#exampleModal2">nguyenvanb</td>
											<td data-bs-toggle="modal" data-bs-target="#exampleModal2">b@123gmail.com</td>
											<td data-bs-toggle="modal" data-bs-target="#exampleModal2">0123456789</td>
											<td data-bs-toggle="modal" data-bs-target="#exampleModal2">Đã
												khóa</td>
											<td class="text-center">
												<button class="btn btn-success ac">Mở khóa</button>
											</td>
											<!-- Modal -->
											<div class="modal fade" id="exampleModal2" tabindex="-1"
												aria-labelledby="exampleModal2Label" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h1 class="modal-title fs-5 fw-bold"
																id="exampleModal2Label">Chi tiết</h1>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<h2>Tên : Nguyễn VÄn B</h2>
															<h2>Arvarta : b.png</h2>
															<h2>Tài khoản: nguyenvanb</h2>
															<h2>Email : b@123gmail.com</h2>
															<h2>Số điện thoại: 0987654321</h2>
															<h2>Bậc: Người mới</h2>
															<h2>Quyền: User</h2>
															<h2>Ngày tạo: 21/05/2024</h2>
															<h2>Ngày cập nhật: 22/05/2024</h2>
															<h2>Trạng thái: Đã Khóa</h2>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-primary"
																data-bs-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>