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

			<div class="col-md-2 col-md-pull-5">
				<div id="product-imgs">
					<c:forEach var="images" items="${finByIdPhone.images}">
						<div class="product-preview">
							<img src="/images/${images.IMAGE }" alt />
						</div>
					</c:forEach>
				</div>
			</div>

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
						<c:set var="price" value="${variant2.PRICE }" />
						<c:set var="discount" value="${variant2.discount_product.DISCOUNT_PERCENTAGE }" />
						<h3 id="giav${finByIdPhone.ID}" class="product-price">
							<fmt:formatNumber pattern="###,###" value=" ${price *(100-discount)/100}"></fmt:formatNumber>
						</h3>
						<del id="discount${finByIdPhone.ID}" class="product-old-price" style="font-size: 18px">
						<fmt:formatNumber pattern="###,###" value="${price}"></fmt:formatNumber></del>
					</div>
					<p>
						<b>Mô tả sản phẩm:</b> <br> ${finByIdPhone.DESCRIPTION}
					</p>

					<div class="product-options">
						<c:set var="GB" />
						<c:set var="idphone" value="${finByIdPhone.ID}" />

						<div class="row">
							<c:forEach var="variant" items="${finByIdPhone.variants }">
								<div class="col-md-3">
									<c:if test="${variant.storage.ID != GB}">
											<a href="/shop/product/${idphone}?id_variant=${variant.ID}&id_storage=${variant.storage.ID}"><button type="button" class="btn btn-default inline-button">${variant.storage.GB}
												GB</button></a>
										<c:set var="GB" value="${variant.storage.ID }"></c:set>
										<c:set var="price" value="${variant.PRICE }"></c:set>
									</c:if>
								</div>
							</c:forEach>
						</div>
						<div class="row">
							<c:set var="usedColors" />
							<c:forEach var="variant" items="${finAllColor}">
								<div class="col-md-3">
										<button onclick="updateBuyNowButton(${idphone}, ${variant.ID})"
											type="button" class="btn btn-default inline-button-color">${variant.color.NAME}</button>
										<c:set var="usedColors" value="${variant.color.ID}" />
								</div>
							</c:forEach>
						</div>

					</div>

					<div class="add-to-cart">
						<div class="qty-label">
							<div class="input-number">
								<input type="number" id="quantityInput" value="1" min="1"/> <span class="qty-up">+</span>
								<span class="qty-down">-</span>
							</div>
						</div>
					</div>
					<div class="add-to-cart">
						<a id="buyNowButton"><button class="add-to-cart-btn">
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
									<p>${finByIdPhone.DESCRIPTION}</p>
								</div>
							</div>
						</div>
						<!-- /tab1  -->

						<!-- tab2  -->
						<div id="tab2" class="tab-pane fade in">
							<div class="row">
								<div class="col-md-12">
									<div class="l-pd-body__right">
										<div class="card re-card st-card">
											<h2 class="card-title">Thông số kỹ thuật</h2>
											<div class="card-body">
												<table class="table table-bordered table-striped">
													<tbody>
														<tr>
															<td>Màn hình</td>
															<td>${finByIdPhone.SCREEN_SIZE}inch,IPS LCD, HD,
																${finByIdPhone.SCREEN_RESOLUTIONKT } Pixels</td>
														</tr>
														<tr>
															<td>Camera chính</td>
															<td>${finByIdPhone.MAIN_CAMERA }MP</td>
														</tr>
														<tr>
															<td>Camera Selfie</td>
															<td>${finByIdPhone.SELFIE_CAMERA }MP</td>
														</tr>
														<tr>
															<td>RAM</td>
															<td>${finByIdPhone.RAM} GB</td>
														</tr>
														<tr>
															<td>Kết nối</td>
															<td>${finByIdPhone.CONNECTION }</td>
														</tr>
														<tr>
															<td>Tốc độ CPU</td>
															<td>${finByIdPhone.CPU_SPEED } GHz</td>
														</tr>
														<tr>
															<td>Dung lượng pin</td>
															<td>${finByIdPhone.BATTERY_CAPACITY }mAh</td>
														</tr>
														<tr>
															<td>Hệ điều hành</td>
															<td>${finByIdPhone.system.SYSTEM }</td>
														</tr>
														<tr>
															<td>Thời gian ra mắt</td>
															<td><fmt:formatDate pattern="dd/MM/yyyy"
																	value="${finByIdPhone.CREATE_AT }" /></td>
														</tr>
													</tbody>
												</table>
												<div class="st-pd-table-viewDetail">
													<a href="#" class="re-link js--open-modal">Xem cấu hình
														chi tiết <span class="carret"></span>
													</a>
												</div>
											</div>
										</div>
									</div>
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
			<c:set var="counter" value="0" />
			<c:forEach var="phone" items="${listPhone}">
				<c:set value="${phone.variants[0]}" var="variantFirst"></c:set>
				<c:set value="${variantFirst}" var="variantmd"></c:set>
				<c:if test="${counter % 3 == 0}">
					<div class="row">
				</c:if>
				<div class="col-md-3">
					<div class="product">
						<div class="product-img">
							<img src="/images/${phone.IMAGE}" alt="">
							<div class="product-label">
								<span id="sale${phone.ID}" class="sale">
									<fmt:formatNumber value="${variantmd.discount_product.DISCOUNT_PERCENTAGE}" /> %
								</span>
								<span class="new">${phone.category.NAME}</span>
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
									<button onclick="getGiaRelated(${idphone},${variant.ID})" type="button" class="btn btn-default">
										<c:if test="${2048 >= variant.storage.GB && variant.storage.GB >= 1024}">
											1 TB
										</c:if>
										<c:if test="${1024 > variant.storage.GB}">
											${variant.storage.GB} GB
										</c:if>
									</button>
									<c:set var="a" value="${variant.storage.GB}"></c:set>
								</c:if>
							</c:forEach>
							<div class="" style="display: flex; justify-content: center;">
								<h4 id="gia${phone.ID}" class="product-price" style="margin-right: 5px;">
									<fmt:formatNumber value="${variantmd.PRICE * (100 - variantmd.discount_product.DISCOUNT_PERCENTAGE) / 100}" pattern="###,###.###" />
								</h4>
								<span class="">
									<del id="giagoc${phone.ID}" class="product-old-price">
										<fmt:formatNumber value="${variantmd.PRICE}" pattern="###,###.###" />
									</del>
								</span>
							</div>
							<div class="product-rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<div class="product-btns">
								<button class="quick-view">
									<a href="/shop/product/${phone.ID}/?id_storage=${variantmd.storage.ID}">
										<i class="fa fa-eye"></i>
									</a>
									<span class="tooltipp">quick view</span>
								</button>
								<button class="quick-view">
									<i class="fa fa-shopping-cart"></i>
									<span class="tooltipp">Thêm vào giỏ hàng</span>
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
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /Section -->
<script>

function updateBuyNowButton(idPhone, idVariant) {
    // Update the "Mua ngay" button's URL with the selected variant ID
    var quantity = document.getElementById('quantityInput').value;
    var buyNowButton = document.getElementById('buyNowButton');
    var baseUrl = "/shop/checkout?&id_variant=" + idVariant+"&quantity="+quantity;
    buyNowButton.href = baseUrl;

    // Optionally, call the getGia function to update prices
    getGia(idPhone, idVariant);
}
function getGia(idPhone, idVariant) {
    $.ajax({
        type: "GET",
        url: "/shop/ajax/getGia/" + idVariant,
        success: function(response) {
            var price = response[0];
            var discount = response[1];
            var discountedPrice = price * (100 - discount) / 100;

            // Format the prices with commas as thousand separators
            var formattedDiscountedPrice = Math.round(discountedPrice).toLocaleString('en-US');
            var formattedPrice = Math.round(price).toLocaleString('en-US');

            $("#giav" + idPhone).text(formattedDiscountedPrice);
            $("#discount" + idPhone).text(formattedPrice);
        },
        error: function(xhr, status, error) {
            console.log("Error: " + error);
        }
    });
}
function getGiaRelated(idPhone, idVariant) {
    $.ajax({
        type: "GET",
        url: "/shop/ajax/getGiaRelated/" + idVariant,
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
function formatPrice(price) {
    return price.toLocaleString('en-US', { minimumFractionDigits: 0, maximumFractionDigits: 0 });
}
</script>

