<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- HEADER -->
		<header>
			<!-- TIÊU ĐỀ CHÍNH -->
			<div id="header">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<!-- LOGO -->
						<div class="col-md-3">
							<div class="header-logo">
								<a href="#" class="logo">
									<img src="/img/logo.png" alt>
								</a>
							</div>
						</div>
						<!-- /LOGO -->

						<!-- THANH TÌM KIẾM -->
						<div class="col-md-6">
							<div class="header-search">
								<form>
									<input class="input" placeholder="Tìm kiếm ở đây">
									<button class="search-btn">Tìm kiếm</button>
								</form>
							</div>
						</div>
						<!-- /THANH TÌM KIẾM -->

						<!-- TÀI KHOẢN -->
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
								<!-- Giỏ hàng -->
								<div class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
										<i class="fa fa-shopping-cart"></i>
										<span>Giỏ hàng</span>
										<div class="qty">3</div>
									</a>
									<div class="cart-dropdown">
										<div class="cart-list">
											<div class="product-widget">
												<div class="product-img">
													<img src="/img/product01.png" alt>
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">tên sản phẩm ở đây</a></h3>
													<h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
												</div>
												<button class="delete"><i class="fa fa-close"></i></button>
											</div>

											<div class="product-widget">
												<div class="product-img">
													<img src="/img/product02.png" alt>
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">tên sản phẩm ở đây</a></h3>
													<h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
												</div>
												<button class="delete"><i class="fa fa-close"></i></button>
											</div>
										</div>
										<div class="cart-summary">
											<small>3 sản phẩm được chọn</small>
											<h5>TỔNG CỘNG: $2940.00</h5>
										</div>
										<div class="cart-btns">
											<a href="/shop/cart">Xem giỏ hàng</a>
											<a href="/shop/checkout">Thanh toán <i class="fa fa-arrow-circle-right"></i></a>
										</div>
									</div>
								</div>
								<div class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
										<i class="fa-solid fa-user"></i>
										<span>Tài khoản</span>
									</a>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
										<li><a href="/shop/login">Đăng nhập</a></li>
										<li><a href="/shop/signup">Đăng ký</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="/shop/profile">Thông tin cá nhân</a></li>
										<li><a href="/shop/changepass">Đổi mật khẩu</a></li>
										<li><a href="/shop/forgotpass1">Quên mật khẩu</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="/shop/address">Quản lý địa chỉ</a></li>
										<li><a href="/shop/order">Đơn hàng của bạn</a></li>
									  </ul>
								</div>
								<!-- /Giỏ hàng -->
							
								<!-- Nút menu -->
								<div class="menu-toggle">
									<a href="#">
										<i class="fa fa-bars"></i>
										<span>Menu</span>
									</a>
								</div>
								<!-- /Nút menu -->
							</div>
						</div>
						<!-- /TÀI KHOẢN -->
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
			<!-- /TIÊU ĐỀ CHÍNH -->
		</header>
		<!-- /HEADER -->
</body>
</html>