<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
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
			<a class="navbar-brand" href="../">TRANS</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="../" class="nav-link">홈</a></li>
					<li class="nav-item"><a href="rooms.html" class="nav-link">교통
							경로찾기</a></li>
					<li class="nav-item"><a href="restaurant.html"
						class="nav-link">여행지 정보</a></li>
					<li class="nav-item active"><a href="" class="nav-link">여행커뮤니티</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link">예약</a></li>
					<c:if test="${empty signinId}">
                        <%-- 로그인 정보가 없는 경우(로그인되어 있지 않은 경우) --%>
                        <li class="nav-item"><a href="../user/login"
                            class="nav-link" style="font-size: 20px" id="btnSignIn">로그인</a></li>
                    </c:if>
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
	<!-- END nav -->


	<div class="hero-wrap"
		style="background-image: url('../resources/images/bg_1.jpg');">
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
						<h1 class="mb-4 bread" style="font-family: 맑은 고딕; font-size: 400%">여행커뮤니티</h1>
					</div>
				</div>
			</div>
		</div>
	</div>



	<nav>
		<br />
		<ul>
			<c:if test="${empty signinId}">
				<%-- 로그인되어 있지 않은 경우 --%>
				<li><a href="../user/login" id="btnSignIn"
					style="font-family: 맑은 고딕; font-size: 200%">로그인</a></li>
			</c:if>
			<c:if test="${not empty signinId}">
				<%-- 로그인되어 있는 경우 --%>
				<li>${signinId}님.<a href="../user/logout">로그아웃</a>
				</li>
			</c:if>

			<li><a href="insert">새 글 작성하기</a></li>
		</ul>
	</nav>


	<section class="ftco-section">
		<div class="container">
			<div class="row d-flex">

				<c:forEach var="board" items="${boardList}">
					<div class="col-md-3 d-flex ftco-animate">
						<div class="blog-entry align-self-stretch">
							<a href="detail?bno=${board.bno}" class="block-20"
								style="background-image: url('../resources/images/image_1.jpg');">
							</a>
							<div class="text mt-3 d-block">
								<h3 class="heading mt-3">
									<a href="#" style="font-family: 맑은 고딕">${board.title}</a>
								</h3>
								<div class="meta mb-3">
									<fmt:formatDate value="${board.reg_date}"
										pattern="yyyy-MM-dd HH:mm" var="reg_date" />
									<div>
										<a href="#">${reg_date}</a>
									</div>
									<div>
										<a href="#">${board.userid}</a>
									</div>
									<div>
										<a href="#" class="meta-chat"><span class="icon-chat"></span>${board.reply_cnt}</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
                 </div>

				<!--  
				<div class="row mt-5">
					<div class="col text-center">
						<div class="block-27">
							<ul>
								<li><a href="#">&lt;</a></li>
								<li class="active"><span>1</span></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&gt;</a></li>
							</ul>
						</div>
					</div>
				</div>
				
				-->

				<div class="row mt-5">
					<div class="col text-center">
						<div class="block-27">
							<ul>
								<c:if test="${pageMaker.prev}">
									<li><a
										href="main${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
                                    end="${pageMaker.endPage}" var="idx">
                                    <c:choose>
                                       <c:when test="${idx eq cri.page}">
                                           <li class="active"><span><a href="main${pageMaker.makeQuery(idx)}">${idx}</a></span></li>
                                       </c:when>
                                       
                                       <c:otherwise>
                                           <li><a href="main${pageMaker.makeQuery(idx)}">${idx}</a></li>
                                       </c:otherwise>                                   
                                    </c:choose>
                                </c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="main${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div> 
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