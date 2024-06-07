<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->

		<div class="row">
			<!-- Product main img -->
			<div class="col-md-5 col-md-push-2">
				<div id="product-main-img">
					<c:forEach var="images" items="${finByIdPhone.images}">
						<div class="product-preview">
							<img src="/images/${images.IMAGE }" alt />
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- /Product main img -->

			<!-- Product thumb imgs -->
			<div class="col-md-2 col-md-pull-5">
				<div id="product-imgs">
					<c:forEach var="images" items="${finByIdPhone.images}">
						<div class="product-preview">
							<img src="/images/${images.IMAGE }" alt />
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- /Product thumb imgs -->

			<!-- Product details -->
			<div class="col-md-5">
				<div class="product-details">
					<h2 class="product-name">${finByIdPhone.NAME }</h2>
					<div>
						<div class="product-rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-o"></i>
						</div>
					</div>
					<div>
					
						<c:set var="price" value="0"></c:set>
						<h3 id="productPrice" class="product-price">
							${price }
							<del class="product-old-price">24.000.000đ</del>
						</h3>
					</div>
					<p>
						<b>Mô tả sản phẩm:</b> <br> ${finByIdPhone.DESCRIPTION}
					</p>

					<div class="product-options">
						<c:set var="GB"></c:set>
						<c:set var="idphone" value="${finByIdPhone.ID }"></c:set>
						<div class="row">
								<c:forEach var="variant" items="${finByIdPhone.variants }">
								<div class="col-md-3">
									<c:if test="${variant.storage.ID != GB}">
										<button onclick="getGia(${idphone},${variant.ID})"
											type="button" class="btn btn-default inline-button">${variant.storage.GB}
											GB</button>
										<c:set var="GB" value="${variant.storage.ID }"></c:set>
										<c:set var="price" value="${variant.PRICE }"></c:set>
									</c:if>
							</div>
								</c:forEach>
						</div>
						<%-- <div class="row">
							<div class="col-md-12">
								<label> <c:set var="color"></c:set> 
								<c:forEach
										var="variant" items="${finByIdPhone.variants }">
										<c:if test="${variant.color.ID != color }">
											<button onclick="getGia(${idphone},${variant.ID})"
												type="button" class="btn btn-default">${variant.color.NAME}
											</button>
											<c:set var="color" value="${variant.color.ID }"></c:set>
										</c:if>
									</c:forEach>

								</label>
							</div>
						</div> --%>
						<div class="row">
							<c:set var="usedColors" />
							<c:forEach var="variant" items="${finByIdPhone.variants}">
								<div class="col-md-3">
									<c:if test="${usedColors != variant.color.ID}">
										<button onclick="getGia(${idphone},${variant.ID})"
											type="button" class="btn btn-default inline-button">${variant.color.NAME}</button>
										<c:set var="usedColors" value="${variant.color.ID}" />
									</c:if>
								</div>
							</c:forEach>
						</div>

					</div>

					<div class="add-to-cart">
						<div class="qty-label">
							<div class="input-number">
								<input type="number" value="1" /> <span class="qty-up">+</span>
								<span class="qty-down">-</span>
							</div>
						</div>
					</div>
					<div class="add-to-cart">
						<a href="/shop/checkout"><button class="add-to-cart-btn">
								<i class="fa-brands fa-bitcoin" style="font-size: 20px"></i> Mua
								ngay
							</button></a> <a href="/shop/cart"><button class="add-to-cart-btn">
								<i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
							</button></a>

					</div>
				</div>
			</div>
			<!-- /Product details -->

			<!-- Product tab -->
			<div class="col-md-12">
				<div id="product-tab">
					<!-- product tab nav -->
					<ul class="tab-nav">
						<li class="active"><a data-toggle="tab" href="#tab1">Description</a>
						</li>
						<li><a data-toggle="tab" href="#tab2">Details</a></li>
						<li><a data-toggle="tab" href="#tab3">Reviews (3)</a></li>
					</ul>
					<!-- /product tab nav -->

					<!-- product tab content -->
					<div class="tab-content">
						<!-- tab1  -->
						<div id="tab1" class="tab-pane fade in active">
							<div class="row">
								<div class="col-md-12">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</p>
								</div>
							</div>
						</div>
						<!-- /tab1  -->

						<!-- tab2  -->
						<div id="tab2" class="tab-pane fade in">
							<div class="row">
								<div class="col-md-12">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</p>
								</div>
							</div>
						</div>
						<!-- /tab2  -->

						<!-- tab3  -->
						<div id="tab3" class="tab-pane fade in">
							<div class="row">
								<!-- Rating -->
								<div class="col-md-3">
									<div id="rating">
										<div class="rating-avg">
											<span>4.5</span>
											<div class="rating-stars">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star-o"></i>
											</div>
										</div>
										<ul class="rating">
											<li>
												<div class="rating-stars">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i>
												</div>
												<div class="rating-progress">
													<div style="width: 80%"></div>
												</div> <span class="sum">3</span>
											</li>
											<li>
												<div class="rating-stars">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o"></i>
												</div>
												<div class="rating-progress">
													<div style="width: 60%"></div>
												</div> <span class="sum">2</span>
											</li>
											<li>
												<div class="rating-stars">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
														class="fa fa-star-o"></i>
												</div>
												<div class="rating-progress">
													<div></div>
												</div> <span class="sum">0</span>
											</li>
											<li>
												<div class="rating-stars">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
														class="fa fa-star-o"></i>
												</div>
												<div class="rating-progress">
													<div></div>
												</div> <span class="sum">0</span>
											</li>
											<li>
												<div class="rating-stars">
													<i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
														class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
														class="fa fa-star-o"></i>
												</div>
												<div class="rating-progress">
													<div></div>
												</div> <span class="sum">0</span>
											</li>
										</ul>
									</div>
								</div>
								<!-- /Rating -->

								<!-- Reviews -->
								<div class="col-md-6">
									<div id="reviews">
										<ul class="reviews">
											<li>
												<div class="review-heading">
													<h5 class="name">John</h5>
													<p class="date">27 DEC 2018, 8:0 PM</p>
													<div class="review-rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-o empty"></i>
													</div>
												</div>
												<div class="review-body">
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit, sed do eiusmod tempor incididunt ut labore et dolore
														magna aliqua</p>
												</div>
											</li>
											<li>
												<div class="review-heading">
													<h5 class="name">John</h5>
													<p class="date">27 DEC 2018, 8:0 PM</p>
													<div class="review-rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-o empty"></i>
													</div>
												</div>
												<div class="review-body">
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit, sed do eiusmod tempor incididunt ut labore et dolore
														magna aliqua</p>
												</div>
											</li>
											<li>
												<div class="review-heading">
													<h5 class="name">John</h5>
													<p class="date">27 DEC 2018, 8:0 PM</p>
													<div class="review-rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-o empty"></i>
													</div>
												</div>
												<div class="review-body">
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit, sed do eiusmod tempor incididunt ut labore et dolore
														magna aliqua</p>
												</div>
											</li>
										</ul>
										<ul class="reviews-pagination">
											<li class="active">1</li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
										</ul>
									</div>
								</div>
								<!-- /Reviews -->

								<!-- Review Form -->
								<div class="col-md-3">
									<div id="review-form">
										<form class="review-form">
											<input class="input" type="text" placeholder="Your Name" />
											<input class="input" type="email" placeholder="Your Email" />
											<textarea class="input" placeholder="Your Review"></textarea>
											<div class="input-rating">
												<span>Your Rating: </span>
												<div class="stars">
													<input id="star5" name="rating" value="5" type="radio" /><label
														for="star5"></label> <input id="star4" name="rating"
														value="4" type="radio" /><label for="star4"></label> <input
														id="star3" name="rating" value="3" type="radio" /><label
														for="star3"></label> <input id="star2" name="rating"
														value="2" type="radio" /><label for="star2"></label> <input
														id="star1" name="rating" value="1" type="radio" /><label
														for="star1"></label>
												</div>
											</div>
											<button class="primary-btn">Submit</button>
										</form>
									</div>
								</div>
								<!-- /Review Form -->
							</div>
						</div>
						<!-- /tab3  -->
					</div>
					<!-- /product tab content  -->
				</div>
			</div>
			<!-- /product tab -->
		</div>
		<!-- /row -->

	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- Section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<div class="section-title text-center">
					<h3 class="title">Related Products</h3>
				</div>
			</div>
			<!-- product -->

			<div class="col-md-3">
				<div class="product">
					<div class="product-img">
						<img src="/img/product01.png" alt />
						<div class="product-label">
							<span class="sale">-30%</span> <span class="new">NEW</span>
						</div>
					</div>
					<div class="product-body">
						<p class="product-category">Mới</p>
						<h3 class="product-name">
							<a href="/shop/product">Iphone 15 pro max</a>
						</h3>
						<button type="button" class="btn btn-default">64GB</button>
						<button type="button" class="btn btn-default">258GB</button>
						<h4 class="product-price">
							30,000,000 đ
							<del class="product-old-price">35,000,000 đ</del>
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
								<a href="/shop/cart"><i class="fa fa-shopping-cart"></i> <span
									class="tooltipp">Thêm vào giỏ hàng</span></a>
							</button>
						</div>
					</div>
					<div class="add-to-cart">
						<a href="/shop/checkout">
							<button class="add-to-cart-btn">
								<i class="fa-brands fa-bitcoin" style="font-size: 20px"></i> Mua
								ngay
							</button>
						</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="product">
					<div class="product-img">
						<img src="/img/product01.png" alt />
						<div class="product-label">
							<span class="sale">-30%</span> <span class="new">NEW</span>
						</div>
					</div>
					<div class="product-body">
						<p class="product-category">Mới</p>
						<h3 class="product-name">
							<a href="#">Iphone 15 pro max</a>
						</h3>
						<button type="button" class="btn btn-default">64GB</button>
						<button type="button" class="btn btn-default">258GB</button>
						<h4 class="product-price">
							30,000,000 đ
							<del class="product-old-price">35,000,000 đ</del>
						</h4>
						<div class="product-rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
						<div class="product-btns">
							<button class="quick-view">
								<a href="product.html?id=1"><i class="fa fa-eye"></i></a><span
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
								<i class="fa-brands fa-bitcoin" style="font-size: 20px"></i> Mua
								ngay
							</button>
						</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="product">
					<div class="product-img">
						<img src="/img/product01.png" alt />
						<div class="product-label">
							<span class="sale">-30%</span> <span class="new">NEW</span>
						</div>
					</div>
					<div class="product-body">
						<p class="product-category">Mới</p>
						<h3 class="product-name">
							<a href="#">Iphone 15 pro max</a>
						</h3>
						<button type="button" class="btn btn-default">64GB</button>
						<button type="button" class="btn btn-default">258GB</button>
						<h4 class="product-price">
							30,000,000 đ
							<del class="product-old-price">35,000,000 đ</del>
						</h4>
						<div class="product-rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
						<div class="product-btns">
							<button class="quick-view">
								<a href="product.html?id=1"><i class="fa fa-eye"></i></a><span
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
								<i class="fa-brands fa-bitcoin" style="font-size: 20px"></i> Mua
								ngay
							</button>
						</a>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="product">
					<div class="product-img">
						<img src="/img/product01.png" alt />
						<div class="product-label">
							<span class="sale">-30%</span> <span class="new">NEW</span>
						</div>
					</div>
					<div class="product-body">
						<p class="product-category">Mới</p>
						<h3 class="product-name">
							<a href="#">Iphone 15 pro max</a>
						</h3>
						<button type="button" class="btn btn-default">64GB</button>
						<button type="button" class="btn btn-default">258GB</button>
						<h4 class="product-price">
							30,000,000 đ
							<del class="product-old-price">35,000,000 đ</del>
						</h4>
						<div class="product-rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
						<div class="product-btns">
							<button class="quick-view">
								<a href="product.html?id=1"><i class="fa fa-eye"></i></a><span
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
								<i class="fa-brands fa-bitcoin" style="font-size: 20px"></i> Mua
								ngay
							</button>
						</a>
					</div>
				</div>
			</div>

		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /Section -->

