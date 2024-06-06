<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
										<h1 class="modal-title fs-5" id="themLabel">Tạo mã mới</h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form:form method="POST" modelAttribute="discount_code"
											action="/admin/discount_code/create"
											class="form-horizontal form-label-left">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label class="control-label">Mã giảm giá</label>
														<form:input path="CODE" cssClass="form-control"
															placeholder="" />
													</div>
													<div class="form-group">
														<label class="control-label">Phần trăm giảm</label>
														<form:input path="PERCENTAGE" cssClass="form-control"
															placeholder="" />
													</div>
													<div class="form-group">
														<label class="control-label">Áp dụng cho đơn tối
															thiểu</label>
														<form:input path="MINIMUM" cssClass="form-control"
															placeholder="" />
													</div>
													<div class="form-group">
														<label class="control-label">Số lượng</label>
														<form:input path="QUANTITY" cssClass="form-control" />
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="control-label">Bậc</label>
														<form:select path="rank" class="form-control">
															<form:options items="${list_rank}" itemLabel="NAME"
																itemValue="ID" />
														</form:select>
													</div>
													<div class="form-group">
														<label class="control-label">Ngày bắt đầu</label>
														<form:input path="START_DATE" cssClass="form-control"
															type="date" placeholder="" />
													</div>
													<div class="form-group">
														<label class="control-label">Ngày kết thúc</label>
														<form:input path="EXPIRY_DATE" cssClass="form-control"
															type="date" />
													</div>
												</div>
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
												<th>Id</th>
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
											<c:forEach items="${list_discount_code}" var="item">
												<tr>
													<td>${item.ID }</td>
													<td>${item.CODE }</td>
													<td>${item.getRank().getNAME()}</td>
													<td>${item.START_DATE }</td>
													<td>${item.EXPIRY_DATE }</td>
													<td><fmt:formatNumber pattern="###">
													${item.PERCENTAGE }</fmt:formatNumber> %</td>
													<td><fmt:formatNumber pattern="###,###">
													${item.QUANTITY }</fmt:formatNumber></td>
													<td><fmt:formatNumber pattern="###,###">
													${item.MINIMUM }</fmt:formatNumber> đ</td>
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
													<form:form class="form-horizontal form-label-left"
														modelAttribute="discount_codeUpdate" method="POST"
														action="/admin/discount_code/update">
														<div class="row text-left">
															<div class="col-md-6">

																<form:input type="hidden" class="form-control"
																	id="discount_codeId" path="ID" />

																<div class="form-group">
																	<label class="control-label">Mã giảm giá</label>
																	<form:input id="code" type="text" class="form-control"
																		path="CODE" placeholder="" />
																</div>
																<div class="form-group">
																	<label class="control-label">Phần trăm giảm</label>
																	<form:input id="percentage" type="text"
																		class="form-control" path="PERCENTAGE" placeholder="" />
																</div>
																<div class="form-group">
																	<label class="control-label">Áp dụng cho đơn
																		tối thiểu</label>
																	<form:input id="minimun" type="text"
																		class="form-control" path="MINIMUM" placeholder="" />
																</div>
																<div class="form-group">
																	<label class="control-label">Số lượng</label>
																	<form:input id="quantity" type="text"
																		class="form-control" path="QUANTITY" />
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label class="control-label">Bậc</label>
																	<form:select itemLabel="rank.NAME" id="rank"
																		path="rank" class="form-select">
																		<form:options items="${list_rank}" itemLabel="NAME"
																			itemValue="ID" />
																	</form:select>
																</div>
																<div class="form-group">
																	<label class="control-label">Ngày bắt đầu</label>
																	<form:input id="start_date" type="date"
																		class="form-control" path="START_DATE" placeholder="" />
																</div>
																<div class="form-group">
																	<label class="control-label">Ngày kết thúc</label>
																	<form:input id="expiry_date" type="date"
																		class="form-control" path="EXPIRY_DATE" />
																</div>
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
														data-bs-dismiss="modal">Close</button>
													<button type="button" class="btn btn-danger"
														id="deleteButton">Delete</button>
												</div>
											</div>
										</div>
									</div>
									</td>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function getdiscount_codeById(id) {
		    $.ajax({
		        type: "GET",
		        url: "/admin/ajax/getdiscount_code/" + id,
		        success: function(discount_code) {
		            // Đổ dữ liệu vào form:form
		            $("#discount_codeId").val(discount_code.id);
		            $("#code").val(discount_code.code); 
		            
		            $("#start_date").val(discount_code.start_DATE);
		            $("#expiry_date").val(discount_code.expiry_DATE);

 		            $("#rank option").each(function() {
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
		        error: function(xhr, status, error) {
		            console.log("Error: " + error);
		        }
		    });
		}
		
		function modelDelete(id) {
		    $.ajax({
		        type: "GET",
		        url: "/admin/ajax/getdiscount_code/" + id,
		        success: function(discount_code) {
		        	  // Đổ dữ liệu vào modal
	                $("#thongbao").text("Bạn có muốn xóa mã code " + discount_code.code);
	                var modal = new bootstrap.Modal(document.getElementById('delete'));
	                modal.show();
	                
	                // Xử lý khi nhấn nút Delete
	                $("#deleteButton").on("click", function() {
	                    window.location.href = "/admin/discount_code/delete?id=" + discount_code.id;
	                });
		        },
		        error: function(xhr, status, error) {
		            console.log("Error: " + error);
		        }
		    });
		}
	</script>

</body>
</html>