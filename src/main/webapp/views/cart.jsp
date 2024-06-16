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
									<td><input type="checkbox" name="selectedItems"
										value="${item.ID}" class="selectItem" /></td>
									<td class="hidden-xs"><a href=""> <img
											data-sizes="auto"
											class="lazyautosizes ls-is-cached lazyloaded" alt=""
											sizes="100px" src="/images/${item.variant.phone.IMAGE}"></a></td>
									<td><a class="itemName" href="">${item.variant.phone.NAME}</a>
										<div class="att attcode">Code:</div>
										<div class="att itemPri visible-xs">
											<i>Giá</i>:
										</div></td>
									<td class="text-center hidden-xs itemPri price"><c:choose>
											<c:when
												test="${item.variant.discount_product.EXPIRY_DATE.time > System.currentTimeMillis()}">
												<fmt:formatNumber pattern="###,###"
													value="${(item.variant.PRICE * (100 - item.variant.discount_product.DISCOUNT_PERCENTAGE)/100)}"></fmt:formatNumber>
											</c:when>
											<c:otherwise>
												<fmt:formatNumber pattern="###,###"
													value="${item.variant.PRICE}"></fmt:formatNumber>
											</c:otherwise>
										</c:choose></td>
									<td class="text-center">
										<div class="cartqty">
											<button type="button" class="qtyminus"
												onclick="updateQuantity(${item.ID}, ${item.variant.QUANTITY}, -1)">−</button>
											<input value="${item.QUANTITY}" name="quantity"
												id="quantity_${item.ID}" min="1"
												max="${item.variant.QUANTITY}" class="updateCart"
												type="text">

											<button type="button" class="qtyplus"
												onclick="updateQuantity(${item.ID}, ${item.variant.QUANTITY}, 1)">+</button>
										</div>
									</td>
									<td class="text-center hidden-xs itemPrice">
										<div class="itemPrice itemPri" id="itemPrice_${item.ID}">
											<c:choose>
												<c:when
													test="${item.variant.discount_product.EXPIRY_DATE.time > System.currentTimeMillis()}">
													<fmt:formatNumber pattern="###,###"
														value="${(item.variant.PRICE * ((100 - item.variant.discount_product.DISCOUNT_PERCENTAGE)/100)) * item.QUANTITY}"></fmt:formatNumber>
												</c:when>
												<c:otherwise>
													<fmt:formatNumber pattern="###,###"
														value="${item.variant.PRICE * item.QUANTITY}"></fmt:formatNumber>
												</c:otherwise>
											</c:choose>
										</div>
									</td>
									<td class="text-center hidden-xs"><a
										href="/shop/cart/delete/${item.ID}"><i
											class="removeCartItem fa fa-trash-o" aria-hidden="true"></i></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<div class="col-md-12">
							<span class="totalPrice pull-right">Tổng tiền: <span
								id="totalPriceValue"><fmt:formatNumber pattern="###,###"
										value="${totalPrice}"></fmt:formatNumber></span> đ
							</span>
						</div>

					</div>

					<div class="button-container">
						<a href="/shop/store">
							<button class="cart_continous button tp_button" type="button">
								<i class="fa fa-reply"></i>TIẾP TỤC MUA HÀNG
							</button>
						</a>
						<button class="cart_checkout_btn button tp_button" type="button"
							onclick="submitOrder()">
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
    function submitOrder() {
        var selectedItems = document.querySelectorAll('.selectItem:checked');
        var cartForm = document.getElementById('cartForm');

        // If no items are checked, check all items
        if (selectedItems.length === 0) {
            document.querySelectorAll('.selectItem').forEach(checkbox => {
                checkbox.checked = true;
            });
        }
        updateSelectedTotal();
        cartForm.submit();
    }

    function updateQuantity(itemId, maxQuantity, change) {
        var inputElement = document.getElementById('quantity_' + itemId);
        var currentQuantity = parseInt(inputElement.value);
        var newQuantity = currentQuantity + change;

        // Đảm bảo số lượng mới không vượt quá giới hạn
        if (newQuantity < 1) {
            newQuantity = 1;
        } else if (newQuantity > maxQuantity) {
            newQuantity = maxQuantity;
        }

        inputElement.value = newQuantity;

        // Gửi form sử dụng AJAX để cập nhật số lượng và giá
        $.ajax({
            type: "POST",
            url: "/shop/updateQuantity",
            data: {
                id: itemId,
                quantity: newQuantity
            },
            success: function(response) {
                // Tải lại trang khi cập nhật thành công
                location.reload();
            },
            error: function(xhr, status, error) {
                console.error("Lỗi cập nhật số lượng:", error);
            }
        });
    }
    function updateSelectedTotal() {
        var selectedItems = document.querySelectorAll('.selectItem:checked');
        var total = 0;

        selectedItems.forEach(function(item) {
            var itemId = item.value;
            var itemPriceElement = document.getElementById('itemPrice_' + itemId);
            var itemPrice = parseInt(itemPriceElement.textContent.replace(/,/g, ''));
            total += itemPrice;
        });

        document.getElementById('totalPriceValue').textContent = total.toLocaleString('en');
    }

    // Attach updateSelectedTotal function to checkbox change event
    document.querySelectorAll('.selectItem').forEach(function(checkbox) {
        checkbox.addEventListener('change', updateSelectedTotal);
    });

</script>
