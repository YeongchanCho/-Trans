<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>TRANS - 장거리 교통정보 안내</title>
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
	href="resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/css/animate.css">

<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">

<link rel="stylesheet" href="resources/css/aos.css">

<link rel="stylesheet" href="resources/css/ionicons.min.css">

<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="resources/css/flaticon.css">
<link rel="stylesheet" href="resources/css/icomoon.css">
<link rel="stylesheet" href="resources/css/style.css">







<!-- <style type="text/css">
#login {
	width: 20%;
	height: 30%;
	background: #3d3d3d;
	color: #fff;
	position: absolute;
	z-index: 1;
	top: 50%;
	left: 50%;
	text-align: center;
	border: 2px solid #000;
	display: none;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">


function openWindow() {
	var _width = '300';
    var _height = '400';
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( document.body.offsetWidth - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 
    	
 
    window.open('user/login', 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
    
   
    /* window.open(

        "user/login", 

        "open the window",

        "toolbar=no, width=300, height=400, left="+ popupX + ", top="+ popupY

    ); */

}

    $(document).ready(function() {
      $('#closeLogin').click(function() {
        $('#login').hide();
      });
    });
    function login(){
        $('#login').show();
    }
 </script> -->





<style type="text/css">
#search {
	width: 300px;
	height: 400px;
	background: #3d3d3d;
	color: #fff;
	position: absolute;
	z-index: 1;
	top: 50%;
	left: 50%;
	text-align: center;
	border: 2px solid #000;
	display: none;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
      $('#close').click(function() {
        $('#search').hide();
      });
    });
    function search(){
        $('#search').show();
    }
 </script>
<script type="text/javascript">
    function openLogin() {
    	 $('#myModal').show();
	}
  //팝업 Close 기능
    function close_pop(flag) {
         $('#myModal').hide();
    };
</script>
<script src="https://code.jquery.com/jquery-latest.js"></script> 
 
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 
</style>








</head>
<body>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html" style="font-size: 50px">TRANS</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> 메뉴
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="index.html"
						class="nav-link" style="font-size: 20px">홈</a></li>
					<li class="nav-item"><a href="rooms.html" class="nav-link"
						style="font-size: 20px">교통 경로찾기</a></li>
					<li class="nav-item"><a href="restaurant.html"
						class="nav-link" style="font-size: 20px">여행지 정보</a></li>
					<li class="nav-item"><a href="board/main" class="nav-link"
						style="font-size: 20px">여행커뮤니티</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link"
						style="font-size: 20px">예약</a></li>
					<!-- <li class="nav-item "><a onclick="login();" class="nav-link" style="font-size: 20px">로그인</a></li> -->
					<c:if test="${empty signinId}">
						<%-- 로그인 정보가 없는 경우(로그인되어 있지 않은 경우) --%>
						<li class="nav-item"><a onclick="openLogin();" class="nav-link"
							style="font-size: 20px" id="btnSignIn">로그인</a></li>
					</c:if>
					<c:if test="${not empty signinId}">
						<%-- 로그인 정보가 있는 경우(로그인되어 있는 경우) --%>
						<li class="nav-link">${signinId}님,환영! <a href="user/logout" class="nav-link">로그아웃</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	
	

	<section class="home-slider owl-carousel">
		<div class="slider-item"
			style="background-image: url(resources/images/bg_1.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-12 ftco-animate text-center">
						<div class="text mb-5 pb-3">
							<h1 class="mb-3" style="font-family: 맑은 고딕; font-size: 500%">장거리
								교통정보 / 관광지 안내</h1>
							<h2>Transportation &amp; Travel Information</h2>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="slider-item"
			style="background-image: url(resources/images/bg_2.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-12 ftco-animate text-center">
						<div class="text mb-5 pb-3">
							<h1 class="mb-3" style="font-family: 맑은 고딕; font-size: 400%">당신의
								이용 경험을 공유하세요~</h1>
							<h2>Join With Us</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-booking">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form onclick="search();" class="booking-form">
						<div class="row">
							<div class="col-md-3 d-flex">
								<div
									class="form-group p-4 align-self-stretch d-flex align-items-end">
									<div class="wrap">
										<label for="#">출발일</label> <input type="text"
											class="form-control checkin_date" placeholder="Check-in date">
									</div>
								</div>
							</div>
							<div class="col-md-3 d-flex">
								<div
									class="form-group p-4 align-self-stretch d-flex align-items-end">
									<div class="wrap">
										<label for="#">도착일</label> <input type="text"
											class="form-control checkout_date"
											placeholder="Check-out date">
									</div>
								</div>
							</div>
							<div class="col-md d-flex">
								<div
									class="form-group p-4 align-self-stretch d-flex align-items-end">
									<div class="wrap">
										<label for="#">출발지</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon">
													<span class="ion-ios-arrow-down"></span>
												</div>
												<select name="" id="" class="form-control">
													<option value="">서울</option>
													<option value="">인천/경기</option>
													<option value="">대전</option>
													<option value="">대구</option>
													<option value="">광주</option>
													<option value="">부산</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md d-flex">
								<div
									class="form-group p-4 align-self-stretch d-flex align-items-end">
									<div class="wrap">
										<label for="#">도착지</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon">
													<span class="ion-ios-arrow-down"></span>
												</div>
												<select name="" id="" class="form-control">
													<option value="">서울</option>
													<option value="">인천/경기</option>
													<option value="">대전</option>
													<option value="">대구</option>
													<option value="">광주</option>
													<option value="">부산</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md d-flex">
								<div class="form-group d-flex align-self-stretch">
									<input type="button" onclick="search();"
										value="Check Availability"
										class="btn btn-primary py-3 px-4 align-self-stretch">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>


	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">

				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">유용한 기능</h2>
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
						<h2 class="ftco-heading-2">정보</h2>
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
						<h2 class="ftco-heading-2">Q & A</h2>
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


	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.stellar.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/aos.js"></script>
	<script src="resources/js/jquery.animateNumber.min.js"></script>
	<script src="resources/js/bootstrap-datepicker.js"></script>
	<script src="resources/js/jquery.timepicker.min.js"></script>
	<script src="resources/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="resources/js/google-map.js"></script>
	<script src="resources/js/main.js"></script>









<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <form action="user/login" method="post">
                <input type="text" name="userid" placeholder="아이디 입력" required />
                <br />
                <input type="password" name="pwd" placeholder="비밀번호 입력" required />
                <br />
                <input type="submit" value="로그인" /> <a href="user/join">회원가입</a>
                <br />
                <input type="hidden" name="target" value="${ target }" />
            </form>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >닫기</span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->


	<div id="login">
		<div style="height: 370px;">
			<form action="user/login" method="post">
				<input type="text" name="userid" placeholder="아이디 입력" required />
				<br />
				<input type="password" name="pwd" placeholder="비밀번호 입력" required />
				<br />
				<input type="submit" value="로그인" /> <a href="user/join">회원가입</a>
				<br />
				<input type="hidden" name="target" value="${ target }" />
			</form>
		</div>
		<div>
			<div id="closeLogin" style="width: 100px; margin: auto;">close</div>
		</div>
	</div>

	<div id="search">
		<div style="height: 370px;">
			<form action="signin" method="post">
				<input type="text" name="userid" placeholder="아이디 입력" required /> <br />
				<input type="password" name="pwd" placeholder="비밀번호 입력" required />
				<br /> <input type="submit" value="로그인" /> <a href="user/join">회원가입</a>
				<br /> <input type="hidden" name="target" value="${ target }" />
			</form>
		</div>
		<div>
			<div id="close" style="width: 100px; margin: auto;">close</div>
		</div>
	</div>





</body>
</html>