<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<title>TRANS - 교통정보 안내</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i"
	rel="stylesheet">

<link rel="stylesheet"
	href="../resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/animate.css">

<link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css">

<link rel="stylesheet" href="../resources/css/aos.css">

<link rel="stylesheet" href="../resources/css/ionicons.min.css">

<link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="../resources/css/flaticon.css">
<link rel="stylesheet" href="../resources/css/icomoon.css">
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="../" style="font-size: 50px">TRANS</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="../" class="nav-link"
						style="font-size: 20px">홈</a></li>
					<li class="nav-item"><a href="../tour?pageNo=1"
						class="nav-link" style="font-size: 20px">여행지 정보</a></li>
					<li class="nav-item"><a href="../board/main" class="nav-link"
						style="font-size: 20px">여행커뮤니티</a></li>
					<li class="nav-item active"><a
						href="../user/myinfo?userid=${signinId}" class="nav-link"
						style="font-size: 20px">내정보</a></li>
					<c:if test="${not empty signinId}">
						<%-- 로그인 정보가 있는 경우(로그인되어 있는 경우) --%>
						<li class="nav-link">${signinId}님,환영!<a href="../user/logout"
							class="nav-link">로그아웃</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>

	<div class="hero-wrap"
		style="background-image: url('../resources/images/korea1.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
				<div
					class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
					<div class="text">
						<p class="breadcrumbs mb-2">
							<span class="mr-2"><a href="../">홈</a></span> <span>여행커뮤니티</span>
						</p>
						<h1 class="mb-4 bread" style="font-family: 맑은 고딕; font-size: 400%">내정보
							수정하기</h1>
					</div>
				</div>
			</div>
		</div>
	</div>


	<section class="ftco-section">
		<div class="container">
			<div class="comment-form-wrap pt-5">
				<form action="myinfoupdate" method="post" class="p-5 bg-light">
					<div class="form-group">
						<label for="userid">아이디</label> <input type="text" id="userid"
							 class="form-control" name="userid" value="${user.userid}" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label for="pwd">비밀번호</label> <input type="text" id="pwd"
							 class="form-control" name="pwd" value="${user.pwd}" required="required" />
					</div>
					<div class="form-group">
						<label for="city">도시</label> <input type="text" id="city"
							 class="form-control" name="city" value="${user.city}" required="required" />
					</div>
					<div class="form-group">
						<label for="phone">전화 번호</label> <input type="text" id="phone"
							 class="form-control" name="phone" value="${user.phone}" required="required" />
					</div>
					<div class="form-group">
						<label for="email">이메일</label> <input type="email" id="email"
							 class="form-control" name="email" value="${user.email}" required="required" />
					</div>
					<div class="form-group">
						<label for="gender">성별 (남/여)</label> <input type="text" id="gender"
							 class="form-control" name="gender" value="${user.gender}" required="required" />
					</div>
					<div class="form-group">
						<fmt:formatDate value="${user.birth}"
	                    pattern="yyyy-MM-dd" var="birth"/> 
						<label for="birth">생년월일</label><br/> <input type="text" id="birth"
							  class="form-control checkin_date" name="birth" value="${birth}" required="required" />
					</div>
					<div class="form-group">
						<input type="submit" value="수정 완료" class="btn py-3 px-4 btn-primary"/>
					</div>
				</form>
			</div>
		</div>
	</section>



	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">

				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2" style="font-family: 맑은 고딕">유용한 기능</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">여행커뮤니티</a></li>
							<li><a href="#" class="py-2 d-block">즐겨찾은 정보들</a></li>
							<li><a href="#" class="py-2 d-block">Amenities</a></li>
							<li><a href="#" class="py-2 d-block">Gift Card</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2" style="font-family: 맑은 고딕">정보</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">내정보수정</a></li>
							<li><a href="#" class="py-2 d-block">사이트맵</a></li>
							<li><a href="#" class="py-2 d-block">서비스 안내</a></li>
							<li><a href="#" class="py-2 d-block">새 소식</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2" style="font-family: 맑은 고딕">Q & A</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">서울시 강남구 테헤란로000 여삼빌딩 PH</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 5555 9999</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">chosamkim@itwill.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Cho &amp; 3Kim </a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	<script src="../resources/js/jquery.min.js"></script>
	<script src="../resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../resources/js/popper.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/jquery.easing.1.3.js"></script>
	<script src="../resources/js/jquery.waypoints.min.js"></script>
	<script src="../resources/js/jquery.stellar.min.js"></script>
	<script src="../resources/js/owl.carousel.min.js"></script>
	<script src="../resources/js/jquery.magnific-popup.min.js"></script>
	<script src="../resources/js/aos.js"></script>
	<script src="../resources/js/jquery.animateNumber.min.js"></script>
	<script src="../resources/js/bootstrap-datepicker.js"></script>
	<script src="../resources/js/jquery.timepicker.min.js"></script>
	<script src="../resources/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="../resources/js/google-map.js"></script>
	<script src="../resources/js/main.js"></script>
</body>
</html>