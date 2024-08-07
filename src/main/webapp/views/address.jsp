<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <div class="container">
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
					<label for="city" style="font-weight: 1">Tỉnh</label> <select
						class="input" name="city" id="city">
						<option value="">Chọn tỉnh / thành</option>
					</select> <input type="hidden" name="cityName" id="cityName"> <small
						style="color: red;">${errors}</small>
				</div>
				<div class="form-group">
					<label for="district" style="font-weight: 1">Thành phố</label> <select
						class="input" name="district" id="district">
						<option value="">Chọn quận / huyện</option>
					</select> <input type="hidden" name="districtName" id="districtName">
					<small style="color: red;">${errors}</small>
				</div>
				<div class="form-group">
					<label for="ward" style="font-weight: 1">Phường</label> <select
						class="input" name="ward" id="ward">
						<option value="">Chọn phường / xã</option>
					</select> <input type="hidden" name="wardName" id="wardName"> <small
						style="color: red;">${errors}</small>
				</div>
				<div class="order-notes">
					<label for="noteAddress" style="font-weight: 1">Địa chỉ cụ
						thể</label>
					<textarea name="noteAddress" class="input">${sub}</textarea>
					<small style="color: red;">${errors}</small>
				</div>
				<div class="form-group text-right" style="margin-top: 10px;">
					<button formaction="/shop/create" formmethod="post" type="submit"
						class="btn btn-info">Thêm</button>
					<button formaction="/shop/update/${item.ID}" formmethod="post"
						type="submit" class="btn btn-info">Cập Nhật</button>
					<a href="/shop/newAddress" class="btn btn-info">Mới</a>
				</div>
			</form:form>
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
								<td><a href="/shop/edit/${item.ID}" class="btn btn-info">Edit</a></td>
								<td>
									<button type="button" class="btn btn-info btn-lg"
										data-toggle="modal" data-target="#myModal">Xóa</button>
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
											<p>Bạn có muốn xóa địa chỉ "${item.ADDRESS }"</p>
										</div>
										<div class="modal-footer">
											<form action="/shop/delete/${item.ID}"
												style="display: inline;">
												<input type="hidden" name="_method" value="delete">
												<button type="submit" class="btn btn-info">Xóa</button>
											</form>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
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
</div> --%>

<div class="container">
	<!-- Billing Details -->
	<div class="billing-details">
		<div class="section-title">
			<h3 class="title">Địa chỉ</h3>
		</div>

		<div class="row">
			<form id="mainForm"  method="post" >
			
				<div class="form-group">
				
					<label for="city" style="font-weight: 1">Tỉnh</label> 
				 <select id="province"  name="province" class="form-control"  onchange="fetchDistricts(); setProvinceName()">
                    <option value="" data-name="">Chọn Tỉnh/Thành phố</option>
                  </select> 
                  <input type="hidden" name="provinceName" id="cityName"> 
					<small style="color: red;">${errors}</small>
				</div>
				<div class="form-group">
					<label for="" style="font-weight: 1">Quận huyện</label> 
				<select id="district"   name="district" class="form-control" onchange="fetchWards(); ">
                    <option value="" data-name="" >Chọn Quận/Huyện</option>
                </select> 
                 <input type="hidden" name="districtName" id="nameDistrict"> 
					<small style="color: red;">${errors}</small>
				</div>
				<div class="form-group">
					<label for="ward" style="font-weight: 1">Phường</label> 
				<select id="ward" name="ward"  class="form-control" onchange="setWardName(); calculateShippingFee();">
                    <option value="" data-name="" >Chọn Phường/Xã</option>
                </select> <input type="hidden" name="wardName" id="wardName"> 
                <small style="color: red;">${errors}</small>
				</div>
				<input type="hidden" name="moneyShip" id="moneyShip">
				<div class="order-notes">
					<label for="noteAddress" style="font-weight: 1">Địa chỉ cụ
						thể</label>
					<textarea name="noteAddress" class="input">${sub}</textarea>
					<small style="color: red;">${errors}</small>
				</div>
				<div class="form-group text-right" style="margin-top: 10px;">
					<button formaction="/shop/create" formmethod="post" type="submit"
						class="btn btn-info">Thêm</button>
						<button formaction="/shop/update/${item.ID}" formmethod="post"
						type="submit" class="btn btn-info">Cập Nhật</button>
						<a href="/shop/newAddress" class="btn btn-info">Mới</a>
				</div>
			</form>
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
								<td><a href="/shop/edit/${item.ID}" class="btn btn-info">Edit</a></td>
								<td>
									<button type="button" class="btn btn-info btn-lg"
										data-toggle="modal" data-target="#myModal${item.ID}">Xóa</button>
								</td>
							</tr>


							<!-- Modal -->
							<div id="myModal${item.ID}" class="modal fade" role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Địa chỉ của bạn: ${item.ADDRESS}</h4>
										</div>
										<div class="modal-body">
											<p>Bạn có muốn xóa địa chỉ "${item.ADDRESS }"</p>
										</div>
										<div class="modal-footer">
											<form action="/shop/delete/${item.ID}"
												style="display: inline;">
												<input type="hidden" name="_method" value="delete">
												<button type="submit" class="btn btn-info">Xóa</button>
											</form>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	 <c:if test="${editCheck}">
        <script>
            document.addEventListener('DOMContentLoaded', function() {
            	try {
            		const provinceId =Number("${province}");
                    const districtId =Number("${district}");
                    const wardId = "${ward}";
                     console.log( wardId)
                    fetchProvinceNameById(provinceId)
                        .then(provinceName => {
                        	   $('#province').append(`<option value="${province}" selected>${provinceNAME}</option>`);
                        	    $('#province').trigger('change');
                               return   fetchDistrictNameById(districtId);
                          
                        }).then(districtName => {
                            console.log(districtName+'  tên huyện  '+${district});
                           
                           
                            setTimeout(function() {
                            	 $('#district').append(`<option value="${district}" selected>${districtNAME}</option>`);
                                 $('#district').trigger('change');   // Kích hoạt sự kiện onchange cho district
                            	return  fetchWardNameById(wardId);
                            	}, 100);
                            
                        }).then(wardName => {
                            setTimeout(function() {
                            	  console.log(wardName+'  tên xã  '+${ward});
                            	 $('#ward').append(`<option value="${ward}" selected>${wardNAME}</option>`);
                           	}, 300);
                             
                        })
                        
                        
                        
            	} catch (error) {
                     console.error('Lỗi khi fetch tên địa điểm:', error);
                }
                
                 
                
            });
            
           
        </script>
    </c:if>
	
	
	<c:choose>
	 <c:when test="${messageAdd }">
	     <script>
	     Swal.fire({
             icon: 'success',
             title: 'Thêm Địa Chỉ Thành Công',
             showConfirmButton: false,
             timer: 800
         });
         
         setTimeout(function() {
        	 window.location.href = "/shop/address"; 
         }, 1000);
         </script>
	 </c:when>
	 <c:when test="${messageUpdate }">
	  <script>
	     Swal.fire({
             icon: 'success',
             title: 'Cập Nhật Địa Chỉ Thành Công',
             showConfirmButton: false,
             timer: 800
         });
         
         setTimeout(function() {
        	 window.location.href = "/shop/address"; 
         }, 1000);
         </script>
	 </c:when>
	 <c:when test="${messageDelete }">
	 <script>
	     Swal.fire({
             icon: 'success',
             title: 'Xóa Địa Chỉ Thành Công',
             showConfirmButton: false,
             timer: 800
         });
         
         setTimeout(function() {
        	 window.location.href = "/shop/address"; 
         }, 1000);
         </script>
	 </c:when>
	</c:choose>

    <script>
        const token = '61810660-2862-11ef-8e53-0a00184fe694';  // Thay thế bằng token thực
        const shopId = '192562';  // Thay thế bằng shop ID thực
       
       
        document.addEventListener("DOMContentLoaded", function() {
            fetchProvinces();
           
           
        });
		
		
		
		// Hàm lấy tên tỉnh/thành phố theo ID
         function fetchProvinceNameById(provinceId) {
            return fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province', {
                headers: {
                    'Content-Type': 'application/json',
                    'Token': token
                }
            })
            .then(response => response.json())
            .then(data => {
                const province = data.data.find(province => province.ProvinceID === provinceId);
                if (province) {
                    return province.ProvinceName;
                } else {
                    throw new Error('Province not found');
                }
            })
            .catch(error => {
                console.error('Error fetching province name:', error);
                throw error;
            });
        }

        // Hàm lấy tên quận/huyện theo ID
        function fetchDistrictNameById(districtId) {
            const provinceId = document.getElementById('province').value;
            
            return fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id='+provinceId+'&shop_id='+shopId, {
                headers: {
                    'Content-Type': 'application/json',
                    'Token': token
                }
            })
            .then(response => response.json())
            .then(data => {
                const district = data.data.find(district => district.DistrictID === districtId);
                if (district) {
                    return district.DistrictName;
                } else {
                    throw new Error('District not found');
                }
            })
            .catch(error => {
                console.error('Error fetching district name:', error);
                throw error;
            });
        }

        // Hàm lấy tên phường/xã theo ID
        function fetchWardNameById(wardId) {
        	const districtId = document.getElementById('district').value;
        	console.log(districtId+' tên huyện tìm thấy')
            return fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id='+districtId+'&shop_id='+shopId, {
                headers: {
                    'Content-Type': 'application/json',
                    'Token': token
                }
            })
            .then(response => response.json())
            .then(data => {
                const ward = data.data.find(ward => ward.WardCode === wardId);
                if (ward) {
                	
                    return ward.WardName;
                } else {
                    throw new Error('Ward not found');
                }
            })
            .catch(error => {
                console.error('Error fetching ward name:', error);
                throw error;
            });
        }

        function fetchProvinces() {
            fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province', {
                headers: {
                    'Content-Type': 'application/json',
                    'Token': token
                }
            })
            .then(response => response.json())
            .then(data => {
                const provinceSelect = document.getElementById('province');
                const sortedProvinces = data.data.sort((a, b) => a.ProvinceName.localeCompare(b.ProvinceName));
                sortedProvinces.forEach(province => {
                    const option = document.createElement('option');
                    
                    option.value = province.ProvinceID;
                    option.textContent = province.ProvinceName;
                    option.setAttribute('data-name', province.ProvinceName);
                    provinceSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching provinces:', error));
          
        }

        function fetchDistricts() {
            const provinceId = document.getElementById('province').value;
           
            if (!provinceId) return;

            fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id='+provinceId+'&shop_id='+shopId, {
                headers: {
                    'Content-Type': 'application/json',
                    'Token': token
                }
            })
            .then(response => response.json())
            .then(data => {
                const districtSelect = document.getElementById('district');
                districtSelect.innerHTML = '<option value="">Chọn Quận/Huyện</option>';
                const wardSelect = document.getElementById('ward');
                wardSelect.innerHTML = '<option value="">Chọn Phường/Xã</option>';
                const sortedDistricts = data.data.sort((a, b) => a.DistrictName.localeCompare(b.DistrictName));
                sortedDistricts.forEach(district => {
                    const option = document.createElement('option');
                   
                    option.value = district.DistrictID;
                    option.textContent = district.DistrictName;
                 
                    districtSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching districts:', error));
           
        }
        function setProvinceName() {
        	  const provinceSelect = document.getElementById('province');
        	  const selectedProvinceId = parseInt(provinceSelect.value);
        	
        	 fetchProvinceNameById(selectedProvinceId)
             .then(provinceName => {
                 document.getElementById('cityName').value =provinceName;
               
             })
             .catch(error => {
                 console.error('Error:', error);
             });
           
          
        };
        function setDistrictName() {
        	const districtSelect = document.getElementById('district').value;
        	const num = Number(districtSelect);
        	
        	fetchDistrictNameById(num)
            .then(districtName => {
            	 document.getElementById('nameDistrict').value =districtName;
            })
            .catch(error => {
                console.error('Error:', error);
            });
        	
      }
        function setWardName() {
        	const wardSelect = document.getElementById('ward').value;
        	
        	fetchWardNameById(wardSelect)
            .then(WardName => {
            	document.getElementById('wardName').value =WardName;
            })
            .catch(error => {
                console.error('Error:', error);
            });
        	
      }
        
        
        function fetchWards() {
        	
            const districtId = document.getElementById('district').value;
            setDistrictName();
            if (!districtId) return;
            
            fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id='+districtId+'&shop_id='+shopId, {
                headers: {
                    'Content-Type': 'application/json',
                    'Token': token
                }
            })
            .then(response => response.json())
            .then(data => {
                const wardSelect = document.getElementById('ward');
                wardSelect.innerHTML = '<option value="">Chọn Phường/Xã</option>';
                const sortedWards = data.data.sort((a, b) => a.WardName.localeCompare(b.WardName));
                sortedWards.forEach(ward => {
                    const option = document.createElement('option');
                    option.value = ward.WardCode;
                    option.textContent = ward.WardName;
             
                    wardSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching wards:', error));
            
        }
        function calculateShippingFee() {
            const toDistrictId =  document.getElementById('district').value;
            const toDistrictIdNum =Number(toDistrictId)
            console.log(toDistrictId+'   mã huyện');
            const toWardCode = document.getElementById('ward').value;
            console.log(toWardCode+'   mã xã');
            if (!toDistrictId || !toWardCode) {
                alert('Vui lòng chọn đầy đủ thông tin địa điểm');
                return;
            }

            const params = new URLSearchParams({
                from_district_id: 1574,
                from_ward_code: '550307',
                service_id: 53320,
                service_type_id: '',
                to_district_id: toDistrictIdNum,
                to_ward_code: toWardCode,
                height: 10,
                length: 10,
                weight: 10,
                width: 10,
                insurance_value: 10000,
                cod_failed_amount: 2000,
                coupon: ''
            });

            fetch('https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee?'+params.toString(), {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Token': token,
                    'ShopId': shopId
                }
            })
            .then(response => response.json())
            .then(data => {
           
                const moneyShip = document.getElementById('moneyShip').value;
              
                if (data.code === 200 && data.data) {
					
             
                	  console.log(data.data.total+'   tiền ');
                    document.getElementById('moneyShip').value=data.data.total;
                } else {
                	console.log(' không thể tính  tiền ');
                	  console.log(data.data.total+'   tiền ');
                }
            })
            .catch(error => {
                console.error('Error calculating shipping fee:', error);
                document.getElementById('shippingFee').textContent = 'Lỗi khi tính phí vận chuyển';
            });
        }
    </script>
   <script>
        document.getElementById('mainForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form submission until validation is done

            const province = document.getElementById('province');
            const district = document.getElementById('district');
            const ward = document.getElementById('ward');
            const noteAddress = document.querySelector('textarea[name="noteAddress"]');
            const errorMessages = document.querySelectorAll('small[style="color: red;"]');

            let isValid = true;

            if (!province.value) {
                errorMessages[0].textContent = 'Vui lòng chọn Tỉnh/Thành phố';
                isValid = false;
            } else {
                errorMessages[0].textContent = '';
            }

            if (!district.value) {
                errorMessages[1].textContent = 'Vui lòng chọn Quận/Huyện';
                isValid = false;
            } else {
                errorMessages[1].textContent = '';
            }

            if (!ward.value) {
                errorMessages[2].textContent = 'Vui lòng chọn Phường/Xã';
                isValid = false;
            } else {
                errorMessages[2].textContent = '';
            }

            if (!noteAddress.value.trim()) {
                errorMessages[3].textContent = 'Vui lòng nhập địa chỉ chi tiết';
                isValid = false;
            } else {
                errorMessages[3].textContent = '';
            }

            if (isValid) {
            	 const form = event.target;
                 const clickedButton = document.activeElement; // Get the clicked button
                 form.action = clickedButton.getAttribute('formaction');
                 form.method = clickedButton.getAttribute('formmethod');
                 form.submit();
            }
        });
    </script>