<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

	<div class="row">
		<div class="col-md-12 col-sm-12 ">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
						data-bs-target="#home-tab-pane" type="button" role="tab"
						aria-controls="home-tab-pane" aria-selected="true">Tất cả
						đơn hàng</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#profile-tab-pane" type="button" role="tab"
						aria-controls="profile-tab-pane" aria-selected="false">Chờ
						xác nhận</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
						data-bs-target="#contact-tab-pane" type="button" role="tab"
						aria-controls="contact-tab-pane" aria-selected="false">Đã
						xác nhận</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="dangvanchuyen-tab"
						data-bs-toggle="tab" data-bs-target="#dangvanchuyen" type="button"
						role="tab" aria-controls="contact-tab-pane" aria-selected="false">Đang
						vận chuyển</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="hoanthanh-tab" data-bs-toggle="tab"
						data-bs-target="#hoanthanh" type="button" role="tab"
						aria-controls="contact-tab-pane" aria-selected="false">Hoàn
						thành</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="dahuy-tab" data-bs-toggle="tab"
						data-bs-target="#dahuy" type="button" role="tab"
						aria-controls="contact-tab-pane" aria-selected="false">Đã
						hủy</button>
				</li>

			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home-tab-pane"
					role="tabpanel" aria-labelledby="home-tab" tabindex="0">

					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 ">
							<div class="x_panel">
								<div class="x_title">
									<h2>Danh Sách</h2>

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
															<th>Mã đơn hàng</th>
															<th>Tên người đặt</th>
															<th>Tổng tiền</th>
															<th>Ngày đặt</th>
															<th>Trạng thái</th>
															<th>Hoạt động</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>001</td>
															<td>Nguyen Van A</td>
															<td>27346342</td>
															<td>19-05-2024</td>
															<td>Chờ xác nhận</td>
															<td><button type="button" class="btn btn-success">Xác
																	nhận</button></td>
														</tr>
														<tr>
															<td>002</td>
															<td>Nguyen Van A</td>
															<td>27346342</td>
															<td>19-05-2024</td>
															<td>Xác nhận</td>
															<td><button type="button" class="btn btn-primary">Giao
																	hàng</button></td>
														</tr>
														<tr>
															<td>003</td>
															<td>Nguyen Van A</td>
															<td>27346342</td>
															<td>19-05-2024</td>
															<td>Đang vận chuyển</td>
															<td><button type="button" class="btn btn-info">Hoàn
																	thành</button></td>
														</tr>
														<tr>
															<td>004</td>
															<td>Nguyen Van A</td>
															<td>27346342</td>
															<td>19-05-2024</td>
															<td>Chờ xác nhận</td>
															<td><button type="button" class="btn btn-success">Xác
																	nhận</button></td>
														</tr>
														<tr>
															<td>005</td>
															<td>Nguyen Van A</td>
															<td>27346342</td>
															<td>19-05-2024</td>
															<td>Xác nhận</td>
															<td><button type="button" class="btn btn-primary">Giao
																	hàng</button></td>
														</tr>
														<tr>
															<td>006</td>
															<td>Nguyen Van A</td>
															<td>27346342</td>
															<td>19-05-2024</td>
															<td>Đang vận chuyển</td>
															<td><button type="button" class="btn btn-info">Hoàn
																	thành</button></td>
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
				<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
					aria-labelledby="profile-tab" tabindex="0">

					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 ">
							<div class="x_panel">
								<div class="x_title">
									<h2>Danh Sách</h2>

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
															<th>Mã đơn hàng</th>
															<th>Tên người đặt</th>
															<th>Tổng tiền</th>
															<th>Ngày đặt</th>
															<th>Trạng thái</th>
															<th>Hoạt động</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>001</td>
															<td>Nguyen Van A</td>
															<td>27346342</td>
															<td>19-05-2024</td>
															<td>Chờ xác nhận</td>
															<td><button type="button" class="btn btn-success">Xác
																	nhận</button></td>
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
				<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel"
					aria-labelledby="contact-tab" tabindex="0">

					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 ">
							<div class="x_panel">
								<div class="x_title">
									<h2>Danh Sách</h2>

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
															<th>Mã đơn hàng</th>
															<th>Tên người đặt</th>
															<th>Tổng tiền</th>
															<th>Ngày đặt</th>
															<th>Trạng thái</th>
															<th>Hoạt động</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>001</td>
															<td>Nguyen Van A</td>
															<td>27346342</td>
															<td>19-05-2024</td>
															<td>Đã xác nhận</td>
															<td><button type="button" class="btn btn-success">Giao
																	hàng</button></td>
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
				<div class="tab-pane fade" id="dangvanchuyen" role="tabpanel"
					aria-labelledby="dangvanchuyen-tab" tabindex="0">

					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 ">
							<div class="x_panel">
								<div class="x_title">
									<h2>Danh Sách</h2>

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
															<th>Mã đơn hàng</th>
															<th>Tên người đặt</th>
															<th>Tổng tiền</th>
															<th>Ngày đặt</th>
															<th>Trạng thái</th>
															<th>Hoạt động</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>001</td>
															<td>Nguyen Van A</td>
															<td>27346342</td>
															<td>19-05-2024</td>
															<td>Đang vận chuyển</td>
															<td><button type="button" class="btn btn-success">Hoàn
																	thành</button></td>
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
				<div class="tab-pane fade" id="hoanthanh" role="tabpanel"
					aria-labelledby="hoanthanh-tab" tabindex="0">

					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 ">
							<div class="x_panel">
								<div class="x_title">
									<h2>Danh Sách</h2>

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
															<th>Mã đơn hàng</th>
															<th>Tên người đặt</th>
															<th>Tổng tiền</th>
															<th>Ngày đặt</th>
															<th>Trạng thái</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>001</td>
															<td>Nguyen Van A</td>
															<td>27346342</td>
															<td>19-05-2024</td>
															<td>Hoàn thành</td>
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
				<div class="tab-pane fade" id="dahuy" role="tabpanel"
					aria-labelledby="dahuy-tab" tabindex="0">

					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 ">
							<div class="x_panel">
								<div class="x_title">
									<h2>Danh Sách</h2>

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
															<th>Mã đơn hàng</th>
															<th>Tên người đặt</th>
															<th>Tổng tiền</th>
															<th>Ngày đặt</th>
															<th>Trạng thái</th>
															<th>Lý do</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>001</td>
															<td>Nguyen Van A</td>
															<td>27346342</td>
															<td>19-05-2024</td>
															<td>Đã hủy</td>
															<td>Sai màu rồi</td>
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
			</div>
		</div>
	</div>
</body>
</html>