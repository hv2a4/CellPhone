<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- /BREADCRUMB -->
<div class="content-wrap" style="background-color: #fff">
	<div class="container clearfix">
		<div class="">
			<div id="showAlertCart"></div>
			<div class="scrollModal">
				<form id="cartForm" action="/shop/addorder" method="post">
					<table class="table table-cart table-no-border" cellspacing="10">
						<thead>
							<tr>
								<th class="hidden-xs"></th>
								<th class="hidden-xs">Ảnh sản phẩm</th>
								<th class="hidden-xs">Tên sản phẩm</th>
								<th class="text-center hidden-xs">Giá tiền</th>
								<th class="text-center">Số lượng</th>
								<th class="text-center hidden-xs">Tổng</th>
								<th class="text-center hidden-xs">Xóa</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${listCartItems}">
								<tr class="cartItem cartItem_${item.ID}">
									<td><input type="checkbox" name="selectedItems" value="${item.ID}" class="selectItem"/></td>
									<td class="hidden-xs"><a href=""> <img
											data-sizes="auto"
											class="lazyautosizes ls-is-cached lazyloaded" alt=""
											sizes="100px" src="/images/${item.variant.phone.IMAGE}"></a></td>
									<td><a class="itemName" href="">${item.variant.phone.NAME}</a>
										<div class="att attcode">Code:</div>
										<div class="att itemPri visible-xs">
											<i>Giá</i>:
										</div></td>
									<td class="text-center hidden-xs itemPri price"><fmt:formatNumber
											pattern="###,###" value="${item.variant.PRICE}"></fmt:formatNumber>
									</td>
									<td class="text-center">
										<form action="/shop/updateQuantity" method="get">
											<input type="hidden" name="id" value="${item.ID}">
											<div class="cartqty">
												<button type="button" class="qtyminus" type="submit">-</button>
												<input value="${item.QUANTITY}" name="quantity" min="1"
													max="${item.variant.QUANTITY}" class="updateCart" type="text"
													onblur="this.form.submit()">
												<button type="button" class="qtyplus" type="submit">+</button>
											</div>
										</form>
									</td>
									<td class="text-center hidden-xs">
										<div class="itemPrice itemPri">
											<fmt:formatNumber pattern="###,###"
												value="${item.variant.PRICE * item.QUANTITY}"></fmt:formatNumber>
										</div>
									</td>
									<td class="text-center hidden-xs">
										<a href="/shop/cart/delete/${item.ID}"><i class="removeCartItem fa fa-trash-o" aria-hidden="true"></i></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
					<div class="col-md-12">
					<span class="totalPrice pull-right">Tổng tiền: 
					<fmt:formatNumber pattern="###,###" value="${totalPrice}"></fmt:formatNumber> đ
					</span>
					</div>
					
					</div>
					
					<div class="button-container">
						<a href="/shop/store">
							<button class="cart_continous button tp_button" type="button">
								<i class="fa fa-reply"></i>TIẾP TỤC MUA HÀNG
							</button>
						</a>
						<button class="cart_checkout_btn button tp_button" type="button" onclick="submitOrder()">
							<i class="fa fa-money"></i> ĐẶT HÀNG
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var updateQuantity = function (button, delta) {
            var input = button.parentElement.querySelector('.updateCart');
            var currentValue = parseInt(input.value);
            var newValue = currentValue + delta;

            if (newValue >= parseInt(input.min) && newValue <= parseInt(input.max)) {
                input.value = newValue;
                input.form.submit();
            }
        };

        document.querySelectorAll('.qtyminus').forEach(button => {
            button.addEventListener('click', function () {
                updateQuantity(this, -1);
            });
        });

        document.querySelectorAll('.qtyplus').forEach(button => {
            button.addEventListener('click', function () {
                updateQuantity(this, 1);
            });
        });
    });

    function submitOrder() {
        var selectedItems = document.querySelectorAll('.selectItem:checked');
        var cartForm = document.getElementById('cartForm');

        // If no items are checked, check all items
        if (selectedItems.length === 0) {
            document.querySelectorAll('.selectItem').forEach(checkbox => {
                checkbox.checked = true;
            });
        }

        cartForm.submit();
    }
</script>
