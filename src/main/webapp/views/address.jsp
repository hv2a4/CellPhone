<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
    <!-- Billing Details -->
    <div class="billing-details">
        <div class="section-title">
            <h3 class="title">Địa chỉ</h3>
        </div>

        <div class="row">
            <form:form modelAttribute="item" action="" method="post">
             <form:hidden path="ID" />
             <form:hidden path="user.USERNAME" />
                <div class="form-group">
                    <label for="city" style="font-weight: 1">Tỉnh</label>
                    <select class="input" name="city" id="city">
                        <option value="">Chọn tỉnh / thành</option>
                    </select>
                    <input type="hidden" name="cityName" id="cityName">
                </div>
                <div class="form-group">
                    <label for="district" style="font-weight: 1">Thành phố</label>
                    <select class="input" name="district" id="district">
                        <option value="">Chọn quận / huyện</option>
                    </select>
                    <input type="hidden" name="districtName" id="districtName">
                </div>
                <div class="form-group">
                    <label for="ward" style="font-weight: 1">Phường</label>
                    <select class="input" name="ward" id="ward">
                        <option value="">Chọn phường / xã</option>
                    </select>
                    <input type="hidden" name="wardName" id="wardName">
                </div>
                <div class="order-notes">
    <label for="noteAddress" style="font-weight: 1">Địa chỉ cụ thể</label>
    <textarea name="noteAddress" class="input">${sub}</textarea>
   <span>${errors}</span>
</div>
                <div class="form-group text-right" style="margin-top: 10px;">
                    <button formaction="/shop/create" formmethod="post" type="submit" class="btn btn-info">Thêm</button>
                     <button formaction="/shop/update/${item.ID}" formmethod="post" type="submit" class="btn btn-info">Cập Nhật</button>
                    <button type="reset" class="btn btn-info">Mới</button>
                </div>
            </form:form >
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Địa chỉ</th>
                        <th scope="col">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${listAddress}">
                <c:if test="${item.user.USERNAME eq list.USERNAME }">
                 <tr>
                        <td scope="row">${item.ID}</td>
                        <td>${item.ADDRESS}</td>
                        <td>  <a href="/shop/edit/${item.ID}" class="btn btn-info">Edit</a></td>
                       
                        <td>
                        
                        <form action="/shop/delete/${item.ID}" style="display:inline;">
                    <input type="hidden" name="_method" value="delete">
                    <button type="submit" class="btn btn-info">Xóa</button>
                     </form>
                   </td>
                    
                           
                    </tr>
                </c:if>
                 
                </c:forEach>
                    
                    
                </tbody>
            </table>
        </div>
    </div>
    <!-- /Billing Details -->
    <!-- Order notes -->
    <!-- /Order notes -->
</div>