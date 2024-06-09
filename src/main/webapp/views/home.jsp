<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="section">

	<div class="container"
		style="display: flex; justify-content: space-between;">
		<div class="row">
			<div class="col-md-4">
				<a href="/shop/store?brand=apple">
					<div class="shop">
						<div class="shop-img">
							<img src="/img/shop01.png" alt>
						</div>
						<div class="shop-body">
							<h3>
								IPhone<br>Collection
							</h3>
							<a href="/shop/store?brand=apple" class="cta-btn">Shop now <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="/shop/store?brand=samsung">
					<div class="shop">
						<div class="shop-img">
							<img src="/img/shop02.png" alt>
						</div>
						<div class="shop-body">
							<h3>
								SamSung<br>Collection
							</h3>
							<a href="/shop/store?brand=samsung" class="cta-btn">Shop now
								<i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="/shop/store?brand=nokia">
					<div class="shop">
						<div class="shop-img">
							<img src="/img/shop03.png" alt>
						</div>
						<div class="shop-body">
							<h3>
								Realme<br>Collection
							</h3>
							<a href="/shop/store?brand=nokia" class="cta-btn">Shop now <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<c:forEach var="item" items="${list_category}">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title">
						<h3 class="title">Sản Phẩm ${item.NAME}</h3>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab1" class="tab-pane active">
								<div class="products-slick" data-nav="#slick-nav-1">
									<!-- product -->
									<c:forEach var="phone" items="${item.phones}">
										<c:set value="${phone.variants[0]}" var="variantFirst"></c:set>
										<c:set value="${variantFirst}" var="variantmd"></c:set>
										<div class="col-md-4">
											<div class="product">
												<a
													href="/shop/product/${phone.ID}?id_storage=${variantmd.storage.ID}">
													<div class="product-img">
														<img src="/images/${phone.IMAGE}" alt=""
															style="padding-top: 10px;">
														<div class="product-label">

															<span id="sale${phone.ID}" class="sale"> <fmt:formatNumber>
										${variantmd.discount_product.DISCOUNT_PERCENTAGE } </fmt:formatNumber> %
															</span> <span class="new">${phone.category.NAME}</span>
														</div>
													</div>
												</a>
												<div class="product-body">
													<p class="product-category">${phone.category.NAME}</p>
													<h3 class="product-name">
														<a href="/shop/product/${phone.ID}/?id_storage=${variantmd.storage.ID}">${phone.NAME}</a>
													</h3>
													<c:set var="idphone" value="${phone.ID}"></c:set>
													<c:set var="a"></c:set>
													<c:set var="phantram" value="0"></c:set>
													<c:forEach var="variant" items="${phone.variants}">
														<c:if test="${a != variant.storage.GB}">
															<button onclick="getGia(${idphone},${variant.ID})"
																type="button" class="btn">
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
													<div class=""
														style="display: flex; justify-content: center;">
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
															<a
																href="/shop/product/${phone.ID}?id_storage=${variantmd.storage.ID}"><i
																class="fa fa-eye"></i></a> <span class="tooltipp">quick
																view</span>
														</button>
														<button class="quick-view">
															<i class="fa fa-shopping-cart"></i> <span
																class="tooltipp">Thêm vào giỏ hàng</span>
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

									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div id="hot-deal" class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hot-deal">
					<ul class="hot-deal-countdown">
						<li>
							<div>
								<h3>02</h3>
								<span>Days</span>
							</div>
						</li>
						<li>
							<div>
								<h3>10</h3>
								<span>Hours</span>
							</div>
						</li>
						<li>
							<div>
								<h3>34</h3>
								<span>Mins</span>
							</div>
						</li>
						<li>
							<div>
								<h3>60</h3>
								<span>Secs</span>
							</div>
						</li>
					</ul>
					<h2 class="text-uppercase">KHUYẾN MÃI HOT TUẦN NÀY</h2>
					<p>BỘ SƯU TẬP MỚI GIẢM ĐẾN 50%</p>
					<a class="primary-btn cta-btn" href="#">Mua ngay</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<c:forEach begin="0" end="2" var="item" items="${list_category}">
				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">${item.NAME}</h4>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-3">
						<c:forEach begin="0" end="2" var="phone" items="${item.phones}">
							<c:if test="true">
								<div>
									<div class="product-widget">
										<div class="product-img">
											<img src="/images/${phone.IMAGE}" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name">
												<a href="#">${phone.NAME}</a>
											</h3>
											<h4 class="product-price">
												$980.00
												<del class="product-old-price">$990.00</del>
											</h4>
										</div>
									</div>
								</div>

							</c:if>

						</c:forEach>
					</div>
				</div>
			</c:forEach>
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

