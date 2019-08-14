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
            <a class="navbar-brand" href="/trans" style="font-size: 50px">TRANS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#ftco-nav" aria-controls="ftco-nav"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a href="/trans" class="nav-link" style="font-size: 20px">홈</a></li>
                    <li class="nav-item active"><a href="" class="nav-link" style="font-size: 20px">여행지
                            정보</a></li>
                    <li class="nav-item"><a href="../board/main" class="nav-link" style="font-size: 20px">여행커뮤니티</a></li>
                    <li class="nav-item"><a href="../user/myinfo?userid=${signinId}" class="nav-link" style="font-size: 20px">내정보</a></li>
                    <c:if test="${empty signinId}">
                        <%-- 로그인 정보가 없는 경우(로그인되어 있지 않은 경우) --%>
                        <li class="nav-item"><a href="../user/login" class="nav-link btnSignIn"
                            style="font-size: 20px" id="btnSignIn">로그인</a></li>
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
        style="background-image: url('../resources/images/korea1.jpg');">
        <div class="overlay"></div>
        <div class="container">
            <div
                class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
                <div
                    class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
                    <div class="text">
                        <p class="breadcrumbs mb-2">
                            <span class="mr-2"><a href="/trans">홈</a></span> <span
                                class="mr-2"><a href="../board/main">여행커뮤니티</a></span>
                        </p>
                        <h1 class="mb-4 bread" style="font-family: 맑은 고딕; font-size: 400%">여행
                            정보</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <br />
    <ul>
        <c:if test="${empty signinId}">
            <%-- 로그인되어 있지 않은 경우 --%>
            <li><a href="../user/login" id="btnSignIn" class="btnSignIn"
                style="font-family: 맑은 고딕; font-size: 200%">로그인</a></li>
        </c:if>
        <c:if test="${not empty signinId}">
            <%-- 로그인되어 있는 경우 --%>
            <li>${signinId}님.<a href="../user/logout">로그아웃</a>
            </li>
        </c:if>

    </ul>

    <div class="col-lg-2 sidebar">
        <div class="sidebar-box">
            <input id="keyword" name="keyword" value="${tour.keyword}" type="text" class="form-control"
                placeholder="검색어 입력" />
        </div>
        <div class="sidebar-box ftco-animate">
            <div class="categories">
                <h3 style="font-family: 맑은 고딕">카테고리</h3>
                <ul>
                    <li><a href="search?pageNo=1&keyword=서울">서울</a></li>
                    <li><a href="search?pageNo=1&keyword=부산">부산 </a></li>
                    <li><a href="search?pageNo=1&keyword=대구">대구</a></li>
                    <li><a href="search?pageNo=1&keyword=제주도">제주도 </a></li>
                    <li><a href="search?pageNo=1&keyword=음식">음식</a></li>
                    <li><a href="search?pageNo=1&keyword=숙박">숙박</a></li>
                </ul>
            </div>
        </div>

    </div>

    <div class="container pt-4">
        <div class="row d-flex">

            <c:forEach var="tour" items="${tourList}">
                <div class="col-md-3 d-flex ftco-animate">
                    <div class="blog-entry align-self-stretch">
                        <a class="block-20"
                            style="background-image: url('${tour.galWebImageUrl}');"> </a>
                        <div class="text mt-3 d-block">
                            <h3 class="heading mt-3">
                                <a style="font-family: 맑은 고딕">${tour.galTitle}</a>
                            </h3>
                            <div class="meta mb-3">

                                <div>
                                    <a >${tour.galPhotographyMonth}</a>
                                </div>
                                <div>
                                    <a >${tour.galSearchKeyword}</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="row mt-5">
            <div class="col text-center">
                <div class="block-27">
                    <ul>

                        <li><a href="all?pageNo=${tour.pageNo -1}">&lt;이전</a></li>

                        <li><a href="all?pageNo=${tour.pageNo + 1}">다음&gt;</a></li>

                    </ul>


                </div>
            </div>
        </div>


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

    <script>
        $(document).ready(function() {
            $("#keyword").keydown(function(key) {
                if (key.keyCode == 13) {
                    var keyword = $('#keyword').val();
                    console.log(keyword);
                    var pageNo = ${tour.pageNo};
                    pageNo = 1;
                    if (keyword === '') {
                        alert("검색할 키워드를 입력해주세요.");
                        $('#keyword').focus();
                        return;
                    }
                    alert(keyword + ' 검색합니다.');
                    location.href = "search?pageNo=" + pageNo +
                            "&keyword=" + keyword;
                }
            });
        });
    </script>
    
    <script type="text/javascript">
    $(document).ready(function () {
        $('.btnSignIn').click(function (event) {
            // 로그인 버튼(링크)를 클릭했을 때 페이지가 이동되는 기본 동작을 막음.
            event.preventDefault();
            location = encodeURI('/trans/user/login?target=' + location.href);
        }); // end $(#btnSignIn).click
    }); // end $(document).ready
    </script>
    
</body>
</html>