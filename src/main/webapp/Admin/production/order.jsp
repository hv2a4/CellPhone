<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<body>

<div class="row">
    <div class="col-md-12 col-sm-12 ">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                        data-bs-target="#home-tab-pane" type="button" role="tab"
                        aria-controls="home-tab-pane" aria-selected="true"
                        style="width: 100px">
                    <span style="font-size: 15px;">Tất cả</span>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="profile-tab" data-bs-toggle="tab"
                        data-bs-target="#profile-tab-pane" type="button" role="tab"
                        aria-controls="profile-tab-pane" aria-selected="false"
                        style="width: 140px">
                    <span style="font-size: 15px;">Chờ xác nhận</span>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="contact-tab" data-bs-toggle="tab"
                        data-bs-target="#contact-tab-pane" type="button" role="tab"
                        aria-controls="contact-tab-pane" aria-selected="false"
                        style="width: 100px">
                    <span style="font-size: 15px;">Xác nhận</span>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="dangvanchuyen-tab"
                        data-bs-toggle="tab" data-bs-target="#dangvanchuyen" type="button"
                        role="tab" aria-controls="dangvanchuyen" aria-selected="false"
                        style="width: 130px">
                    <span style="font-size: 15px;">Đang giao</span>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="hoanthanh-tab" data-bs-toggle="tab"
                        data-bs-target="#hoanthanh" type="button" role="tab"
                        aria-controls="hoanthanh" aria-selected="false"
                        style="width: 130px">
                    <span style="font-size: 15px;">Hoàn thành</span>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="trahang-tab" data-bs-toggle="tab"
                        data-bs-target="#trahang" type="button" role="tab"
                        aria-controls="trahang" aria-selected="false" style="width: 100px">
                    <span style="font-size: 15px;">Trả hàng</span>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="dahuy-tab" data-bs-toggle="tab"
                        data-bs-target="#dahuy" type="button" role="tab"
                        aria-controls="dahuy" aria-selected="false" style="width: 100px">
                    <span style="font-size: 15px;">Đã hủy</span>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="choxacnhantrahang-tab"
                        data-bs-toggle="tab" data-bs-target="#choxacnhantrahang"
                        type="button" role="tab" aria-controls="choxacnhantrahang"
                        aria-selected="false" style="width: 150px">
                    <span style="font-size: 15px;">Chờ trả hàng</span>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="giaoTraHang-tab"
                        data-bs-toggle="tab" data-bs-target="#giaoTraHang"
                        type="button" role="tab" aria-controls="giaoTraHang"
                        aria-selected="false" style="width: 100px">
                    <span style="font-size: 15px;">Giao trả</span>
                </button>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home-tab-pane"
                 role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Danh Sách</h2>

                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">
                                            <table id=""
                                                   class="table table-striped table-bordered dt-responsive nowrap"
                                                   cellspacing="0" width="100%">
                                                <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Địa chỉ</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Trạng thái thanh toán</th>
                                                    <th>Trạng thái đơn hàng</th>
                                                    <th>Hoạt động</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" items="${pageOrder.content}"
                                                           varStatus="loop">
                                                    <c:if test="${item.user.USERNAME != list.USERNAME}">
                                                        <c:if test="${item.user.USERNAME != list.USERNAME}">
                                                            <tr>
                                                                <td data-bs-toggle="modal"
                                                                    data-bs-target="#staticBackdrop_${item.ID}">
                                                                    DK<fmt:formatDate value="${item.UPDATE_AT}"
                                                                                      pattern="yyyy-MM-dd"/>${loop.index +1}</td>
                                                                <td data-bs-toggle="modal"
                                                                    data-bs-target="#staticBackdrop_${item.ID}">${item.user.FULLNAME}</td>
                                                                <td>${item.ADDRESS}</td>
                                                                <td><fmt:formatNumber type="number"
                                                                                      currencyCode="VND"
                                                                                      value="${item.TOTAL_AMOUNT}"/></td>
                                                                <td><fmt:formatDate value="${item.UPDATE_AT}"
                                                                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                                <td>
                                                                    <b>
                                                                        <c:choose>
                                                                            <c:when test="${not empty item.invoices and not empty item.invoices.get(0)}">
                                                                                <c:choose>
                                                                                    <c:when test="${item.invoices.get(0).status_invoice.NAME == 'Đã thanh toán'}">
                                                                                <span class="text-center  text-success"
                                                                                      style="font-size: 15px;width: 130px">${item.invoices.get(0).status_invoice.NAME}</span>
                                                                                    </c:when>
                                                                                    <c:when test="${item.invoices.get(0).status_invoice.NAME == 'Chưa thanh toán'}">
                                                                                <span class="text-center  text-secondary"
                                                                                      style="font-size: 15px;width: 130px">${item.invoices.get(0).status_invoice.NAME}</span>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                <span class="text-center text-danger"
                                                                                      style="font-size: 15px;width: 130px">${item.invoices.get(0).status_invoice.NAME}</span>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="text-center text-secondary"
                                                                                      style="font-size: 15px;width: 130px">Chưa thanh toán</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </b>
                                                                </td>
                                                                <td><c:choose>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Hoàn thành'}">
																			<span class="badge rounded-pill"
                                                                                  style="width: 130px; background-color: #4caf50; color: white; font-size: 15px">
																				Hoàn thành </span>
                                                                    </c:when>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Chờ xác nhận'}">
																			<span class="badge rounded-pill"
                                                                                  style="width: 130px; background-color: #ffeb3b; color: black; font-size: 15px">
																				Chờ xác nhận </span>
                                                                    </c:when>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Đã xác nhận'}">
																			<span class="badge rounded-pill"
                                                                                  style="width: 130px; background-color: #2196f3; color: white; font-size: 15px">
																				Đã xác nhận </span>
                                                                    </c:when>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Giao hàng'}">
																			<span class="badge rounded-pill"
                                                                                  style="width: 130px; background-color: #ff9800; color: white; font-size: 15px">
																				Giao hàng </span>
                                                                    </c:when>
                                                                    <c:when test="${item.status_order.STATUS == 'Hủy'}">
																			<span class="badge rounded-pill"
                                                                                  style="width: 130px; background-color: #f44336; color: white; font-size: 15px">
																				Hủy </span>
                                                                    </c:when>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Giao trả'}">
																			<span class="badge rounded-pill"
                                                                                  style="width: 130px; background-color: #9e9e9e; color: white; font-size: 15px">Giao trả </span>
                                                                    </c:when>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Trả hàng'}">
																			<span class="badge rounded-pill"
                                                                                  style="width: 130px; background-color: #32aae1; color: white; font-size: 15px">Trả hàng </span>
                                                                    </c:when>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Chờ xác nhận trả'}">
                                                                <span class="badge rounded-pill"
                                                                      style="width: 130px; background-color: #A0522D; color: white; font-size: 15px">Chờ xác nhận trả</span>
                                                                    </c:when>
                                                                </c:choose></td>
                                                                <td class="text-center"><c:choose>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Hoàn thành'}">
                                                                        <button type="button" class="btn"
                                                                                data-bs-toggle="modal"
                                                                                data-bs-target="#chiTietTraHang_${item.ID}"
                                                                                style="width: 120px; background-color: #28a745; color: white; font-size: 15px;">
                                                                            Chi tiết
                                                                        </button>
                                                                        <div class="modal fade"
                                                                             id="chiTietTraHang_${item.ID}"
                                                                             data-bs-backdrop="static"
                                                                             data-bs-keyboard="false"
                                                                             tabindex="-1"
                                                                             aria-labelledby="staticBackdropLabel"
                                                                             aria-hidden="true">
                                                                            <div class="modal-dialog modal-xl">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h1 class="modal-title fs-5"
                                                                                            id="staticBackdropLabel_${item.ID}">
                                                                                            Thông tin
                                                                                            đơn hàng</h1>
                                                                                        <button type="button"
                                                                                                class="btn-close"
                                                                                                data-bs-dismiss="modal"
                                                                                                aria-label="Close"></button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <!-- Header của danh sách đơn hàng -->
                                                                                        <div class="row bg-dark text-white">
                                                                                            <div class="col-md-1 py-2">
                                                                                                Mã
                                                                                            </div>
                                                                                            <div class="col-md-2 py-2">
                                                                                                Hình
                                                                                                ảnh
                                                                                            </div>
                                                                                            <div class="col-md-3 py-2">
                                                                                                Tên
                                                                                                sản phẩm
                                                                                            </div>
                                                                                            <div class="col-md-2 text-center py-2">
                                                                                                Số
                                                                                                lượng
                                                                                            </div>
                                                                                            <div class="col-md-2 text-center py-2">
                                                                                                Đơn giá
                                                                                            </div>
                                                                                            <div class="col-md-2 text-center py-2">
                                                                                                Tổng
                                                                                            </div>
                                                                                        </div>

                                                                                        <!-- Dữ liệu từng đơn hàng -->
                                                                                        <c:forEach
                                                                                                items="${item.order_items}"
                                                                                                var="orderItem">
                                                                                            <div class="row mt-3">
                                                                                                <div class="col-md-1 border-bottom">${orderItem.ID}</div>
                                                                                                <div class="col-md-2 border-bottom">
                                                                                                    <img src="/images/${orderItem.variant.phone.IMAGE}"
                                                                                                         alt="${orderItem.variant.phone.NAME}"
                                                                                                         class="img-fluid"
                                                                                                         style="width: 100px; height: 100px">
                                                                                                </div>
                                                                                                <div class="col-md-3 border-bottom d-flex align-items-center">

                                                                                                        ${orderItem.variant.phone.NAME}
                                                                                                    (${orderItem.variant.color.NAME}
                                                                                                    -
                                                                                                    <c:choose>
                                                                                                        <c:when test="${orderItem.variant.storage.GB == 1024}">
                                                                                                            1T
                                                                                                        </c:when>
                                                                                                        <c:otherwise>${orderItem.variant.storage.GB} GB</c:otherwise>
                                                                                                    </c:choose>
                                                                                                    )
                                                                                                </div>
                                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">${orderItem.QUANTITY}</div>
                                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                                    <fmt:formatNumber
                                                                                                            type="number"
                                                                                                            currencyCode="VND"
                                                                                                            value="${orderItem.PRICE}"/>
                                                                                                </div>
                                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                                    <fmt:formatNumber
                                                                                                            type="number"
                                                                                                            currencyCode="VND"
                                                                                                            value="${orderItem.PRICE * orderItem.QUANTITY}"/>
                                                                                                </div>
                                                                                            </div>
                                                                                            <!-- Lặp lại các block trên cho từng orderItem -->
                                                                                        </c:forEach>
                                                                                    </div>

                                                                                    <div class="modal-footer">
                                                                                        <button type="button"
                                                                                                class="btn btn-primary"
                                                                                                data-bs-dismiss="modal">
                                                                                            Đóng
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Chờ xác nhận'}">
                                                                        <button class="btn"
                                                                                onclick="confirmation(${item.ID})"
                                                                                style="width: 120px; background-color: #ffc107; color: black;">
                                                                            Xác Nhận
                                                                        </button>
                                                                    </c:when>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Đã xác nhận'}">
                                                                        <button class="btn"
                                                                                onclick="delivery(${item.ID})"
                                                                                style="width: 120px; background-color: #17a2b8; color: whitesmoke;">
                                                                            Giao hàng
                                                                        </button>
                                                                    </c:when>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Giao hàng'}">
                                                                        <button class="btn"
                                                                                onclick="completed(${item.ID})"
                                                                                style="width: 120px; background-color: #007bff; color: white;">
                                                                            Hoàn tất
                                                                        </button>
                                                                    </c:when>
                                                                    <c:when test="${item.status_order.STATUS == 'Hủy'}">
                                                                        <button type="button" class="btn"
                                                                                data-bs-toggle="modal"
                                                                                data-bs-target="#xemlydo_${loop.index + 1}"
                                                                                style="width: 120px; background-color: #dc3545; color: white;">
                                                                            Lý do
                                                                        </button>
                                                                    </c:when>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Giao trả'}">
                                                                        <button class="btn btn-dark"
                                                                                onclick="returns(${item.ID})"
                                                                                style="width: 120px;">
                                                                            Đã nhận
                                                                        </button>
                                                                    </c:when>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Trả hàng'}">
                                                                        <button class="btn btn-primary"
                                                                                style="width: 120px;"
                                                                                data-bs-toggle="modal"
                                                                                data-bs-target="#xemChiTietTraHangNhanModal_${item.ID}">
                                                                            Chi tiết
                                                                        </button>
                                                                    </c:when>
                                                                    <c:when
                                                                            test="${item.status_order.STATUS == 'Chờ xác nhận trả'}">
                                                                        <button class="btn btn-dark"
                                                                                onclick="xacNhanTraHang(${item.ID})"
                                                                                style="width: 120px;">Xác nhận trả
                                                                        </button>
                                                                    </c:when>
                                                                </c:choose></td>
                                                            </tr>
                                                            <div class="modal fade"
                                                                 id="xemChiTietTraHangNhanModal_${item.ID}"
                                                                 data-bs-backdrop="static" data-bs-keyboard="false"
                                                                 tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                                 aria-hidden="true">
                                                                <div class="modal-dialog modal-xl">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h1 class="modal-title fs-5"
                                                                                id="staticBackdropLabel_${item.ID}">
                                                                                Thông
                                                                                tin
                                                                                đơn hàng</h1>
                                                                            <button type="button" class="btn-close"
                                                                                    data-bs-dismiss="modal"
                                                                                    aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <!-- Header của danh sách đơn hàng -->
                                                                            <div class="row bg-dark text-white">
                                                                                <div class="col-md-1 py-2">Mã</div>
                                                                                <div class="col-md-2 py-2">Hình ảnh
                                                                                </div>
                                                                                <div class="col-md-3 py-2">Tên sản phẩm
                                                                                </div>
                                                                                <div class="col-md-2 text-center py-2">
                                                                                    Số
                                                                                    lượng
                                                                                </div>
                                                                                <div class="col-md-2 text-center py-2">
                                                                                    Đơn
                                                                                    giá
                                                                                </div>
                                                                                <div class="col-md-2 text-center py-2">
                                                                                    Tổng
                                                                                </div>
                                                                            </div>

                                                                            <!-- Dữ liệu từng đơn hàng -->
                                                                            <c:forEach items="${item.order_items}"
                                                                                       var="orderItem">
                                                                                <div class="row mt-3">
                                                                                    <div class="col-md-1 border-bottom">${orderItem.ID}</div>
                                                                                    <div class="col-md-2 border-bottom">
                                                                                        <img src="/images/${orderItem.variant.phone.IMAGE}"
                                                                                             alt="${orderItem.variant.phone.NAME}"
                                                                                             class="img-fluid"
                                                                                             style="width: 100px; height: 100px">
                                                                                    </div>
                                                                                    <div class="col-md-3 border-bottom d-flex align-items-center">

                                                                                            ${orderItem.variant.phone.NAME}
                                                                                        (${orderItem.variant.color.NAME}
                                                                                        -
                                                                                        <c:choose>
                                                                                            <c:when test="${orderItem.variant.storage.GB == 1024}">
                                                                                                1T
                                                                                            </c:when>
                                                                                            <c:otherwise>${orderItem.variant.storage.GB} GB</c:otherwise>
                                                                                        </c:choose>
                                                                                        )
                                                                                    </div>
                                                                                    <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">${orderItem.QUANTITY}</div>
                                                                                    <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                        <fmt:formatNumber type="number"
                                                                                                          currencyCode="VND"
                                                                                                          value="${orderItem.PRICE}"/>
                                                                                    </div>
                                                                                    <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                        <fmt:formatNumber type="number"
                                                                                                          currencyCode="VND"
                                                                                                          value="${orderItem.PRICE * orderItem.QUANTITY}"/>
                                                                                    </div>
                                                                                </div>
                                                                                <!-- Lặp lại các block trên cho từng orderItem -->
                                                                            </c:forEach>
                                                                        </div>

                                                                        <div class="modal-footer">
                                                                            <button type="button"
                                                                                    class="btn btn-primary"
                                                                                    data-bs-dismiss="modal">Đóng
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="modal fade"
                                                                 id="exampleModal_${loop.index + 1}" tabindex="-1"
                                                                 aria-labelledby="exampleModalLabel_${loop.index + 1}"
                                                                 aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h1 class="modal-title fs-5 fw-bold"
                                                                                id="exampleModalLabel_${loop.index + 1}">
                                                                                Chi
                                                                                tiết</h1>
                                                                            <button type="button" class="btn-close"
                                                                                    data-bs-dismiss="modal"
                                                                                    aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <h2>Tên: ${item.user.FULLNAME}</h2>
                                                                            <h2>Trạng
                                                                                thái: ${item.status_order.STATUS}</h2>
                                                                                <%--                                                                    <h2>Địa chỉ: ${item.address.ADDRESS}</h2>--%>
                                                                            <h2>Phương thức thanh toán:
                                                                                    ${item.payment_method.NAME}</h2>
                                                                            <h2>Tổng giảm giá: <fmt:formatNumber
                                                                                    type="number"
                                                                                    currencyCode="VND"
                                                                                    value="${item.TOTAL_DISCOUNT}"/></h2>
                                                                            <h2>
                                                                                Tổng tiền:
                                                                                <fmt:formatNumber type="number"
                                                                                                  currencyCode="VND"
                                                                                                  value="${item.TOTAL_AMOUNT}"/>
                                                                            </h2>
                                                                            <h2>Ngày tạo: ${item.CREATE_AT}</h2>
                                                                            <h2>
                                                                                Ngày cập nhật:
                                                                                <fmt:formatDate
                                                                                        value="${item.UPDATE_AT}"
                                                                                        pattern="yyyy-MM-dd HH:mm:ss"/>
                                                                            </h2>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button"
                                                                                    class="btn btn-primary"
                                                                                    data-bs-dismiss="modal">Close
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal fade" id="xemlydo_${loop.index + 1}"
                                                                 tabindex="-1"
                                                                 aria-labelledby="exampleModalLabel_${loop.index + 1}"
                                                                 aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h1 class="modal-title fs-5 fw-bold"
                                                                                id="exampleModalLabel_${loop.index + 1}">
                                                                                Xem
                                                                                lý
                                                                                do</h1>
                                                                            <button type="button" class="btn-close"
                                                                                    data-bs-dismiss="modal"
                                                                                    aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <h2>${item.user.USERNAME}-${item.user.FULLNAME}</h2>
                                                                            <br>
                                                                            <p>${item.REASON}</p>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button"
                                                                                    class="btn btn-primary"
                                                                                    data-bs-dismiss="modal">Close
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal fade" id="staticBackdrop_${item.ID}"
                                                                 data-bs-backdrop="static" data-bs-keyboard="false"
                                                                 tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                                 aria-hidden="true">
                                                                <div class="modal-dialog modal-xl">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h1 class="modal-title fs-5"
                                                                                id="staticBackdropLabel_${item.ID}">
                                                                                Thông
                                                                                tin
                                                                                đơn hàng</h1>
                                                                            <button type="button" class="btn-close"
                                                                                    data-bs-dismiss="modal"
                                                                                    aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <!-- Header của danh sách đơn hàng -->
                                                                            <div class="row bg-dark text-white">
                                                                                <div class="col-md-1 py-2">Mã</div>
                                                                                <div class="col-md-2 py-2">Hình ảnh
                                                                                </div>
                                                                                <div class="col-md-3 py-2">Tên sản phẩm
                                                                                </div>
                                                                                <div class="col-md-2 text-center py-2">
                                                                                    Số
                                                                                    lượng
                                                                                </div>
                                                                                <div class="col-md-2 text-center py-2">
                                                                                    Đơn
                                                                                    giá
                                                                                </div>
                                                                                <div class="col-md-2 text-center py-2">
                                                                                    Tổng
                                                                                </div>
                                                                            </div>

                                                                            <!-- Dữ liệu từng đơn hàng -->
                                                                            <c:forEach items="${item.order_items}"
                                                                                       var="orderItem">
                                                                                <div class="row mt-3">
                                                                                    <div class="col-md-1 border-bottom">${orderItem.ID}</div>
                                                                                    <div class="col-md-2 border-bottom">
                                                                                        <img src="/images/${orderItem.variant.phone.IMAGE}"
                                                                                             alt="${orderItem.variant.phone.NAME}"
                                                                                             class="img-fluid"
                                                                                             style="width: 100px; height: 100px">
                                                                                    </div>
                                                                                    <div class="col-md-3 border-bottom d-flex align-items-center">

                                                                                            ${orderItem.variant.phone.NAME}
                                                                                        (${orderItem.variant.color.NAME}
                                                                                        -
                                                                                        <c:choose>
                                                                                            <c:when test="${orderItem.variant.storage.GB == 1024}">
                                                                                                1T
                                                                                            </c:when>
                                                                                            <c:otherwise>${orderItem.variant.storage.GB} GB</c:otherwise>
                                                                                        </c:choose>
                                                                                        )
                                                                                    </div>
                                                                                    <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">${orderItem.QUANTITY}</div>
                                                                                    <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                        <fmt:formatNumber type="number"
                                                                                                          currencyCode="VND"
                                                                                                          value="${orderItem.PRICE}"/>
                                                                                    </div>
                                                                                    <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                        <fmt:formatNumber type="number"
                                                                                                          currencyCode="VND"
                                                                                                          value="${orderItem.PRICE * orderItem.QUANTITY}"/>
                                                                                    </div>
                                                                                </div>
                                                                                <!-- Lặp lại các block trên cho từng orderItem -->
                                                                            </c:forEach>
                                                                        </div>

                                                                        <div class="modal-footer">
                                                                            <button type="button"
                                                                                    class="btn btn-primary"
                                                                                    data-bs-dismiss="modal">Đóng
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <c:if test="${pageOrder.totalPages!=1}">
                                                <div class="text-right">
                                                    <c:forEach var="item" begin="1"
                                                               end="${pageOrder.totalPages}" step="1">
                                                        <a class="btn btn-primary"
                                                           href="/admin/order?pages=${item}">${item}</a>
                                                    </c:forEach>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
                 aria-labelledby="profile-tab" tabindex="0">

                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Danh Sách</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">
                                            <table id=""
                                                   class="table table-striped table-bordered dt-responsive nowrap"
                                                   cellspacing="0" width="100%">
                                                <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Trạng thái thanh toán</th>
                                                    <th class="text-center">Hoạt động</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" varStatus="loop"
                                                           items="${confirmations}">
                                                    <c:if test="${item.user.USERNAME != list.USERNAME}">
                                                        <c:if
                                                                test="${item.status_order.STATUS == 'Chờ xác nhận'}">
                                                            <tr>
                                                                <td data-bs-toggle="modal"
                                                                    data-bs-target="#choXacNhanModal_${item.ID}">
                                                                    DK<fmt:formatDate value="${item.UPDATE_AT}"
                                                                                      pattern="yyyyMMdd"/>${loop.index +1}
                                                                </td>
                                                                <td data-bs-toggle="modal"
                                                                    data-bs-target="#choXacNhanModal_${item.ID}">${item.user.FULLNAME}</td>
                                                                <td><fmt:formatNumber type="number"
                                                                                      currencyCode="VND"
                                                                                      value="${item.TOTAL_AMOUNT}"/></td>
                                                                <td>${item.CREATE_AT}</td>
                                                                <td><span class="badge rounded-pill"
                                                                          style="width: 120px; background-color: #ffeb3b; color: black; font-size: 15px;">
																			Chờ xác nhận </span></td>
                                                                <td class="text-center">
                                                                    <button class="btn"
                                                                            onclick="confirmation(${item.ID})"
                                                                            style="width: 120px; background-color: #ffc107; color: black;">
                                                                        Xác Nhận
                                                                    </button>
                                                                    <button class="btn" data-bs-toggle="modal"
                                                                            data-bs-target="#huyBoiAdmin_${item.ID}"
                                                                            style="width: 120px; background-color: #dc3545; color: #fff;">
                                                                        Hủy
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <div class="modal fade" id="choXacNhanModal_${item.ID}"
                                                             data-bs-backdrop="static" data-bs-keyboard="false"
                                                             tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog modal-xl">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5"
                                                                            id="staticBackdropLabel_${item.ID}">Thông
                                                                            tin
                                                                            đơn hàng</h1>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <!-- Header của danh sách đơn hàng -->
                                                                        <div class="row bg-dark text-white">
                                                                            <div class="col-md-1 py-2">Mã</div>
                                                                            <div class="col-md-2 py-2">Hình ảnh</div>
                                                                            <div class="col-md-3 py-2">Tên sản phẩm
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Số
                                                                                lượng
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Đơn
                                                                                giá
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Tổng
                                                                            </div>
                                                                        </div>

                                                                        <!-- Dữ liệu từng đơn hàng -->
                                                                        <c:forEach items="${item.order_items}"
                                                                                   var="orderItem">
                                                                            <div class="row mt-3">
                                                                                <div class="col-md-1 border-bottom">${orderItem.ID}</div>
                                                                                <div class="col-md-2 border-bottom">
                                                                                    <img src="/images/${orderItem.variant.phone.IMAGE}"
                                                                                         alt="${orderItem.variant.phone.NAME}"
                                                                                         class="img-fluid"
                                                                                         style="width: 100px; height: 100px">
                                                                                </div>
                                                                                <div class="col-md-3 border-bottom d-flex align-items-center">

                                                                                        ${orderItem.variant.phone.NAME}
                                                                                    (${orderItem.variant.color.NAME} -
                                                                                    <c:choose>
                                                                                        <c:when test="${orderItem.variant.storage.GB == 1024}">
                                                                                            1T
                                                                                        </c:when>
                                                                                        <c:otherwise>${orderItem.variant.storage.GB} GB</c:otherwise>
                                                                                    </c:choose>
                                                                                    )
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">${orderItem.QUANTITY}</div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE}"/>
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE * orderItem.QUANTITY}"/>
                                                                                </div>
                                                                            </div>
                                                                            <!-- Lặp lại các block trên cho từng orderItem -->
                                                                        </c:forEach>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-primary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="huyBoiAdmin_${item.ID}"
                                                             tabindex="-1"
                                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5"
                                                                            id="exampleModalLabel">
                                                                            Lý do hủy đơn hàng</h1>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                    </div>

                                                                    <div class="modal-body">
                                                                        <div class="form-floating">
                                                                        <textarea class="form-control"
                                                                                  placeholder="Leave a comment here"
                                                                                  id="floatingTextarea2_${item.ID}"
                                                                                  style="height: 100px"
                                                                                  name="REASON"></textarea>
                                                                            <label for="floatingTextarea2_${item.ID}">Nhập
                                                                                lý do
                                                                                của
                                                                                bạn </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                        <button onclick="huyDonHang(${item.ID})"
                                                                                class="btn btn-primary">Xác nhận hủy
                                                                        </button>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel"
                 aria-labelledby="contact-tab" tabindex="0">

                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Danh Sách</h2>

                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">
                                            <table id=""
                                                   class="table table-striped table-bordered dt-responsive nowrap"
                                                   cellspacing="0" width="100%">
                                                <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày xác nhận</th>
                                                    <th>Trạng thái thanh toán</th>
                                                    <th>Hoạt động</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" varStatus="loop"
                                                           items="${confirmations}">
                                                    <c:if test="${item.user.USERNAME != list.USERNAME}">
                                                        <c:if test="${item.status_order.STATUS == 'Đã xác nhận'}">
                                                            <tr>
                                                                <td data-bs-toggle="modal"
                                                                    data-bs-target="#daXacNhan_${item.ID}">
                                                                    DK<fmt:formatDate
                                                                        value="${item.UPDATE_AT}"
                                                                        pattern="yyyyMMdd"/>${loop.index +1}
                                                                </td>
                                                                <td>${item.user.FULLNAME}</td>
                                                                <td><fmt:formatNumber type="number"
                                                                                      currencyCode="VND"
                                                                                      value="${item.TOTAL_AMOUNT}"/></td>
                                                                <td>${item.UPDATE_AT}</td>
                                                                <td><span class="badge rounded-pill"
                                                                          style="width: 100px; background-color: #2196f3; color: white; font-size: 15px;">
																			Đã xác nhận </span></td>
                                                                <td class="text-center">
                                                                    <button class="btn" onclick="delivery(${item.ID})"
                                                                            style="width: 100px; background-color: #17a2b8; color: whitesmoke;">
                                                                        Giao hàng
                                                                    </button>

                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <div class="modal fade" id="daXacNhan_${item.ID}"
                                                             data-bs-backdrop="static" data-bs-keyboard="false"
                                                             tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog modal-xl">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5"
                                                                            id="staticBackdropLabel_${item.ID}">Thông
                                                                            tin
                                                                            đơn hàng</h1>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <!-- Header của danh sách đơn hàng -->
                                                                        <div class="row bg-dark text-white">
                                                                            <div class="col-md-1 py-2">Mã</div>
                                                                            <div class="col-md-2 py-2">Hình ảnh</div>
                                                                            <div class="col-md-3 py-2">Tên sản phẩm
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Số
                                                                                lượng
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Đơn
                                                                                giá
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Tổng
                                                                            </div>
                                                                        </div>

                                                                        <!-- Dữ liệu từng đơn hàng -->
                                                                        <c:forEach items="${item.order_items}"
                                                                                   var="orderItem">
                                                                            <div class="row mt-3">
                                                                                <div class="col-md-1 border-bottom">${orderItem.ID}</div>
                                                                                <div class="col-md-2 border-bottom">
                                                                                    <img src="/images/${orderItem.variant.phone.IMAGE}"
                                                                                         alt="${orderItem.variant.phone.NAME}"
                                                                                         class="img-fluid"
                                                                                         style="width: 100px; height: 100px">
                                                                                </div>
                                                                                <div class="col-md-3 border-bottom d-flex align-items-center">

                                                                                        ${orderItem.variant.phone.NAME}
                                                                                    (${orderItem.variant.color.NAME} -
                                                                                    <c:choose>
                                                                                        <c:when test="${orderItem.variant.storage.GB == 1024}">
                                                                                            1T
                                                                                        </c:when>
                                                                                        <c:otherwise>${orderItem.variant.storage.GB} GB</c:otherwise>
                                                                                    </c:choose>
                                                                                    )
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">${orderItem.QUANTITY}</div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE}"/>
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE * orderItem.QUANTITY}"/>
                                                                                </div>
                                                                            </div>
                                                                            <!-- Lặp lại các block trên cho từng orderItem -->
                                                                        </c:forEach>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-primary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="dangvanchuyen" role="tabpanel"
                 aria-labelledby="dangvanchuyen-tab" tabindex="0">

                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Danh Sách</h2>

                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">
                                            <table id=""
                                                   class="table table-striped table-bordered dt-responsive nowrap"
                                                   cellspacing="0" width="100%">
                                                <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày giao</th>
                                                    <th>Trạng thái thanh toán</th>
                                                    <th class="text-center">Hoạt động</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" varStatus="loop"
                                                           items="${confirmations}">
                                                    <c:if test="${item.user.USERNAME != list.USERNAME}">
                                                        <c:if test="${item.status_order.STATUS == 'Giao hàng'}">
                                                            <tr>
                                                                <td data-bs-toggle="modal"
                                                                    data-bs-target="#dangGiao_${item.ID}">
                                                                    DK<fmt:formatDate
                                                                        value="${item.UPDATE_AT}"
                                                                        pattern="yyyyMMdd"/>${loop.index +1}</td>
                                                                <td>${item.user.FULLNAME}</td>
                                                                <td><fmt:formatNumber type="number"
                                                                                      currencyCode="VND"
                                                                                      value="${item.TOTAL_AMOUNT}"/></td>
                                                                <td><fmt:formatDate value="${item.UPDATE_AT}"
                                                                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                                <td><span class="badge rounded-pill"
                                                                          style="width: 100px; background-color: #007bff; color: white; font-size: 15px;">
																			Giao hàng </span></td>
                                                                <td class="text-center">
                                                                    <button class="btn"
                                                                            onclick="completed(${item.ID})"
                                                                            style="width: 100px; background-color: #007bff; color: white;">
                                                                        Hoàn tất
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <div class="modal fade" id="dangGiao_${item.ID}"
                                                             data-bs-backdrop="static" data-bs-keyboard="false"
                                                             tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog modal-xl">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5"
                                                                            id="staticBackdropLabel_${item.ID}">Thông
                                                                            tin
                                                                            đơn hàng</h1>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <!-- Header của danh sách đơn hàng -->
                                                                        <div class="row bg-dark text-white">
                                                                            <div class="col-md-1 py-2">Mã</div>
                                                                            <div class="col-md-2 py-2">Hình ảnh</div>
                                                                            <div class="col-md-3 py-2">Tên sản phẩm
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Số
                                                                                lượng
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Đơn
                                                                                giá
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Tổng
                                                                            </div>
                                                                        </div>

                                                                        <!-- Dữ liệu từng đơn hàng -->
                                                                        <c:forEach items="${item.order_items}"
                                                                                   var="orderItem">
                                                                            <div class="row mt-3">
                                                                                <div class="col-md-1 border-bottom">${orderItem.ID}</div>
                                                                                <div class="col-md-2 border-bottom">
                                                                                    <img src="/images/${orderItem.variant.phone.IMAGE}"
                                                                                         alt="${orderItem.variant.phone.NAME}"
                                                                                         class="img-fluid"
                                                                                         style="width: 100px; height: 100px">
                                                                                </div>
                                                                                <div class="col-md-3 border-bottom d-flex align-items-center">

                                                                                        ${orderItem.variant.phone.NAME}
                                                                                    (${orderItem.variant.color.NAME} -
                                                                                    <c:choose>
                                                                                        <c:when test="${orderItem.variant.storage.GB == 1024}">
                                                                                            1T
                                                                                        </c:when>
                                                                                        <c:otherwise>${orderItem.variant.storage.GB} GB</c:otherwise>
                                                                                    </c:choose>
                                                                                    )
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">${orderItem.QUANTITY}</div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE}"/>
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE * orderItem.QUANTITY}"/>
                                                                                </div>
                                                                            </div>
                                                                            <!-- Lặp lại các block trên cho từng orderItem -->
                                                                        </c:forEach>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-primary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="hoanthanh" role="tabpanel"
                 aria-labelledby="hoanthanh-tab" tabindex="0">

                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Danh Sách</h2>

                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">
                                            <table id=""
                                                   class="table table-striped table-bordered dt-responsive nowrap"
                                                   cellspacing="0" width="100%">
                                                <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày hoàn thành</th>
                                                    <th>Trạng thái</th>
                                                    <td>Hoạt động</td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" varStatus="loop"
                                                           items="${confirmations}">
                                                    <c:if test="${item.user.USERNAME != list.USERNAME}">
                                                        <c:if test="${item.status_order.STATUS == 'Hoàn thành'}">
                                                            <tr>
                                                                <td>DK<fmt:formatDate value="${item.UPDATE_AT}"
                                                                                      pattern="yyyyMMdd"/>${loop.index +1}
                                                                </td>
                                                                <td>${item.user.FULLNAME}</td>
                                                                <td><fmt:formatNumber type="number"
                                                                                      currencyCode="VND"
                                                                                      value="${item.TOTAL_AMOUNT}"/></td>
                                                                <td><fmt:formatDate value="${item.UPDATE_AT}"
                                                                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                                <td><span class="badge rounded-pill"
                                                                          style="width: 100px; background-color: #4caf50; color: white; font-size: 15px;">
																			Hoàn thành </span></td>
                                                                <td class="text-center">
                                                                    <button type="button" class="btn"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#hoanhThanh_${item.ID}"
                                                                            style="background-color: #28a745; color: white; font-size: 15px;">
                                                                        Chi tiết
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                            <div class="modal fade" id="hoanhThanh_${item.ID}"
                                                                 data-bs-backdrop="static" data-bs-keyboard="false"
                                                                 tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                                 aria-hidden="true">
                                                                <div class="modal-dialog modal-xl">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h1 class="modal-title fs-5"
                                                                                id="staticBackdropLabel_${item.ID}">
                                                                                Thông
                                                                                tin
                                                                                đơn hàng</h1>
                                                                            <button type="button" class="btn-close"
                                                                                    data-bs-dismiss="modal"
                                                                                    aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <!-- Header của danh sách đơn hàng -->
                                                                            <div class="row bg-dark text-white">
                                                                                <div class="col-md-1 py-2">Mã</div>
                                                                                <div class="col-md-2 py-2">Hình ảnh
                                                                                </div>
                                                                                <div class="col-md-3 py-2">Tên sản phẩm
                                                                                </div>
                                                                                <div class="col-md-2 text-center py-2">
                                                                                    Số
                                                                                    lượng
                                                                                </div>
                                                                                <div class="col-md-2 text-center py-2">
                                                                                    Đơn
                                                                                    giá
                                                                                </div>
                                                                                <div class="col-md-2 text-center py-2">
                                                                                    Tổng
                                                                                </div>
                                                                            </div>

                                                                            <!-- Dữ liệu từng đơn hàng -->
                                                                            <c:forEach items="${item.order_items}"
                                                                                       var="orderItem">
                                                                                <div class="row mt-3">
                                                                                    <div class="col-md-1 border-bottom">${orderItem.ID}</div>
                                                                                    <div class="col-md-2 border-bottom">
                                                                                        <img src="/images/${orderItem.variant.phone.IMAGE}"
                                                                                             alt="${orderItem.variant.phone.NAME}"
                                                                                             class="img-fluid"
                                                                                             style="width: 100px; height: 100px">
                                                                                    </div>
                                                                                    <div class="col-md-3 border-bottom d-flex align-items-center">

                                                                                            ${orderItem.variant.phone.NAME}
                                                                                        (${orderItem.variant.color.NAME}
                                                                                        -
                                                                                        <c:choose>
                                                                                            <c:when test="${orderItem.variant.storage.GB == 1024}">
                                                                                                1T
                                                                                            </c:when>
                                                                                            <c:otherwise>${orderItem.variant.storage.GB} GB</c:otherwise>
                                                                                        </c:choose>
                                                                                        )
                                                                                    </div>
                                                                                    <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">${orderItem.QUANTITY}</div>
                                                                                    <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                        <fmt:formatNumber type="number"
                                                                                                          currencyCode="VND"
                                                                                                          value="${orderItem.PRICE}"/>
                                                                                    </div>
                                                                                    <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                        <fmt:formatNumber type="number"
                                                                                                          currencyCode="VND"
                                                                                                          value="${orderItem.PRICE * orderItem.QUANTITY}"/>
                                                                                    </div>
                                                                                </div>
                                                                                <!-- Lặp lại các block trên cho từng orderItem -->
                                                                            </c:forEach>
                                                                        </div>

                                                                        <div class="modal-footer">
                                                                            <button type="button"
                                                                                    class="btn btn-primary"
                                                                                    data-bs-dismiss="modal">Đóng
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="trahang" role="tabpanel"
                 aria-labelledby="trahang-tab" tabindex="0">

                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Danh Sách</h2>

                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">
                                            <table id=""
                                                   class="table table-striped table-bordered dt-responsive nowrap"
                                                   cellspacing="0" width="100%">
                                                <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày hủy</th>
                                                    <th>Trạng thái</th>
                                                    <th>Lý do</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" varStatus="loop"
                                                           items="${confirmations}">
                                                    <c:if test="${item.status_order.STATUS == 'Trả hàng'}">
                                                        <tr>
                                                            <td data-bs-toggle="modal"
                                                                data-bs-target="#traHang${item.ID}">DK<fmt:formatDate
                                                                    value="${item.UPDATE_AT}"
                                                                    pattern="yyyyMMdd"/>${loop.index +1}
                                                            </td>
                                                            <td>${item.user.FULLNAME}</td>
                                                            <td><fmt:formatNumber type="number"
                                                                                  currencyCode="VND"
                                                                                  value="${item.TOTAL_AMOUNT}"/></td>
                                                            <td><fmt:formatDate value="${item.UPDATE_AT}"
                                                                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                            <td><span class="badge rounded-pill"
                                                                      style="width: 100px; background-color: #7f181b; color: white; font-size: 15px;">
																			Trả hàng </span></td>
                                                            <td class="text-center">
                                                                <button type="button" class="btn"
                                                                        data-bs-toggle="modal"
                                                                        data-bs-target="#xemlydos_${loop.index + 1}"
                                                                        style="background-color: #dc3545; color: white; font-size: 15px;">
                                                                    Lý do
                                                                </button>
                                                            </td>
                                                        </tr>
                                                        <div class="modal fade" id="traHang${item.ID}"
                                                             data-bs-backdrop="static" data-bs-keyboard="false"
                                                             tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog modal-xl">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5"
                                                                            id="staticBackdropLabel_${item.ID}">Thông
                                                                            tin
                                                                            đơn hàng</h1>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <!-- Header của danh sách đơn hàng -->
                                                                        <div class="row bg-dark text-white">
                                                                            <div class="col-md-1 py-2">Mã</div>
                                                                            <div class="col-md-2 py-2">Hình ảnh</div>
                                                                            <div class="col-md-3 py-2">Tên sản phẩm
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Số
                                                                                lượng
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Đơn
                                                                                giá
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Tổng
                                                                            </div>
                                                                        </div>

                                                                        <!-- Dữ liệu từng đơn hàng -->
                                                                        <c:forEach items="${item.order_items}"
                                                                                   var="orderItem">
                                                                            <div class="row mt-3">
                                                                                <div class="col-md-1 border-bottom">${orderItem.ID}</div>
                                                                                <div class="col-md-2 border-bottom">
                                                                                    <img src="/images/${orderItem.variant.phone.IMAGE}"
                                                                                         alt="${orderItem.variant.phone.NAME}"
                                                                                         class="img-fluid"
                                                                                         style="width: 100px; height: 100px">
                                                                                </div>
                                                                                <div class="col-md-3 border-bottom d-flex align-items-center">

                                                                                        ${orderItem.variant.phone.NAME}
                                                                                    (${orderItem.variant.color.NAME} -
                                                                                    <c:choose>
                                                                                        <c:when test="${orderItem.variant.storage.GB == 1024}">
                                                                                            1T
                                                                                        </c:when>
                                                                                        <c:otherwise>${orderItem.variant.storage.GB} GB</c:otherwise>
                                                                                    </c:choose>
                                                                                    )
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">${orderItem.QUANTITY}</div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE}"/>
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE * orderItem.QUANTITY}"/>
                                                                                </div>
                                                                            </div>
                                                                            <!-- Lặp lại các block trên cho từng orderItem -->
                                                                        </c:forEach>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-primary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="modal fade" id="xemlydos_${loop.index + 1}"
                                                             tabindex="-1"
                                                             aria-labelledby="exampleModalLabel_${loop.index + 1}"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5 fw-bold"
                                                                            id="exampleModalLabel_${loop.index + 1}">Xem
                                                                            lý do</h1>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <h2>${item.user.USERNAME}-
                                                                                ${item.user.FULLNAME}</h2>
                                                                        <br>
                                                                        <p>${item.REASON}</p>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-primary"
                                                                                data-bs-dismiss="modal">Close
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="dahuy" role="tabpanel"
                 aria-labelledby="dahuy-tab" tabindex="0">
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Danh Sách</h2>

                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">
                                            <table id=""
                                                   class="table table-striped table-bordered dt-responsive nowrap"
                                                   cellspacing="0" width="100%">
                                                <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày hủy</th>
                                                    <th>Trạng thái</th>
                                                    <th>Lý do</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" varStatus="loop"
                                                           items="${confirmations}">
                                                    <c:if test="${item.status_order.STATUS == 'Hủy'}">
                                                        <tr>
                                                            <td data-bs-toggle="modal"
                                                                data-bs-target="#DaHuyModal${item.ID}">DK<fmt:formatDate
                                                                    value="${item.UPDATE_AT}"
                                                                    pattern="yyyyMMdd"/>${loop.index +1}
                                                            </td>
                                                            <td>${item.user.FULLNAME}</td>
                                                            <td><fmt:formatNumber type="number"
                                                                                  currencyCode="VND"
                                                                                  value="${item.TOTAL_AMOUNT}"/></td>
                                                            <td><fmt:formatDate value="${item.UPDATE_AT}"
                                                                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                            <td><span class="badge rounded-pill"
                                                                      style="width: 100px; background-color: #f44336; color: white; font-size: 15px;">
																			Hủy </span></td>
                                                            <td class="text-center">
                                                                <button type="button" class="btn"
                                                                        data-bs-toggle="modal"
                                                                        data-bs-target="#xemlydos_${loop.index + 1}"
                                                                        style="background-color: #dc3545; color: white; font-size: 15px;">
                                                                    Lý do
                                                                </button>
                                                            </td>
                                                        </tr>
                                                        <div class="modal fade" id="DaHuyModal${item.ID}"
                                                             data-bs-backdrop="static" data-bs-keyboard="false"
                                                             tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog modal-xl">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5"
                                                                            id="staticBackdropLabel_${item.ID}">Thông
                                                                            tin
                                                                            đơn hàng</h1>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <!-- Header của danh sách đơn hàng -->
                                                                        <div class="row bg-dark text-white">
                                                                            <div class="col-md-1 py-2">Mã</div>
                                                                            <div class="col-md-2 py-2">Hình ảnh</div>
                                                                            <div class="col-md-3 py-2">Tên sản phẩm
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Số
                                                                                lượng
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Đơn
                                                                                giá
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Tổng
                                                                            </div>
                                                                        </div>

                                                                        <!-- Dữ liệu từng đơn hàng -->
                                                                        <c:forEach items="${item.order_items}"
                                                                                   var="orderItem">
                                                                            <div class="row mt-3">
                                                                                <div class="col-md-1 border-bottom">${orderItem.ID}</div>
                                                                                <div class="col-md-2 border-bottom">
                                                                                    <img src="/images/${orderItem.variant.phone.IMAGE}"
                                                                                         alt="${orderItem.variant.phone.NAME}"
                                                                                         class="img-fluid"
                                                                                         style="width: 100px; height: 100px">
                                                                                </div>
                                                                                <div class="col-md-3 border-bottom d-flex align-items-center">

                                                                                        ${orderItem.variant.phone.NAME}
                                                                                    (${orderItem.variant.color.NAME} -
                                                                                    <c:choose>
                                                                                        <c:when test="${orderItem.variant.storage.GB == 1024}">
                                                                                            1T
                                                                                        </c:when>
                                                                                        <c:otherwise>${orderItem.variant.storage.GB} GB</c:otherwise>
                                                                                    </c:choose>
                                                                                    )
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">${orderItem.QUANTITY}</div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE}"/>
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE * orderItem.QUANTITY}"/>
                                                                                </div>
                                                                            </div>
                                                                            <!-- Lặp lại các block trên cho từng orderItem -->
                                                                        </c:forEach>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-primary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="modal fade" id="xemlydos_${loop.index + 1}"
                                                             tabindex="-1"
                                                             aria-labelledby="exampleModalLabel_${loop.index + 1}"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5 fw-bold"
                                                                            id="exampleModalLabel_${loop.index + 1}">Xem
                                                                            lý do</h1>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <h2>${item.user.USERNAME}-
                                                                                ${item.user.FULLNAME}</h2>
                                                                        <br>
                                                                        <p>${item.REASON}</p>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-primary"
                                                                                data-bs-dismiss="modal">Close
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="choxacnhantrahang" role="tabpanel"
                 aria-labelledby="choxacnhantrahang-tab" tabindex="0">
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Danh Sách</h2>

                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">
                                            <table id=""
                                                   class="table table-striped table-bordered dt-responsive nowrap"
                                                   cellspacing="0" width="100%">
                                                <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày hủy</th>
                                                    <th>Trạng thái</th>
                                                    <th>Lý do</th>
                                                    <th>Hoạt động</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" varStatus="loop"
                                                           items="${confirmations}">

                                                    <c:if
                                                            test="${item.status_order.STATUS == 'Chờ xác nhận trả'}">
                                                        <tr>
                                                            <td data-bs-toggle="modal"
                                                                data-bs-target="#choXacNhanTra_${item.ID}">
                                                                DK<fmt:formatDate value="${item.UPDATE_AT}"
                                                                                  pattern="yyyyMMdd"/>${loop.index +1}
                                                            </td>
                                                            <td data-bs-toggle="modal"
                                                                data-bs-target="#choXacNhanTra_${item.ID}">${item.user.FULLNAME}</td>
                                                            <td><fmt:formatNumber type="number"
                                                                                  currencyCode="VND"
                                                                                  value="${item.TOTAL_AMOUNT}"/></td>
                                                            <td><fmt:formatDate value="${item.UPDATE_AT}"
                                                                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                            <td><span class="badge rounded-pill"
                                                                      style="width: 120px; background-color: #ffeb3b; color: white; font-size: 15px;">
																			Chờ xác nhận</span></td>
                                                            <td class="text-center">
                                                                <button type="button" class="btn"
                                                                        style="width: 120px; background-color: #ffeb3b; color: white;"
                                                                        data-bs-toggle="modal"
                                                                        data-bs-target="#xemlydotrahang_${loop.index + 1}">
                                                                    Lý do
                                                                </button>
                                                            </td>
                                                            <td class="text-center">
                                                                <button type="button" class="btn"
                                                                        onclick="xacNhanTraHang(${item.ID})"
                                                                        style="width: 120px; background-color: #ffc107; color: black;">
                                                                    Xác nhận
                                                                </button>
                                                            </td>
                                                        </tr>
                                                        <div class="modal fade" id="choXacNhanTra_${item.ID}"
                                                             data-bs-backdrop="static" data-bs-keyboard="false"
                                                             tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog modal-xl">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5"
                                                                            id="staticBackdropLabel_${item.ID}">Thông
                                                                            tin
                                                                            đơn hàng</h1>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <!-- Header của danh sách đơn hàng -->
                                                                        <div class="row bg-dark text-white">
                                                                            <div class="col-md-1 py-2">Mã</div>
                                                                            <div class="col-md-2 py-2">Hình ảnh</div>
                                                                            <div class="col-md-3 py-2">Tên sản phẩm
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Số
                                                                                lượng
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Đơn
                                                                                giá
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Tổng
                                                                            </div>
                                                                        </div>

                                                                        <!-- Dữ liệu từng đơn hàng -->
                                                                        <c:forEach items="${item.order_items}"
                                                                                   var="orderItem">
                                                                            <div class="row mt-3">
                                                                                <div class="col-md-1 border-bottom">${orderItem.ID}</div>
                                                                                <div class="col-md-2 border-bottom">
                                                                                    <img src="/images/${orderItem.variant.phone.IMAGE}"
                                                                                         alt="${orderItem.variant.phone.NAME}"
                                                                                         class="img-fluid"
                                                                                         style="width: 100px; height: 100px">
                                                                                </div>
                                                                                <div class="col-md-3 border-bottom d-flex align-items-center">

                                                                                        ${orderItem.variant.phone.NAME}
                                                                                    (${orderItem.variant.color.NAME} -
                                                                                    <c:choose>
                                                                                        <c:when test="${orderItem.variant.storage.GB == 1024}">
                                                                                            1T
                                                                                        </c:when>
                                                                                        <c:otherwise>${orderItem.variant.storage.GB} GB</c:otherwise>
                                                                                    </c:choose>
                                                                                    )
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">${orderItem.QUANTITY}</div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE}"/>
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE * orderItem.QUANTITY}"/>
                                                                                </div>
                                                                            </div>
                                                                            <!-- Lặp lại các block trên cho từng orderItem -->
                                                                        </c:forEach>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-primary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="modal fade"
                                                             id="xemlydotrahang_${loop.index + 1}" tabindex="-1"
                                                             aria-labelledby="exampleModalLabel_${loop.index + 1}"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5 fw-bold"
                                                                            id="exampleModalLabel_${loop.index + 1}">Xem
                                                                            lý do</h1>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <h2>${item.user.USERNAME}-
                                                                                ${item.user.FULLNAME}</h2>
                                                                        <br>
                                                                        <p>${item.REASON}</p>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-primary"
                                                                                data-bs-dismiss="modal">Close
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="giaoTraHang" role="tabpanel"
                 aria-labelledby="giaoTraHang-tab" tabindex="0">
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Danh Sách</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">
                                            <table id=""
                                                   class="table table-striped table-bordered dt-responsive nowrap"
                                                   cellspacing="0" width="100%">
                                                <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày trả</th>
                                                    <th>Trạng thái</th>
                                                    <th>Hoạt động</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" varStatus="loop"
                                                           items="${confirmations}">
                                                    <c:if test="${item.user.USERNAME != list.USERNAME}">
                                                        <c:if test="${item.status_order.STATUS == 'Giao trả'}">
                                                            <tr>
                                                                <td data-bs-toggle="modal"
                                                                    data-bs-target="#giaoTraHangs${item.ID}">
                                                                    DK<fmt:formatDate
                                                                        value="${item.UPDATE_AT}"
                                                                        pattern="yyyyMMdd"/>${loop.index +1}
                                                                </td>
                                                                <td>${item.user.FULLNAME}</td>
                                                                <td><fmt:formatNumber type="number"
                                                                                      currencyCode="VND"
                                                                                      value="${item.TOTAL_AMOUNT}"/></td>
                                                                <td><fmt:formatDate value="${item.UPDATE_AT}"
                                                                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                                <td><span class="badge rounded-pill"
                                                                          style="width: 100px; background-color: #9e9e9e; color: white; font-size: 15px;">
																			Trả hàng </span></td>
                                                                <td class="text-center">
                                                                    <button
                                                                            class="btn btn-dark"
                                                                            onclick="returns(${item.ID})"
                                                                            style="width: 100px;">Đã nhận
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <div class="modal fade" id="giaoTraHangs${item.ID}"
                                                             data-bs-backdrop="static" data-bs-keyboard="false"
                                                             tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog modal-xl">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5"
                                                                            id="staticBackdropLabel_${item.ID}">Thông
                                                                            tin
                                                                            đơn hàng</h1>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <!-- Header của danh sách đơn hàng -->
                                                                        <div class="row bg-dark text-white">
                                                                            <div class="col-md-1 py-2">Mã</div>
                                                                            <div class="col-md-2 py-2">Hình ảnh</div>
                                                                            <div class="col-md-3 py-2">Tên sản phẩm
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Số
                                                                                lượng
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Đơn
                                                                                giá
                                                                            </div>
                                                                            <div class="col-md-2 text-center py-2">Tổng
                                                                            </div>
                                                                        </div>

                                                                        <!-- Dữ liệu từng đơn hàng -->
                                                                        <c:forEach items="${item.order_items}"
                                                                                   var="orderItem">
                                                                            <div class="row mt-3">
                                                                                <div class="col-md-1 border-bottom">${orderItem.ID}</div>
                                                                                <div class="col-md-2 border-bottom">
                                                                                    <img src="/images/${orderItem.variant.phone.IMAGE}"
                                                                                         alt="${orderItem.variant.phone.NAME}"
                                                                                         class="img-fluid"
                                                                                         style="width: 100px; height: 100px">
                                                                                </div>
                                                                                <div class="col-md-3 border-bottom d-flex align-items-center">

                                                                                        ${orderItem.variant.phone.NAME}
                                                                                    (${orderItem.variant.color.NAME} -
                                                                                    <c:choose>
                                                                                        <c:when test="${orderItem.variant.storage.GB == 1024}">
                                                                                            1T
                                                                                        </c:when>
                                                                                        <c:otherwise>${orderItem.variant.storage.GB} GB</c:otherwise>
                                                                                    </c:choose>
                                                                                    )
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">${orderItem.QUANTITY}</div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE}"/>
                                                                                </div>
                                                                                <div class="col-md-2 border-bottom d-flex align-items-center justify-content-center">
                                                                                    <fmt:formatNumber type="number"
                                                                                                      currencyCode="VND"
                                                                                                      value="${orderItem.PRICE * orderItem.QUANTITY}"/>
                                                                                </div>
                                                                            </div>
                                                                            <!-- Lặp lại các block trên cho từng orderItem -->
                                                                        </c:forEach>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-primary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    function changeTab(index) {
        // Lấy tất cả các tab và các tab nội dung
        const tabElements = document.querySelectorAll('.nav-link');
        const tabContentElements = document.querySelectorAll('.tab-pane');

        // Xóa lớp active từ các tab và tab nội dung hiện tại
        tabElements.forEach(tab => tab.classList.remove('active'));
        tabContentElements.forEach(content => content.classList.remove('show', 'active'));

        // Thêm lớp active vào tab và tab nội dung được chọn
        tabElements[index].classList.add('active');
        tabContentElements[index].classList.add('show', 'active');

        // Lưu trạng thái tab vào localStorage
        localStorage.setItem('activeTab', index);
    }

    // Thêm sự kiện click cho các nút
    document.getElementById('home-tab').addEventListener('click', () => changeTab(0));
    document.getElementById('profile-tab').addEventListener('click', () => changeTab(1));
    document.getElementById('contact-tab').addEventListener('click', () => changeTab(2));
    document.getElementById('dangvanchuyen-tab').addEventListener('click', () => changeTab(3));
    document.getElementById('hoanthanh-tab').addEventListener('click', () => changeTab(4));
    document.getElementById('trahang-tab').addEventListener('click', () => changeTab(5));
    document.getElementById('dahuy-tab').addEventListener('click', () => changeTab(6));
    document.getElementById('choxacnhantrahang-tab').addEventListener('click', () => changeTab(7));
    document.getElementById('giaoTraHang-tab').addEventListener('click', () => changeTab(8));
    // Khi trang được tải lại, khôi phục trạng thái tab
    document.addEventListener('DOMContentLoaded', () => {
        const activeTab = localStorage.getItem('activeTab');
        if (activeTab !== null) {
            changeTab(parseInt(activeTab, 10));
        } else {
            // Nếu không có tab nào được lưu, đặt tab đầu tiên là active mặc định
            changeTab(0);
        }
    });


    function confirmation(id) {
        $.ajax({
            type: "GET",
            url: "/admin/confirmation/" + id,
            success: function (response) {
                if (response) {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 1000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    Toast.fire({
                        icon: "success",
                        title: "Hoàn tất"
                    }).then(function () {
                        window.location.href = "/admin/order";
                    });
                } else {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 1000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    Toast.fire({
                        icon: "error",
                        title: "Người dùng đã cập nhật trạng thái mới"
                    }).then(function () {
                        window.location.href = "/admin/order";
                    });
                }

            },
            error: function (xhr, status, error) {
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({
                    icon: "error",
                    title: "Người dùng đã cập nhật trạng thái mới"
                }).then(function () {
                    window.location.href = "/admin/order";
                });
            }
        });
    }

    function cancel(id) {
        $.ajax({
            type: "GET",
            url: "/admin/cancel/" + id,
            success: function (response) {
                if (response) {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 1000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    Toast.fire({
                        icon: "success",
                        title: "Hoàn tất"
                    }).then(function () {
                        window.location.href = "/admin/order";
                    });
                } else {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 1000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    Toast.fire({
                        icon: "error",
                        title: "Người dùng đã cập nhật trạng thái mới"
                    }).then(function () {
                        window.location.href = "/admin/order";
                    });
                }

            },
            error: function (xhr, status, error) {
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({
                    icon: "error",
                    title: "Người dùng đã cập nhật trạng thái mới"
                }).then(function () {
                    window.location.href = "/admin/order";
                });
            }
        });
    }

    function delivery(id) {
        $.ajax({
            type: "GET",
            url: "/admin/delivery/" + id,
            success: function (response) {
                if (response) {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 1000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    Toast.fire({
                        icon: "success",
                        title: "Hoàn tất"
                    }).then(function () {
                        window.location.href = "/admin/order";
                    });
                } else {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 1000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    Toast.fire({
                        icon: "error",
                        title: "Người dùng đã cập nhật trạng thái mới"
                    }).then(function () {
                        window.location.href = "/admin/order";
                    });
                }
            },
            error: function (xhr, status, error) {
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({
                    icon: "error",
                    title: "Đã xảy ra lỗi"
                }).then(function () {
                    window.location.href = "/admin/order";
                });
            }
        });
    }

    function completed(id) {
        $.ajax({
            type: "GET",
            url: "/admin/completed/" + id,
            success: function () {
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({
                    icon: "success",
                    title: "Hoàn tất"
                }).then(function () {
                    window.location.href = "/admin/order";
                });
            },
            error: function (xhr, status, error) {
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({
                    icon: "error",
                    title: "Người dùng đã cập nhật trạng thái mới"
                }).then(function () {
                    window.location.href = "/admin/order";
                });
            }
        });
    }

    function returns(id) {
        $.ajax({
            type: "GET",
            url: "/admin/returns/" + id,
            success: function () {
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({
                    icon: "success",
                    title: "Hoàn tất"
                }).then(function () {
                    window.location.href = "/admin/order";
                });
            },
            error: function (xhr, status, error) {
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({
                    icon: "error",
                    title: "Người dùng đã cập nhật trạng thái mới"
                }).then(function () {
                    window.location.href = "/admin/order";
                });
            }
        });
    }

    function xacNhanTraHang(id) {
        $.ajax({
            type: "GET",
            url: "/admin/xacNhanTraHang/" + id,
            success: function () {
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({
                    icon: "success",
                    title: "Hoàn tất"
                }).then(function () {
                    window.location.href = "/admin/order";
                });
            },
            error: function (xhr, status, error) {
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({
                    icon: "error",
                    title: "Người dùng đã cập nhật trạng thái mới"
                }).then(function () {
                    window.location.href = "/admin/order";
                });
            }
        });
    }


    function huyDonHang(id) {
        let addressID = document.getElementById("floatingTextarea2_" + id).value;
        $.ajax({
            type: "GET",
            url: "/admin/order/huyDonHang/" + id,
            data: {address: addressID},
            success: function (response) {
                if (response) {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 1000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    Toast.fire({
                        icon: "success",
                        title: "Hoàn tất"
                    }).then(function () {
                        window.location.href = "/admin/order";
                    });
                } else {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 1000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    Toast.fire({
                        icon: "error",
                        title: "Người dùng đã cập nhật trạng thái mới"
                    }).then(function () {
                        window.location.href = "/admin/order";
                    });
                }

            },
            error: function (xhr, status, error) {
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({
                    icon: "error",
                    title: "Người dùng đã cập nhật trạng thái mới"
                }).then(function () {
                    window.location.href = "/admin/order";
                });
            }
        });
    }

</script>
</body>
</html>