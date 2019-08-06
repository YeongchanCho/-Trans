
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                    <li class="nav-item"><a href="../tour?pageNo=1"
                        class="nav-link">여행지 정보</a></li>
                    <li class="nav-item"><a href="../board/main" class="nav-link">여행커뮤니티</a></li>
                    <li class="nav-item"><a href="about.html" class="nav-link">예약</a></li>
                    <li class="nav-item active"><a href="" class="nav-link">로그인</a></li>
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
                        <h1 class="mb-4 bread" style="font-family: 맑은 고딕; font-size: 400%">회원가입</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section">
        <div class="container">
            <div class="comment-form-wrap pt-5">
                <form action="join" method="post" class="p-5 bg-light">
                    <div class="form-group">
                        <label for="userid">아이디 *</label> <input type="text" id="userid"
                            class="form-control" name="userid" placeholder="아이디 입력" required />
                            <input type="button" id="btn" value="아이디 중복 체크" /><br>
                              <div id="result"></div>
                              <div id="result2"></div><br>
                            <br />
                    </div>
                    <div class="form-group">
                        <label for="pwd">비밀번호 *</label> <input type="password" id="pwd"
                            name="pwd" class="form-control" placeholder="비밀번호 입력" required /><br />
                    </div>
                    <div class="form-group">
                        <label for="pwdCheck">비밀번호 확인</label> <input type="password"
                            id="pw2" name="pwdCheck" class="form-control" placeholder="비밀번호 다시 입력"
                            required /><br />
                    </div>
                    <div class="form-group">
                        <label for="city">거주 지역 </label> <input type="text" name="city"
                            class="form-control" placeholder="거주지 입력" required /><br />
                    </div>
                    <div class="form-group">
                        <label for="phone">전화번호 *</label> <input type="text" id="phone"
                            name="phone" class="form-control" placeholder="전화번호 입력" required /><br />
                    </div>
                    <div class="form-group">
                        <label for="email">이메일 *</label> <input type="email" id="eamil"
                            name="email" class="form-control" placeholder="이메일 입력" required />
                    </div>



                    <div class="form-group align-self-stretch d-flex align-items-end">

						<label for="gender">성별 * </label>
						<div class="form-field">
							<div class="select-wrap">
								<div class="icon">
									<span class="ion-ios-arrow-down"></span>
								</div>
								<select name="gender" id="gender" class="form-control">
									<option value="남">남</option>
									<option value="여">여</option>
								</select>
							</div>
						</div>


                    </div>

                    <div class="form-group">
                        <label for="birth">생년월일 *</label> <input type="date" name="birth"
                            id="birth" class="form-control" placeholder="출생년월일 입력" required /><br />
                    </div>
                    <div class="form-group">
                        <input type="submit" value="회원가입"
                            class="btn py-3 px-4 btn-primary" />
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

<div class="family">
        <a href="javascript:void(0);" class="flink"><img src="/newweb/kr/images/main/family.gif" alt="패밀리사이트 바로가기" /></a>
        <div class="flist">
            <ul>
                <li><a href="http://www.mltm.go.kr" target="_blank" title="새창이동">국토교통부</a></li>
                <li><a href="http://www.visitkorea.co.kr" target="_blank" title="새창이동">한국관광공사</a></li>
                <li><a href="http://www.bus.or.kr" target="_blank" title="새창이동">전국버스운송사업조합연합회</a></li>
                <li><a href="http://www.sbus.or.kr" target="_blank" title="새창이동">서울특별시버스운송사업조합</a></li>
                <li><a href="http://www.incheonbus.or.kr" target="_blank" title="새창이동">인천광역시버스운송사업조합</a></li>
                <li><a href="http://www.daejeonbus.or.kr" target="_blank" title="새창이동">대전광역시버스운송사업조합</a></li>
                <li><a href="http://www.ulsanbus.or.kr" target="_blank" title="새창이동">울산광역시버스운송사업조합</a></li>
                <li><a href="http://www.gbus.or.kr" target="_blank" title="새창이동">경기도버스운송사업조합</a></li>
                <li><a href="http://www.busta.or.kr" target="_blank" title="새창이동">전라북도버스운송사업조합</a></li>
            </ul>
        </div>
    </div>
      <script>
       $(function(){
         //비밀번호 확인
             $('#pw2').blur(function(){
                if($('#pwd').val() != $('#pw2').val()){
                     if($('#pw2').val()!=''){
                     alert("비밀번호가 일치하지 않습니다.");
                         $('#pw2').val('');
                       $('#pw2').focus();
                    }
                 }
             });         
         });
       $(document).ready(function () {
    
           $('#btn').click(function () {
              
               var query = {userid : $("#userid").val()};
               $.ajax({
                   url: '/trans/user/checkid',
                   type: 'post',
                   data: query,
                   success: function (data) {
                       
                       if (data === 1) {
                           $('#result2').html('<em>사용할 수 없는 아이디</em>');
                           $('#userid').val('');
                           $('#userid').focus();
                       } else {
                           $('#result2').html('<em>사용할 수 있는 아이디</em>');
                       }
                   }
               });  
               
           }); // end click()
           
       }); // end ready()

       </script>

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

