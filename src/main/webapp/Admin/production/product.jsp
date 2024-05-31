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
					<h2>Danh Sách</h2>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary float-end mr-3 px-5"
						data-bs-toggle="modal" data-bs-target="#them">Thêm</button>
					<!-- Modal Thêm -->
					<div div class="modal fade" id="them" tabindex="-1"
						aria-labelledby="themLabel" aria-hidden="true">
						<div class="modal-dialog modal-xl">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="themLabel">Thêm sản phẩm</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form class="form-horizontal form-label-left">
										<div class="row text-left">
											<div class="col-md-4">
												<div class="form-group ">
													<label class="control-label">Tên</label> <input type="text"
														class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Hãng</label> <select
														name="brand" class="form-select">
														<option value="">Chọn hãng điện thoại</option>
														<option value="apple">Apple</option>
														<option value="samsung">Samsung</option>
														<option value="huawei">Huawei</option>
														<option value="xiaomi">Xiaomi</option>
														<option value="google">Google</option>
														<option value="oneplus">OnePlus</option>
													</select>
												</div>
												<div class="form-group ">
													<label class="control-label">Hệ điều hành</label> <select
														name="" class="form-select">
														<option value="">Chọn hệ điều hành</option>
														<option value="ios">iOS</option>
														<option value="android">Android</option>
														<option value="windows">Windows</option>
														<option value="blackberry">BlackBerry</option>
														<option value="kaios">KaiOS</option>
													</select>
												</div>
												<div class="form-group">
													<label class="control-label">Charging port</label> <select
														name="charging-port" class="form-select">
														<option value="">Chọn charging port</option>
														<option value="usb-c">USB-C</option>
														<option value="lightning">Lightning</option>
														<option value="micro-usb">Micro USB</option>
														<option value="wireless">Wireless</option>
														<option value="proprietary">Cổng sạc đặc biệt</option>
													</select>
												</div>
												<div class="form-group">
													<label class="control-label">Headphone jack</label> <select
														name="headphone-jack" class="form-select">
														<option value="">Chọn headphone jack</option>
														<option value="3.5mm">3.5mm</option>
														<option value="usb-c">USB-C</option>
														<option value="lightning">Lightning</option>
														<option value="none">Không có</option>
													</select>
												</div>
												<div class="form-group">
													<label class="control-label">Battery type</label> <select
														name="battery-type" class="form-select">
														<option value="">Chọn loại pin</option>
														<option value="lithium-ion">Lithium-ion</option>
														<option value="lithium-polymer">Lithium-polymer</option>
														<option value="nickel-cadmium">Nickel-cadmium</option>
														<option value="nickel-metal-hydride">Nickel-metal
															hydride</option>
														<option value="graphene">Graphene</option>
													</select>
												</div>
												<div class="form-group">
													<label class="control-label">Độ phân giải màn hình</label>
													<select name="screen-resolution" class="form-select">
														<option value="">Chọn độ phân giải</option>
														<option value="hd">HD (720p)</option>
														<option value="full-hd">Full HD (1080p)</option>
														<option value="quad-hd">Quad HD (1440p)</option>
														<option value="ultra-hd">Ultra HD (4K)</option>
														<option value="other">Khác</option>
													</select>
												</div>
												<div class="form-group">
													<label class="control-label">Chip đồ họa</label> <select
														name="gpu" class="form-select">
														<option value="">Chọn chip đồ họa</option>
														<option value="adreno">Adreno</option>
														<option value="mali">Mali</option>
														<option value="power-vr">PowerVR</option>
														<option value="apple-gpu">Apple GPU</option>
														<option value="other">Khác</option>
													</select>
												</div>
												<div class="form-group ">
													<label class="control-label">Chip</label> <input
														type="text" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Camera trước</label> <input
														type="text" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Camera sau</label> <input
														type="text" class="form-control">
												</div>
												<div class="form-group">
													<label class="control-label mb-3">Công nghệ sạc</label><br>
													<input type="checkbox" name="" id=""> Sạc nhanh <input
														type="checkbox" name="" id=""> Sạc không dây <input
														type="checkbox" name="" id=""> Sạc USB-C <input
														type="checkbox" name="" id=""> Sạc Qi
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group ">
													<label class="control-label">Chiều dài</label> <input
														type="number" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Chiều rộng</label> <input
														type="number" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Chiều cao</label> <input
														type="number" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Kích thước màng hình</label> <input
														type="text" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Trọng lượng</label> <input
														type="number" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Dung lượng pin</label> <input
														type="number" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Ram</label> <input
														type="number" step="0.1" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Tần số làm mới</label> <input
														type="number" class="form-control" placeholder="120Hz">
												</div>
												<div class="form-group ">
													<label class="control-label">Độ sáng</label> <input
														type="number" class="form-control" placeholder="120Hz">
												</div>
												<div class="form-group ">
													<label class="control-label">Quay video</label> <input
														type="text" class="form-control" placeholder="120Hz">
												</div>
												<div class="form-group ">
													<label class="control-label">Tốc độ CPU</label> <input
														type="number" class="form-control" placeholder="3.4Hz">
												</div>
												<div class="form-group ">
													<label class="control-label">Kết nối</label> <input
														type="text" class="form-control"
														placeholder="Wifi, 3G, 4G, 5G, Bluletooth">
												</div>
												<div class="form-group ">
													<label class="control-label">Mô tả</label> <input
														type="text" class="form-control">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group ">
													<label class="control-label">Ảnh 1</label> <input
														type="file" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Ảnh 2</label> <input
														type="file" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Ảnh 3</label> <input
														type="file" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Ảnh 4</label> <input
														type="file" class="form-control">
												</div>
												<div class="form-group ">
													<label class="control-label">Ảnh 5</label> <input
														type="file" class="form-control">
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
									class="table dt-responsive nowrap" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Mã</th>
											<th>Ảnh</th>
											<th>Tên</th>
											<th>Hãng</th>
											<th>Ram</th>
											<th>Kích thước màng hình</th>
											<th>Hệ điều hành</th>
											<th>Hoạt động</th>
										</tr>
									</thead>
									<tbody>
										<tr class="center">
											<td class="pt-5">001</td>
											<td><img
												src="/Admin/production/images/iphone-card-40-iphone15prohero-202309_FMT_WHH.jpg"
												height="100px" alt=""></td>
											<td class="pt-5">Iphone 15 Pro</td>
											<td class="pt-5">Apple</td>
											<td class="pt-5">8 GB</td>
											<td class="pt-5">6.7 inch</td>
											<td class="pt-5">IOS</td>
											<td class="text-center pt-5"><i
												class="fa-solid fa-pen-to-square mr-3"
												data-bs-toggle="modal" data-bs-target="#updatephone"></i> <i
												class="fa-solid fa-trash mr-3" data-bs-toggle="modal"
												data-bs-target="#delete"></i> <i
												class="fa-solid fa-mobile-screen-button"
												data-bs-toggle="collapse"
												data-bs-target="#flush-collapseOne" aria-expanded="false"
												aria-controls="flush-collapseOne"></i> <!-- Modal updatephone-->
												<div class="modal fade" id="updatephone" tabindex="-1"
													aria-labelledby="updatephoneLabel" aria-hidden="true">
													<div class="modal-dialog modal-xl">
														<div class="modal-content">
															<div class="modal-header">
																<h1 class="modal-title fs-5" id="updatephoneLabel">Cập
																	nhật</h1>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<form class="form-horizontal form-label-left">
																	<div class="row text-left">
																		<div class="col-md-4">
																			<div class="form-group ">
																				<label class="control-label">Id</label> <input
																					type="text" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Tên</label> <input
																					type="text" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Hãng</label> <select
																					name="brand" class="form-select">
																					<option value="">Chọn hãng điện thoại</option>
																					<option value="apple">Apple</option>
																					<option value="samsung">Samsung</option>
																					<option value="huawei">Huawei</option>
																					<option value="xiaomi">Xiaomi</option>
																					<option value="google">Google</option>
																					<option value="oneplus">OnePlus</option>
																				</select>
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Hệ điều hành</label> <select
																					name="" class="form-select">
																					<option value="">Chọn hệ điều hành</option>
																					<option value="ios">iOS</option>
																					<option value="android">Android</option>
																					<option value="windows">Windows</option>
																					<option value="blackberry">BlackBerry</option>
																					<option value="kaios">KaiOS</option>
																				</select>
																			</div>
																			<div class="form-group">
																				<label class="control-label">Charging port</label> <select
																					name="charging-port" class="form-select">
																					<option value="">Chọn charging port</option>
																					<option value="usb-c">USB-C</option>
																					<option value="lightning">Lightning</option>
																					<option value="micro-usb">Micro USB</option>
																					<option value="wireless">Wireless</option>
																					<option value="proprietary">Cổng sạc đặc
																						biệt</option>
																				</select>
																			</div>
																			<div class="form-group">
																				<label class="control-label">Headphone jack</label>
																				<select name="headphone-jack" class="form-select">
																					<option value="">Chọn headphone jack</option>
																					<option value="3.5mm">3.5mm</option>
																					<option value="usb-c">USB-C</option>
																					<option value="lightning">Lightning</option>
																					<option value="none">Không có</option>
																				</select>
																			</div>
																			<div class="form-group">
																				<label class="control-label">Battery type</label> <select
																					name="battery-type" class="form-select">
																					<option value="">Chọn loại pin</option>
																					<option value="lithium-ion">Lithium-ion</option>
																					<option value="lithium-polymer">Lithium-polymer</option>
																					<option value="nickel-cadmium">Nickel-cadmium</option>
																					<option value="nickel-metal-hydride">Nickel-metal
																						hydride</option>
																					<option value="graphene">Graphene</option>
																				</select>
																			</div>
																			<div class="form-group">
																				<label class="control-label">Độ phân giải
																					màn hình</label> <select name="screen-resolution"
																					class="form-select">
																					<option value="">Chọn độ phân giải</option>
																					<option value="hd">HD (720p)</option>
																					<option value="full-hd">Full HD (1080p)</option>
																					<option value="quad-hd">Quad HD (1440p)</option>
																					<option value="ultra-hd">Ultra HD (4K)</option>
																					<option value="other">Khác</option>
																				</select>
																			</div>
																			<div class="form-group">
																				<label class="control-label">Chip đồ họa</label> <select
																					name="gpu" class="form-select">
																					<option value="">Chọn chip đồ họa</option>
																					<option value="adreno">Adreno</option>
																					<option value="mali">Mali</option>
																					<option value="power-vr">PowerVR</option>
																					<option value="apple-gpu">Apple GPU</option>
																					<option value="other">Khác</option>
																				</select>
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Chip</label> <input
																					type="text" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Camera trước</label> <input
																					type="text" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Camera sau</label> <input
																					type="text" class="form-control">
																			</div>
																			<div class="form-group">
																				<label class="control-label mb-3">Công nghệ
																					sạc</label><br> <input type="checkbox" name="" id="">
																				Sạc nhanh <input type="checkbox" name="" id="">
																				Sạc không dây <input type="checkbox" name="" id="">
																				Sạc USB-C <input type="checkbox" name="" id="">
																				Sạc Qi
																			</div>
																		</div>
																		<div class="col-md-4">
																			<div class="form-group ">
																				<label class="control-label">Chiều dài</label> <input
																					type="number" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Chiều rộng</label> <input
																					type="number" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Chiều cao</label> <input
																					type="number" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Kích thước màng
																					hình</label> <input type="text" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Trọng lượng</label> <input
																					type="number" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Dung lượng pin</label>
																				<input type="number" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Ram</label> <input
																					type="number" step="0.1" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Tần số làm mới</label>
																				<input type="number" class="form-control"
																					placeholder="120Hz">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Độ sáng</label> <input
																					type="number" class="form-control"
																					placeholder="120Hz">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Quay video</label> <input
																					type="text" class="form-control"
																					placeholder="120Hz">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Tốc độ CPU</label> <input
																					type="number" class="form-control"
																					placeholder="3.4Hz">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Kết nối</label> <input
																					type="text" class="form-control"
																					placeholder="Wifi, 3G, 4G, 5G, Bluletooth">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Mô tả</label> <input
																					type="text" class="form-control">
																			</div>
																		</div>
																		<div class="col-md-4">
																			<div class="form-group ">
																				<label class="control-label">Ảnh 1</label> <input
																					type="file" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Ảnh 2</label> <input
																					type="file" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Ảnh 3</label> <input
																					type="file" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Ảnh 4</label> <input
																					type="file" class="form-control">
																			</div>
																			<div class="form-group ">
																				<label class="control-label">Ảnh 5</label> <input
																					type="file" class="form-control">
																			</div>
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
															<div class="modal-body text-left">Bạn có muốn xóa</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">Close</button>
																<button type="button" class="btn btn-danger">Delete</button>
															</div>
														</div>
													</div>
												</div></td>
										</tr>

										<tr class="" id="bienthe" tabindex="-1"
											aria-labelledby="bientheLabel" aria-hidden="true">
											<td colspan="8 row">
												<div class="accordion accordion-flush"
													id="accordionFlushExample">
													<div class="accordion-item">
														<div id="flush-collapseOne"
															class="accordion-collapse collapse"
															data-bs-parent="#accordionFlushExample">
															<div class="accordion-body">
																<div class="row">

																	<table class="table table-striped">
																		<thead>
																			<tr>
																				<th scope="col">Mã biến thể</th>
																				<th scope="col">Mã điện thoại</th>
																				<th scope="col">Màu</th>
																				<th scope="col">Bộ nhớ</th>
																				<th scope="col">Giảm</th>
																				<th scope="col">Số lượng</th>
																				<th scope="col">Giá</th>
																				<th scope="col">Hoạt động</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td>0001</td>
																				<td>001</td>
																				<td>Đen</td>
																				<td>256 GB</td>
																				<td>10%</td>
																				<td>100</td>
																				<td>30,000,000</td>
																				<td><i class="fa-solid fa-pen-to-square mr-3"
																					data-bs-toggle="modal"
																					data-bs-target="#updatebienthe"></i> <i
																					class="fa-solid fa-trash mr-3"
																					data-bs-toggle="modal"
																					data-bs-target="#deletebienthe"></i></td>
																				<!-- Modal updatebienthe-->
																				<div class="modal fade" id="updatebienthe"
																					tabindex="-1" aria-labelledby="updatebientheLabel"
																					aria-hidden="true">
																					<div class="modal-dialog modal-lg">
																						<div class="modal-content">
																							<div class="modal-header">
																								<h1 class="modal-title fs-5"
																									id="updatebientheLabel">Cập nhật</h1>
																								<button type="button" class="btn-close"
																									data-bs-dismiss="modal" aria-label="Close"></button>
																							</div>
																							<div class="modal-body">
																								<form class="form-horizontal form-label-left">
																									<div class="row text-left">

																										<div class="form-group ">
																											<label class="control-label">Mã biến
																												thể</label> <input type="text" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Mã phone</label>
																											<input type="text" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Màu</label> <select
																												name="brand" class="form-select">
																												<option value="">Chọn</option>
																												<option value="apple">Trắng</option>
																												<option value="samsung">Đen</option>
																												<option value="huawei">Xanh</option>
																												<option value="xiaomi">Đỏ</option>
																												<option value="google">Vàng</option>
																												<option value="oneplus">Tím</option>
																											</select>
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Bộ nhớ
																												trong</label> <select name="brand"
																												class="form-select">
																												<option value="">Chọn</option>
																												<option value="apple">32 GB</option>
																												<option value="samsung">64 GB</option>
																												<option value="huawei">128 GB</option>
																												<option value="xiaomi">256 GB</option>
																												<option value="google">512 GB</option>
																												<option value="oneplus">1 TB</option>
																											</select>
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Phần
																												trăm giảm</label> <input type="number"
																												class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Ngày bắt
																												đầu</label> <input type="date" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Ngày kết
																												thúc</label> <input type="date" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Số lương</label>
																											<input type="text" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Giá</label> <input
																												type="text" class="form-control">
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
																				</div>
																				<!-- Modal deletebienthe-->
																				<div class="modal fade" id="deletebienthe"
																					tabindex="-1" aria-labelledby="deletebientheLabel"
																					aria-hidden="true">
																					<div class="modal-dialog">
																						<div class="modal-content">
																							<div class="modal-header">
																								<h1 class="modal-title fs-5"
																									id="deletebientheLabel">Xác nhận xóa biến
																									thể</h1>
																								<button type="button" class="btn-close"
																									data-bs-dismiss="modal" aria-label="Close"></button>
																							</div>
																							<div class="modal-body text-left">Bạn có
																								muốn xóa biến thể 0001</div>
																							<div class="modal-footer">
																								<button type="button" class="btn btn-secondary"
																									data-bs-dismiss="modal">Close</button>
																								<button type="button" class="btn btn-danger">deletebienthe</button>
																							</div>
																						</div>
																					</div>
																				</div>
																			</tr>
																			<tr>
																				<td>0002</td>
																				<td>001</td>
																				<td>Đen</td>
																				<td>512 GB</td>
																				<td>10%</td>
																				<td>100</td>
																				<td>33,000,000</td>
																				<td><i class="fa-solid fa-pen-to-square mr-3"
																					data-bs-toggle="modal"
																					data-bs-target="#updatebienthe"></i> <i
																					class="fa-solid fa-trash mr-3"
																					data-bs-toggle="modal"
																					data-bs-target="#deletebienthe"></i></td>
																				<!-- Modal updatebienthe-->
																				<div class="modal fade" id="updatebienthe"
																					tabindex="-1" aria-labelledby="updatebientheLabel"
																					aria-hidden="true">
																					<div class="modal-dialog modal-lg">
																						<div class="modal-content">
																							<div class="modal-header">
																								<h1 class="modal-title fs-5"
																									id="updatebientheLabel">Cập nhật</h1>
																								<button type="button" class="btn-close"
																									data-bs-dismiss="modal" aria-label="Close"></button>
																							</div>
																							<div class="modal-body">
																								<form class="form-horizontal form-label-left">
																									<div class="row text-left">

																										<div class="form-group ">
																											<label class="control-label">Mã biến
																												thể</label> <input type="text" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Mã phone</label>
																											<input type="text" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Màu</label> <select
																												name="brand" class="form-select">
																												<option value="">Chọn</option>
																												<option value="apple">Trắng</option>
																												<option value="samsung">Đen</option>
																												<option value="huawei">Xanh</option>
																												<option value="xiaomi">Đỏ</option>
																												<option value="google">Vàng</option>
																												<option value="oneplus">Tím</option>
																											</select>
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Bộ nhớ
																												trong</label> <select name="brand"
																												class="form-select">
																												<option value="">Chọn</option>
																												<option value="apple">32 GB</option>
																												<option value="samsung">64 GB</option>
																												<option value="huawei">128 GB</option>
																												<option value="xiaomi">256 GB</option>
																												<option value="google">512 GB</option>
																												<option value="oneplus">1 TB</option>
																											</select>
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Phần
																												trăm giảm</label> <input type="number"
																												class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Ngày bắt
																												đầu</label> <input type="date" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Ngày kết
																												thúc</label> <input type="date" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Số lương</label>
																											<input type="text" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Giá</label> <input
																												type="text" class="form-control">
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
																				</div>
																				<!-- Modal deletebienthe-->
																				<div class="modal fade" id="deletebienthe"
																					tabindex="-1" aria-labelledby="deletebientheLabel"
																					aria-hidden="true">
																					<div class="modal-dialog">
																						<div class="modal-content">
																							<div class="modal-header">
																								<h1 class="modal-title fs-5"
																									id="deletebientheLabel">Xác nhận xóa biến
																									thể</h1>
																								<button type="button" class="btn-close"
																									data-bs-dismiss="modal" aria-label="Close"></button>
																							</div>
																							<div class="modal-body text-left">Bạn có
																								muốn xóa biến thể 0001</div>
																							<div class="modal-footer">
																								<button type="button" class="btn btn-secondary"
																									data-bs-dismiss="modal">Close</button>
																								<button type="button" class="btn btn-danger">deletebienthe</button>
																							</div>
																						</div>
																					</div>
																				</div>
																			</tr>
																			<tr>
																				<td>0002</td>
																				<td>001</td>
																				<td>Đen</td>
																				<td>1 TB</td>
																				<td>10%</td>
																				<td>100</td>
																				<td>35,000,000</td>
																				<td><i class="fa-solid fa-pen-to-square mr-3"
																					data-bs-toggle="modal"
																					data-bs-target="#updatebienthe"></i> <i
																					class="fa-solid fa-trash mr-3"
																					data-bs-toggle="modal"
																					data-bs-target="#deletebienthe"></i></td>
																				<!-- Modal updatebienthe-->
																				<div class="modal fade" id="updatebienthe"
																					tabindex="-1" aria-labelledby="updatebientheLabel"
																					aria-hidden="true">
																					<div class="modal-dialog modal-lg">
																						<div class="modal-content">
																							<div class="modal-header">
																								<h1 class="modal-title fs-5"
																									id="updatebientheLabel">Cập nhật</h1>
																								<button type="button" class="btn-close"
																									data-bs-dismiss="modal" aria-label="Close"></button>
																							</div>
																							<div class="modal-body">
																								<form class="form-horizontal form-label-left">
																									<div class="row text-left">

																										<div class="form-group ">
																											<label class="control-label">Mã biến
																												thể</label> <input type="text" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Mã phone</label>
																											<input type="text" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Màu</label> <select
																												name="brand" class="form-select">
																												<option value="">Chọn</option>
																												<option value="apple">Trắng</option>
																												<option value="samsung">Đen</option>
																												<option value="huawei">Xanh</option>
																												<option value="xiaomi">Đỏ</option>
																												<option value="google">Vàng</option>
																												<option value="oneplus">Tím</option>
																											</select>
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Bộ nhớ
																												trong</label> <select name="brand"
																												class="form-select">
																												<option value="">Chọn</option>
																												<option value="apple">32 GB</option>
																												<option value="samsung">64 GB</option>
																												<option value="huawei">128 GB</option>
																												<option value="xiaomi">256 GB</option>
																												<option value="google">512 GB</option>
																												<option value="oneplus">1 TB</option>
																											</select>
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Phần
																												trăm giảm</label> <input type="number"
																												class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Ngày bắt
																												đầu</label> <input type="date" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Ngày kết
																												thúc</label> <input type="date" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Số lương</label>
																											<input type="text" class="form-control">
																										</div>
																										<div class="form-group ">
																											<label class="control-label">Giá</label> <input
																												type="text" class="form-control">
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
																				</div>
																				<!-- Modal deletebienthe-->
																				<div class="modal fade" id="deletebienthe"
																					tabindex="-1" aria-labelledby="deletebientheLabel"
																					aria-hidden="true">
																					<div class="modal-dialog">
																						<div class="modal-content">
																							<div class="modal-header">
																								<h1 class="modal-title fs-5"
																									id="deletebientheLabel">Xác nhận xóa biến
																									thể</h1>
																								<button type="button" class="btn-close"
																									data-bs-dismiss="modal" aria-label="Close"></button>
																							</div>
																							<div class="modal-body text-left">Bạn có
																								muốn xóa biến thể 0001</div>
																							<div class="modal-footer">
																								<button type="button" class="btn btn-secondary"
																									data-bs-dismiss="modal">Close</button>
																								<button type="button" class="btn btn-danger">deletebienthe</button>
																							</div>
																						</div>
																					</div>
																				</div>
																			</tr>
																		</tbody>
																	</table>
																	<button type="button" class="btn btn-primary"
																		data-bs-toggle="modal" data-bs-target="#thembienthe">Thêm
																		biến thể mới</button>
																	<!-- Modal Thêm biến thể -->
																	<div div class="modal fade" id="thembienthe"
																		tabindex="-1" aria-labelledby="thembientheLabel"
																		aria-hidden="true">
																		<div class="modal-dialog modal-lg">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h1 class="modal-title fs-5" id="thembientheLabel">
																						Thêm biến thể</h1>
																					<button type="button" class="btn-close"
																						data-bs-dismiss="modal" aria-label="Close"></button>
																				</div>
																				<div class="modal-body">
																					<form class="form-horizontal form-label-left">
																						<div class="row text-left">
																							<div class="form-group ">
																								<label class="control-label">Mã phone</label> <input
																									type="text" class="form-control">
																							</div>
																							<div class="form-group ">
																								<label class="control-label">Màu</label> <select
																									name="brand" class="form-select">
																									<option value="">Chọn</option>
																									<option value="apple">Trắng</option>
																									<option value="samsung">Đen</option>
																									<option value="huawei">Xanh</option>
																									<option value="xiaomi">Đỏ</option>
																									<option value="google">Vàng</option>
																									<option value="oneplus">Tím</option>
																								</select>
																							</div>
																							<div class="form-group ">
																								<label class="control-label">Bộ nhớ
																									trong</label> <select name="brand" class="form-select">
																									<option value="">Chọn</option>
																									<option value="apple">32 GB</option>
																									<option value="samsung">64 GB</option>
																									<option value="huawei">128 GB</option>
																									<option value="xiaomi">256 GB</option>
																									<option value="google">512 GB</option>
																									<option value="oneplus">1 TB</option>
																								</select>
																							</div>
																							<div class="form-group ">
																								<label class="control-label">Phần trăm
																									giảm</label> <input type="number" class="form-control">
																							</div>
																							<div class="form-group ">
																								<label class="control-label">Ngày bắt
																									đầu</label> <input type="date" class="form-control">
																							</div>
																							<div class="form-group ">
																								<label class="control-label">Ngày kết
																									thúc</label> <input type="date" class="form-control">
																							</div>
																							<div class="form-group ">
																								<label class="control-label">Số lương</label> <input
																									type="text" class="form-control">
																							</div>
																							<div class="form-group ">
																								<label class="control-label">Giá</label> <input
																									type="text" class="form-control">
																							</div>
																						</div>
																					</form>
																				</div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-secondary"
																						data-bs-dismiss="modal">Close</button>
																					<button type="button" class="btn btn-primary">
																						Create</button>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
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
