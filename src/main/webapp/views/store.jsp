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
			<!-- ASIDE -->
			<form:form>
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
						<button class="btn pull-right" style="border-radius:5px; border: 1px solid #090909; background-color: #0d6efd;
    						color: #fff; width: 78px; margin-top: 57px;">Tìm</button>
					<!-- /aside Widget -->
				</div>
			</form:form>


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
					<!-- product -->
					<c:forEach var="item" items="${finByAllCategories}">
					<c:forEach var="phone" items="${item.phones}">
					<c:if test="${!phone.IS_DELETE }">
						<div class="col-md-4 col-xs-6">
							<div class="product">
								<div class="product-img">
									<img src="/images/${phone.IMAGE }" alt=""/>
									<div class="product-label"> 
										<span class="new">${item.NAME }</span>
									</div>
								</div>
								<div class="product-body">
									<p class="product-category">Mới</p>
									<h3 class="product-name">
										<a href="#">${phone.NAME }</a>
									</h3>
									<c:set var="a"></c:set>
									<c:forEach var="variant" items="${phone.variants}">
										<c:if test="${a != (variant.storage.GB)}">
										<a href="#"><button type="button" class="btn btn-default">${variant.storage.GB}GB</button></a>
										<c:set var="a" value="${variant.storage.GB}"></c:set>
										</c:if>
									</c:forEach>
									
									<h4 class="product-price">
										<fmt:formatNumber pattern="###,###">10000000</fmt:formatNumber>
										
									</h4>
									<div class="product-btns">
										<button class="quick-view">
											<a href="product?id=1"><i class="fa fa-eye"></i></a><span
												class="tooltipp">quick view</span>
										</button>
										<button class="quick-view">
											<i class="fa fa-shopping-cart"></i><span class="tooltipp">Thêm
												vào giỏ hàng</span>
										</button>
									</div>
								</div>
								<div class="add-to-cart">
									<a href="checkout.html">
										<button class="add-to-cart-btn">
											<i class="fa-brands fa-bitcoin" style="font-size: 20px"></i>
											Mua ngay
										</button>
									</a>
								</div>
							</div>
						</div>
						</c:if>
						</c:forEach>
					</c:forEach>
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