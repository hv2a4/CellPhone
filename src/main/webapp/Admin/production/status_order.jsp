<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							data-bs-toggle="modal" data-bs-target="#them">Thêm</button>
						<!-- Modal -->
						<div div class="modal fade " id="them" tabindex="-1"
							aria-labelledby="themLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="themLabel">Thêm</h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form class="form-horizontal form-label-left">
											<div class="form-group ">
												<label class="control-label">Trạng thái đơn hàng</label> <input type="text"
													class="form-control" placeholder="">
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
												<th>Mã</th>
												<th>Tên</th>
												<th class="text-center">Hoạt động</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>001</td>
												<td>Chờ xác nhận</td>
												<td class="text-center"><i
													class="fa-solid fa-pen-to-square fs-4 mr-3"
													data-bs-toggle="modal" data-bs-target="#update"></i> <i
													class="fa-solid fa-trash fs-4 " data-bs-toggle="modal"
													data-bs-target="#delete"></i> <!-- Modal Update-->
													<div class="modal fade" id="update" tabindex="-1"
														aria-labelledby="updateLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h1 class="modal-title fs-5" id="updateLabel">Cập nhật</h1>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<div class="modal-body">
																	<form class="form-horizontal form-label-left">
																		<div class="row text-left">
																			<div class="form-group ">
																				<label class="control-label">Id</label> <input
																					type="text" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Trạng thái đơn hàng</label> <input
																					type="text" class="form-control" placeholder="">
																			</div>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">Close</button>
																	<button type="button" class="btn btn-primary">Update</button>
																</div>
															</div>
														</div>
													</div> <!-- Modal Delete-->
													<div class="modal fade" id="delete" tabindex="-1"
														aria-labelledby="deleteLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h1 class="modal-title fs-5" id="deleteLabel">Xác
																		nhận xóa</h1>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<div class="modal-body text-left">Bạn có muốn xóa
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">Close</button>
																	<button type="button" class="btn btn-danger">Delete</button>
																</div>
															</div>
														</div>
													</div></td>
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
	</div>
</body>
</html>