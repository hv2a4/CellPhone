<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<!-- Billing Details -->
	<div class="billing-details">
		<div class="section-title">
			<h3 class="title">Địa chỉ</h3>
		</div>

		<div class="row">
			<form action="">
				<div class="form-group">
					<label for="" style="font-weight: 1">Tỉnh</label> <select
						class="input" name="city" id="city">
						<option value="">Chọn tỉnh / thành</option>
					</select>
				</div>
				<div class="form-group">
					<label for="" style="font-weight: 1">Thành phố</label> <select
						class="input" name="district" id="district">
						<option value="">Chọn quận / huyện</option>
					</select>
				</div>
				<div class="form-group">
					<label for="" style="font-weight: 1">Phường</label> <select
						class="input" name="ward" id="ward">
						<option value="">Chọn phường / xã</option>
					</select>
				</div>
				<div class="order-notes">
					<label for="" style="font-weight: 1">Địa chỉ cụ thể</label>
					<textarea class="input"></textarea>
				</div>
				<div class="form-group text-right" style="margin-top: 10px;">
					<button type="button" class="btn btn-info">Thêm</button>
					<button type="button" class="btn btn-info">Mới</button>
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Địa chỉ</th>
						<th scope="col">Hành động</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row">1</td>
						<td>18 A Trương Vĩnh Nguyên, Thường thạnh, Cái Răng, Cần thơ</td>
						<td><button type="button" class="btn btn-info">Sửa</button>
							<button type="button" class="btn btn-info">Xóa</button></td>
					</tr>
					<tr>
						<td scope="row">2</td>
						<td>Địa chỉ 2</td>
						<td><button type="button" class="btn btn-info">Sửa</button>
							<button type="button" class="btn btn-info">Xóa</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- /Billing Details -->
	<!-- Order notes -->

	<!-- /Order notes -->
</div>