<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- SECTION -->
<div class="section">
	<div class="container">
		<div class="row">
			<div id="aside" class="col-md-3">
				<div class="aside">
					<h3 class="aside-title">Hệ điều hành</h3>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<input type="checkbox" id="category-1" /> <label
								for="category-1"> <span></span> IOS <small>(120)</small>
							</label>
						</div>

						<div class="input-checkbox">
							<input type="checkbox" id="category-2" /> <label
								for="category-2"> <span></span> Android <small>(740)</small>
							</label>
						</div>

						<div class="input-checkbox">
							<input type="checkbox" id="category-3" /> <label
								for="category-3"> <span></span> Khác <small>(1450)</small>
							</label>
						</div>
					</div>
				</div>

				<div class="aside">
					<h3 class="aside-title">Giá</h3>
					<div class="price-filter">
						<div id="price-slider"></div>
						<div class="input-number price-min">
							<input id="price-min" type="number" /> <span class="qty-up">+</span>
							<span class="qty-down">-</span>
						</div>
						<span>-</span>
						<div class="input-number price-max">
							<input id="price-max" type="number" /> <span class="qty-up">+</span>
							<span class="qty-down">-</span>
						</div>
					</div>
				</div>

				<div class="aside">
					<h3 class="aside-title">Hãng</h3>
					<div class="checkbox-filter">
						<div class="input-checkbox">
							<input type="checkbox" id="brand-1" /> <label for="brand-1">
								<span></span> SAMSUNG <small>(578)</small>
							</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="brand-2" /> <label for="brand-2">
								<span></span> Apple <small>(125)</small>
							</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="brand-3" /> <label for="brand-3">
								<span></span> Xiaomi <small>(755)</small>
							</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="brand-4" /> <label for="brand-4">
								<span></span> Oppo <small>(578)</small>
							</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="brand-5" /> <label for="brand-5">
								<span></span> Realme <small>(125)</small>
							</label>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="brand-6" /> <label for="brand-6">
								<span></span> Vivo <small>(755)</small>
							</label>
						</div>
					</div>
				</div>

			</div>

			<div id="store" class="col-md-9">
				<div class="store-filter clearfix">
					<div class="store-sort">
						<label> Sắp xếp <select class="input-select">
								<option value="0">Giá</option>
								<option value="1">Tên</option>
						</select>
						</label> <label> hiện: <select class="input-select">
								<option value="0">15</option>
								<option value="1">30</option>
						</select>
						</label>
					</div>
				</div>

				<c:set var="counter" value="0" />
				<c:forEach var="phone" items="${finByAllPhone}">
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
								<p class="product-category">Mới</p>
								<h3 class="product-name">
									<a href="#">${phone.NAME}</a>
								</h3>
								<c:set var="idphone" value="${phone.ID}"></c:set>
								<c:set var="a"></c:set>
								<c:set var="phantram" value="0"></c:set>
								<c:forEach var="variant" items="${phone.variants}">
									<c:if test="${a != variant.storage.GB}">
										<button onclick="getGia(${idphone},${variant.ID})"
											type="button" class="btn btn-default inline-button">${variant.storage.GB}
											GB</button>
										<c:set var="a" value="${variant.storage.GB}"></c:set>
									</c:if>
								</c:forEach>
								<div class="" style="display: flex; justify-content: center;">
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
									<button class="quick-view">
										<a href="/shop/product/${phone.ID}"><i class="fa fa-eye"></i></a>
										<span class="tooltipp">quick view</span>
									</button>
									<button class="quick-view">
										<i class="fa fa-shopping-cart"></i> <span class="tooltipp">Thêm
											vào giỏ hàng</span>
									</button>
								</div>
							</div>
							<div class="add-to-cart">
								<a href="/shop/checkout">
									<button class="add-to-cart-btn">
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

		<div class="store-filter clearfix">
			<span class="store-qty">Showing 20-100 products</span>
			<ul class="store-pagination">
				<li class="active">1</li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
			</ul>
		</div>
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
