<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/Admin/production/head.jsp"></jsp:include>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<jsp:include page="/Admin/production/menubar.jsp"></jsp:include>
			<jsp:include page="/Admin/production/topnav.jsp"></jsp:include>


			<!-- Page Content -->
			<div class="right_col" role="main">
				<jsp:include page="/Admin/production/${page }"></jsp:include>
			</div>

			<!-- Footer -->
			<jsp:include page="/Admin/production/footer.jsp"></jsp:include>

		</div>
	</div>
	<script>
	var daysList = ${daysList}
	var getTotalPricePerDay = ${getTotalPricePerDay}
		var ctx = document.getElementById('columnChart').getContext('2d');

		//Data chart
		var data = {
			labels : daysList,
			datasets : [ {
				label : 'Doanh thu',
				data : getTotalPricePerDay,
				backgroundColor : 'rgba(38,185,154, 0.7)',
				borderColor : 'rgba(46, 204, 113, 1)',
				borderWidth : 0
			} ]
		};

		var options = {
			scales : {
				y : {
					beginAtZero : true
				}
			}
		};

		// Tạo chart
		var columnChart = new Chart(ctx, {
			type : 'bar',
			data : data,
			options : options
		});
	</script>

	<script>
	var hoursList = ${hoursList}
	
		// Lấy tham chiếu đến phần tử <canvas>
		var ctx = document.getElementById('columnChartday').getContext('2d');

		// Dữ liệu và cấu hình biểu đồ
		var data = {
			labels : hoursList,
			datasets : [ {
				label : 'Doanh thu',
				data : [ 0, 0, 0, 0, 0, 0, 900, 1800, 200, 700, 1200, 1500,
						900, 1800, 1900, 1400, 900, 1800, 200, 700, 900, 1800,
						1900, 1400 ],
				backgroundColor : 'rgba(38,185,154, 0.7)',
				borderColor : 'rgba(46, 204, 113, 1)',
				borderWidth : 0
			} ]
		};

		var options = {
			scales : {
				y : {
					beginAtZero : true
				}
			}
		};

		// Tạo biểu đồ cột
		var columnChart = new Chart(ctx, {
			type : 'bar',
			data : data,
			options : options
		});
	</script>
	<script>
	var monthsList = ${monthsList}
	var getTotalPricePerDay = ${getTotalPricePerDay}
		// Lấy tham chiếu đến phần tử <canvas>
		var ctx = document.getElementById('columnChartyear').getContext('2d');

		// Dữ liệu và cấu hình biểu đồ
		var data = {
			labels : monthsList,
			datasets : [ {
				label : 'Doanh thu',
				data : getTotalPricePerDay,
				backgroundColor : 'rgba(38,185,154, 0.7)',
				borderColor : 'rgba(46, 204, 113, 1)',
				borderWidth : 0
			} ]
		};

		var options = {
			scales : {
				y : {
					beginAtZero : true
				}
			}
		};

		// Tạo biểu đồ cột
		var columnChart = new Chart(ctx, {
			type : 'bar',
			data : data,
			options : options
		});
	</script>

	<!-- jQuery -->
	<script src="/Admin/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="/Admin/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/Admin/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- FastClick -->
	<script src="/Admin/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="/Admin/vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script src="/Admin/vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- gauge.js -->
	<script src="/Admin/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="/Admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="/Admin/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script src="/Admin/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script src="/Admin/vendors/Flot/jquery.flot.js"></script>
	<script src="/Admin/vendors/Flot/jquery.flot.pie.js"></script>
	<script src="/Admin/vendors/Flot/jquery.flot.time.js"></script>
	<script src="/Admin/vendors/Flot/jquery.flot.stack.js"></script>
	<script src="/Admin/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- jQuery custom content scroller -->
	<script
		src="/Admin/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Flot plugins -->
	<script src="/Admin/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script src="/Admin/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script src="/Admin/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script src="/Admin/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script src="/Admin/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script src="/Admin/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script
		src="/Admin/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="/Admin/vendors/moment/min/moment.min.js"></script>
	<script
		src="/Admin/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="/Admin/build/js/custom.min.js"></script>
	<!-- Datatables -->
	<script src="/Admin/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="/Admin/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="/Admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="/Admin/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="/Admin/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="/Admin/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="/Admin/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="/Admin/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="/Admin/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="/Admin/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="/Admin/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="/Admin/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script src="/Admin/vendors/jszip/dist/jszip.min.js"></script>
	<script src="/Admin/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script src="/Admin/vendors/pdfmake/build/vfs_fonts.js"></script>

</body>
</html>