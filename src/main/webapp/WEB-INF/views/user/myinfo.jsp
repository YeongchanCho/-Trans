<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
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

<meta charset="UTF-8">
<title>My Informaiton</title>
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
                    <li class="nav-item"><a href="rooms.html" class="nav-link" style="font-size: 20px">교통
                            경로찾기</a></li>
                    <li class="nav-item"><a href="/trans/tour/all?pageNo=1" class="nav-link" style="font-size: 20px">여행지
                            정보</a></li>
                    <li class="nav-item"><a href="../board/main" class="nav-link" style="font-size: 20px">여행커뮤니티</a></li>
                    <li class="nav-item active"><a href="../user/myinfo?userid=${signinId}" class="nav-link" style="font-size: 20px">내정보</a></li>
            
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
                        <h1 class="mb-4 bread" style="font-family: 맑은 고딕; font-size: 400%">내정보</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
    <div class="col-lg-4 sidebar">
       
        <div class="sidebar-box">
            <div class="categories">
                <h3 style="font-family: 맑은 고딕">내정보 상세보기</h3>
                <ul>
                    <li>
	                    <label for="userid">아이디</label><br/>
	                    <input type="text" id="userid" name="userid"
	                value="${user.userid}" readonly />
                </li>
                    <li>
                        <label for="pwd">비밀번호</label><br/>
                        <input type="text" id="pwd" name="pwd"
                value="${user.pwd}" readonly />
                    </li>
                    <li>
                        <label for="city">도시</label><br/>
                        <input type="text" id="city" name="city"
                value="${user.city}" readonly />
                    </li>
                    <li>
                        <label for="email">이메일</label><br/>
                        <input type="email" id="email" name="email"
                value="${user.email}" readonly />
                    </li>
                    <li>
                        <label for="gender">성별</label><br/>
                        <input type="text" id="gender" name="gender"
                value="${user.gender}" readonly />
                    </li>
                    <li>
                        <label for="grade">생년월일</label><br/>
                        <fmt:formatDate value="${user.birth}"
                    pattern="yyyy-MM-dd" var="birth"/> 
		           <input type="text" id="birth" name="birth"
		                value="${birth}" readonly />
                    </li>
                </ul>
            </div>
        </div>

    </div>
 
 
 
    <hr>
     
    
    <hr>
        <ul>
       
        <li><a href="myinfoupdate?userid=${user.userid}">회원 정보 수정</a></li>
        <li><a id="menudelete" href="delete?userid=${user.userid}">회원 탈퇴</a></li>
     
      
    </ul>
    
    <hr/>
    <h3 style="font-family: 맑은 고딕">내가 쓴 글</h3>
    <div class="container pt-5">
    <div id ="selectBoarduserid">
    
    </div></div>
    
    <br>
    <!--  
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
                       
                        Copyright &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script>
                        All rights reserved | This template is made with <i
                            class="icon-heart color-danger" aria-hidden="true"></i> by <a
                            href="https://colorlib.com" target="_blank">Cho &amp; 3Kim </a>
                       
                    </p>
                </div>
            </div>
        </div>
    </footer> 
    -->



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
    $(document).ready(function () {
        $('#menudelete').click(function (event) {
            event.preventDefault();
            var result = confirm('정말 삭제할까요?');
            if (result) {
                location = $(this).attr("href");
            }
        });
    });
    </script>
    
    <script>
    $(document).ready(function () {
        // input[id='bno']에 있는 글번호(bno)를 읽음
        var userid = $('#userid').val();
        
        // 서버에서 해당 게시글 번호(bno)에 달린 모든 댓글 목록을 읽어오는 Ajax 함수 정의
        function getAllmyBoard() {
            $.getJSON('/trans/selectuserid/boards/' + userid, function (data) {
                //console.log(data);
                // div[id="replies"] 안에 있는 모든 하위 요소들을 삭제
                $('#selectBoarduserid').empty();
                var list = ''; // div의 하위 요소가 될 HTML 코드들
                
                // 자바스크립트 배열 data의 원소 갯수만큼 콜백 함수의 내용을 반복
                $(data).each(function () {
                    // 콜백 함수 내부에서 this: 배열 data의 원소
                    var date = new Date(this.regdate);
                    var dateString = date.toLocaleDateString() 
                            + ' ' + date.toLocaleTimeString();
                    list += '<div class="container pt-2"><div class="row d-flex"><div class="my-board">'
                            +'<a href="/trans/board/detail?bno=' + this.bno + '">'
                            + '<input type="text" id="bno" value="'
                            + this.bno
                            + '" readonly />'    
                            +'</a>'
                            + '<input type="text" id="title" value="'
                            + this.title
                            + '" readonly />'                            
                            + '<input type="text" id="userid" value="'
                            + this.userid
                            + '" readonly />'
                            
                            + '</div></div></div>';
                }); // end $.each();
                
                $('#selectBoarduserid').html(list);
            }); // end $.getJSON()
        } // end getAllmyBoard()
        getAllmyBoard();
   
        
    }); // end $(document).ready()
    
    </script>
    
</body>
</html>