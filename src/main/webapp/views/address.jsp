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
                    <select  class="input" name="city" id="city" >
                        <option value=""> Chọn tỉnh / thành  </option>
                    </select>
                    <input type="hidden" name="cityName" id="cityName">
                     <small style=" color: red;">${errors}</small>
                </div>
                <div class="form-group">
                    <label for="district" style="font-weight: 1">Thành phố</label>
                    <select class="input" name="district" id="district">
                        <option value="">Chọn quận / huyện   </option>
                    </select>
                    <input type="hidden" name="districtName" id="districtName">
                     <small style=" color: red;">${errors}</small>
                </div>
                <div class="form-group">
                    <label for="ward" style="font-weight: 1">Phường</label>
                    <select class="input" name="ward" id="ward">
                        <option value="">Chọn phường / xã  </option>
                    </select>
                    <input type="hidden" name="wardName" id="wardName">
                     <small style=" color: red;">${errors}</small>
                </div>
                <div class="order-notes">
    <label for="noteAddress" style="font-weight: 1">Địa chỉ cụ thể</label>
    <textarea name="noteAddress" class="input">${sub}</textarea>
     <small style=" color: red;">${errors}</small>
</div>
                <div class="form-group text-right" style="margin-top: 10px;">
                    <button formaction="/shop/create" formmethod="post" type="submit" class="btn btn-info">Thêm</button>
                     <button formaction="/shop/update/${item.ID}" formmethod="post" type="submit" class="btn btn-info">Cập Nhật</button>
                    <a href="/shop/newAddress" class="btn btn-info">Mới</a>
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
                <c:forEach var="item" items="${listAddress}" varStatus="status">
                <c:if test="${item.user.USERNAME eq list.USERNAME }">
                 <tr>
                        <td scope="row">${item.ID}</td>
                        <td>${item.ADDRESS}</td>
                        <td>  <a href="/shop/edit/${item.ID}" class="btn btn-info">Edit</a></td>
                       
                        <td>
                        
                          <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Xóa</button>
                   </td>
                    
                           
                    </tr>
                  

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Địa chỉ của bạn: ${item.ADDRESS}</h4>
      </div>
      <div class="modal-body">
        <p>Bạn có muốn xóa địa chỉ  "${item.ADDRESS }"</p>
      </div>
      <div class="modal-footer">
       <form action="/shop/delete/${item.ID}" style="display:inline;">
                    <input type="hidden" name="_method" value="delete">
                    <button type="submit" class="btn btn-info">Xóa</button>
                     </form>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
   
<!-- Modal -->

    <!-- /Billing Details -->
    <!-- Order notes -->
    <!-- /Order notes -->
    
</div>