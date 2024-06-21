<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<!-- SECTION -->
<div class="section">
	<!-- code có cộng tiền ship vào -->
	<form id="succussForm" action="/shop/ordersuccess" method="get"
		onsubmit="return submitOrder();">
		
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
						<input class="input" type="tel" value="" name="tel"
							placeholder="Mã giảm giá">
					</div>
					<div class="order-summary">
						<div class="order-col">
							<div>
								<strong>SẢN PHẨM</strong>
							</div>
							<div>
								<strong>TỔNG CỘNG</strong>
							</div>
						</div>
						<input type="hidden" name="quantity" value="${quantity}" />
    					<input type="hidden" name="totalOrder" value="${totalOrder}" />
  					    <input type="hidden" name="variant" value="${variant.ID}" />
  					    <c:if test="${not empty selectedItems}">
      						  <input type="hidden" name="selectedItems" value="${selectedItems}">
   						</c:if>
						<c:choose>
							<c:when test="${not empty variant}">
								<div class="order-products">
									<div class="order-col">
										<div>Số lượng ${quantity} x ${variant.phone.NAME}</div>
										<div>
											<fmt:formatNumber value="${totalOrder}" pattern="###,###.###" />
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${items}">
									<div class="order-products">
										<div class="order-col">
											<div>Số lượng ${item.QUANTITY} x
												${item.variant.phone.NAME}</div>
											<div>
												<c:choose>
													<c:when
														test="${item.variant.discount_product.EXPIRY_DATE.time > System.currentTimeMillis()}">
														<fmt:formatNumber pattern="###,###.###"
															value="${(item.variant.PRICE * (100 - item.variant.discount_product.DISCOUNT_PERCENTAGE)/100) * item.QUANTITY}" />
													</c:when>
													<c:otherwise>
														<fmt:formatNumber pattern="###,###.###"
															value="${item.variant.PRICE * item.QUANTITY}" />
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="order-col">
							<div>Vận Chuyển</div>
							<div>
								<strong id="shippingFee"> <fmt:formatNumber
										value="${order.address.SHIPPING_FEE}" pattern="###,###.###" />
								</strong>
							</div>
						</div>
						<div class="order-col">
							<div>
								<strong>TỔNG CỘNG</strong>
							</div>
							<div>
								<strong id="totalOrder" class="order-total"> <fmt:formatNumber
										value="${totalOrder}" pattern="###,###.###" />
								</strong> <input type="hidden" name="moneys" id="moneys"
									value="${empty order?0:totalOrder}">
							</div>
						</div>
					</div>
					<div class="form-group">
						<select class="input" name="address" id="addressSelect">
							<c:forEach var="adr" items="${user.addresses}">
								<option name="address" value="${adr.ID}">${adr.ADDRESS}</option>
							</c:forEach>

						</select>
					</div>
					<div class="payment-method">
						<label for="">Phương thức thanh toán</label>
						<c:forEach var="payq" items="${pays}">
							<div class="input-radio">
								<input
									onclick="UpdateOrder(${payq.ID})"
									type="radio" name="payment" value="${payq.ID}" id="${payq.ID}"> <label
									for="${payq.ID}"> <span></span> ${payq.NAME}
								</label>
							</div>
						</c:forEach>
						<div id="paymentErrorMessage" style="display: none; color: red;">
							Vui lòng chọn phương thức thanh toán!</div>
					</div>
					<div class="order-col">
						<label for="">${user.FULLNAME} - ${user.PHONE_NUMBER}</label>
					</div>
					<div class="input-checkbox">
						<input type="checkbox" id="terms"> </label> <label for="terms">
							<span></span> Tôi đã đọc và chấp nhận <a href="#">các điều
								khoản & điều kiện</a>
						</label>
						<div id="termsErrorMessage" style="display: none; color: red;">
							Vui lòng đồng ý với các điều khoản và điều kiện!</div>
					</div>
					<div class="row">
						<div class="col-md-12 text-center">
							<button class="add-to-cart-btn" type="submit"
								style="border: none; background: none; width: 600px;">
								<a class="primary-btn order-submit">Đặt Hàng</a>
							</button>
						</div>

					</div>
				</div>
				<!-- /Order Details -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</form>
</div>
<!-- /SECTION -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function sendAddress() {
        var addressID = document.getElementById("addressSelect").value;
        var totalOrderText = document.getElementById("moneys").value;
        console.log(totalOrderText)
       var totalOrderNumber = parseFloat(totalOrderText); 
         totalOrderNumber = parseInt(totalOrderNumber.toFixed(0)); 
        var formattedNumber = new Intl.NumberFormat('en-US').format(totalOrderNumber);

        $.ajax({
            url: '/shop/getShippingFee',
            type: 'GET',
            data: { address: addressID },
            success: function(response) {
                console.log(response); // Ghi log phản hồi
                if (response && response.shippingFee !== undefined) {
                	 var shippingFeeNumber = Number(response.shippingFee);
                	 var formattedFee = new Intl.NumberFormat('en-US', {
                         minimumFractionDigits: 0,
                         maximumFractionDigits: 3,
                         useGrouping: true
                     }).format(response.shippingFee);
                	 
                	 console.log(totalOrderNumber)
                	  console.log(shippingFeeNumber)
                	 var total = totalOrderNumber + shippingFeeNumber;
                	 
                	 var formattedTotal = new Intl.NumberFormat('en-US', {
                		    minimumFractionDigits: 0,
                		    maximumFractionDigits: 3,
                		    useGrouping: true
                		}).format(total);

                    document.getElementById("shippingFee").innerText = formattedFee.replace(/,/g, '.');
                    document.getElementById("totalOrder").innerText = formattedTotal.replace(/,/g, '.');
                } else {
                    document.getElementById("shippingFee").innerText = "lỗi";
                }
            },
            error: function(xhr, status, error) {
                console.error(error);
                document.getElementById("shippingFee").innerText = "lỗi 2";
            }
        });
    }
</script>
<script>
//Lắng nghe sự kiện change trên các radio button phương thức thanh toán
var paymentRadios = document.querySelectorAll('input[name="payment"]');
for (var i = 0; i < paymentRadios.length; i++) {
    paymentRadios[i].addEventListener('change', function() {
        validatePaymentSelection();
    });
}

// Lắng nghe sự kiện change trên checkbox điều kiện
var termsCheckbox = document.getElementById('terms');
termsCheckbox.addEventListener('change', function() {
    validateTermsAgreement();
});

// Hàm kiểm tra xem có radio button phương thức thanh toán nào được chọn không
function validatePaymentSelection() {
    var isChecked = false;
    for (var i = 0; i < paymentRadios.length; i++) {
        if (paymentRadios[i].checked) {
            isChecked = true;
            break;
        }
    }
    // Hiển thị hoặc ẩn thông báo tùy thuộc vào việc có phương thức thanh toán nào được chọn hay không
    var paymentErrorMessage = document.getElementById('paymentErrorMessage');
    paymentErrorMessage.style.display = isChecked ? 'none' : 'block';
}

// Hàm kiểm tra xem checkbox điều kiện đã được chọn hay không
function validateTermsAgreement() {
    var isChecked = termsCheckbox.checked;
    // Hiển thị hoặc ẩn thông báo tùy thuộc vào việc checkbox điều kiện đã được chọn hay không
    var termsErrorMessage = document.getElementById('termsErrorMessage');
    termsErrorMessage.style.display = isChecked ? 'none' : 'block';
}

// Hàm xử lý khi người dùng nhấn nút "Đặt Hàng"
function submitOrder() {
    // Kiểm tra xem có radio button phương thức thanh toán nào được chọn không
    var isPaymentSelected = false;
    for (var i = 0; i < paymentRadios.length; i++) {
        if (paymentRadios[i].checked) {
            isPaymentSelected = true;
            break;
        }
    }
    // Kiểm tra xem checkbox điều kiện đã được chọn hay không
    var isTermsAgreed = termsCheckbox.checked;

    // Hiển thị hoặc ẩn thông báo lỗi về phương thức thanh toán
    var paymentErrorMessage = document.getElementById('paymentErrorMessage');
    paymentErrorMessage.style.display = isPaymentSelected ? 'none' : 'block';

    // Hiển thị hoặc ẩn thông báo lỗi về điều kiện
    var termsErrorMessage = document.getElementById('termsErrorMessage');
    termsErrorMessage.style.display = isTermsAgreed ? 'none' : 'block';

    // Nếu không có lỗi, cho phép gửi form
    if (isPaymentSelected && isTermsAgreed) {
        return true;
    } else {
        return false;
    }
}
</script>
<script>
function UpdateOrder(idPay) {
	var address = document.getElementsByName("address")[0].value;
    var form = document.getElementById('succussForm');
    var discountCode = document.getElementsByName("tel")[0].value;
    var selectedItem = "${selectedItems}";
    form.action = "/shop/ordersuccess?id_pay=" + idPay+ "&id_address=" + address + "&discount=" + discountCode + "&selectedItem=" + selectedItem;
}

</script>