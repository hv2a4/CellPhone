<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<body>

	<h1 class="ml-2">
		<b>Tổng quan</b>
	</h1>
	<div class="row">

		<div class="col-md-4 p-2">
			<div class="card w-100 p-4">
				<h2 class="ml-2">
					<b>Tổng doanh thu</b>
				</h2>
				<hr>
				<h1 class="ml-2">
					<b><fmt:formatNumber pattern="###,###">${sumRevenue}</fmt:formatNumber></b>
				</h1>
			</div>
		</div>
		<div class="col-md-4 p-2">
			<div class="card w-100 p-4">
				<h2 class="ml-2">
					<b>Tổng khách hàng</b>
				</h2>
				<hr>
				<h1 class="ml-2">
					<b><fmt:formatNumber pattern="###,###">${countUser }</fmt:formatNumber></b>
				</h1>
			</div>
		</div>
		<div class="col-md-4 p-2">
			<div class="card w-100 p-4">
				<h2 class="ml-2">
					<b>Tổng đơn hàng</b>
				</h2>
				<hr>
				<h1 class="ml-2">
					<b><fmt:formatNumber pattern="###,###">${countOrder}</fmt:formatNumber></b>
				</h1>
			</div>
		</div>

	</div>
	<div class="row">
		<div class="col-md-12 col-sm-12 ">
			<h1 class="text-center">Doanh thu</h1>
			<canvas id="columnChart"></canvas>
		</div>
	</div>
</body>
</html>