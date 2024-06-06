<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Electro - HTML Ecommerce Template</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
			rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="/css/bootstrap.min.css" />
		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="/css/slick.css" />
		<link type="text/css" rel="stylesheet" href="/css/slick-theme.css" />

		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="/css/nouislider.min.css" />

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="/css/font-awesome.min.css">
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
			integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
			crossorigin="anonymous" referrerpolicy="no-referrer" />

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="/css/style.css" />
	</head>
	<body>
		<jsp:include page="/views/header.jsp"></jsp:include>
		<jsp:include page="/views/nav.jsp"></jsp:include>
		<jsp:include page="/views/${page}"></jsp:include>
		<jsp:include page="/views/newsletter.jsp"></jsp:include>
		<jsp:include page="/views/footer.jsp"></jsp:include>
		
		<!-- jQuery Plugins -->
		<script src="/js/jquery.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<script src="/js/slick.min.js"></script>
		<script src="/js/nouislider.min.js"></script>
		<script src="/js/jquery.zoom.min.js"></script>
		<script src="/js/main.js"></script>

	</body>
</html>
