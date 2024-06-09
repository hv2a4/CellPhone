<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- SECTION -->
<div class="section">
	<div class="container">
		<form id="filterForm" action="/shop/store">
			<div class="row">

				<div id="aside" class="col-md-3">

					<div class="aside">
						<h3 class="aside-title">Giá</h3>
						<div class="row">
							<div class="col-md-12">
								<div id="price-range" class="slider-range" style="height: 7px;"></div>
							</div>
						</div>
						<div class="row"
							style="margin-top: 7px; display: flex; justify-content: space-between;">
							<div class="col-md-6">
								<input min="0" name="min" type="number" id="min-price"
									class="form-control" pattern="" value="100000000"
									oninput="formatNumber(this)">
							</div>
							<div class="col-md-6">
								<input max="50000000" name="max" type="number" id="max-price"
									class="form-control" oninput="formatNumber(this)">
							</div>
						</div>
						<button class="btn col-md-12" style="margin-top: 7px;">Lọc
							theo giá</button>
					</div>

					<div class="aside">
						<h3 class="aside-title">Hãng</h3>

						<c:forEach var="item" items="${list_brand}">
							<div class="checkbox-filter">
								<div class="input-checkbox">
									<input name="brand" value="${item.NAME}" type="checkbox"
										id="${item.NAME}" onchange="submitFormAndSaveState()" /> <label
										for="${item.NAME}"> <span></span> ${item.NAME}
									</label>
								</div>
							</div>
						</c:forEach>

					</div>

					<div class="aside">
						<h3 class="aside-title">Hệ điều hành</h3>

						<c:forEach var="item" items="${list_system}">
							<div class="checkbox-filter">
								<div class="input-checkbox">

									<input name="system" value="${item.SYSTEM}" type="checkbox"
										id="category-${item.ID}" onchange="submitFormAndSaveState()" />
									<label for="category-${item.ID}"> <span></span>
										${item.SYSTEM}
									</label>
								</div>
							</div>
						</c:forEach>

					</div>
					<!-- Lọc -->
				</div>

				<div id="store" class="col-md-9">
					<div class="store-filter clearfix">
						<div class="store-sort">
							<label> Sắp xếp <select name="sorts" class="input-select"
								onchange="submitFormAndSaveState()">
									<option value="NAME">Sắp xếp</option>
									<option value="variants.PRICE">Giá</option>
									<option value="NAME">Tên</option>
							</select>
							</label> <label> Hiện: <select name="sizes" class="input-select"
								onchange="submitFormAndSaveState()">
									<option value="15">15</option>
									<option value="30">30</option>
									<option value="50">50</option>
									<option value="100">100</option>
							</select>
							</label>
						</div>
					</div>

					<c:set var="counter" value="0" />
					<c:forEach var="phone" items="${listphone}">
						<c:set value="${phone.variants[0]}" var="variantFirst"></c:set>
						<c:set value="${variantFirst}" var="variantmd"></c:set>
						<c:if test="${counter % 3 == 0}">
							<div class="row">
						</c:if>
						<div class="col-md-4">
							<div class="product">
								<div class="product-img">
									<img src="/images/${phone.IMAGE}" alt="">
									<div class="product-label">

										<span id="sale${phone.ID}" class="sale"> <fmt:formatNumber>
										${variantmd.discount_product.DISCOUNT_PERCENTAGE } </fmt:formatNumber> %
										</span> <span class="new">${phone.category.NAME}</span>
									</div>
								</div>
								<div class="product-body">
									<p class="product-category">${phone.category.NAME}</p>
									<h3 class="product-name">
										<a
											href="/shop/product/${phone.ID}/?id_storage=${variantmd.storage.ID}">${phone.NAME}</a>
									</h3>
									<c:set var="idphone" value="${phone.ID}"></c:set>
									<c:set var="a"></c:set>
									<c:set var="phantram" value="0"></c:set>
									<c:forEach var="variant" items="${phone.variants}">
										<c:if test="${a != variant.storage.GB}">
											<button onclick="getGia(${idphone},${variant.ID})"
												type="button" class="btn btn-default">
												<c:if
													test="${2048>=variant.storage.GB&&variant.storage.GB>=1024}">
												1 TB
											</c:if>
												<c:if test="${1024>variant.storage.GB}">
												${variant.storage.GB} GB
											</c:if>
											</button>
											<c:set var="a" value="${variant.storage.GB}"></c:set>
										</c:if>
									</c:forEach>
									<div class="product-details" style="display: flex; justify-content: center;">
										<h4 id="gia${phone.ID}" class="product-price"
											style="margin-right: 5px;">
											<fmt:formatNumber pattern="###,###.###">
											${variantmd.PRICE*(100-variantmd.discount_product.DISCOUNT_PERCENTAGE)/100}
										</fmt:formatNumber>
										</h4>
										<span class=""> <del id="giagoc${phone.ID}"
												class="product-old-price">
												<fmt:formatNumber pattern="###,###.###">
												${variantmd.PRICE}
											</fmt:formatNumber>
											</del>
										</span>
									</div>
									<div class="product-rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<div class="product-btns">
										<button type="button" class="quick-view">
											<a
												href="/shop/product/${phone.ID}/?id_storage=${variantmd.storage.ID}"><i
												class="fa fa-eye"></i></a> <span class="tooltipp">quick
												view</span>
										</button>
										<button type="button" class="quick-view">
											<i class="fa fa-shopping-cart"></i> <span class="tooltipp">Thêm
												vào giỏ hàng</span>
										</button>
									</div>
								</div>
								<div class="add-to-cart">
									<a href="/shop/checkout">
										<button ty class="add-to-cart-btn">
											<i class="fa-brands fa-bitcoin" style="font-size: 20px;"></i>
											Mua ngay
										</button>
									</a>
								</div>
							</div>
						</div>
						<c:if test="${counter % 3 == 2}">
				</div>

				</c:if>
				<c:set var="counter" value="${counter + 1}" />
				</c:forEach>
				<c:if test="${counter % 3 != 0}">
			</div>
			</c:if>

			<div class="store-filter clearfix text-right">
				<c:forEach var="item" begin="1" end="${productPage.totalPages }"
					step="1">
					<button type="button" class="btn">
						<a class="text-light" href="/shop/store?pages=${item}">${item}</a>
					</button>
				</c:forEach>
			</div>
		</form>
	</div>
</div>
</div>
</div>


<script>
function formatPrice(price) {
    return price.toLocaleString("en-US");
}

function getGia(idPhone, idVariant) {
    $.ajax({
        type: "GET",
        url: "/shop/ajax/getGia/" + idVariant,
        success: function(response) {
            console.log(response);
            // Giả sử 'response' là một đối tượng JSON chứa thuộc tính 'price' và 'discountPercentage'
            var giaChuaGiam = response[0];
            var giaGiam = giaChuaGiam * (100 - response[1]) / 100;

            $("#gia" + idPhone).text(formatPrice(giaGiam));
            $("#giagoc" + idPhone).text(formatPrice(giaChuaGiam));
            $("#sale" + idPhone).text(response[1] + " %");
        },
        error: function(xhr, status, error) {
            console.log("Error: " + error);
        }
    });
}

</script>
<script>
    function submitFormAndSaveState() {
        saveCheckboxState();
        document.getElementById('filterForm').submit();
    }

    function saveCheckboxState() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]');
        for (var i = 0; i < checkboxes.length; i++) {
            var checkbox = checkboxes[i];
            localStorage.setItem(checkbox.id, checkbox.checked);
        }
    }

    function restoreCheckboxState() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]');
        for (var i = 0; i < checkboxes.length; i++) {
            var checkbox = checkboxes[i];
            var state = localStorage.getItem(checkbox.id);
            if (state !== null) {
                checkbox.checked = state === 'true';
            }
        }
    }

    // Gọi hàm khôi phục trạng thái checkbox khi tải lại trang
    window.onload = function() {
        restoreCheckboxState();
        document.getElementById('filterForm').addEventListener('submit', saveCheckboxState);
    };
</script>


<script>
    $(function() {
        $("#price-range").slider({
            range: true,
            min: 0,
            max: 50000000,
            values: [0, 50000000],
            slide: function(event, ui) {
                $("#min-price").val(ui.values[0]);
                $("#max-price").val(ui.values[1]);
            }
        });

        $("#min-price").val($("#price-range").slider("values", 0));
        $("#max-price").val($("#price-range").slider("values", 1));

        $("#min-price").on("input", function() {
            var minValue = $(this).val();
            var maxValue = $("#max-price").val();
            $("#price-range").slider("values", 0, minValue);
            if (parseInt(minValue) > parseInt(maxValue)) {
                $("#max-price").val(minValue);
                $("#price-range").slider("values", 1, minValue);
            }
        });

        $("#max-price").on("input", function() {
            var minValue = $("#min-price").val();
            var maxValue = $(this).val();
            $("#price-range").slider("values", 1, maxValue);
            if (parseInt(maxValue) < parseInt(minValue)) {
                $("#min-price").val(maxValue);
                $("#price-range").slider("values", 0, maxValue);
            }});
    });
    </script>
<script>
function formatNumber(input) {
	let value = input.value.replace(/\D/g, ""); // Loại bỏ tất cả các ký tự không phải số
	let formattedValue = "";
	
	while (value.length > 3) {
		formattedValue = "." + value.slice(-3) + formattedValue;
		value = value.slice(0, value.length - 3);
	}
	
	formattedValue = value + formattedValue;
	
	input.value = formattedValue;
}
</script>
