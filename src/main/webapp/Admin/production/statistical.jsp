<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
	<div class="row">
		<div class="col-md-3 p-2 custom-rounded">
			<div class="card w-100 p-4" style="border-radius: 15px;">
				<h2 class="ml-2">
					<b>Tổng doanh thu</b>
				</h2>
				<hr>
				<h1 class="ml-2">
					<b><fmt:formatNumber pattern="###,###">${sumRevenue}</fmt:formatNumber></b>
				</h1>
			</div>
		</div>
		<div class="col-md-3 p-2">
			<div class="card w-100 p-4 custom-rounded">
				<h2 class="ml-2">
					<b>Tổng đơn hàng</b>
				</h2>
				<hr>
				<h1 class="ml-2">
					<b><fmt:formatNumber pattern="###,###">${countOrder}</fmt:formatNumber></b>
				</h1>
			</div>
		</div>
		<div class="col-md-3 p-2">
			<div class="card w-100 p-4 custom-rounded">
				<h2 class="ml-2">
					<b>Tổng số lượng sản phẩm</b>
				</h2>
				<hr>
				<h1 class="ml-2">
					<b><fmt:formatNumber pattern="###,###">${totalSumProducts}</fmt:formatNumber></b>
				</h1>
			</div>
		</div>
		<div class="col-md-3 p-2">
			<div class="card w-100 p-4 custom-rounded">
				<h2 class="ml-2">
					<b>Tổng người dùng</b>
				</h2>
				<hr>
				<h1 class="ml-2">
					<b><fmt:formatNumber pattern="###,###">${countUsers }</fmt:formatNumber></b>
				</h1>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 col-sm-12 ">
			<h1 class="text-center">Doanh thu</h1>
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
						data-bs-target="#home-tab-pane" type="button" role="tab"
						aria-controls="home-tab-pane" aria-selected="true">Ngày</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#profile-tab-pane" type="button" role="tab"
						aria-controls="profile-tab-pane" aria-selected="false">Tháng</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#nam" type="button" role="tab"
						aria-controls="profile-tab-pane" aria-selected="false">Năm</button>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home-tab-pane"
					role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<div class="row">
						<div class="container">
							<canvas id="columnChartday"></canvas>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
					aria-labelledby="profile-tab" tabindex="0">
					<div class="container">
						<canvas id="columnChart"></canvas>
					</div>
				</div>
				<div class="tab-pane fade" id="nam" role="tabpanel"
					aria-labelledby="profile-tab" tabindex="0">
					<div class="container">
						<canvas id="columnChartyear"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 col-sm-12 ">
			<h1 class="text-center">Sản phẩm bán chạy</h1>
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
										<table class="table dt-responsive nowrap text-center"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>Mã</th>
													<th>Ảnh</th>
													<th>Tên sản phẩm</th>
													<th>Hãng</th>
													<th>Kích thước</th>
													<th>Dung lượng lưu trữ</th>
													<th>Dung lượng pin</th>
													<th>Độ phân giải</th>
													<th>Độ mượt</th>
													<th>Số lượng</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${getTop7Quantity}">
													<tr>
														<td class="pt-5">${item[0]}</td>
														<td><img src="/Admin/production/images/${item[1]}"
												height="100px" alt=""></td>
														<td class="pt-5">${item[2]}</td>
														<td class="pt-5">${item[3]} </td>
														<td class="pt-5">${item[4]} inch</td>
														<td class="pt-5">${item[5]} GB</td>
														<td class="pt-5">${item[6]} mA</td>
														<td class="pt-5">${item[7]}</td>
														<td class="pt-5">${item[8]} Hz</td>
														<td class="pt-5">${item[9]}</td>
													</tr>
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
		</div>
	</div>
</body>
</html>