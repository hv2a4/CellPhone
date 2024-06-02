<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/Admin/production/head.jsp"></jsp:include>
<body>
	<!-- Menu Bar -->
	<div class="col-md-3 left_col menu_fixed">
		<div class="left_col scroll-view">
			<div class="navbar nav_title" style="border: 0;">
				<a href="/admin" class="site_title"><i class="fa fa-paw"></i> <span>Admin</span></a>
			</div>
			<div class="clearfix"></div>

			<!-- menu profile quick info -->
			<div class="profile clearfix">
				<div class="profile_pic">
					<img src="/Admin/production/images/img.jpg" alt="..."
						class="img-circle profile_img">
				</div>
				<div class="profile_info">
					<span>Welcome,</span>
					<h2>John Doe</h2>
				</div>
			</div>
			<br />

			<!-- sidebar menu -->
			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
				<div class="menu_section">
					<h3>General</h3>
					<ul class="nav side-menu">
						<li class=""><a href="/admin">Tổng quan</a></li>
						<li class="border-top"><a href="/admin/order">Quản lý đơn hàng</a></li>
						<li><a href="/admin/user">Quản lý người dùng</a></li>
						<li><a href="/admin/product">Quản lý sản phẩm</a></li>
						<li><a href="/admin/discount">Quản lý mã giảm giá</a></li>
						<li><a class="border-top" href="/admin/category">Quản danh mục</a></li>
						<li><a href="/admin/color">Quản lý màu</a></li>
						<li><a href="/admin/storage">Quản lý GB</a></li>
						<li><a href="/admin/brand">Quản lý hãng</a></li>
						<li><a href="/admin/battery_type">Quản lý loại pin</a></li>
						<li><a href="/admin/system">Quản lý hệ điều hành</a></li>
						<li><a href="/admin/rank">Quản lý bậc hạng</a></li>
						<li><a href="/admin/headphone_jack">Quản lý loại Jack tai nghe</a></li>
						<li><a href="/admin/charging_port">Quản lý cổng sạc</a></li>
						<li><a href="/admin/wireless_charging_technology">Quản lý công nghệ sạc</a></li>
						<li><a href="/admin/screen_resolution">Quản lý độ phân giải</a></li>
						<li><a href="/admin/graphics_chip">Quản lý chíp đồ họa</a></li>
						<li><a href="/admin/status_order">Quản lý trạng thái đơn hàng</a></li>
						<li><a href="/admin/status_invoice">Quản lý trạng thái hóa đơn</a></li>
						<li><a href="/admin/payment_method">Quản lý phương thức thanh toán</a></li>
						<li class="border-top"><a href="/admin/statistical">Thống kê</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>

</html>