<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- /BREADCRUMB -->
<div class="content-wrap" style="background-color: #fff">
	<div class="container clearfix">
		<div class="table-responsive">
			<div id="showAlertCart"></div>
			<div class="scrollModal table-responsive">
				<table class="table table-cart table-no-border" cellspacing="10">
					<thead>
						<tr>
							<th class="hidden-xs">Ảnh sản phẩm</th>
							<th class="hidden-xs">Tên sản phẩm</th>
							<th class="text-center hidden-xs">Giá tiền</th>
							<th class="text-center">Số lượng</th>
							<th class="text-center hidden-xs">Tổng</th>
							<th class="text-center hidden-xs">Xóa</th>
						</tr>
					</thead>
					<tbody>
						<%-- <c:forEach var="item" items="${ListUser}">	 --%>				
								<tr class="cartItem cartItem_14340887">
									<td class="hidden-xs"><a href=""> <img
											data-sizes="auto"
											class="lazyautosizes ls-is-cached lazyloaded"
											data-src="/images/"
											alt="MÀN HÌNH LG 24MK430H-B 24''" sizes="100px"
											src="/images/"></a></td>
									<td><a class="itemName" href=""></a>
										<div class="att attcode">Code:</div>
										<div class="att itemPri visible-xs">
											<i>Giá</i>: 12,000,000đ
										</div></td>
									<td class="text-center hidden-xs itemPri price">12,000,000₫
									</td>
									<td class="text-center">
										<div class="cartqty">
											<button class="qtyminus">-</button>
											<input value="2" min="1" max="5000" class="updateCart"
												type="text">
											<button class="qtyplus">+</button>
										</div>
										<div class="att itemPri visible-xs">
											<i>Tổng</i>: <span class="itemPrice"> 24,000,000đ </span>
										</div> <i class="removeCartItem fa fa-trash-o visible-xs"
										aria-hidden="true"></i>
									</td>
									<td class="text-center hidden-xs">
										<div class="itemPrice itemPri">24,000,000₫</div>
									</td>
									<td class="text-center hidden-xs"><i
										class="removeCartItem fa fa-trash-o" aria-hidden="true"></i></td>
								</tr>
						<%-- </c:forEach> --%>
					</tbody>
				</table>
				<span class="totalPrice pull-right">Tổng tiền: <c:out
						value="${totalPrice}" />₫
				</span>
			</div>
			<div class="cartLine"></div>
			<div class="button-container">
				<a href="/shop/store">
					<button class="cart_continous button tp_button" type="button">
						<i class="fa fa-reply"></i>TIẾP TỤC MUA HÀNG
					</button>
				</a> <a href="/shop/checkout">
					<button class="cart_checkout_btn button tp_button" type="button">
						<i class="fa fa-money"></i> ĐẶT HÀNG
					</button>
				</a>
			</div>
		</div>
	</div>
</div>

<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row"></div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<script>
	function updateTotal(input) {
		let quantity = parseInt(input.value);
		if (isNaN(quantity) || quantity < 1) {
			input.value = 1;
			quantity = 1;
		}

		let row = input.closest('tr');
		let price = parseInt(row.querySelector('.itemPri.price').innerText
				.replace(/₫|,/g, '').trim());
		let total = quantity * price;

		row.querySelector('.itemPrice.itemPri').innerText = new Intl.NumberFormat()
				.format(total)
				+ '₫';

		updateCartTotal();
	}

	function updateCartTotal() {
		let total = 0;
		document.querySelectorAll('.itemPrice.itemPri').forEach(function(item) {
			total += parseInt(item.innerText.replace(/₫|,/g, '').trim());
		});

		document.querySelector('.totalPrice').innerText = 'Tổng tiền: '
				+ new Intl.NumberFormat().format(total) + '₫';
	}

	function updateQuantity(button, increment) {
		let input = button.parentElement
				.querySelector('input[name="quantity"]');
		let quantity = parseInt(input.value) + increment;
		if (quantity < 1)
			quantity = 1;
		input.value = quantity;
		updateTotal(input);
	}
</script>