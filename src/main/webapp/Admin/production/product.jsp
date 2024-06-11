<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<body>

<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Danh Sách</h2>

                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary float-end mr-3 px-5"
                        data-bs-toggle="modal" data-bs-target="#them">Thêm
                </button>
                <!-- Modal Thêm -->
                <div div class="modal fade" id="them" tabindex="-1"
                     aria-labelledby="themLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="themLabel">Thêm sản phẩm</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left"
                                      method="POST" id="form"
                                      action="/admin/phone/create" enctype="multipart/form-data">
                                    <div class="row text-left">
                                        <div class="col-md-4">
                                            <div class="form-group ">
                                                <label class="control-label">Tên</label>
                                                <input type="text" class="form-control" name="NAME"/>
                                                <span id="NAME_error" class="text-danger"></span>
                                            </div>
                                            <!-- Hãng -->
                                            <div class="form-group">
                                                <label class="control-label">Hãng</label>
                                                <select name="brand.ID" id="brand" class="form-select">
                                                    <option value="">Chọn hãng sản phẩm</option>
                                                    <c:forEach items="${list_brand}" var="entry">
                                                        <option value="${entry.key}">
                                                            <c:if test="${entry.key == phone.brand.ID}">selected</c:if>
                                                                ${entry.value}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <span id="brand_errors" class="text-danger"></span>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Danh mục</label>
                                                <select name="category.ID" id="category" class="form-select">
                                                    <option value="">Chọn danh mục</option>
                                                    <c:forEach items="${list_category}" var="entry">
                                                        <option value="${entry.key}">
                                                            <c:if test="${entry.key == phone.category.ID}">selected</c:if>
                                                                ${entry.value}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <span id="category_errors" class="text-danger"></span>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Hệ điều hành</label>
                                                <select name="system.ID" id="system" class="form-select">
                                                    <option value="">Chọn hệ điều hành</option>
                                                    <c:forEach items="${list_system}" var="entry">
                                                        <option value="${entry.key}">
                                                            <c:if test="${entry.key == phone.system.ID}">selected</c:if>
                                                                ${entry.value}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <span id="system_errors" class="text-danger"></span>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Cổng sạc</label>
                                                <select name="charging_port.ID" id="charging_port" class="form-select">
                                                    <option value="">Chọn cổng sạc</option>
                                                    <c:forEach var="entry" items="${list_charging_port}">
                                                        <option value="${entry.key}">
                                                            <c:if test="${entry.key == phone.charging_port.ID}">selected</c:if>
                                                                ${entry.value}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <span id="charging_port_errors" class="text-danger"></span>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Cổng tai nghe</label>
                                                <select name="headphone_jack.ID" id="headphone_jack"
                                                        class="form-select">
                                                    <option value="">Chọn cổng tai nghe</option>
                                                    <c:forEach var="entry" items="${list_headphone_jack}">
                                                        <option value="${entry.key}">
                                                            <c:if test="${entry.key == phone.headphone_jack.ID}">selected</c:if>
                                                                ${entry.value}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <span id="headphone_jack_errors" class="text-danger"></span>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Loại pin</label>
                                                <select name="battery_type.ID" id="battery_type" class="form-select">
                                                    <option value="">Chọn loại pin</option>
                                                    <c:forEach var="entry" items="${list_battery_type}">
                                                        <option value="${entry.key}">
                                                            <c:if test="${entry.key == phone.battery_type.ID}">selected</c:if>
                                                                ${entry.value}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <span id="battery_type_errors" class="text-danger"></span>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Độ phân giải màn hình</label>
                                                <select name="screen_resolution.ID" id="screen_resolution"
                                                        class="form-select">
                                                    <option value="">Chọn độ phân giải</option>
                                                    <c:forEach var="entry" items="${list_screen_resolution}">
                                                        <option value="${entry.key}">
                                                            <c:if test="${entry.key == phone.screen_resolution.ID}">selected</c:if>
                                                                ${entry.value}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <span id="screen_resolution_errors" class="text-danger"></span>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Chip đồ họa</label>
                                                <select name="graphics_chip.ID" id="graphics_chip" class="form-select">
                                                    <option value="">Chọn chip đồ họa
                                                    </option>
                                                    <c:forEach var="entry" items="${list_graphics_chip}">
                                                        <option value="${entry.key}">
                                                            <c:if test="${entry.key == phone.graphics_chip.ID}">selected</c:if>
                                                                ${entry.value}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <span id="graphics_chip_errors" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Chip</label>
                                                <input name="PROCESSOR" type="text"
                                                       class="form-control"/>
                                                <span id="PROCESSOR_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Quay video</label>
                                                <input name="VIDEO_RECORDING" type="text"
                                                       class="form-control"/>
                                                <span id="VIDEO_RECORDING_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Kết nối</label>
                                                <input name="CONNECTION" type="text"
                                                       class="form-control"/>
                                                <span id="CONNECTION_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Mô tả</label>
                                                <input name="DESCRIPTION" type="text"
                                                       class="form-control"/>
                                                <span id="DESCRIPTION_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Kích thước độ phân giải</label>
                                                <input name="SCREEN_RESOLUTIONKT" type="text"
                                                       class="form-control" placeholder=""/>
                                                <span id="SCREEN_RESOLUTIONKT_error" class="text-danger"></span>
                                            </div>

                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group ">
                                                <label class="control-label">Chiều rộng</label>
                                                <input name="WIDTH" type="number" step="any" class="form-control"/>
                                                <span id="WIDTH_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Chiều dài</label>
                                                <input name="LENGTH" type="number" step="any"
                                                       class="form-control"/>
                                                <span id="LENGTH_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Chiều cao</label>
                                                <input name="HEIGHT" type="number" step="any"
                                                       class="form-control"/>
                                                <span id="HEIGHT_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Kích thước màng hình</label>
                                                <input name="SCREEN_SIZE" type="number" step="any"
                                                       class="form-control"/>
                                                <span id="SCREEN_SIZE_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Trọng lượng</label>
                                                <input name="WEIGHT" type="number" step="any"
                                                       class="form-control"/>
                                                <span id="WEIGHT_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Dung lượng</label>
                                                <input name="BATTERY_CAPACITY" type="number" step="any"
                                                       class="form-control"/>
                                                <span id="BATTERY_CAPACITY_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Ram</label>
                                                <input name="RAM" type="number" step="any" class="form-control"/>
                                                <span id="RAM_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Tần số làm mới</label>
                                                <input name="REFRESH_RATE" type="number" step="any"
                                                       class="form-control"/>
                                                <span id="REFRESH_RATE_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Độ sáng</label>
                                                <input name="MAXIMUM_BRIGHTNESS" type="number" step="any"
                                                       class="form-control"/>
                                                <span id="MAXIMUM_BRIGHTNESS_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Tốc độ CPU</label>
                                                <input name="CPU_SPEED" type="number" step="any"
                                                       class="form-control"/>
                                                <span id="CPU_SPEED_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Camera trước</label>
                                                <input name="SELFIE_CAMERA" type="number" step="any"
                                                       class="form-control"/>
                                                <span id="SELFIE_CAMERA_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label">Camera sau</label>
                                                <input name="MAIN_CAMERA" type="number" step="any"
                                                       class="form-control"/>
                                                <span id="MAIN_CAMERA_error" class="text-danger"></span>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <img id="previewImg1" alt="" height="100px" width="100px"
                                                     src=""> <label class="control-label">Ảnh 1</label>
                                                <input
                                                        id="imageInput1" name="anh" type="file"
                                                        class="form-control"
                                                        onchange="previewImage(this, 'previewImg1')">
                                                <span id="anh_error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group">
                                                <img id="previewImg2" alt="" height="100px" width="100px"
                                                     src=""> <label class="control-label">Ảnh2</label>
                                                <input
                                                        id="imageInput2" name="anh" type="file"
                                                        class="form-control"
                                                        onchange="previewImage(this, 'previewImg2')">
                                            </div>
                                            <div class="form-group">
                                                <img id="previewImg3" alt="" height="100px" width="100px"
                                                     src=""> <label class="control-label">Ảnh 3</label>
                                                <input
                                                        id="imageInput3" name="anh" type="file"
                                                        class="form-control"
                                                        onchange="previewImage(this, 'previewImg3')">
                                            </div>
                                            <div class="form-group">
                                                <img id="previewImg4" alt="" height="100px" width="100px"
                                                     src=""> <label class="control-label">Ảnh 4</label>
                                                <input
                                                        id="imageInput4" name="anh" type="file"
                                                        class="form-control"
                                                        onchange="previewImage(this, 'previewImg4')">
                                            </div>
                                            <div class="form-group">
                                                <img id="previewImg5" alt="" height="100px" width="100px"
                                                     src=""> <label class="control-label">Ảnh 5</label>
                                                <input
                                                        id="imageInput5" name="anh" type="file"
                                                        class="form-control"
                                                        onchange="previewImage(this, 'previewImg5')">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary">Create</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <table id="datatable-responsive"
                                   class="table dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>Ảnh</th>
                                    <th>Mã</th>
                                    <th>Tên</th>
                                    <th>Hãng</th>
                                    <th>Ram</th>
                                    <th>Kích thước màng hình</th>
                                    <th>Hệ điều hành</th>
                                    <th>Hoạt động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list_phone}" var="item" varStatus="stt">

                                    <tr class="center">
                                        <td><img src="/images/${item.IMAGE}" height="100px"
                                                 width="100px"></td>
                                        <td class="pt-5 cochu">PD<fmt:formatDate
                                                value="${item.CREATE_AT}"
                                                pattern="yyyyMMdd"/>${stt.index +1 }</td>
                                        <td class="pt-5 cochu">${item.NAME}</td>
                                        <td class="pt-5 cochu">${item.brand.NAME}</td>
                                        <td class="pt-5 cochu">${item.RAM}</td>
                                        <td class="pt-5 cochu">${item.SCREEN_SIZE }</td>
                                        <td class="pt-5 cochu">${item.system.SYSTEM}</td>
                                        <td class="text-center pt-5"><i
                                                class="fa-solid fa-pen-to-square mr-3"
                                                data-bs-toggle="modal" data-bs-target="#updatephone${item.ID}"></i>
                                            <i
                                                    class="fa-solid fa-trash mr-3" data-bs-toggle="modal"
                                                    data-bs-target="#delete${item.ID }"></i>
                                            <i
                                                    class="fa-solid fa-mobile-screen-button"
                                                    data-bs-toggle="collapse"
                                                    data-bs-target="#bien_the${item.ID}" aria-expanded="false"
                                                    aria-controls="flush-collapseOne">

                                            </i>
                                            <!-- Modal updatephone-->
                                            <div class="modal fade" id="updatephone${item.ID}" tabindex="-1"
                                                 aria-labelledby="updatephoneLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-xl">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="updatephoneLabel">Cập
                                                                nhật</h1>
                                                            <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form class="form-horizontal form-label-left"
                                                                  method="POST" id="updateForms"
                                                                  action="/admin/phone/update/${item.ID}"
                                                                  enctype="multipart/form-data">
                                                                <div class="row text-left">
                                                                    <div class="col-md-4">
                                                                        <input type="hidden" name="ID"
                                                                               value="${item.ID}"/>
                                                                        <input type="hidden" name="IDC"
                                                                               value="${item.ID}"/>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Tên</label>
                                                                            <input type="text" class="form-control"
                                                                                   name="NAME"
                                                                                   value="${item.NAME}"/>
                                                                            <span id="NAME_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <!-- Hãng -->
                                                                        <div class="form-group">
                                                                            <label class="control-label">Hãng</label>
                                                                            <select name="brand.ID" id="brands"
                                                                                    class="form-select">
                                                                                <option value="">Chọn hãng sản phẩm
                                                                                </option>
                                                                                <c:forEach items="${list_brand}"
                                                                                           var="entry">
                                                                                    <option value="${entry.key}"
                                                                                            <c:if test="${entry.key == item.brand.ID}">selected</c:if>>
                                                                                            ${entry.value}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                            <span id="brand_errorss"
                                                                                  class="text-danger"></span>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <label class="control-label">Danh
                                                                                mục</label>
                                                                            <select name="category.ID"
                                                                                    id="categorys"
                                                                                    class="form-select">
                                                                                <option value="">Chọn danh mục
                                                                                </option>
                                                                                <c:forEach items="${list_category}"
                                                                                           var="entry">
                                                                                    <option value="${entry.key}"
                                                                                            <c:if test="${entry.key == item.category.ID}">selected</c:if>>
                                                                                            ${entry.value}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                            <span id="category_errorss"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label">Hệ điều
                                                                                hành</label>
                                                                            <select name="system.ID" id="systems"
                                                                                    class="form-select">
                                                                                <option value="">Chọn hệ điều hành
                                                                                </option>
                                                                                <c:forEach items="${list_system}"
                                                                                           var="entry">
                                                                                    <option value="${entry.key}"
                                                                                            <c:if test="${entry.key == item.system.ID}">selected</c:if>>
                                                                                            ${entry.value}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                            <span id="system_errorss"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label">Cổng
                                                                                sạc</label>
                                                                            <select name="charging_port.ID"
                                                                                    id="charging_ports"
                                                                                    class="form-select">
                                                                                <option value="">Chọn cổng sạc
                                                                                </option>
                                                                                <c:forEach var="entry"
                                                                                           items="${list_charging_port}">
                                                                                    <option value="${entry.key}"
                                                                                            <c:if test="${entry.key == item.charging_port.ID}">selected</c:if>>
                                                                                            ${entry.value}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                            <span id="charging_port_errorss"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label">Cổng tai
                                                                                nghe</label>
                                                                            <select name="headphone_jack.ID"
                                                                                    id="headphone_jacks"
                                                                                    class="form-select">
                                                                                <option value="">Chọn cổng tai nghe
                                                                                </option>
                                                                                <c:forEach var="entry"
                                                                                           items="${list_headphone_jack}">
                                                                                    <option value="${entry.key}"
                                                                                            <c:if test="${entry.key == item.headphone_jack.ID}">selected</c:if>>
                                                                                            ${entry.value}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                            <span id="headphone_jack_errorss"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label">Loại
                                                                                pin</label>
                                                                            <select name="battery_type.ID"
                                                                                    id="battery_types"
                                                                                    class="form-select">
                                                                                <option value="">Chọn loại pin
                                                                                </option>
                                                                                <c:forEach var="entry"
                                                                                           items="${list_battery_type}">
                                                                                    <option value="${entry.key}"
                                                                                            <c:if
                                                                                                    test="${entry.key == item.battery_type.ID}">
                                                                                                selected</c:if>>
                                                                                            ${entry.value}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                            <span id="battery_type_errorss"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label">Độ phân
                                                                                giải
                                                                                màn hình</label>
                                                                            <select name="screen_resolution.ID"
                                                                                    id="screen_resolutions"
                                                                                    class="form-select">
                                                                                <option value="">Chọn độ phân giải
                                                                                </option>
                                                                                <c:forEach var="entry"
                                                                                           items="${list_screen_resolution}">
                                                                                    <option value="${entry.key}"
                                                                                            <c:if test="${entry.key == item.screen_resolution.ID}">selected</c:if>>
                                                                                            ${entry.value}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                            <span id="screen_resolution_errorss"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label">Chip đồ
                                                                                họa</label>
                                                                            <select name="graphics_chip.ID"
                                                                                    id="graphics_chips"
                                                                                    class="form-select">
                                                                                <option value="">Chọn chip đồ họa
                                                                                    giải
                                                                                </option>
                                                                                <c:forEach var="entry"
                                                                                           items="${list_graphics_chip}">
                                                                                    <option value="${entry.key}"
                                                                                            <c:if test="${entry.key == item.graphics_chip.ID}">selected</c:if>>
                                                                                            ${entry.value}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                            <span id="graphics_chip_errorss"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Chip</label>
                                                                            <input name="PROCESSOR" type="text"
                                                                                   class="form-control"
                                                                                   value="${item.PROCESSOR}"/>
                                                                            <span id="PROCESSOR_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Quay
                                                                                video</label>
                                                                            <input name="VIDEO_RECORDING"
                                                                                   type="text"
                                                                                   class="form-control"
                                                                                   value="${item.VIDEO_RECORDING}"/>
                                                                            <span id="VIDEO_RECORDING_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Kết
                                                                                nối</label>
                                                                            <input name="CONNECTION" type="text"
                                                                                   class="form-control"
                                                                                   value="${item.CONNECTION}"/>
                                                                            <span id="CONNECTION_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Mô
                                                                                tả</label>
                                                                            <input name="DESCRIPTION" type="text"
                                                                                   class="form-control"
                                                                                   value="${item.DESCRIPTION}"/>
                                                                            <span id="DESCRIPTION_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Kích thước
                                                                                độ
                                                                                phân giải</label>
                                                                            <input name="SCREEN_RESOLUTIONKT"
                                                                                   type="text"
                                                                                   class="form-control"
                                                                                   value="${item.SCREEN_RESOLUTIONKT}"/>
                                                                            <span id="SCREEN_RESOLUTIONKT_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>

                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Chiều
                                                                                rộng</label>
                                                                            <input name="WIDTH" type="number"
                                                                                   step="any"
                                                                                   class="form-control"
                                                                                   value="${item.WIDTH}"/>
                                                                            <span id="WIDTH_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Chiều
                                                                                dài</label>
                                                                            <input name="LENGTH" type="number"
                                                                                   step="any"
                                                                                   class="form-control"
                                                                                   value="${item.LENGTH}"/>
                                                                            <span id="LENGTH_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Chiều
                                                                                cao</label>
                                                                            <input name="HEIGHT" type="number"
                                                                                   step="any"
                                                                                   class="form-control"
                                                                                   value="${item.HEIGHT}"/>
                                                                            <span id="HEIGHT_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Kích thước
                                                                                màng
                                                                                hình</label>
                                                                            <input name="SCREEN_SIZE" type="number"
                                                                                   step="any"
                                                                                   class="form-control"
                                                                                   value="${item.SCREEN_SIZE}"/>
                                                                            <span id="SCREEN_SIZE_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Trọng
                                                                                lượng</label>
                                                                            <input name="WEIGHT" type="number"
                                                                                   step="any"
                                                                                   class="form-control"
                                                                                   value="${item.WEIGHT}"/>
                                                                            <span id="WEIGHT_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Dung
                                                                                lượng</label>
                                                                            <input name="BATTERY_CAPACITY"
                                                                                   type="number"
                                                                                   step="any"
                                                                                   class="form-control"
                                                                                   value="${item.BATTERY_CAPACITY}"/>
                                                                            <span id="BATTERY_CAPACITY_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Ram</label>
                                                                            <input name="RAM" type="number"
                                                                                   step="any"
                                                                                   class="form-control"
                                                                                   value="${item.RAM}"/>
                                                                            <span id="RAM_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Tần số làm
                                                                                mới</label>
                                                                            <input name="REFRESH_RATE" type="number"
                                                                                   step="any"
                                                                                   class="form-control"
                                                                                   value="${item.REFRESH_RATE}"/>
                                                                            <span id="REFRESH_RATE_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Độ
                                                                                sáng</label>
                                                                            <input name="MAXIMUM_BRIGHTNESS"
                                                                                   type="number" step="any"
                                                                                   class="form-control"
                                                                                   value="${item.MAXIMUM_BRIGHTNESS}"/>
                                                                            <span id="MAXIMUM_BRIGHTNESS_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Tốc độ
                                                                                CPU</label>
                                                                            <input name="CPU_SPEED" type="number"
                                                                                   step="any"
                                                                                   class="form-control"
                                                                                   value="${item.CPU_SPEED}"/>
                                                                            <span id="CPU_SPEED_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Camera
                                                                                trước</label>
                                                                            <input name="SELFIE_CAMERA"
                                                                                   type="number"
                                                                                   step="any"
                                                                                   class="form-control"
                                                                                   value="${item.SELFIE_CAMERA}"/>
                                                                            <span id="SELFIE_CAMERA_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <div class="form-group ">
                                                                            <label class="control-label">Camera
                                                                                sau</label>
                                                                            <input name="MAIN_CAMERA" type="number"
                                                                                   step="any"
                                                                                   class="form-control"
                                                                                   value="${item.MAIN_CAMERA}"/>
                                                                            <span id="MAIN_CAMERA_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <input type="hidden" name="IMAGE"
                                                                               value="${item.IMAGE}"/>
                                                                        <div class="form-group">
                                                                            <img id="previewImg1_${item.ID}" alt=""
                                                                                 height="100px" width="100px"
                                                                                 src="/images/${item.IMAGE}">
                                                                            <label class="control-label">Ảnh
                                                                                chính</label>
                                                                            <input id="imageInput1_${item.ID}"
                                                                                   name="anhUpdate"
                                                                                   type="file"
                                                                                   class="form-control mt-3"
                                                                                   onchange="previewImage(this, 'previewImg1_${item.ID}')">
                                                                            <span id="anh1_2_errors"
                                                                                  class="text-danger"></span>
                                                                        </div>
                                                                        <c:forEach var="image"
                                                                                   items="${item.images}"
                                                                                   varStatus="index" begin="1"
                                                                                   end="5"
                                                                                   step="1">
                                                                            <div class="form-group">
                                                                                <input type="hidden" name="image" value="${image.IMAGE}"/>
                                                                                <img id="previewImg${index.index +1}_${item.ID}"
                                                                                     alt=""
                                                                                     height="100px" width="100px"
                                                                                     src="/images/${image.IMAGE}">
                                                                                <label class="control-label">Ảnh
                                                                                        ${index.index+1}</label>
                                                                                <input id="imageInput${index.index +1}_${item.ID}"
                                                                                       name="anhUpdate"
                                                                                       type="file"
                                                                                       class="form-control mt-3"
                                                                                       onchange="previewImage(this, 'previewImg${index.index +1}_${item.ID}')">
                                                                            </div>
                                                                        </c:forEach>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button"
                                                                                class="btn btn-secondary"
                                                                                data-bs-dismiss="modal">Close
                                                                        </button>
                                                                        <button type="submit"
                                                                                class="btn btn-primary">
                                                                            Update
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> <!-- Modal Delete-->
                                            <div class="modal fade" id="delete${item.ID }"
                                                 tabindex="-1" aria-labelledby="deleteLabel"
                                                 aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="deleteLabel">Xác
                                                                nhận xóa</h1>
                                                            <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body text-left">Bạn có muốn xóa</div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-bs-dismiss="modal">Close
                                                            </button>
                                                            <A href="/admin/phone/delete?id=${item.ID }"
                                                               class="btn btn-danger">Delete</A>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="" id="bienthe" tabindex="-1"
                                        aria-labelledby="bientheLabel" aria-hidden="true">
                                        <td colspan="8 row">
                                            <div class="accordion accordion-flush"
                                                 id="accordionFlushExample">
                                                <div class="accordion-item">
                                                    <div id="bien_the${item.ID}"
                                                         class="accordion-collapse collapse"
                                                         data-bs-parent="#accordionFlushExample">
                                                        <div class="accordion-body">
                                                            <div class="row">

                                                                <table class="table table-striped">
                                                                    <thead>
                                                                    <tr>
                                                                        <th scope="col">Mã biến thể</th>
                                                                        <th scope="col">Mã điện thoại</th>
                                                                        <th scope="col">Màu</th>
                                                                        <th scope="col">Bộ nhớ</th>
                                                                        <th scope="col">Giảm</th>
                                                                        <th scope="col">Số lượng</th>
                                                                        <th scope="col">Giá</th>
                                                                        <th scope="col">Hoạt động</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>


                                                                    <c:forEach var="variant"
                                                                               items="${item.variants}"
                                                                               varStatus="stt">
                                                                        <tr>
                                                                                <%-- Lấy ngày hiện tại và format thành chuỗi --%>
                                                                            <jsp:useBean id="today"
                                                                                         class="java.util.Date"
                                                                                         scope="page"/>
                                                                            <fmt:formatDate var="currentDate"
                                                                                            value="${today}"
                                                                                            pattern="yyyy-MM-dd"/>
                                                                            <fmt:formatDate var="expiryDate"
                                                                                            value="${variant.discount_product.EXPIRY_DATE}"
                                                                                            pattern="yyyy-MM-dd"/>
                                                                            <fmt:formatDate var="discount_product"
                                                                                            value="${item.CREATE_AT}"
                                                                                            pattern="yyyyMMdd"/>
                                                                            <td>
                                                                                BT${discount_product}${stt.index +1}</td>
                                                                            <td>
                                                                                PD${formattedCreateAt}${variant.phone.ID}</td>
                                                                            <td>${variant.color.NAME}</td>
                                                                            <td>
                                                                                <c:choose>
                                                                                    <c:when test="${variant.storage.GB == 32}">
                                                                                        32 GB
                                                                                    </c:when>
                                                                                    <c:when test="${variant.storage.GB == 64}">
                                                                                        64 GB
                                                                                    </c:when>
                                                                                    <c:when test="${variant.storage.GB == 128}">
                                                                                        128 GB
                                                                                    </c:when>
                                                                                    <c:when test="${variant.storage.GB == 256}">
                                                                                        256 GB
                                                                                    </c:when>
                                                                                    <c:when test="${variant.storage.GB == 512}">
                                                                                        512 GB
                                                                                    </c:when>
                                                                                    <c:when test="${variant.storage.GB == 1024}">
                                                                                        1024 T
                                                                                    </c:when>
                                                                                    <c:otherwise>Đang cập nhật</c:otherwise>
                                                                                </c:choose>
                                                                            </td>
                                                                            <td>
                                                                                <c:choose>
                                                                                    <c:when test="${expiryDate > currentDate}">
                                                                                        ${variant.discount_product.DISCOUNT_PERCENTAGE} %
                                                                                    </c:when>
                                                                                    <c:otherwise>0 %</c:otherwise>
                                                                                </c:choose>
                                                                            </td>
                                                                            <td><fmt:formatNumber pattern="###,###">
                                                                                ${variant.QUANTITY }</fmt:formatNumber></td>
                                                                            <td><fmt:formatNumber type="currency"
                                                                                                  currencyCode="VND"
                                                                                                  value="${variant.PRICE}"/></td>
                                                                            <td>
                                                                                <i class="fa-solid fa-pen-to-square mr-3"
                                                                                   data-bs-toggle="modal"
                                                                                   data-bs-target="#updatebienthe${variant.ID}"></i>
                                                                                <i
                                                                                        class="fa-solid fa-trash mr-3"
                                                                                        data-bs-toggle="modal"
                                                                                        data-bs-target="#deletebienthe${variant.ID}"></i>
                                                                            </td>
                                                                            <!-- Modal updatebienthe-->
                                                                            <div class="modal fade"
                                                                                 id="updatebienthe${variant.ID}"
                                                                                 tabindex="-1"
                                                                                 aria-labelledby="updatebientheLabel"
                                                                                 aria-hidden="true">
                                                                                <div class="modal-dialog modal-lg">
                                                                                    <div class="modal-content">
                                                                                        <div class="modal-header">
                                                                                            <h1 class="modal-title fs-5"
                                                                                                id="updatebientheLabel">
                                                                                                Cập
                                                                                                nhật</h1>
                                                                                            <button type="button"
                                                                                                    class="btn-close"
                                                                                                    data-bs-dismiss="modal"
                                                                                                    aria-label="Close"></button>
                                                                                        </div>
                                                                                        <div class="modal-body">

                                                                                            <form class="form-horizontal form-label-left"
                                                                                                  action="/admin/variant/update"
                                                                                                  method="post">
                                                                                                <div class="row text-left">
                                                                                                    <div class="form-group">
                                                                                                        <input type="hidden"
                                                                                                               name="phone.ID"
                                                                                                               value="${item.ID}"/>
                                                                                                        <input type="hidden"
                                                                                                               name="ID"
                                                                                                               value="${variant.ID}"/>
                                                                                                        <fmt:formatDate
                                                                                                                var="formattedCreateAt"
                                                                                                                value="${item.CREATE_AT}"
                                                                                                                pattern="yyyyMMdd"/>
                                                                                                        <div class="form-group">
                                                                                                            <label class="control-label">Mã
                                                                                                                biến
                                                                                                                thể</label>
                                                                                                            <input type="text"
                                                                                                                   class="form-control"
                                                                                                                   disabled
                                                                                                                   value="BT${formattedCreateAt}${variant.ID}">
                                                                                                        </div>

                                                                                                        <label class="control-label">Mã
                                                                                                            phone</label>
                                                                                                        <input type="text"
                                                                                                               disabled
                                                                                                               value="PD${formattedCreateAt}${item.ID}"
                                                                                                               class="form-control">

                                                                                                        <div class="form-group">
                                                                                                            <label class="control-label">Màu</label>
                                                                                                            <select name="color.ID"
                                                                                                                    class="form-select">
                                                                                                                <option value="">
                                                                                                                    Chọn
                                                                                                                    màu
                                                                                                                </option>
                                                                                                                <c:forEach
                                                                                                                        items="${listColor}"
                                                                                                                        var="color">
                                                                                                                    <option value="${color.key}"
                                                                                                                            <c:if test="${color.key == variant.color.ID}">selected</c:if>>
                                                                                                                            ${color.value}
                                                                                                                    </option>
                                                                                                                </c:forEach>
                                                                                                            </select>
                                                                                                        </div>

                                                                                                        <div class="form-group">
                                                                                                            <label class="control-label">Bộ
                                                                                                                nhớ
                                                                                                                trong</label>
                                                                                                            <select name="storage.ID"
                                                                                                                    class="form-select">
                                                                                                                <option value="">
                                                                                                                    Chọn
                                                                                                                    dung
                                                                                                                    lượng
                                                                                                                </option>
                                                                                                                <c:forEach
                                                                                                                        var="st"
                                                                                                                        items="${listStorage}">
                                                                                                                    <option value="${st.key}"
                                                                                                                            <c:if test="${st.key == variant.storage.ID}">selected</c:if>>
                                                                                                                            ${st.value}
                                                                                                                        GB
                                                                                                                    </option>
                                                                                                                </c:forEach>
                                                                                                            </select>
                                                                                                        </div>

                                                                                                        <div class="form-group">
                                                                                                            <label class="control-label">Phần
                                                                                                                trăm
                                                                                                                giảm</label>
                                                                                                            <select name="discount_product.ID"
                                                                                                                    class="form-select">
                                                                                                                <option value="">
                                                                                                                    Chọn
                                                                                                                    giảm
                                                                                                                    giá
                                                                                                                </option>
                                                                                                                <c:forEach
                                                                                                                        var="dp"
                                                                                                                        items="${listDiscount}">
                                                                                                                    <option value="${dp.key}"
                                                                                                                            <c:if test="${dp.key == variant.discount_product.ID}">selected</c:if>>
                                                                                                                            ${dp.value}%
                                                                                                                    </option>
                                                                                                                </c:forEach>
                                                                                                            </select>
                                                                                                        </div>

                                                                                                        <div class="form-group">
                                                                                                            <label class="control-label">Ngày
                                                                                                                bắt
                                                                                                                đầu</label>
                                                                                                            <input type="date"
                                                                                                                   name="START_DATE"
                                                                                                                   class="form-control"
                                                                                                                   value="${variant.discount_product.START_DATE}">
                                                                                                        </div>

                                                                                                        <div class="form-group">
                                                                                                            <label class="control-label">Ngày
                                                                                                                kết
                                                                                                                thúc</label>
                                                                                                            <input type="date"
                                                                                                                   name="EXPIRY_DATE"
                                                                                                                   class="form-control"
                                                                                                                   value="${variant.discount_product.EXPIRY_DATE}">
                                                                                                        </div>

                                                                                                        <div class="form-group">
                                                                                                            <label class="control-label">Số
                                                                                                                lượng</label>
                                                                                                            <input type="number"
                                                                                                                   name="QUANTITY"
                                                                                                                   class="form-control"
                                                                                                                   value="${variant.QUANTITY}">
                                                                                                        </div>

                                                                                                        <div class="form-group">
                                                                                                            <label class="control-label">Giá</label>
                                                                                                            <input type="number"
                                                                                                                   step="any"
                                                                                                                   name="PRICE"
                                                                                                                   class="form-control"
                                                                                                                   value="${variant.PRICE}">
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="modal-footer">
                                                                                                    <button type="button"
                                                                                                            class="btn btn-secondary"
                                                                                                            data-bs-dismiss="modal">
                                                                                                        Close
                                                                                                    </button>
                                                                                                    <button type="submit"
                                                                                                            class="btn btn-primary">
                                                                                                        Update
                                                                                                    </button>
                                                                                                </div>
                                                                                            </form>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <!-- Modal deletebienthe-->
                                                                            <div class="modal fade"
                                                                                 id="deletebienthe${variant.ID}"
                                                                                 tabindex="-1"
                                                                                 aria-labelledby="deletebientheLabel"
                                                                                 aria-hidden="true">
                                                                                <div class="modal-dialog">
                                                                                    <div class="modal-content">
                                                                                        <div class="modal-header">
                                                                                            <h1 class="modal-title fs-5"
                                                                                                id="deletebientheLabel">
                                                                                                Xác
                                                                                                nhận xóa biến
                                                                                                thể</h1>
                                                                                            <button type="button"
                                                                                                    class="btn-close"
                                                                                                    data-bs-dismiss="modal"
                                                                                                    aria-label="Close"></button>
                                                                                        </div>
                                                                                        <div class="modal-body text-left">
                                                                                            <fmt:formatDate
                                                                                                    var="formattedCreateAt"
                                                                                                    value="${item.CREATE_AT}"
                                                                                                    pattern="yyyyMMdd"/>
                                                                                            Bạn có
                                                                                            muốn xóa biến thể
                                                                                            BT${formattedCreateAt}${variant.ID}
                                                                                        </div>
                                                                                        <div class="modal-footer">
                                                                                            <button type="button"
                                                                                                    class="btn btn-secondary"
                                                                                                    data-bs-dismiss="modal">
                                                                                                Close
                                                                                            </button>
                                                                                            <a href="/admin/variant/detele/${variant.ID}"
                                                                                               class="btn btn-danger">
                                                                                                Delete
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                                <button type="button" class="btn btn-primary"
                                                                        data-bs-toggle="modal"
                                                                        data-bs-target="#thembienthe${item.ID}">Thêm
                                                                    biến thể mới
                                                                </button>
                                                                <!-- Modal Thêm biến thể -->
                                                                <div div class="modal fade"
                                                                     id="thembienthe${item.ID}"
                                                                     tabindex="-1"
                                                                     aria-labelledby="thembientheLabel"
                                                                     aria-hidden="true">
                                                                    <div class="modal-dialog modal-lg">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h1 class="modal-title fs-5"
                                                                                    id="thembientheLabel">
                                                                                    Thêm biến thể</h1>
                                                                                <button type="button"
                                                                                        class="btn-close"
                                                                                        data-bs-dismiss="modal"
                                                                                        aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <form class="form-horizontal form-label-left"
                                                                                      action="/admin/variant/create"
                                                                                      method="post">
                                                                                    <div class="row text-left">
                                                                                        <div class="form-group ">
                                                                                            <input type="hidden"
                                                                                                   name="phone.ID"
                                                                                                   value="${item.ID}"/>
                                                                                            <label class="control-label">Mã
                                                                                                phone</label>
                                                                                            <fmt:formatDate
                                                                                                    var="formattedCreateAt"
                                                                                                    value="${item.CREATE_AT}"
                                                                                                    pattern="yyyyMMdd"/>
                                                                                            <input
                                                                                                    type="text"
                                                                                                    disabled
                                                                                                    value="PD${formattedCreateAt}${item.ID}"
                                                                                                    class="form-control">
                                                                                        </div>
                                                                                        <div class="form-group ">
                                                                                            <label class="control-label">Màu</label>
                                                                                            <select
                                                                                                    name="color.ID"
                                                                                                    class="form-select">
                                                                                                <option value="">
                                                                                                    Chọn
                                                                                                    màu
                                                                                                </option>
                                                                                                <c:forEach
                                                                                                        items="${listColor}"
                                                                                                        var="color">
                                                                                                    <option value="${color.key}"
                                                                                                            id="color-validate"
                                                                                                            <c:if test="${color.key == ObjectVariant.color.ID}">selected</c:if>>
                                                                                                            ${color.value}
                                                                                                    </option>
                                                                                                </c:forEach>

                                                                                            </select>
                                                                                        </div>
                                                                                        <div class="form-group ">
                                                                                            <label class="control-label">Bộ
                                                                                                nhớ
                                                                                                trong</label>
                                                                                            <select
                                                                                                    name="storage.ID"
                                                                                                    class="form-select">
                                                                                                <option value="">
                                                                                                    Chọn
                                                                                                    dung lượng
                                                                                                </option>
                                                                                                <c:forEach var="st"
                                                                                                           items="${listStorage}">
                                                                                                    <option value="${st.key}"
                                                                                                            id="color-validate"
                                                                                                            <c:if test="${st.key == ObjectVariant.storage.ID}">selected</c:if>>
                                                                                                            ${st.value}
                                                                                                        GB
                                                                                                    </option>
                                                                                                </c:forEach>
                                                                                            </select>
                                                                                        </div>
                                                                                        <div class="form-group ">
                                                                                            <label class="control-label">Phần
                                                                                                trăm
                                                                                                giảm</label>
                                                                                            <select
                                                                                                    name="discount_product.ID"
                                                                                                    class="form-select">
                                                                                                <option value="">
                                                                                                    Chọn giảm giá
                                                                                                </option>
                                                                                                <c:forEach var="st"
                                                                                                           items="${listDiscount}">
                                                                                                    <option value="${st.key}"
                                                                                                            id="color-validate"
                                                                                                            <c:if test="${st.key == ObjectVariant.discount_product.DISCOUNT_PERCENTAGE}">selected</c:if>>
                                                                                                            ${st.value}%
                                                                                                    </option>
                                                                                                </c:forEach>
                                                                                            </select>
                                                                                        </div>
                                                                                        <div class="form-group ">
                                                                                            <label class="control-label">Ngày
                                                                                                bắt
                                                                                                đầu</label> <input
                                                                                                type="date"
                                                                                                name="START_DATE"
                                                                                                class="form-control">
                                                                                        </div>
                                                                                        <div class="form-group ">
                                                                                            <label class="control-label">Ngày
                                                                                                kết
                                                                                                thúc</label> <input
                                                                                                type="date"
                                                                                                name="EXPIRY_DATE"
                                                                                                class="form-control">
                                                                                        </div>
                                                                                        <div class="form-group ">
                                                                                            <label class="control-label">Số
                                                                                                lương</label> <input
                                                                                                type="number"
                                                                                                name="QUANTITY"
                                                                                                class="form-control">
                                                                                        </div>
                                                                                        <div class="form-group ">
                                                                                            <label class="control-label">Giá</label>
                                                                                            <input
                                                                                                    type="number"
                                                                                                    step="any"
                                                                                                    name="PRICE"
                                                                                                    class="form-control">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button"
                                                                                                class="btn btn-secondary"
                                                                                                data-bs-dismiss="modal">
                                                                                            Close
                                                                                        </button>
                                                                                        <button type="submit"
                                                                                                class="btn btn-primary">
                                                                                            Create
                                                                                        </button>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    function previewImage(input, imgId) {
        console.log("previewImage called for", imgId); // Log kiểm tra
        let imgElement = document.getElementById(imgId);
        console.log("input files:", input.files); // Kiểm tra file đầu vào
        if (input.files && input.files[0]) {
            let reader = new FileReader();
            reader.onload = function (e) {
                console.log("File loaded:", e.target.result); // Log kết quả load file
                imgElement.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    $(document).ready(function () {
        $('#form').submit(function (event) {
            event.preventDefault(); // Ngăn chặn việc submit form mặc định
            let formData = new FormData(this);
            $.ajax({
                type: 'POST',
                url: '/admin/phone/create',
                data: formData,
                contentType: false,
                processData: false,
                success: function (response) {
                    if (response.status === 'success') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Thêm sản phẩm thành công',
                            showConfirmButton: false,
                            timer: 1050
                        });

                        setTimeout(function() {
                            window.location.href = '/admin/product'; // Điều hướng tới trang danh sách người dùng
                        }, 1600);
                    }
                },
                error: function (response) {
                    let errors = response.responseJSON;
                    $.each(errors, function (key, value) {
                        if ($('#brand').val() === "") {
                            $('#brand_errors').text("Vui lòng chọn hãng điện thoại !");
                        } else {
                            $('#brand_errors').text('');
                        }

                        if ($('#category').val() === "") {
                            $('#category_errors').text('Vui lòng chọn danh mục !');
                        } else {
                            $('#category_errors').text('');
                        }

                        if ($('#system').val() === "") {
                            $('#system_errors').text('Vui lòng chọn hệ điều hành !');
                        } else {
                            $('#system_errors').text('');
                        }

                        if ($('#charging_port').val() === "") {
                            $('#charging_port_errors').text('Vui lòng chọn cổng sạc !');
                        } else {
                            $('#charging_port_errors').text('');
                        }

                        if ($('#headphone_jack').val() === "") {
                            $('#headphone_jack_errors').text('Vui lòng chọn cổng tai nghe !');
                        } else {
                            $('#headphone_jack_errors').text('');
                        }

                        if ($('#battery_type').val() === "") {
                            $('#battery_type_errors').text('Vui lòng chọn loại pin !');
                        } else {
                            $('#battery_type_errors').text('');
                        }

                        if ($('#screen_resolution').val() === "") {
                            $('#screen_resolution_errors').text('Vui lòng chọn độ phân giải màn hình !');
                        } else {
                            $('#screen_resolution_errors').text('');
                        }

                        if ($('#graphics_chip').val() === "") {
                            $('#graphics_chip_errors').text('Vui lòng chọn chip đồ họa !');
                        } else {
                            $('#graphics_chip_errors').text('');
                        }

                        if ($('#imageInput1').val() === "") {
                            $('#anh_error').text('Vui lòng chọn ảnh !');
                        } else {
                            $('#anh_error').text('');
                        }

                        $('#' + key + '_error').text(value); // Hiển thị lỗi trong thẻ span
                    });
                }
            });
        });
    });
</script>
</body>
</html>
