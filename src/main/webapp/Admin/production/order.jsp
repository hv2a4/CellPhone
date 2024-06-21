<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<body>
	<div class="row">
		<div class="col-md-12 col-sm-12 ">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
						data-bs-target="#home-tab-pane" type="button" role="tab"
						aria-controls="home-tab-pane" aria-selected="true"
						style="width: 150px">
						<span style="font-size: 15px;">Tất cả đơn hàng</span>
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#profile-tab-pane" type="button" role="tab"
						aria-controls="profile-tab-pane" aria-selected="false"
						style="width: 150px">
						<span style="font-size: 15px;">Chờ xác nhận</span>
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
						data-bs-target="#contact-tab-pane" type="button" role="tab"
						aria-controls="contact-tab-pane" aria-selected="false"
						style="width: 150px">
						<span style="font-size: 15px;">Đã xác nhận</span>
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="dangvanchuyen-tab"
						data-bs-toggle="tab" data-bs-target="#dangvanchuyen" type="button"
						role="tab" aria-controls="dangvanchuyen" aria-selected="false"
						style="width: 150px">
						<span style="font-size: 15px;">Đang giao</span>
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="hoanthanh-tab" data-bs-toggle="tab"
						data-bs-target="#hoanthanh" type="button" role="tab"
						aria-controls="hoanthanh" aria-selected="false"
						style="width: 150px">
						<span style="font-size: 15px;">Hoàn thành</span>
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="trahang-tab" data-bs-toggle="tab"
						data-bs-target="#trahang" type="button" role="tab"
						aria-controls="trahang" aria-selected="false" style="width: 150px">
						<span style="font-size: 15px;">Trả hàng</span>
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="dahuy-tab" data-bs-toggle="tab"
						data-bs-target="#dahuy" type="button" role="tab"
						aria-controls="dahuy" aria-selected="false" style="width: 150px">
						<span style="font-size: 15px;">Đã hủy</span>
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="choxacnhantrahang-tab"
						data-bs-toggle="tab" data-bs-target="#choxacnhantrahang"
						type="button" role="tab" aria-controls="choxacnhantrahang"
						aria-selected="false" style="width: 150px">
						<span style="font-size: 15px;">Chờ xác nhận trả</span>
					</button>
				</li>
			</ul>

			<div class="tab-content" id="myTabContent">
				<!-- Danh Sách Tất Cả Đơn Hàng -->
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
												<table id=""
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
														<c:forEach var="item" items="${pageOrder.content}"
															varStatus="loop">
															<tr>
																<td>DK<fmt:formatDate value="${item.UPDATE_AT}"
																		pattern="yyyy-MM-dd" />${loop.index +1}
																</td>
																<td>${item.user.FULLNAME}</td>
																<td><fmt:formatNumber type="number"
																		currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
																<td><fmt:formatDate value="${item.UPDATE_AT}"
																		pattern="yyyy-MM-dd HH:mm:ss" /></td>
																<!-- Trạng thái giao hàng -->
																<td><c:choose>
																		<c:when
																			test="${item.status_order.STATUS == 'Hoàn thành'}">
																			<span class="badge rounded-pill"
																				style="width: 200px; background-color: #4caf50; color: white; font-size: 15px">
																				Hoàn thành </span>
																		</c:when>
																		<c:when
																			test="${item.status_order.STATUS == 'Chờ xác nhận'}">
																			<span class="badge rounded-pill"
																				style="width: 200px; background-color: #ffeb3b; color: black; font-size: 15px">
																				Chờ xác nhận </span>
																		</c:when>
																		<c:when
																			test="${item.status_order.STATUS == 'Đã xác nhận'}">
																			<span class="badge rounded-pill"
																				style="width: 200px; background-color: #2196f3; color: white; font-size: 15px">
																				Đã xác nhận </span>
																		</c:when>
																		<c:when
																			test="${item.status_order.STATUS == 'Giao hàng'}">
																			<span class="badge rounded-pill"
																				style="width: 200px; background-color: #ff9800; color: white; font-size: 15px">
																				Giao hàng </span>
																		</c:when>
																		<c:when test="${item.status_order.STATUS == 'Hủy'}">
																			<span class="badge rounded-pill"
																				style="width: 200px; background-color: #f44336; color: white; font-size: 15px">
																				Hủy </span>
																		</c:when>
																		<c:when
																			test="${item.status_order.STATUS == 'Trả hàng'}">
																			<span class="badge rounded-pill"
																				style="width: 200px; background-color: #9e9e9e; color: white; font-size: 15px">
																				Trả hàng </span>
																		</c:when>
																		<c:when
																			test="${item.status_order.STATUS == 'Chờ xác nhận trả'}">
																			<span class="badge rounded-pill"
																				style="width: 200px; background-color: #9e9e9e; color: white; font-size: 15px">
																				Chờ xác nhận trả hàng </span>
																		</c:when>
																	</c:choose></td>
																<!-- Hoạt động -->
																<td class="text-center"><c:choose>
																		<c:when
																			test="${item.status_order.STATUS == 'Hoàn thành'}">
																			<button type="button" class="btn"
																				data-bs-toggle="modal"
																				data-bs-target="#exampleModal_${loop.index + 1}"
																				style="width: 120px; background-color: #28a745; color: white; font-size: 15px;">
																				Chi tiết</button>
																		</c:when>
																		<c:when
																			test="${item.status_order.STATUS == 'Chờ xác nhận'}">
																			<button class="btn"
																				onclick="confirmation(${item.ID})"
																				style="width: 120px; background-color: #ffc107; color: black;">
																				Xác Nhận</button>
																		</c:when>
																		<c:when
																			test="${item.status_order.STATUS == 'Đã xác nhận'}">
																			<button class="btn" onclick="delivery(${item.ID})"
																				style="width: 120px; background-color: #17a2b8; color: whitesmoke;">
																				Giao hàng</button>
																		</c:when>
																		<c:when
																			test="${item.status_order.STATUS == 'Giao hàng'}">
																			<button class="btn" onclick="completed(${item.ID})"
																				style="width: 120px; background-color: #007bff; color: white;">
																				Hoàn tất</button>
																		</c:when>
																		<c:when test="${item.status_order.STATUS == 'Hủy'}">
																			<button type="button" class="btn"
																				data-bs-toggle="modal"
																				data-bs-target="#xemlydo_${loop.index + 1}"
																				style="width: 120px; background-color: #dc3545; color: white;">
																				Lý do</button>
																		</c:when>
																		<c:when
																			test="${item.status_order.STATUS == 'Trả hàng'}">
																			<button class="btn btn-dark"
																				onclick="returns(${item.ID})" style="width: 120px;">
																				Đã nhận</button>
																		</c:when>
																		<c:when
																			test="${item.status_order.STATUS == 'Chờ xác nhận trả'}">
																			<button class="btn btn-dark"
																				onclick="xacNhanTraHang(${item.ID})"
																				style="width: 120px;">Xác nhận trả</button>
																		</c:when>
																	</c:choose></td>
															</tr>
															<!-- Chi tiết đơn hàng -->
															<div class="modal fade"
																id="exampleModal_${loop.index + 1}" tabindex="-1"
																aria-labelledby="exampleModalLabel_${loop.index + 1}"
																aria-hidden="true">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h1 class="modal-title fs-5 fw-bold"
																				id="exampleModalLabel_${loop.index + 1}">Chi
																				tiết</h1>
																			<button type="button" class="btn-close"
																				data-bs-dismiss="modal" aria-label="Close"></button>
																		</div>
																		<div class="modal-body">
																			<h2>Tên: ${item.user.FULLNAME}</h2>
																			<h2>Trạng thái: ${item.status_order.STATUS}</h2>
																			<h2>Địa chỉ: ${item.address.ADDRESS}</h2>
																			<h2>Phương thức thanh toán:
																				${item.payment_method.NAME}</h2>
																			<h2>Tổng giảm giá: <fmt:formatNumber type="number" currencyCode="VND"
																						value="${item.TOTAL_DISCOUNT}" /></h2>
																			<h2>
																				Tổng tiền:
																				<fmt:formatNumber type="number" currencyCode="VND"
																					value="${item.TOTAL_AMOUNT}" />
																			</h2>
																			<h2>Ngày tạo: ${item.CREATE_AT}</h2>
																			<h2>
																				Ngày cập nhật:
																				<fmt:formatDate value="${item.UPDATE_AT}"
																					pattern="yyyy-MM-dd HH:mm:ss" />
																			</h2>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-primary"
																				data-bs-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div>
															<!-- Lý do hủy đơn hàng -->
															<div class="modal fade" id="xemlydo_${loop.index + 1}"
																tabindex="-1"
																aria-labelledby="exampleModalLabel_${loop.index + 1}"
																aria-hidden="true">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h1 class="modal-title fs-5 fw-bold"
																				id="exampleModalLabel_${loop.index + 1}">Xem lý
																				do</h1>
																			<button type="button" class="btn-close"
																				data-bs-dismiss="modal" aria-label="Close">
																			</button>
																		</div>
																		<div class="modal-body">
																			<h2>${item.user.USERNAME}-${item.user.FULLNAME}</h2>
																			<br>
																			<p>${item.REASON}</p>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-primary"
																				data-bs-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div>
														</c:forEach>
													</tbody>
												</table>
												<!-- Phân Trang -->
												<c:if test="${pageOrder.totalPages!=1}">
													<div class="text-right">
														<c:forEach var="item" begin="1"
															end="${pageOrder.totalPages}" step="1">
															<a class="btn btn-primary"
																href="/admin/order?pages=${item}">${item}</a>
														</c:forEach>
													</div>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Chờ xác nhận -->
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
												<table id=""
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
														<c:forEach var="item" varStatus="loop"
															items="${confirmations}">
															<c:if
																test="${item.status_order.STATUS == 'Chờ xác nhận'}">
																<tr>
																	<td>DK<fmt:formatDate value="${item.UPDATE_AT}"
																			pattern="yyyyMMdd" />${loop.index +1}
																	</td>
																	<td>${item.user.FULLNAME}</td>
																	<td><fmt:formatNumber type="number"
																			currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
																	<td>${item.CREATE_AT}</td>
																	<td><span class="badge rounded-pill"
																		style="width: 120px; background-color: #ffeb3b; color: black; font-size: 15px;">
																			Chờ xác nhận </span></td>
																	<td class="text-center">
																		<button class="btn" onclick="confirmation(${item.ID})"
																			style="width: 120px; background-color: #ffc107; color: black;">
																			Xác Nhận</button>
																	</td>
																</tr>
															</c:if>
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

				<!-- Đã xác nhận -->
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
												<table id=""
													class="table table-striped table-bordered dt-responsive nowrap"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Mã đơn hàng</th>
															<th>Tên người đặt</th>
															<th>Tổng tiền</th>
															<th>Ngày xác nhận</th>
															<th>Trạng thái</th>
															<th>Hoạt động</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="item" varStatus="loop"
															items="${confirmations}">
															<c:if test="${item.status_order.STATUS == 'Đã xác nhận'}">
																<tr>
																	<td>DK<fmt:formatDate value="${item.UPDATE_AT}"
																			pattern="yyyyMMdd" />${loop.index +1}
																	</td>
																	<td>${item.user.FULLNAME}</td>
																	<td><fmt:formatNumber type="number"
																			currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
																	<td>${item.UPDATE_AT}</td>
																	<td><span class="badge rounded-pill"
																		style="width: 100px; background-color: #2196f3; color: white; font-size: 15px;">
																			Đã xác nhận </span></td>
																	<td class="text-center">
																		<button class="btn" onclick="delivery(${item.ID})"
																			style="width: 100px; background-color: #17a2b8; color: whitesmoke;">
																			Giao hàng</button>
																	</td>
																</tr>
															</c:if>
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

				<!-- Đang giao hàng -->
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
												<table id=""
													class="table table-striped table-bordered dt-responsive nowrap"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Mã đơn hàng</th>
															<th>Tên người đặt</th>
															<th>Tổng tiền</th>
															<th>Ngày giao</th>
															<th>Trạng thái</th>
															<th class="text-center">Hoạt động</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="item" varStatus="loop"
															items="${confirmations}">
															<c:if test="${item.status_order.STATUS == 'Giao hàng'}">
																<tr>
																	<td>DK<fmt:formatDate value="${item.UPDATE_AT}"
																			pattern="yyyyMMdd" />${loop.index +1}
																	</td>
																	<td>${item.user.FULLNAME}</td>
																	<td><fmt:formatNumber type="number"
																			currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
																	<td><fmt:formatDate value="${item.UPDATE_AT}"
																			pattern="yyyy-MM-dd HH:mm:ss" /></td>
																	<td><span class="badge rounded-pill"
																		style="width: 100px; background-color: #007bff; color: white; font-size: 15px;">
																			Giao hàng </span></td>
																	<td class="text-center">
																		<button class="btn" onclick="completed(${item.ID})"
																			style="width: 100px; background-color: #007bff; color: white;">
																			Hoàn tất</button>
																	</td>
																</tr>
															</c:if>
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

				<!-- Đã giao xong -->
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
												<table id=""
													class="table table-striped table-bordered dt-responsive nowrap"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Mã đơn hàng</th>
															<th>Tên người đặt</th>
															<th>Tổng tiền</th>
															<th>Ngày hoàn thành</th>
															<th>Trạng thái</th>
															<td>Hoạt động</td>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="item" varStatus="loop"
															items="${confirmations}">
															<c:if test="${item.status_order.STATUS == 'Hoàn thành'}">
																<tr>
																	<td>DK<fmt:formatDate value="${item.UPDATE_AT}"
																			pattern="yyyyMMdd" />${loop.index +1}
																	</td>
																	<td>${item.user.FULLNAME}</td>
																	<td><fmt:formatNumber type="number"
																			currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
																	<td><fmt:formatDate value="${item.UPDATE_AT}"
																			pattern="yyyy-MM-dd HH:mm:ss" /></td>
																	<td><span class="badge rounded-pill"
																		style="width: 100px; background-color: #4caf50; color: white; font-size: 15px;">
																			Hoàn thành </span></td>
																	<td class="text-center">
																		<button type="button" class="btn"
																			data-bs-toggle="modal"
																			data-bs-target="#exampleModals_${loop.index + 1}"
																			style="background-color: #28a745; color: white; font-size: 15px;">
																			Chi tiết</button>
																	</td>
																</tr>
																<div class="modal fade"
																	id="exampleModals_${loop.index + 1}" tabindex="-1"
																	aria-labelledby="exampleModalLabels_${loop.index + 1}"
																	aria-hidden="true">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h1 class="modal-title fs-5 fw-bold"
																					id="exampleModalLabels_${loop.index + 1}">Chi
																					tiết</h1>
																				<button type="button" class="btn-close"
																					data-bs-dismiss="modal" aria-label="Close">
																				</button>
																			</div>
																			<div class="modal-body">
																				<h2>Tên: ${item.user.FULLNAME}</h2>
																				<h2>Trạng thái: ${item.status_order.STATUS}</h2>
																				<h2>Địa chỉ: ${item.address.ADDRESS}</h2>
																				<h2>Phương thức thanh toán:
																					${item.payment_method.NAME}</h2>
																				<h2>
																					Tổng giảm giá:
																					<fmt:formatNumber type="number" pattern="###,###"
																						value="${item.TOTAL_DISCOUNT}" />
																				</h2>
																				<h2>
																					Tổng tiền:
																					<fmt:formatNumber type="number" currencyCode="VND"
																						value="${item.TOTAL_AMOUNT}" />
																				</h2>
																				<h2>Ngày tạo: ${item.CREATE_AT}</h2>
																				<h2>
																					Ngày cập nhật:
																					<fmt:formatDate value="${item.UPDATE_AT}"
																						pattern="yyyy-MM-dd HH:mm:ss" />
																				</h2>
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-primary"
																					data-bs-dismiss="modal">Close</button>
																			</div>
																		</div>
																	</div>
																</div>
															</c:if>
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

				<!-- Trả hàng -->
				<div class="tab-pane fade" id="trahang" role="tabpanel"
					aria-labelledby="trahang-tab" tabindex="0">
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
												<table id=""
													class="table table-striped table-bordered dt-responsive nowrap"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Mã đơn hàng</th>
															<th>Tên người đặt</th>
															<th>Tổng tiền</th>
															<th>Ngày trả</th>
															<th>Trạng thái</th>
															<th>Hoạt động</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="item" varStatus="loop"
															items="${confirmations}">
															<c:if test="${item.status_order.STATUS == 'Trả hàng'}">
																<tr>
																	<td>DK<fmt:formatDate value="${item.UPDATE_AT}"
																			pattern="yyyyMMdd" />${loop.index +1}
																	</td>
																	<td>${item.user.FULLNAME}</td>
																	<td><fmt:formatNumber type="number"
																			currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
																	<td><fmt:formatDate value="${item.UPDATE_AT}"
																			pattern="yyyy-MM-dd HH:mm:ss" /></td>
																	<td><span class="badge rounded-pill"
																		style="width: 100px; background-color: #9e9e9e; color: white; font-size: 15px;">
																			Trả hàng </span></td>
																	<td class="text-center">
																		<button class="btn btn-dark"
																			onclick="returns(${item.ID})" style="width: 100px;">
																			Đã nhận</button>
																	</td>
																</tr>
															</c:if>
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

				<!-- Đã hủy -->
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
												<table id=""
													class="table table-striped table-bordered dt-responsive nowrap"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Mã đơn hàng</th>
															<th>Tên người đặt</th>
															<th>Tổng tiền</th>
															<th>Ngày hủy</th>
															<th>Trạng thái</th>
															<th>Lý do</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="item" varStatus="loop"
															items="${confirmations}">
															<c:if test="${item.status_order.STATUS == 'Hủy'}">
																<tr>
																	<td>DK<fmt:formatDate value="${item.UPDATE_AT}"
																			pattern="yyyyMMdd" />${loop.index +1}
																	</td>
																	<td>${item.user.FULLNAME}</td>
																	<td><fmt:formatNumber type="number"
																			currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
																	<td><fmt:formatDate value="${item.UPDATE_AT}"
																			pattern="yyyy-MM-dd HH:mm:ss" /></td>
																	<td><span class="badge rounded-pill"
																		style="width: 100px; background-color: #f44336; color: white; font-size: 15px;">
																			Hủy </span></td>
																	<td class="text-center">
																		<button type="button" class="btn"
																			data-bs-toggle="modal"
																			data-bs-target="#xemlydos_${loop.index + 1}"
																			style="background-color: #dc3545; color: white; font-size: 15px;">
																			Lý do</button>
																	</td>
																</tr>
																<!-- Lý do trả hàng -->
																<div class="modal fade" id="xemlydos_${loop.index + 1}"
																	tabindex="-1"
																	aria-labelledby="exampleModalLabel_${loop.index + 1}"
																	aria-hidden="true">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h1 class="modal-title fs-5 fw-bold"
																					id="exampleModalLabel_${loop.index + 1}">Xem
																					lý do</h1>
																				<button type="button" class="btn-close"
																					data-bs-dismiss="modal" aria-label="Close">
																				</button>
																			</div>
																			<div class="modal-body">
																				<h2>${item.user.USERNAME}-${item.user.FULLNAME}</h2>
																				<br>
																				<p>${item.REASON}</p>
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-primary"
																					data-bs-dismiss="modal">Close</button>
																			</div>
																		</div>
																	</div>
																</div>
															</c:if>
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

				<!-- Chờ xác nhận trả hàng -->
				<div class="tab-pane fade" id="choxacnhantrahang" role="tabpanel"
					aria-labelledby="choxacnhantrahang-tab" tabindex="0">
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
												<table id=""
													class="table table-striped table-bordered dt-responsive nowrap"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Mã đơn hàng</th>
															<th>Tên người đặt</th>
															<th>Tổng tiền</th>
															<th>Ngày hủy</th>
															<th>Trạng thái</th>
															<th>Lý do</th>
															<th>Hoạt động</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="item" varStatus="loop"
															items="${confirmations}">
															<c:if
																test="${item.status_order.STATUS == 'Chờ xác nhận trả'}">
																<tr>
																	<td>DK<fmt:formatDate value="${item.UPDATE_AT}"
																			pattern="yyyyMMdd" />${loop.index +1}
																	</td>
																	<td>${item.user.FULLNAME}</td>
																	<td><fmt:formatNumber type="number"
																			currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
																	<td><fmt:formatDate value="${item.UPDATE_AT}"
																			pattern="yyyy-MM-dd HH:mm:ss" /></td>
																	<td><span class="badge rounded-pill"
																		style="width: 120px; background-color: #ffeb3b; color: white; font-size: 15px;">
																			Chờ xác nhận </span></td>
																	<td class="text-center">
																		<button type="button" class="btn"
																			style="width: 120px; background-color: #ffeb3b; color: white;"
																			data-bs-toggle="modal"
																			data-bs-target="#xemlydotrahang_${loop.index + 1}">
																			Lý do</button>
																	</td>
																	<td class="text-center">
																		<button type="button" class="btn"
																			onclick="xacNhanTraHang(${item.ID})"
																			style="width: 120px; background-color: #ffc107; color: black;">
																			Xác nhận</button>
																	</td>
																</tr>
																<!-- Xem lý do trả hàng -->
																<div class="modal fade"
																	id="xemlydotrahang_${loop.index + 1}" tabindex="-1"
																	aria-labelledby="exampleModalLabel_${loop.index + 1}"
																	aria-hidden="true">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h1 class="modal-title fs-5 fw-bold"
																					id="exampleModalLabel_${loop.index + 1}">Xem
																					lý do</h1>
																				<button type="button" class="btn-close"
																					data-bs-dismiss="modal" aria-label="Close">
																				</button>
																			</div>
																			<div class="modal-body">
																				<h2>${item.user.USERNAME}-${item.user.FULLNAME}</h2>
																				<br>
																				<p>${item.REASON}</p>
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-primary"
																					data-bs-dismiss="modal">Close</button>
																			</div>
																		</div>
																	</div>
																</div>
															</c:if>
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
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
    function changeTab(index) {
        // Lấy tất cả các tab và các tab nội dung
        const tabElements = document.querySelectorAll('.nav-link');
        const tabContentElements = document.querySelectorAll('.tab-pane');

        // Xóa lớp active từ các tab và tab nội dung hiện tại
        tabElements.forEach(tab => tab.classList.remove('active'));
        tabContentElements.forEach(content => content.classList.remove('show', 'active'));

        // Thêm lớp active vào tab và tab nội dung được chọn
        tabElements[index].classList.add('active');
        tabContentElements[index].classList.add('show', 'active');

        // Lưu trạng thái tab vào localStorage
        localStorage.setItem('activeTab', index);
    }

    // Thêm sự kiện click cho các nút
    document.getElementById('home-tab').addEventListener('click', () => changeTab(0));
    document.getElementById('profile-tab').addEventListener('click', () => changeTab(1));
    document.getElementById('contact-tab').addEventListener('click', () => changeTab(2));
    document.getElementById('dangvanchuyen-tab').addEventListener('click', () => changeTab(3));
    document.getElementById('hoanthanh-tab').addEventListener('click', () => changeTab(4));
    document.getElementById('trahang-tab').addEventListener('click', () => changeTab(5));
    document.getElementById('dahuy-tab').addEventListener('click', () => changeTab(6));
    document.getElementById('choxacnhantrahang-tab').addEventListener('click', () => changeTab(7));

    // Khi trang được tải lại, khôi phục trạng thái tab
    document.addEventListener('DOMContentLoaded', () => {
        const activeTab = localStorage.getItem('activeTab');
        if (activeTab !== null) {
            changeTab(parseInt(activeTab, 10));
        } else {
            // Nếu không có tab nào được lưu, đặt tab đầu tiên là active mặc định
            changeTab(0);
        }
    });
   

    function confirmation(id) {
    	  $.ajax({
    	    type: "GET",
    	    url: "/admin/confirmation/" + id,
    	    success: function(response) {
      	      if (response) {
      	        const Toast = Swal.mixin({
      	          toast: true,
      	          position: "top-end",
      	          showConfirmButton: false,
      	          timer: 1000,
      	          timerProgressBar: true,
      	          didOpen: (toast) => {
      	            toast.onmouseenter = Swal.stopTimer;
      	            toast.onmouseleave = Swal.resumeTimer;
      	          }
      	        });
      	        Toast.fire({
      	          icon: "success",
      	          title: "Hoàn tất"
      	        }).then(function() {
      	          window.location.href = "/admin/order";
      	        });
      	      } else {
      	        const Toast = Swal.mixin({
      	          toast: true,
      	          position: "top-end",
      	          showConfirmButton: false,
      	          timer: 1000,
      	          timerProgressBar: true,
      	          didOpen: (toast) => {
      	            toast.onmouseenter = Swal.stopTimer;
      	            toast.onmouseleave = Swal.resumeTimer;
      	          }
      	        });
      	        Toast.fire({
      	          icon: "error",
      	          title: "Người dùng đã cập nhật trạng thái mới"
      	        }).then(function() {
      	          window.location.href = "/admin/order";
      	        });
      	      }

    	    },
    	    error: function(xhr, status, error) {
    	    	const Toast = Swal.mixin({
        	        toast: true,
        	        position: "top-end",
        	        showConfirmButton: false,
        	        timer: 1000,
        	        timerProgressBar: true,
        	        didOpen: (toast) => {
        	          toast.onmouseenter = Swal.stopTimer;
        	          toast.onmouseleave = Swal.resumeTimer;
        	        }
        	      });
        	      Toast.fire({
        	        icon: "error",
        	        title: "Người dùng đã cập nhật trạng thái mới"
        	      }).then(function(){
        	    	  window.location.href = "/admin/order";
        	      });
    	    }
    	  });
    	}

    function cancel(id) {
    	  $.ajax({
    	    type: "GET",
    	    url: "/admin/cancel/" + id,
    	    success: function(response) {
      	      if (response) {
      	        const Toast = Swal.mixin({
      	          toast: true,
      	          position: "top-end",
      	          showConfirmButton: false,
      	          timer: 1000,
      	          timerProgressBar: true,
      	          didOpen: (toast) => {
      	            toast.onmouseenter = Swal.stopTimer;
      	            toast.onmouseleave = Swal.resumeTimer;
      	          }
      	        });
      	        Toast.fire({
      	          icon: "success",
      	          title: "Hoàn tất"
      	        }).then(function() {
      	          window.location.href = "/admin/order";
      	        });
      	      } else {
      	        const Toast = Swal.mixin({
      	          toast: true,
      	          position: "top-end",
      	          showConfirmButton: false,
      	          timer: 1000,
      	          timerProgressBar: true,
      	          didOpen: (toast) => {
      	            toast.onmouseenter = Swal.stopTimer;
      	            toast.onmouseleave = Swal.resumeTimer;
      	          }
      	        });
      	        Toast.fire({
      	          icon: "error",
      	          title: "Người dùng đã cập nhật trạng thái mới"
      	        }).then(function() {
      	          window.location.href = "/admin/order";
      	        });
      	      }

    	    },
    	    error: function(xhr, status, error) {
    	    	const Toast = Swal.mixin({
        	        toast: true,
        	        position: "top-end",
        	        showConfirmButton: false,
        	        timer: 1000,
        	        timerProgressBar: true,
        	        didOpen: (toast) => {
        	          toast.onmouseenter = Swal.stopTimer;
        	          toast.onmouseleave = Swal.resumeTimer;
        	        }
        	      });
        	      Toast.fire({
        	        icon: "error",
        	        title: "Người dùng đã cập nhật trạng thái mới"
        	      }).then(function(){
        	    	  window.location.href = "/admin/order";
        	      });
    	    }
    	  });
    	}
    
    function delivery(id) {
    	  $.ajax({
    	    type: "GET",
    	    url: "/admin/delivery/" + id,
    	    success: function(response) {
    	      if (response) {
    	        const Toast = Swal.mixin({
    	          toast: true,
    	          position: "top-end",
    	          showConfirmButton: false,
    	          timer: 1000,
    	          timerProgressBar: true,
    	          didOpen: (toast) => {
    	            toast.onmouseenter = Swal.stopTimer;
    	            toast.onmouseleave = Swal.resumeTimer;
    	          }
    	        });
    	        Toast.fire({
    	          icon: "success",
    	          title: "Hoàn tất"
    	        }).then(function() {
    	          window.location.href = "/admin/order";
    	        });
    	      } else {
    	        const Toast = Swal.mixin({
    	          toast: true,
    	          position: "top-end",
    	          showConfirmButton: false,
    	          timer: 1000,
    	          timerProgressBar: true,
    	          didOpen: (toast) => {
    	            toast.onmouseenter = Swal.stopTimer;
    	            toast.onmouseleave = Swal.resumeTimer;
    	          }
    	        });
    	        Toast.fire({
    	          icon: "error",
    	          title: "Người dùng đã cập nhật trạng thái mới"
    	        }).then(function() {
    	          window.location.href = "/admin/order";
    	        });
    	      }
    	    },
    	    error: function(xhr, status, error) {
    	      const Toast = Swal.mixin({
    	        toast: true,
    	        position: "top-end",
    	        showConfirmButton: false,
    	        timer: 1000,
    	        timerProgressBar: true,
    	        didOpen: (toast) => {
    	          toast.onmouseenter = Swal.stopTimer;
    	          toast.onmouseleave = Swal.resumeTimer;
    	        }
    	      });
    	      Toast.fire({
    	        icon: "error",
    	        title: "Đã xảy ra lỗi"
    	      }).then(function() {
    	        window.location.href = "/admin/order";
    	      });
    	    }
    	  });
    	}
    function completed(id) {
  	  $.ajax({
  	    type: "GET",
  	    url: "/admin/completed/" + id,
  	    success: function() {
  	      const Toast = Swal.mixin({
  	        toast: true,
  	        position: "top-end",
  	        showConfirmButton: false,
  	        timer: 1000,
  	        timerProgressBar: true,
  	        didOpen: (toast) => {
  	          toast.onmouseenter = Swal.stopTimer;
  	          toast.onmouseleave = Swal.resumeTimer;
  	        }
  	      });
  	      Toast.fire({
  	        icon: "success",
  	        title: "Hoàn tất"
  	      }).then(function(){
  	    	  window.location.href = "/admin/order";
  	      });
  	    },
  	    error: function(xhr, status, error) {
  	    	const Toast = Swal.mixin({
      	        toast: true,
      	        position: "top-end",
      	        showConfirmButton: false,
      	        timer: 1000,
      	        timerProgressBar: true,
      	        didOpen: (toast) => {
      	          toast.onmouseenter = Swal.stopTimer;
      	          toast.onmouseleave = Swal.resumeTimer;
      	        }
      	      });
      	      Toast.fire({
      	        icon: "error",
      	        title: "Người dùng đã cập nhật trạng thái mới"
      	      }).then(function(){
      	    	  window.location.href = "/admin/order";
      	      });
  	    }
  	  });
  	}
    
    function returns(id) {
  	  $.ajax({
  	    type: "GET",
  	    url: "/admin/returns/" + id,
  	    success: function() {
  	      const Toast = Swal.mixin({
  	        toast: true,
  	        position: "top-end",
  	        showConfirmButton: false,
  	        timer: 1000,
  	        timerProgressBar: true,
  	        didOpen: (toast) => {
  	          toast.onmouseenter = Swal.stopTimer;
  	          toast.onmouseleave = Swal.resumeTimer;
  	        }
  	      });
  	      Toast.fire({
  	        icon: "success",
  	        title: "Hoàn tất"
  	      }).then(function(){
  	    	  window.location.href = "/admin/order";
  	      });
  	    },
  	    error: function(xhr, status, error) {
  	    	const Toast = Swal.mixin({
      	        toast: true,
      	        position: "top-end",
      	        showConfirmButton: false,
      	        timer: 1000,
      	        timerProgressBar: true,
      	        didOpen: (toast) => {
      	          toast.onmouseenter = Swal.stopTimer;
      	          toast.onmouseleave = Swal.resumeTimer;
      	        }
      	      });
      	      Toast.fire({
      	        icon: "error",
      	        title: "Người dùng đã cập nhật trạng thái mới"
      	      }).then(function(){
      	    	  window.location.href = "/admin/order";
      	      });
  	    }
  	  });
  	}
    
    function xacNhanTraHang(id) {
  	  $.ajax({
  	    type: "GET",
  	    url: "/admin/xacNhanTraHang/" + id,
  	    success: function() {
  	      const Toast = Swal.mixin({
  	        toast: true,
  	        position: "top-end",
  	        showConfirmButton: false,
  	        timer: 1000,
  	        timerProgressBar: true,
  	        didOpen: (toast) => {
  	          toast.onmouseenter = Swal.stopTimer;
  	          toast.onmouseleave = Swal.resumeTimer;
  	        }
  	      });
  	      Toast.fire({
  	        icon: "success",
  	        title: "Hoàn tất"
  	      }).then(function(){
  	    	  window.location.href = "/admin/order";
  	      });
  	    },
  	    error: function(xhr, status, error) {
  	    	const Toast = Swal.mixin({
      	        toast: true,
      	        position: "top-end",
      	        showConfirmButton: false,
      	        timer: 1000,
      	        timerProgressBar: true,
      	        didOpen: (toast) => {
      	          toast.onmouseenter = Swal.stopTimer;
      	          toast.onmouseleave = Swal.resumeTimer;
      	        }
      	      });
      	      Toast.fire({
      	        icon: "error",
      	        title: "Người dùng đã cập nhật trạng thái mới"
      	      }).then(function(){
      	    	  window.location.href = "/admin/order";
      	      });
  	    }
  	  });
  	}
</script>
</body>
</html>