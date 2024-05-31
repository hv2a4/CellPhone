<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row" style="display: flex; justify-content: center;">
				<!-- Order Details -->
				<div class="col-md-7 order-details">
					<div class="section-title text-center">
						<h3 class="title">Đơn Hàng Của Bạn</h3>
					</div>
					<div class="form-group">
						<input class="input" type="tel" name="tel" placeholder="Mã giảm giá">
					</div>
					<div class="order-summary">
						<div class="order-col">
							<div><strong>SẢN PHẨM</strong></div>
							<div><strong>TỔNG CỘNG</strong></div>
						</div>
						<div class="order-products">
							<div class="order-col">
								<div>1x Tên Sản Phẩm Tại Đây</div>
								<div>$980.00</div>
							</div>
							<div class="order-col">
								<div>2x Tên Sản Phẩm Tại Đây</div>
								<div>$980.00</div>
							</div>
						</div>
						<div class="order-col">
							<div>Vận Chuyển</div>
							<div><strong>MIỄN PHÍ</strong></div>
						</div>
						<div class="order-col">
							<div><strong>TỔNG CỘNG</strong></div>
							<div><strong class="order-total">$2940.00</strong></div>
						</div>
					</div>
					<div class="form-group">
						<select class="input" name="city" id="city">
							<option value="">Chọn địa chỉ</option>
							<option value="">Địa chỉ 1</option>
							<option value="">18 A Trương Vĩnh Nguyên, Thường thạnh, Cái Răng, Cần thơ</option>
						</select>
					</div>
					<div class="payment-method">
						<label for="">Phương thức thanh toán</label>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-1">
							<label for="payment-1">
								<span></span>
								Thanh toán khi nhận hàng
							</label>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-2">
							<label for="payment-2">
								<span></span>
								Thanh toán online
							</label>
						</div>
					</div>
					<div class="order-col">
						<p for="">Lê Minh Khôi - 07436378</p>
					</div>
					<div class="input-checkbox">
						<input type="checkbox" id="terms">
						<label for="terms">
							<span></span>
							Tôi đã đọc và chấp nhận <a href="#">các điều khoản & điều kiện</a>
						</label>
					</div>
					<a href="/views/ordersuccess.jsp" class="primary-btn order-submit">Đặt Hàng</a>
				</div>
				<!-- /Order Details -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->