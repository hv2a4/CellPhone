<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
        <form:form method="post"  modelAttribute="item" name="UserProfile"
                             class="form mt-5"
                            action="/shop/profile"   enctype="multipart/form-data">
            <div class="container">
                <div class="card mt-5">
                    <div class="card-body">
                        <div class="img row">
                            <div class="col-12" id="imageContainer">
                                <img  id="imagePreview" src="/images/${list.AVATAR}" alt="">
                              
                            </div>
                            
                        </div>
                        <div class="col-12">
                            <input class="mt-3" type="file"
                              name="photo_file"  id="imageUpload" accept="image/*"
                                style="width: 75px; position: relative;">
                        </div>
                        <!-- chỗ này hiển thị thông tin người dùng -->
                                 <form:hidden path="PASSWORD" value="${list.PASSWORD}"/>
                        <small style=" color: red;"><form:errors path="PASSWORD"></form:errors></small>
                                 <form:hidden path="ROLE" value="false"/>
                        <small style=" color: red;"><form:errors path="ROLE"></form:errors></small>
                            <div class=" row">
                                <div class="col-md-6" style="padding-right:25px ;">
                                    <div class="form-group row">
                                        <label class="control-label required"
                                            for="fullName">Tài khoản: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7">
                                            <form:input path="USERNAME" class="input form-control" value="${list.USERNAME}" placeholder=" " readonly="true" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="control-label required"
                                            for="fullName">Họ tên: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7">
                                           
                               <form:input path="FULLNAME" class="input form-control" value="${list.FULLNAME}" placeholder=" "  />
                                    <small style=" color: red;"><form:errors path="FULLNAME"></form:errors></small>  
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label class="control-label required"
                                            for="birthday">Bậc: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7 date">
                                            <input type="text" name="birthday"
                                                class="input form-control"
                                                value ="${list.rank.NAME}" readonly>
                                        </div>
                                    </div>
                                   <!--  l -->
                                    <div class="form-group row mt-3">
                                        <label
                                            class="control-label required">Giới
                                            tính: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7 d-flex">
                                            <div class="radio">
                               <label><form:radiobutton path="GENDER" id="flexRadioDefault1" value="NAM" style="margin-left: -36px;" 
                               checked="${list.GENDER eq 'NAM'? true:'' }" />
                                                    Nam</label>
                                            </div>
                                            <div class="radio" style="margin-left: 10px;">
                         <label><form:radiobutton path="GENDER" id="flexRadioDefault1" value="NU" style="margin-left: -36px;" 
                        checked="${list.GENDER eq 'NU'? true:'' }" /> Nữ</label>
                                            </div>
                                            <div class="radio" style="margin-left: 10px;">
                        <label> <form:radiobutton path="GENDER" id="flexRadioDefault1" value="KHAC" style="margin-left: -36px;" 
                       checked="${list.GENDER eq 'KHAC'? true:'' }"  /> Khác</label>
                       <small style=" color: red;"><form:errors path="GENDER"></form:errors></small>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                 <!--  l -->
                                  
                                </div>
                                <div class="col-md-6" style="padding-left:25px ;">
                                    <div class="form-group row mt-2">
                                        <label class="control-label required"
                                            for="fullName">Email: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7">
                                        <form:input path="EMAIL" class="input form-control" value="${list.EMAIL}" placeholder=" "  />
                                  <small style=" color: red;"><form:errors path="EMAIL"></form:errors></small> 
                                        </div>
                                    </div>
                                    <div class="form-group row mt-2">
                                        <label class="control-label required"
                                            for="fullName">Số Điện Thoại: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7">
                                           
                                          <form:input path="PHONE_NUMBER" class="input form-control" value="${list.PHONE_NUMBER}" placeholder=" "  />
                                       <small style=" color: red;"><form:errors path="PHONE_NUMBER"></form:errors></small> 
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label class="control-label required"
                                            for="birthday">Quyền: <span
                                                class="text-fail">*</span></label>
                                        <div class="col-7 date">
                                            <input value="${list.ROLE?'Quản Lí':'Khách Hàng'}" type="text" name="birthday"
                                                class="input form-control"
                                                value maxlength="10" readonly>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 text-right">
                                    <button type="submit" class="btn btn-success btn-rounded" style="border-radius: 10px;">Lưu</button>
                                    <a href="/shop" class="btn btn-default btn-rounded" style="border-radius: 10px;">Quay lại</a>
                                </div>
                            </div>
                     
                    </div>
                </div>
            </div>
             </form:form>
             
        </main>
         
