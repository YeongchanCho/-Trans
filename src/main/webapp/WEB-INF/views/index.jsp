<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>TRANS - 장거리 교통정보 안내</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        
        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">
        
        <link rel="stylesheet" href="resources/css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="resources/css/animate.css">
        <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
        <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="resources/css/magnific-popup.css">
        <link rel="stylesheet" href="resources/css/aos.css">
        <link rel="stylesheet" href="resources/css/ionicons.min.css">
        <link rel="stylesheet" href="resources/css/jquery.timepicker.css">
        <link rel="stylesheet" href="resources/css/flaticon.css">
        <link rel="stylesheet" href="resources/css/icomoon.css">
        <link rel="stylesheet" href="resources/css/style.css">

    </head>
    <body>
    
        <nav
            class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
            id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="" style="font-size: 50px">TRANS</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#ftco-nav" aria-controls="ftco-nav"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> 메뉴
                </button>
    
                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="" class="nav-link"
                            style="font-size: 20px">홈</a></li>
                        <li class="nav-item"><a href="transDetail" class="nav-link"
                            style="font-size: 20px">교통 경로찾기</a></li>
                        <li class="nav-item"><a href="tour"
                            class="nav-link" style="font-size: 20px">여행지 정보</a></li>
                        <li class="nav-item"><a href="board/main" class="nav-link"
                            style="font-size: 20px">여행커뮤니티</a></li>
                        <li class="nav-item"><a href="user/myinfo" class="nav-link"
                            style="font-size: 20px">내정보</a></li>
                        <!-- <li class="nav-item "><a onclick="login();" class="nav-link" style="font-size: 20px">로그인</a></li> -->
                        <c:if test="${empty signinId}">
                            <%-- 로그인 정보가 없는 경우(로그인되어 있지 않은 경우) --%>
                            <li class="nav-item"><a onclick="openLogin();"
                                class="nav-link" style="font-size: 20px" id="btnSignIn">로그인</a></li>
                        </c:if>
                        <c:if test="${not empty signinId}">
                            <%-- 로그인 정보가 있는 경우(로그인되어 있는 경우) --%>
                            <li class="nav-link">${signinId}님,환영!<a href="user/logout"
                                class="nav-link">로그아웃</a>
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
                        <!-- <form onclick="search();" class="booking-form"> -->
                        <form class="booking-form">
                            <div class="row">
                                <div class="col-md-3 d-flex">
                                    <div
                                        class="form-group p-4 align-self-stretch d-flex align-items-end">
                                        <div class="wrap">
                                            <label for="#">출발일</label> <input type="text"
                                                class="form-control checkin_date" placeholder="출발일 선택">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 d-flex">
                                    <div
                                        class="form-group p-4 align-self-stretch d-flex align-items-end">
                                        <div class="wrap">
                                            <label for="#">도착일</label> <input type="text"
                                                class="form-control checkout_date"
                                                placeholder="도착일 선택">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md d-flex">
                                    <div
                                        class="form-group p-4 align-self-stretch d-flex align-items-end">
                                        <div class="wrap">
                                            <label for="#" >출발지</label>
                                            <div class="form-field">
                                                <div class="select-wrap">
                                                    <div class="icon">
                                                        <span class="ion-ios-arrow-down"></span>
                                                    </div>
                                                    <div >
                                                    <select name="" id="departure" class="form-control">
                                                        
                                                    </select>
                                                    </div>
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
                                                    <select name="" id="arrived" class="form-control">
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md d-flex" style="text-align:center; vertical-align: middle;">
                                    <div class="form-group d-flex align-self-stretch">
                                        <!-- <input type="button" onclick="showtrans()" value="교통편 찾기" class="btn btn-primary py-3 px-4 align-self-stretch" > -->
                                        <!-- <button type="button" class="btn btn-primary py-3 px-4 align-self-stretch" data-toggle="modal" data-target="#trans_f"> -->
                                        <button type="button" class="btn btn-primary" id="trans">
                                                                                    교통편 찾기
                                        </button>
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
        
        <!-- The Modal -->
        <div id="myModal" class="modal">
            <div class="modal-dialog modal-ms">
            <!-- Modal content -->
            <div class="modal-content">
                <div class="modal-header"> 로그인
                    <button type="button" class="close" onClick="close_pop();">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="panel-body">
                        <form action="user/login" method="post">
                            <label>아이디</label>
                            <input type="text" name="userid" placeholder="아이디 입력" required /> <br />
                            <label>비빌번호</label>
                            <input type="password" name="pwd" placeholder="비밀번호 입력" required />
                            <br /> <input type="submit" value="로그인" /> <a href="user/join">회원가입</a>
                            <br /> <input type="hidden" name="target" value="${ target }" />
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" onClick="close_pop();">Close</button>
                </div>
            </div>
            </div>
        </div>
        <!-- The Modal -->
        <div id="trans_f" class="modal fade">
            <div class="modal-dialog modal-lg">
            <!-- Modal content -->
            <div class="modal-content">
                <!-- Modal Header -->
            <div class="modal-header">
                <div>
                <table class="table table-borderless" id="trans_table">
                      <thead style="font-size: 25px">
                          <tr style="color: #ff8000;">
                              <th id="dep_city" style="text-align: center;">서울</th>
                              <th id="" style="text-align: center;">&nbsp;-->&nbsp;</th>
                              <th id="arr_city" style="text-align: center;">부산</th>
                          </tr>
                      </thead>
                </table>
                </div>
                
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
            <div class="modal-body">
             <div class="panel-body">
                
                  <table width="100%" class="table table-striped table-bordered table-hover" id="trans_table">
                      <thead style="text-align: center;">
                          <tr>
                              <th>교통편</th>
                              <th>출발일</th>
                              <th>도착일</th>
                              <th>요금</th>
                          </tr>
                      </thead>
                      <tbody style="text-align: center;">
                          <tr class="table-info">
                                <td id="device">고속버스</td>
                                <td class="date_dep">date</td>
                                <td class="date_arr">date</td>
                                <td id="e_charge">100원</td>
                            </tr>
                            <tr class="table-warning">
                                <td id="device">KTX</td>
                                <td class="date_dep">date</td>
                                <td class="date_arr">date</td>
                                <td id="a_charge">100원</td>
                            </tr>
                            <tr class="table-danger">
                                <td id="device">비행기</td>
                                <td class="date_dep">date</td>
                                <td class="date_arr">date</td>
                                <td id="a_charge">100원</td>
                            </tr>
                      </tbody>
                  </table>
              </div>
            </div>
            
            <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
        </div>
        <!-- <script src="resources/js/jquery.min.js"></script> -->
        <!-- <script src="resources/js/jquery-migrate-3.0.1.min.js"></script> -->
        <!-- <script src="resources/js/popper.min.js"></script> -->
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/bootstrap-datepicker.js"></script>
        <script src="resources/js/jquery.easing.1.3.js"></script>
        <script src="resources/js/jquery.waypoints.min.js"></script>
        <script src="resources/js/jquery.stellar.min.js"></script>
        <script src="resources/js/owl.carousel.min.js"></script>
        <script src="resources/js/jquery.magnific-popup.min.js"></script>
        <script src="resources/js/aos.js"></script>
        <script src="resources/js/jquery.animateNumber.min.js"></script>
        <!-- <script src="resources/js/jquery.timepicker.min.js"></script> -->
        <script src="resources/js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="resources/js/google-map.js"></script>
        <script src="resources/js/main.js"></script>
        
        <script type="text/javascript">
            function openLogin() {
                $('#myModal').show();
            }
            //팝업 Close 기능
            function close_pop(flag) {
                $('#myModal').hide();
            };
            
        </script>
        <script>
        $(document).ready(function () {
                url = '/trans/transCities';
                $.get(url, function (data) {
                    var strs = '<option value="';
                    var strm = '">';
                    var stre = '</option>';
                    var str = '';
                    $.each(data, function (i) {
                        $.each(data[i], function (key, value) {
                            if (i === 0) {
                                /* console.log(key + ' / ' + value); */
                                str += strs + key + strm + value + stre;
                            };
                            if (i != 0) {
                                /* console.log(key + ' / ' + value); */
                                str += strs + value + strm + key + stre;
                            };
                        });
                    });
                    $('.form-control').append(str);
                });
        });
        $(document).ready(function () {
            $('#reApi').click(function (event) {
                event.preventDefault();
            });
        });
        $(document).ready(function(){
              $("#trans").click(function(){
                  var checkin_date = $(".checkin_date").val().replace(/-/gi, '');
                  var checkout_date = $(".checkout_date").val().replace(/-/gi, '');
                  var dep_city = $('#departure option:selected').text();
                  var dep_cityCode = $('#departure option:selected').val();
                  var arr_city = $('#arrived option:selected').text();
                  var arr_cityCode = $('#arrived option:selected').val();
                  var req = { 'dep_date': checkin_date, 
                          'arr_date': checkout_date, 
                          'depcity': dep_city, 
                          'arrcity': arr_city,
                          'depcitycode': dep_cityCode,
                          'arrcitycode': arr_cityCode,
                          };
                  var redirectURL = '/board/main'
                  
                  $('#dep_city').html(dep_city);
                  $('#arr_city').html(arr_city);
                  $('.date_dep').html($(".checkin_date").val());
                  $('.date_arr').html($(".checkout_date").val());
                  
                  url = '/trans/transDetail';
                  $.get(url, req, function (data) {
                      $("#trans_f").modal();
                      /* window.location.href = '/trans/transDetail'; */
                      /* window.location.href = data.redirectURL; */
                      /* alert(data); */
                  });
              });
            });
      </script>
    </body>
</html>