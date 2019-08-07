<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>TRANS - 장거리 교통정보 안내</title>
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
                    <li class="nav-item"><a href="../" class="nav-link" style="font-size: 20px">홈</a></li>
                    <li class="nav-item"><a href="rooms.html" class="nav-link" style="font-size: 20px">교통
                            경로찾기</a></li>
                    <li class="nav-item"><a href="../tour/all?pageNo=1"
                        class="nav-link">여행지 정보</a></li>
                    <li class="nav-item active"><a href="main" class="nav-link" style="font-size: 20px">여행커뮤니티</a></li>
                    <li class="nav-item"><a href="../user/myinfo?userid=${signinId}" class="nav-link" style="font-size: 20px">내정보</a></li>
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
    
    <div class="hero-wrap"
        style="background-image: url('../resources/images/korea3.jpg');">
        <div class="overlay"></div>
        <div class="container">
            <div
                class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
                <div
                    class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
                    <div class="text">
                        <p class="breadcrumbs mb-2">
                            <span class="mr-2"><a href="../">홈</a></span> <span class="mr-2"><a
                                href="main">여행커뮤니티</a></span>
                        </p>
                        <h1 class="mb-4 bread" style="font-family: 맑은 고딕; font-size: 400%">글 수정하기</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container pt-3">
 
    <div class="categories">
        <ul>
            <li>
                <a href="main">게시판 메인 페이지</a>
            </li>
            <li>
                <a href="detail?bno=${board.bno}">게시글 상세보기 페이지</a>
            </li>
            <li>
                <a id="menuDelete" href="delete?bno=${board.bno}">삭제</a>
            </li>
        </ul>
      </div>
 
    
    <div class="comment-form-wrap pt-1">
	    <form action="update" method="post" class="p-5 bg-light">
	        <div class="form-group">
	            <label for="bno">글 번호</label>
	            <input type="number" id="bno" name="bno"
	               class="form-control" value="${board.bno}" readonly/>
	        </div>
	        <div class="form-group">
	            <label for="title">제목 *</label>
	            <input type="text" id="title" name="title"
	                class="form-control" value="${board.title}" required />
	        </div>
	        <div class="form-group">
	            <label for="content">내용 *</label>
	            <textarea rows="5" id="content" 
	                name="content" class="form-control" required>${board.content}</textarea>
	        </div>
	        <div class="form-group">
	            <label for="userid">작성자</label>
	            <input type="text" id="userid"
	                class="form-control" value="${board.userid}" readonly />
	        </div>
	        <!-- 
	        <div class="inputArea">
	        <p>${board.attachment}</p>
                <label for="attachment">이미지</label> <input type="file" id="attachment" value="${board.attachment}"
                    name="file" />
                <div class="select_img">
                    <img src="" />
                </div>

                <script>
                    $("#attachment").change(
                            function() {
                                if (this.files && this.files[0]) {
                                    var reader = new FileReader;
                                    reader.onload = function(data) {
                                        $(".select_img img").attr("src",
                                                data.target.result).width(500);
                                    }
                                    reader.readAsDataURL(this.files[0]);
                                }
                            });
                </script>
                </div>
                 -->
	        <div class="form-group">
	            <label for="reply_cnt">댓글 갯수</label>
	            <input type="number" id="reply_cnt"
	               class="form-control" value="${board.reply_cnt}" readonly />
	        </div>
	        
	        <div class="form-group">
	            <input type="submit"  class="btn py-3 px-4 btn-primary"
	            value="수정 완료" />
	        </div>
	    </form>
	   </div>

    <script>
    $(document).ready(function () {
        $('#menuDelete').click(function (event) {
            event.preventDefault();
            var result = confirm('정말 삭제할까요?');
            if (result) {
                location = $(this).attr("href");
            }
        });
        
    });
    </script>
    
   
        </div>
 
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