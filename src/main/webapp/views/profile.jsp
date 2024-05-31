<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="breadcrumb-wrapper" class="breadcrumb-w-img">
            <div class="breadcrumb-overlay"></div>
            <div class="breadcrumb-content">
                <div class="wrapper">
                    <div class="inner text-center">
                        <div class="breadcrumb-big">
                            <h2>Thông tin cá nhân</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <main>
            <div class="container">
                <div class="card mt-5">
                    <div class="card-body">
                        <div class="img row">
                            <div class="col-12" id="imageContainer">
                                <img id="imagePreview" src alt>
                            </div>
                            
                        </div>
                        <div class="col-12">
                            <input class="mt-3" type="file"
                                id="imageUpload" accept="image/*"
                                style="width: 75px; position: relative;">
                        </div>
                        <!-- chỗ này hiển thị thông tin người dùng -->
        
                        <form method="post" name="UserProfile"
                            id="fChangeProfile" class="form mt-5"
                            enctype="multipart/form-data">
                            <div class=" row">
                                <div class="col-md-6" style="padding-right:25px ;">
                                    <div class="form-group row">
                                        <label class="control-label required"
                                            for="fullName">Tài khoản: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7">
                                            <input type="text" name="fullName"
                                                class="input form-control"
                                                maxlength="255">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="control-label required"
                                            for="fullName">Họ tên: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7">
                                            <input type="text" name="fullName"
                                                class="input form-control"
                                                maxlength="255">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label class="control-label required"
                                            for="birthday">Bậc: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7 date">
                                            <input type="text" name="birthday"
                                                class="input form-control"
                                                value maxlength="10">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group row mt-3">
                                        <label
                                            class="control-label required">Giới
                                            tính: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7 d-flex">
                                            <div class="radio">
                                                <label><input type="radio"
                                                        name="flexRadioDefault"
                                                        id="flexRadioDefault1" style="margin-left: -36px;">
                                                    Nam</label>
                                            </div>
                                            <div class="radio" style="margin-left: 10px;">
                                                <label><input type="radio"
                                                        name="flexRadioDefault"
                                                        id="flexRadioDefault2"
                                                        checked style="margin-left: -36px;"> Nữ</label>
                                            </div>
                                            <div class="radio" style="margin-left: 10px;">
                                                <label><input type="radio"
                                                        name="flexRadioDefault"
                                                        id="flexRadioDefault3"
                                                        checked style="margin-left: -36px;"> Khác</label>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                </div>
                                <div class="col-md-6" style="padding-left:25px ;">
                                    <div class="form-group row mt-2">
                                        <label class="control-label required"
                                            for="fullName">Email: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7">
                                            <input type="email" name="email"
                                                class="input form-control"
                                                maxlength="255">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label class="control-label required"
                                            for="fullName">Số Điện Thoại: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7">
                                            <input type="number" name="fullName"
                                                class="input form-control"
                                                maxlength="255">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label class="control-label required"
                                            for="birthday">Quyền: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7 date">
                                            <input type="text" name="birthday"
                                                class="input form-control"
                                                value maxlength="10">
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label class="control-label">Địa chỉ mặc định:</label>
                                        <select name="" id="" class="form-select" style="height: 45px;">
                                            <option value="">Địa chỉ 1</option>
                                            <option value="">Địa chỉ 2</option>
                                            <option value="">Địa chỉ 3</option ion>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 text-right">
                                    <button type="submit" class="btn btn-success btn-rounded" style="border-radius: 10px;">Lưu</button>
                                    <a href="#" class="btn btn-default btn-rounded" style="border-radius: 10px;">Quay lại</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
