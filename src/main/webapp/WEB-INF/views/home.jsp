<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
	<head>
		<title>Home</title>
		<meta charset="UTF-8"/>
		<!-- 3) 반응형 웹(responsive web)을 위한 설정 -->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!-- Bootstrap 설정 -->
		<!-- 1) Bootstrap CSS 파일 링크 -->
		<link rel="stylesheet"
		    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
		<!-- 2) Bootstrap JavaScript를 포함 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</head>
	<body>
		<h1>
			Hello world!  
		</h1>
		
		<P>  The time on the server is ${serverTime}. </P>
	</body>
</html>
