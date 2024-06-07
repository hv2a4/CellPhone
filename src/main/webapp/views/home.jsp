<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container"
		style="display: flex; justify-content: space-between;">
		<!-- row -->
		<div class="row">
			<!-- shop -->
			<div class="col-md-4">
				<a href="store.html?brand=iphone">
					<div class="shop">
						<div class="shop-img">
							<img src="/img/shop01.png" alt>
						</div>
						<div class="shop-body">
							<h3>
								IPhone<br>Collection
							</h3>
							<a href="#" class="cta-btn">Shop now <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</a>
			</div>
			<!-- /shop -->

			<!-- shop -->
			<div class="col-md-4">
				<a href="store.html">
					<div class="shop">
						<div class="shop-img">
							<img src="/img/shop02.png" alt>
						</div>
						<div class="shop-body">
							<h3>
								SamSung<br>Collection
							</h3>
							<a href="#" class="cta-btn">Shop now <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</a>
			</div>
			<!-- /shop -->
			<!-- shop -->
			<div class="col-md-4">
				<a href="store.html">
					<div class="shop">
						<div class="shop-img">
							<img src="/img/shop03.png" alt>
						</div>
						<div class="shop-body">
							<h3>
								Realme<br>Collection
							</h3>
							<a href="#" class="cta-btn">Shop now <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</a>
			</div>
			<!-- /shop -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<c:forEach var="item" items="${list_category}">
			<div class="row">
				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h3 class="title">Sản Phẩm ${item.NAME}</h3>
					</div>
				</div>
				<!-- /section title -->

				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab1" class="tab-pane active">
								<div class="products-slick" data-nav="#slick-nav-1">
									<!-- product -->
									<c:forEach var="phone" items="${item.phones}">
										<div class="product">
											<div class="product-img">
												<img src="/img/product01.png" alt>
												<div class="product-label">
													<span class="sale">-30%</span> <span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">Mới</p>
												<h3 class="product-name">
													<a href="#">${phone.NAME}</a>
												</h3>

												<c:set var="idphone" value="${phone.ID }"></c:set>
												<c:set var="a"></c:set>
												<c:set var="price" value="${Double.MAX_VALUE}"></c:set>
												<c:set var="phantram" value="0"></c:set>
												<c:forEach var="variant" items="${phone.variants}">
													<c:if test="${variant.PRICE < price}">
														<c:set var="price" value="${variant.PRICE}"></c:set>
														<c:set var="phantram"
															value="${variant.discount_product.DISCOUNT_PERCENTAGE}"></c:set>
													</c:if>
													<c:if test="${a != variant.storage.GB}">
														<button onclick="getGia(${idphone},${variant.ID})"
															type="button" class="btn btn-default">${variant.storage.GB}
															GB</button>
														<c:set var="a" value="${variant.storage.GB}"></c:set>
													</c:if>
												</c:forEach>
												<h4 id="gia${phone.ID }" class="product-price">${price *(100-phantram)/100 }

													<del id="gia${phone.ID }" class="product-old-price">${price }</del>
												</h4>
												<div class="product-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="quick-view">
														<a href="/shop/product"><i class="fa fa-eye"></i></a><span
															class="tooltipp">quick view</span>
													</button>
													<button class="quick-view">
														<i class="fa fa-shopping-cart"></i><span class="tooltipp">Thêm
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

									</c:forEach>
								</div>
								<div id="slick-nav-1" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- Products tab & slick -->
			</div>
			<!-- /row -->
		</c:forEach>
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- HOT DEAL SECTION -->
<div id="hot-deal" class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
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
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /HOT DEAL SECTION -->

<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<!-- Sản phẩm mới -->
		<c:forEach var="item" items="${list_category}">
			<div class="row">
				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h3 class="title">Sản Phẩm ${item.NAME}</h3>
					</div>
				</div>
				<!-- /section title -->

				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab1" class="tab-pane active">
								<div class="products-slick" data-nav="#slick-nav-1">
									<!-- product -->
									<c:forEach var="phone" items="${item.phones}">
										<div class="product">
											<div class="product-img">
												<img src="/images/${phone.IMAGE}" alt>
												<div class="product-label">
													<span class="sale">-30%</span> <span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">Mới</p>
												<h3 class="product-name">
													<a href="#">${phone.NAME}</a>
												</h3>

												<c:set var="idphone" value="${phone.ID }"></c:set>
												<c:set var="a"></c:set>
												<c:set var="price" value="${Double.MAX_VALUE}"></c:set>
												<c:set var="phantram" value="0"></c:set>
												<c:forEach var="variant" items="${phone.variants}">
													<c:if test="${variant.PRICE < price}">
														<c:set var="price" value="${variant.PRICE}"></c:set>
														<c:set var="phantram"
															value="${variant.discount_product.DISCOUNT_PERCENTAGE}"></c:set>
													</c:if>
													<c:if test="${a != variant.storage.GB}">
														<button onclick="getGia(${idphone},${variant.ID})"
															type="button" class="btn btn-default">${variant.storage.GB}
															GB</button>
														<c:set var="a" value="${variant.storage.GB}"></c:set>
													</c:if>
												</c:forEach>
												<h4 id="gia${phone.ID }" class="product-price">${price *(100-phantram)/100 }

													<del id="gia${phone.ID }" class="product-old-price">${price }</del>
												</h4>
												<div class="product-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="quick-view">
														<a href="/shop/product"><i class="fa fa-eye"></i></a><span
															class="tooltipp">quick view</span>
													</button>
													<button class="quick-view">
														<i class="fa fa-shopping-cart"></i><span class="tooltipp">Thêm
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

									</c:forEach>
								</div>
								<div id="slick-nav-1" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- Products tab & slick -->
			</div>
			<!-- /row -->
		</c:forEach>
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<!-- Sản Phẩm Bán Chạy Theo Hãng -->
<div class="section">
	<!-- container -->
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
									<!-- product widget -->
									<div class="product-widget">
										<div class="product-img">
											<img src="/images/${phone.IMAGE}" alt>
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
			<div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
	</div>
</div>
</div>
<!-- /SECTION -->
<script>
	function getGia(idPhone,idVariant) {
		$.ajax({
			type : "GET",
			url : "/shop/ajax/getGia/" + idVariant,
			success : function(Double) {
				// Đổ dữ liệu vào form:form
				$("#gia"+idPhone).text(Double);
			},
			error : function(xhr, status, error) {
				console.log("Error: " + error);
			}
		});
	}
</script>