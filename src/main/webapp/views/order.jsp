<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
	<div class="row">
		<div class="col-md-12 tb">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li role="presentation" class="active"><a href="#home-tab-pane"
					id="home-tab" data-toggle="tab" role="tab"
					aria-controls="home-tab-pane" aria-selected="true">Tất cả đơn
						hàng</a></li>
				<li role="presentation"><a href="#profile-tab-pane"
					id="profile-tab" data-toggle="tab" role="tab"
					aria-controls="profile-tab-pane" aria-selected="false">Chờ xác
						nhận</a></li>
				<li role="presentation"><a href="#contact-tab-pane"
					id="contact-tab" data-toggle="tab" role="tab"
					aria-controls="contact-tab-pane" aria-selected="false">Đã xác
						nhận</a></li>
				<li role="presentation"><a href="#dangvanchuyen"
					id="dangvanchuyen-tab" data-toggle="tab" role="tab"
					aria-controls="dangvanchuyen" aria-selected="false">Đang vận
						chuyển</a></li>
				<li role="presentation"><a href="#hoanthanh" id="hoanthanh-tab"
					data-toggle="tab" role="tab" aria-controls="hoanthanh"
					aria-selected="false">Hoàn thành</a></li>
				<li role="presentation"><a href="#traHang" id="traHang-tab"
					data-toggle="tab" role="tab" aria-controls="traHang"
					aria-selected="false">Trả Hàng</a></li>
				<li role="presentation"><a href="#dahuy" id="dahuy-tab"
					data-toggle="tab" role="tab" aria-controls="dahuy"
					aria-selected="false">Đã hủy</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<!-- Tất cả đơn hàng -->
				<div class="tab-pane fade in active" id="home-tab-pane"
					role="tabpanel" aria-labelledby="home-tab">
					<div class="card mt-3">
						<div class="card-header">
							<h2 class="card-title">Danh Sách</h2>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered">
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
									<c:forEach var="item" items="${getAllOrders}">
										<tbody>

											<tr>
												<td>${item.ID }</td>
												<td>${item.user.USERNAME }</td>
												<td><fmt:formatNumber type="currency"
														currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
												<td><fmt:formatDate value="${item.CREATE_AT}"
														pattern="yyyy-MM-dd" /></td>
												<td>${item.status_order.STATUS }</td>

												<c:choose>
													<c:when
														test="${item.status_order.STATUS == 'Chờ xác nhận'}">
														<td>
															<button type="button" class="btn btn-danger "
																style="width: 100px;" data-toggle="modal"
																data-target="#myModal-${item.ID+1}">Hủy</button>
														</td>
														<!-- Modal -->
														<div id="myModal-${item.ID+1}" class="modal fade"
															role="dialog">
															<div class="modal-dialog">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																		<h4 class="modal-title">Lý do hủy đơn hàng
																			${item.ID} của ${item.user.USERNAME}</h4>
																	</div>
																	<div class="modal-body">
																		<p>
																			<textarea id="noteReasons-${item.ID}" class="input"></textarea>
																			<small id="errors-message-${item.ID}"
																				class="text-danger"></small>
																		</p>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-info"
																			onclick="submitDeleteForms(${item.ID})">Hủy</button>
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">Close</button>
																	</div>
																</div>
															</div>
														</div>
													</c:when>
													<c:when test="${item.status_order.STATUS == 'Giao hàng'}">
														<td><button type="button"
																class="btn btn-warning btn-md" data-toggle="modal"
																data-target="#myModal-${item.ID+1}">Trả Hàng</button></td>
														<!-- Modal -->
														<div id="myModal-${item.ID+1}" class="modal fade"
															role="dialog">
															<div class="modal-dialog">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																		<h4 class="modal-title">Lý do trả đơn hàng
																			${item.ID} của ${item.user.USERNAME}</h4>
																	</div>
																	<div class="modal-body">
																		<p>
																			<textarea id="noteReasons-${item.ID}" class="input"></textarea>
																			<small id="errors-message-${item.ID}"
																				class="text-danger"></small>
																		</p>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-info"
																			onclick="submitReturnItemForms(${item.ID})">Xác
																			Nhận</button>
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">Close</button>
																	</div>
																</div>
															</div>
														</div>
													</c:when>
													<c:when test="${item.status_order.STATUS == 'Trả hàng'}">
														<td><button type="button" class="btn btn-primary"
																style="width: 100px;" data-toggle="modal"
																data-target="#myModal${item.ID+2}">Lý do</button></td>
														<!-- Modal -->
														<div id="myModal${item.ID+2}" class="modal fade"
															role="dialog">
															<div class="modal-dialog">

																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																		<h4 class="modal-title">Lý do trả hàng của
																			${item.ID}</h4>
																	</div>
																	<div class="modal-body">
																		<p>${item.REASON}</p>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">Close</button>
																	</div>
																</div>

															</div>
														</div>

													</c:when>
												</c:choose>


											</tr>
										</tbody>

									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- Chờ xác nhận -->
				<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
					aria-labelledby="profile-tab" tabindex="0">
					<div class="card mt-3">
						<div class="card-header">
							<h2 class="card-title">Danh Sách</h2>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered">
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
									<c:forEach var="item" items="${getAllOrders}">
										<tbody>

											<c:choose>
												<c:when test="${item.status_order.STATUS == 'Chờ xác nhận'}">
													<td>${item.ID }</td>
													<td>${item.user.USERNAME }</td>
													<td><fmt:formatNumber type="currency"
															currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
													<td><fmt:formatDate value="${item.CREATE_AT}"
															pattern="yyyy-MM-dd" /></td>
													<td>${item.status_order.STATUS }</td>
													<td>
														<button type="button" class="btn btn-danger"
															style="width: 100px;" data-toggle="modal"
															data-target="#myModal-${item.ID}">Hủy</button>

													</td>
													<!-- Modal -->
													<div id="myModal-${item.ID}" class="modal fade"
														role="dialog">
														<div class="modal-dialog">
															<!-- Modal content-->
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal">&times;</button>
																	<h4 class="modal-title">Lý do hủy đơn hàng của
																		${item.user.USERNAME}</h4>
																</div>
																<div class="modal-body">
																	<p>
																		<textarea id="noteReason-${item.ID}" class="input"></textarea>
																		<small id="error-message-${item.ID}"
																			class="text-danger"></small>
																	</p>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-info"
																		onclick="submitDeleteForm(${item.ID})">Hủy</button>
																	<button type="button" class="btn btn-default"
																		data-dismiss="modal">Close</button>
																</div>
															</div>
														</div>
													</div>
												</c:when>

											</c:choose>


										</tbody>

									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- Đã xác nhận -->
				<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel"
					aria-labelledby="contact-tab" tabindex="0">
					<div class="card mt-3">
						<div class="card-header">
							<h2 class="card-title">Danh Sách</h2>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Tên người đặt</th>
											<th>Tổng tiền</th>
											<th>Ngày đặt</th>
											<th>Trạng thái</th>
										</tr>
									</thead>
									<c:forEach var="item" items="${getAllOrders}">
										<tbody>

											<c:choose>
												<c:when test="${item.status_order.STATUS == 'Đã xác nhận'}">
													<td>${item.ID }</td>
													<td>${item.user.USERNAME }</td>
													<td><fmt:formatNumber type="currency"
															currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
													<td><fmt:formatDate value="${item.CREATE_AT}"
															pattern="yyyy-MM-dd" /></td>
													<td>${item.status_order.STATUS }</td>

												</c:when>

											</c:choose>

										</tbody>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- Đang vận chuyển -->
				<div class="tab-pane fade" id="dangvanchuyen" role="tabpanel"
					aria-labelledby="dangvanchuyen-tab" tabindex="0">
					<div class="card mt-3">
						<div class="card-header">
							<h2 class="card-title">Danh Sách</h2>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Tên người đặt</th>
											<th>Tổng tiền</th>
											<th>Ngày đặt</th>
											<th>Trạng thái</th>
											<th>Hoạt Động</th>
										</tr>
									</thead>
									<c:forEach var="item" items="${getAllOrders}">
										<tbody>

											<c:choose>
												<c:when test="${item.status_order.STATUS == 'Giao hàng'}">
													<td>${item.ID }</td>
													<td>${item.user.USERNAME }</td>
													<td><fmt:formatNumber type="currency"
															currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
													<td><fmt:formatDate value="${item.CREATE_AT}"
															pattern="yyyy-MM-dd" /></td>
													<td>${item.status_order.STATUS }</td>
													<td>
														<button type="button" class="btn btn-warning "
															style="width: 100px;" data-toggle="modal"
															data-target="#myModal-${item.ID}">Trả Hàng</button>
													</td>
													<!-- Modal -->
													<div id="myModal-${item.ID}" class="modal fade"
														role="dialog">
														<div class="modal-dialog">
															<!-- Modal content-->
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal">&times;</button>
																	<h4 class="modal-title">Lý do trả hàng của
																		${item.user.USERNAME}</h4>
																</div>
																<div class="modal-body">
																	<p>
																		<textarea id="noteReason-${item.ID}" class="input"></textarea>
																		<small id="error-message-${item.ID}"
																			class="text-danger"></small>
																	</p>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-info"
																		onclick="submitReturnItemForm(${item.ID})">Xác
																		Nhận</button>
																	<button type="button" class="btn btn-default"
																		data-dismiss="modal">Close</button>
																</div>
															</div>
														</div>
													</div>
												</c:when>

											</c:choose>

										</tbody>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- Trả Hàng -->
				<div class="tab-pane fade" id="traHang" role="tabpanel"
					aria-labelledby="traHang-tab" tabindex="0">
					<div class="card mt-3">
						<div class="card-header">
							<h2 class="card-title">Danh Sách</h2>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Tên người đặt</th>
											<th>Tổng tiền</th>
											<th>Ngày đặt</th>
											<th>Trạng thái</th>
											<th>Hoạt Động</th>
										</tr>
									</thead>
									<c:forEach var="item" items="${getAllOrders}">
										<tbody>

											<c:choose>
												<c:when test="${item.status_order.STATUS == 'Trả hàng'}">
													<td>${item.ID }</td>
													<td>${item.user.USERNAME }</td>
													<td><fmt:formatNumber type="currency"
															currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
													<td><fmt:formatDate value="${item.CREATE_AT}"
															pattern="yyyy-MM-dd" /></td>
													<td>${item.status_order.STATUS }</td>
													<td><button type="button" class="btn btn-primary "
															data-toggle="modal" data-target="#myModal${item.ID}"
															style="width: 100px;">Lý do</button></td>
													<!-- Modal -->
													<div id="myModal${item.ID}" class="modal fade"
														role="dialog">
														<div class="modal-dialog">

															<!-- Modal content-->
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal">&times;</button>
																	<h4 class="modal-title">Lý do trả hàng của
																		${item.ID}</h4>
																</div>
																<div class="modal-body">
																	<p>${item.REASON}</p>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default"
																		data-dismiss="modal">Close</button>
																</div>
															</div>

														</div>
													</div>

												</c:when>

											</c:choose>

										</tbody>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- Hoàn thành -->
				<div class="tab-pane fade" id="hoanthanh" role="tabpanel"
					aria-labelledby="hoanthanh-tab" tabindex="0">
					<div class="card mt-3">
						<div class="card-header">
							<h2 class="card-title">Danh Sách</h2>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Tên người đặt</th>
											<th>Tổng tiền</th>
											<th>Ngày đặt</th>
											<th>Trạng thái</th>
										</tr>
									</thead>
									<c:forEach var="item" items="${getAllOrders}">
										<tbody>

											<c:choose>
												<c:when test="${item.status_order.STATUS == 'Hoàn thành'}">
													<td>${item.ID }</td>
													<td>${item.user.USERNAME }</td>
													<td><fmt:formatNumber type="currency"
															currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
													<td><fmt:formatDate value="${item.CREATE_AT}"
															pattern="yyyy-MM-dd" /></td>
													<td>${item.status_order.STATUS}</td>

												</c:when>

											</c:choose>

										</tbody>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- Đã hủy -->
				<div class="tab-pane fade" id="dahuy" role="tabpanel"
					aria-labelledby="dahuy-tab" tabindex="0">
					<div class="card mt-3">
						<div class="card-header">
							<h2 class="card-title">Danh Sách</h2>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Tên người đặt</th>
											<th>Tổng tiền</th>
											<th>Ngày đặt</th>
											<th>Lý do</th>
											<th>Hoạt động</th>
										</tr>
									</thead>
									<c:forEach var="item" items="${getAllOrders}">
										<tbody>

											<c:choose>
												<c:when test="${item.status_order.STATUS == 'Hủy'}">
													<td>${item.ID }</td>
													<td>${item.user.USERNAME }</td>
													<td><fmt:formatNumber type="currency"
															currencyCode="VND" value="${item.TOTAL_AMOUNT}" /></td>
													<td><fmt:formatDate value="${item.CREATE_AT}"
															pattern="yyyy-MM-dd" /></td>
													<td>${item.REASON }</td>
													<td><button type="button" class="btn btn-success">Mua
															Lại</button></td>

												</c:when>

											</c:choose>

										</tbody>
									</c:forEach>
								</table>
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
    function submitDeleteForm(orderId) {
        var noteReason = document.getElementById('noteReason-' + orderId).value;
        var errorMessageElement = document.getElementById('error-message-' + orderId);

        if (noteReason.trim() === '') {
            // Hiển thị thông báo lỗi nếu người dùng không nhập lý do
            errorMessageElement.textContent = 'Vui lòng nhập lý do hủy đơn hàng.';
            return;  // Dừng việc gửi yêu cầu
        } 
        $.ajax({
            type: "POST",
            url: "/shop/deleteOrder/" + orderId,
            data: {
                noteReason: noteReason
            },
            success: function(response) {
              
                $('#myModal-' + orderId).modal('hide');
                Swal.fire({
                    icon: 'success',
                    title: 'Đơn Hàng Đã Hủy Thành Công',
                    showConfirmButton: false,
                    timer: 950
                });
                
                setTimeout(function() {
                    window.location.href = "/shop/order";
                }, 1200);
               
            },
            error: function(xhr, status, error) {
                alert("Đã xảy ra lỗi: " + error);
            }
        });
    }
    function submitDeleteForms(orderId) {
        var noteReason = document.getElementById('noteReasons-' + orderId).value;
        var errorMessageElement = document.getElementById('errors-message-' + orderId);

        if (noteReason.trim() === '') {
            // Hiển thị thông báo lỗi nếu người dùng không nhập lý do
            errorMessageElement.textContent = 'Vui lòng nhập lý do hủy đơn hàng.';
            return;  // Dừng việc gửi yêu cầu
        } 
        $.ajax({
            type: "POST",
            url: "/shop/deleteOrder/" + orderId,
            data: {
                noteReason: noteReason
            },
            success: function(response) {
               
                $('#myModal-' + orderId).modal('hide');
               
                Swal.fire({
                    icon: 'success',
                    title: 'Đơn Hàng Đã Hủy Thành Công',
                    showConfirmButton: false,
                    timer: 950
                });
                setTimeout(function() {
                    window.location.href = "/shop/order";
                }, 1200);
               
            },
            error: function(xhr, status, error) {
                alert("Đã xảy ra lỗi: " + error);
            }
        });
    }
    function submitReturnItemForm(orderId) {
        var noteReason = document.getElementById('noteReason-' + orderId).value;
        var errorMessageElement = document.getElementById('error-message-' + orderId);
        if (noteReason.trim() === '') {
            // Hiển thị thông báo lỗi nếu người dùng không nhập lý do
            errorMessageElement.textContent = 'Vui lòng nhập lý do trả đơn hàng.';
            return;  // Dừng việc gửi yêu cầu
        }
        $.ajax({
            type: "POST",
            url: "/shop/returnItem/" + orderId,
            data: {
                noteReason: noteReason
            },
            success: function(response) {
                
            	Swal.fire({
                    icon: 'success',
                    title: 'Trả Hàng Thành Công',
                    showConfirmButton: false,
                    timer: 950
                });
                setTimeout(function() {
                    window.location.href = "/shop/order";
                }, 1200);
            },
            error: function(xhr, status, error) {
                alert("Đã xảy ra lỗi: " + error);
            }
        });
    }
    function submitReturnItemForms(orderId) {
        var noteReason = document.getElementById('noteReasons-' + orderId).value;
        var errorMessageElement = document.getElementById('errors-message-' + orderId);
        if (noteReason.trim() === '') {
            // Hiển thị thông báo lỗi nếu người dùng không nhập lý do
            errorMessageElement.textContent = 'Vui lòng nhập lý do trả đơn hàng.';
            return;  // Dừng việc gửi yêu cầu
        } 
        $.ajax({
            type: "POST",
            url: "/shop/returnItem/" + orderId,
            data: {
                noteReason: noteReason
            },
            success: function(response) {
            	Swal.fire({
                    icon: 'success',
                    title: 'Trả Hàng Thành Công',
                    showConfirmButton: false,
                    timer: 950
                });
                setTimeout(function() {
                    window.location.href = "/shop/order";
                }, 1200);
            },
            error: function(xhr, status, error) {
                alert("Đã xảy ra lỗi: " + error);
            }
        });
    }
</script>