<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- ASIDE -->
			<div id="aside" class="col-md-3">
				<!-- aside Widget -->
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
				<!-- /aside Widget -->

				<!-- aside Widget -->
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
				<!-- /aside Widget -->

				<!-- aside Widget -->
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
				<!-- /aside Widget -->

				<!-- /aside Widget -->
			</div>
			<!-- /ASIDE -->

			<!-- STORE -->
			<div id="store" class="col-md-9">
				<!-- store top filter -->
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
				<!-- /store top filter -->

				<!-- store products -->
				<div class="row">
					<c:forEach var="phone" items="${phones}">
						<div class="col-md-4 col-xs-6">
							<div class="product">
								<div class="product-img" >
									 <img src="/images/${phone.IMAGE}" alt="${phone.NAME}" height="200px" width="100%"/>
									<div class="product-label">
										<span class="sale">-30%</span> <span class="new">NEW</span>
									</div>
								</div>
								<div class="product-body">
									<p class="product-category">${brand.NAME}</p>
									<h3 class="product-name">
										<a href="/shop/product">${phone.NAME}</a>
									</h3>
									<button type="button" class="btn btn-default">64GB</button>
									<button type="button" class="btn btn-default">258GB</button>
									<h4 class="product-price">
										${variant.PRICE} đ
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
											<a href="/shop/cart"> <i class="fa fa-shopping-cart"></i><span
												class="tooltipp">Thêm vào giỏ hàng</span></a>
										</button>
									</div>
								</div>
								<div class="add-to-cart">
									<a href="/shop/checkout">
										<button class="add-to-cart-btn">
											<i class="fa-brands fa-bitcoin" style="font-size: 20px"></i>
											Mua ngay
										</button>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>

					<!-- <div class="col-md-4 col-xs-6">
                <div class="product">
                  <div class="product-img">
                    <img src="/img/product01.png" alt />
                    <div class="product-label">
                      <span class="sale">-30%</span>
                      <span class="new">NEW</span>
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
                      30,000,000 đ<del class="product-old-price"
                        >35,000,000 đ</del
                      >
                    </h4>
                    <div class="product-rating">
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </div>
                    <div class="product-btns">
                      <button class="quick-view">
                        <a href="product.html?id=1"><i class="fa fa-eye"></i></a
                        ><span class="tooltipp">quick view</span>
                      </button>
                      <button class="quick-view">
                        <i class="fa fa-shopping-cart"></i
                        ><span class="tooltipp">Thêm vào giỏ hàng</span>
                      </button>
                    </div>
                  </div>
                  <div class="add-to-cart">
                    <a href="checkout.html">
                      <button class="add-to-cart-btn">
                        <i
                          class="fa-brands fa-bitcoin"
                          style="font-size: 20px"
                        ></i>
                        Mua ngay
                      </button></a
                    >
                  </div>
                </div>
              </div> -->

					<!-- <div class="col-md-4 col-xs-6">
                <div class="product">
                  <div class="product-img">
                    <img src="/img/product01.png" alt />
                    <div class="product-label">
                      <span class="sale">-30%</span>
                      <span class="new">NEW</span>
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
                      30,000,000 đ<del class="product-old-price"
                        >35,000,000 đ</del
                      >
                    </h4>
                    <div class="product-rating">
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </div>
                    <div class="product-btns">
                      <button class="quick-view">
                        <a href="product.html?id=1"><i class="fa fa-eye"></i></a
                        ><span class="tooltipp">quick view</span>
                      </button>
                      <button class="quick-view">
                        <i class="fa fa-shopping-cart"></i
                        ><span class="tooltipp">Thêm vào giỏ hàng</span>
                      </button>
                    </div>
                  </div>
                  <div class="add-to-cart">
                    <a href="checkout.html">
                      <button class="add-to-cart-btn">
                        <i
                          class="fa-brands fa-bitcoin"
                          style="font-size: 20px"
                        ></i>
                        Mua ngay
                      </button></a
                    >
                  </div>
                </div>
              </div> -->
				</div>
				<!-- /store products -->

				<!-- store bottom filter -->
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
				<!-- /store bottom filter -->
			</div>
			<!-- /STORE -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->
