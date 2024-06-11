<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- HEADER -->
<header>
	<div id="header">
		<div class="container">
			<div class="row">
				<!-- LOGO -->
				<div class="col-md-3">
					<div class="header-logo">
						<a href="/shop" class="logo"> <img src="/img/logo.png" alt>
						</a>
					</div>
				</div>

				<div class="col-md-6">
					<div class="header-search">
						<form action="/shop/store" method="get">
							<input name="q" class="input" placeholder="Tìm kiếm ở đây">
							<button type="submit" class="search-btn">Tìm kiếm</button>
						</form>
					</div>
				</div>

				<div class="col-md-3 clearfix">
					<div class="header-ctn">
						<!-- Giỏ hàng -->
						<div class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown"
								aria-expanded="true"> <i class="fa fa-shopping-cart"></i> <span>Giỏ
									hàng</span> <c:if test="${cartItems.size()>0}">
									<div class="qty">${totalquantity}</div>
								</c:if>
							</a>
							<div class="cart-dropdown">

								<div class="cart-list">
									<c:forEach var="cartItem" items="${cartItems}">
										<div class="product-widget">
											<div class="product-img">
												<img src="/images/${cartItem.variant.phone.IMAGE}" alt>
											</div>
											<div class="product-body">
												<h3 class="product-name">
													<a href="#">${cartItem.variant.phone.NAME}</a>
												</h3>
												<h4 class="product-price">
													<span class="qty"> ${cartItem.QUANTITY}x</span>
													<fmt:formatNumber pattern="##,###,###">
									${cartItem.variant.PRICE}</fmt:formatNumber>
													vnđ
												</h4>
											</div>
											<button class="delete" onclick="deleteCart(${cartItem.ID})">
												<i class="fa fa-close"></i>
											</button>
										</div>
									</c:forEach>
								</div>

								<div class="cart-summary">
									<small>${cartItems.size()} sản phẩm được chọn</small>
									<h5>
										Tổng cộng: <b><fmt:formatNumber pattern="##,###,###">
									${totalCart}</fmt:formatNumber> vnđ</b>
									</h5>
								</div>
								<div class="cart-btns">
									<a href="/shop/cart">Xem giỏ hàng</a> <a href="/shop/addorder">Đặt hàng
									 <i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
						</div>
						<!-- Tài khoản -->
						<div class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown"
								aria-expanded="true"> <i class="fa-solid fa-user"></i> <span>${empty list?"Tài Khoản":list.FULLNAME}</span>
							</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
								<c:choose>

									<c:when test="${empty list.FULLNAME}">
										<li><a href="/shop/login">Đăng nhập</a></li>
										<li><a href="/shop/register">Đăng ký</a></li>
									</c:when>
									<c:when test="${list.ROLE}">
										<li><a href="/admin">Trang quản lí</a></li>
										<li><a href="/shop/profile">Thông tin cá nhân</a></li>
										<li><a href="/shop/changepass">Đổi mật khẩu</a></li>
										<li><a href="/shop/forgotpass1">Quên mật khẩu</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="/shop/address">Quản lý địa chỉ</a></li>
										<li><a href="/shop/order">Đơn hàng của bạn</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="/shop/logout">Đăng xuất</a></li>
									</c:when>
									<c:otherwise>

										<li><a href="/shop/profile">Thông tin cá nhân</a></li>
										<li><a href="/shop/changepass">Đổi mật khẩu</a></li>
										<li><a href="/shop/forgotpass1">Quên mật khẩu</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="/shop/address">Quản lý địa chỉ</a></li>
										<li><a href="/shop/order">Đơn hàng của bạn</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="/shop/logout">Đăng xuất</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<!-- Nút menu -->
						<div class="menu-toggle">
							<a href="#"> <i class="fa fa-bars"></i> <span>Menu</span>
							</a>
						</div>
					</div>
					<!-- /LOGO -->
				</div>
			</div>
		</div>
	</div>
</header>
<script>
function deleteCart(id) {
	  $.ajax({
	    type: "GET",
	    url: "/shop/cart/delete/" + id,
	    success: function() {
	      location.reload();
	    },
	    error: function(xhr, status, error) {
	      console.log("Error: " + error);
	    }
	  });
	}
</script>








