<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <style type="text/css">
        @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
        .jg{font-family: 'Jeju Gothic', sans-serif; color: #1E90FF}
        #loadingModal{
            position: absolute;
            top: 30%;
        }
        </style>
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
                        <li class="nav-item"><a href="tour/all?pageNo=1"
                            class="nav-link" style="font-size: 20px">여행지 정보</a></li>
                        <li class="nav-item"><a href="board/main" class="nav-link"
                            style="font-size: 20px">여행커뮤니티</a></li>
                        <li class="nav-item"><a href="user/myinfo?userid=${signinId}" class="nav-link"
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
                style="background-image: url(resources/images/korea2.jpg);">
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
                style="background-image: url(resources/images/korea1.jpg);">
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
                                                class="form-control checkin_date" placeholder="출발일 선택" >
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
                                <li><a href="board/main" class="py-2 d-block">여행커뮤니티</a></li>
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
                                <li><a href="user/myinfo?userid=${signinId}" class="py-2 d-block">내정보</a></li>
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
        <!-- The Modal(loading) -->
        <div id="loadingModal" class="modal">
            <div class="modal-dialog modal-ms">
            <div class="modal-content">
                    <div class="panel-body" style="text-align: center;">
                          <h2 class="jg">데이터 로딩중 ...</h2>
                          <div class="spinner-grow text-muted"></div>
                          <div class="spinner-grow text-primary"></div>
                          <div class="spinner-grow text-success"></div>
                          <div class="spinner-grow text-info"></div>
                          <div class="spinner-grow text-warning"></div>
                          <div class="spinner-grow text-danger"></div>
                          <div class="spinner-grow text-secondary"></div>
                          <div class="spinner-grow text-dark"></div>
                          <div class="spinner-grow text-light"></div>
                    </div>
            </div>
            </div>
        </div>

            <!-- loader -->
            <%-- <div id="ftco-loader" class="show fullscreen">
                <svg class="circular" width="48px" height="48px">
                    <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
                        stroke-width="4" stroke="#eeeeee" />
                    <circle class="path" cx="24" cy="24" r="22" fill="none"
                        stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
            </div> --%>
        
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
    <!-- The Modal 1st -->
    <div id="trans_f" class="modal fade">
        <div class="modal-dialog">
            <!-- Modal content -->
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <div>
                        <table class="table table-borderless" id="trans_table">
                            <thead style="font-size: 25px">
                                <tr style="color: #ff8000;">
                                    <th class="dep_city" style="text-align: center;">서울</th>
                                    <th id="" style="text-align: center;">&nbsp;-->&nbsp;</th>
                                    <th class="arr_city" style="text-align: center;">부산</th>
                                </tr>
                            </thead>
                        </table>
                    </div>

                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="panel-body">

                        <table width="100%"
                            class="table table-striped table-bordered table-hover"
                            id="trans_table">
                            <thead class="thead-dark" style="text-align: center;">
                                <tr>
                                    <th>교통편</th>
                                    <th>출발일</th>
                                    <th>도착일</th>
                                    <th>요금</th>
                                </tr>
                            </thead>
                            <tbody style="text-align: center;">
                                <tr class="showDetail table-info" id="expBus-table">
                                    <td id="device">고속버스</td>
                                    <td class="date_dep">date</td>
                                    <td class="date_arr">date</td>
                                    <td id="e_charge">N/A</td>
                                </tr>
                                <tr class="showDetail table-warning" id="train-table">
                                    <td id="device">열차</td>
                                    <td class="date_dep">date</td>
                                    <td class="date_arr">date</td>
                                    <td id="t_charge">N/A</td>
                                </tr>
                                <tr class="showDetail table-danger" id="airplane-table">
                                    <td id="device">항공편</td>
                                    <td class="date_dep">date</td>
                                    <td class="date_arr">date</td>
                                    <td id="a_charge">N/A</td>
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

    <!-- The Modal 2nd -->
    <div id="trans_s" class="modal fade">
        <div class="modal-dialog modal-lg">
            <!-- Modal content -->
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="text-align: center; font-size: 170%; color: red;">
                        <label># 교통편 상세 검색</label>
                    </div>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="table table-borderless" id="trans_table"
                            style="display: inline-block;">
                            <thead style="font-size: 25px">
                                <tr style="color: #ff8000;">
                                    <th id="" style="text-align: center;">경로 :</th>
                                    <th class="dep_city" style="text-align: center;">서울</th>
                                    <th id="" style="text-align: center;">&nbsp;-->&nbsp;</th>
                                    <th class="arr_city" style="text-align: center;">부산</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="panel-body">


                    <form>
                        <div class="form-row align-items-center">
                            <div class="col-auto">
                                <label class="my-1 mr-2" for="inlineFormCustomSelectPref">출발 터미널</label>  
                                <select name="" id="depTerminal" class="depTerminalList">

                                </select>
                            </div>
                            <div class="col-auto">
                                <label class="my-1 mr-2" for="inlineFormCustomSelectPref">도착 터미널</label> 
                                <select name="" id="arrTerminal" class="arrTerminalList">

                                </select>
                            </div>
                            <div class="col-auto">
                                <button type="button" class="btn btn-primary mb-2"  id="search-path">검  색</button>
                            </div>
                        </div>
                    </form>
                    <!-- <form>
                                <label class="my-1 mr-2" style="font-size: 140%; color: blue;">*** 이용 가능 노선 ***</label> 
                        <div class="form-row align-items-center">
                            <div class="col-auto">
                                <label class="my-1 mr-2" id="d_Path" style="font-size: 120%; color: blue;">N/A</label> 
                            </div>
                        </div>
                    </form> -->

                        
                        <table width="100%"
                            class="table table-dark table-striped table-hover">
                            <thead style="text-align: center;">
                                <tr>
                                    <th>출발시간</th>
                                    <th>도착시간</th>
                                    <th>요금</th>
                                    <th id="air_grade">등급</th>
                                </tr>
                            </thead>
                            <tbody style="text-align: center;" class="transDetail_table">

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
        function trimCityNm(city) {
            city = city.substring(0, city.length - 1);
            city = city.replace('특별', '');
            city = city.replace('광역', '');
            return city;
        };
        var HashSet = function () {

            this.set = [];

            this.add = function (obj) {
                if (!this.contains(obj)) {
                    this.set.push(obj);
                }
            };

            this.remove = function (obj) {
                this.set = jQuery.grep(this.set, function (value) {
                    return value !== obj;
                });
            };

            this.clear = function () {
                this.set = [];
            };

            this.contains = function (obj) {
                return $.inArray(obj, this.set) > -1;
            };

            this.isEmpty = function () {
                return this.set.length === 0;
            };
        };
    </script>
    <script>
        $(document).ready(function() {
            url = '/trans/transCities';
            $.get(url, function(data) {
                var strs = '<option value="';
                var strm = '">';
                var stre = '</option>';
                var str = '';
                $.each(data, function(i) {
                    $.each(data[i], function(key, value) {
                        if (i === 0) {
                            /* console.log(key + ' / ' + value); */
                            str += strs + key
                                    + strm
                                    + value
                                    + stre;
                        };
                        if (i != 0) {
                            /* console.log(key + ' / ' + value); */
                            str += strs + value
                                    + strm
                                    + key
                                    + stre;
                        };
                    });
                });
                $('.form-control').append(str);
            });
        });

        var responseData;
        $(document).ready(function() {
            $("#trans").click(function() {
                $('#loadingModal').show();
                responseData = null;
                var checkin_date = $(".checkin_date").val().replace(/-/gi, '');
                var checkout_date = $(".checkout_date").val().replace(/-/gi, '');
                var dep_city = $('#departure option:selected').text();
                var dep_cityCode = $('#departure option:selected').val();
                var arr_city = $('#arrived option:selected').text();
                var arr_cityCode = $('#arrived option:selected').val();
                var req = {
                    'dep_date' : checkin_date,
                    'arr_date' : checkout_date,
                    'depcity' : dep_city,
                    'arrcity' : arr_city,
                    'depcitycode' : dep_cityCode,
                    'arrcitycode' : arr_cityCode,
                };
                var redirectURL = '/board/main'
                $('.dep_city').html(dep_city);
                $('.arr_city').html(arr_city);
                $('.date_dep').html($(".checkin_date").val());
                $('.date_arr').html($(".checkout_date").val());
                url = '/trans/transDetail';
                
                $.get(url, req, function(data) {
                    responseData = data;
                    var strs = '<option value="';
                    var strm = '">';
                    var stre = '</option>';
                    var str1 = '';
                    var str2 = '';
    
                    var exit = false;
                    for (i in data) {
                        for (j in data[i]) {
                            if (data[i][j]['price'] !== null && data[i][j]['infoService'] === 'bus') {
                                //console.log('BUS: (' + i + ' : ' + j + ')' + data[i][j]['price']);
                                $('#e_charge').html(data[i][j]['price'].replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1,') + '원');
                                /* exit = true;
                                break; */
                            }
                            if (data[i][j]['price'] !== null && data[i][j]['infoService'] === 'train') {
                                //console.log('TRAIN: (' + i + ' : ' + j + ')' + data[i][j]['price']);
                                $('#t_charge').html(data[i][j]['price'].replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '원');
                                /* exit = true;
                                break; */
                            }
                            if (data[i][j]['price'] !== null && data[i][j]['infoService'] === 'air') {
                                /* console.log(data[i][j]['price']); */
                                $('#a_charge').html(data[i][j]['price'].replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '원');
                                /* exit = true;
                                break; */
                            }
                        }
                            /* if (exit) {
                              break;
                            } */
                    }
                    $('#loadingModal').hide();
                    $("#trans_f").modal();

                    });
                });

            $(".showDetail").click(function() {
                var strs = '<option value="';
                var strm = '">';
                var stre = '</option>';
                var str1 = '';
                var str2 = '';
                var device = $(this).attr('id');
                var deviceKey = '';
    
                if (device === 'airplane-table') {
                    deviceKey = 'AIRPLANE';
                    $('#air_grade').html('항공사');
                };
                if (device === 'train-table') {
                    deviceKey = 'TRAIN';
                    $('#air_grade').html('열차종류');
                }
                if (device === 'expBus-table') {
                    deviceKey = 'BUS';
                    $('#air_grade').html('버스등급');
                }
                var str1 = '';
                var str2 = '';
                $('.depTerminalList').html(str1);
                $('.arrTerminalList').html(str2);
                var dcity = $('#departure option:selected').text();
                dcity = trimCityNm(dcity);
                var acity = $('#arrived option:selected').text();
                acity = trimCityNm(acity);
                for (i in responseData) { /* 교통편 상세보기 출발지&도착지 터미널 리스트 */
                    for (j in responseData[i]) {
                        if (responseData[i][j]['oper'] !== null && responseData[i][j]['infoService'] === deviceKey) {
                            var ct = decodeURIComponent(responseData[i][j]['oper']);
                            if (deviceKey === 'AIRPLANE') {
                                dcity = responseData[i][j]['depCity'];
                                acity = responseData[i][j]['arrCity'];
                            }
                            if (ct === dcity) {
                                str1 += strs + 
                                        responseData[i][j]['terminalId'] + 
                                        strm + 
                                        responseData[i][j]['terminalNm'] + stre;
                            }
                            if (ct === acity) {
                                str2 += strs + 
                                        responseData[i][j]['terminalId'] + 
                                        strm + 
                                        responseData[i][j]['terminalNm'] + stre;
                            }
                        }
                    }
                }
                $('.depTerminalList').html(str1);
                $('.arrTerminalList').html(str2);

                var schedule = '';
                var dset = new HashSet();
                var aset = new HashSet();
                var pathDetail = '';
                var allPath = '';
                var dt = '';
                var at = '';
                var sdt = '';
                var sat = '';
                var numD = $('#depTerminal option').length;
                var numA = $('#arrTerminal option').length;
                for (var i = 0; i < numD; i++) {
                    $('#depTerminal option').eq(i).prop('selected', true);
                    var depT = $('#depTerminal option:selected').text();
                    //console.log(depT);
                    for (var j = 0; j < numA; j++) {
                        $('#arrTerminal option').eq(j).prop('selected', true);
                        var arrT = $('#arrTerminal option:selected').text();
                        //console.log(arrT);
                        for (n in responseData) {
                            pathDetail = '';
                            for (m in responseData[n]) {
                                dt = responseData[n][m]['depCity'];
                                at = responseData[n][m]['arrCity'];
                                if (dt == depT && at == arrT) {
                                console.log('dt = ' + dt);
                                console.log('at = ' + at);
                                    sdt = dt;
                                    sat = at;
                                    
                                    dTime = responseData[n][m]['depPlandTime'];
                                    dTime = dTime.substring(8, dTime.length);
                                    dTime = dTime.substring(0, 2) +  ':' + dTime.substring(2, 4);
                                    aTime = responseData[n][m]['arrPlandTime'];
                                    aTime = aTime.substring(8, aTime.length);
                                    aTime = aTime.substring(0, 2) + ':' + aTime.substring(2, 4);
                                    
                                    if (responseData[n][m]['price'] === null) {
                                        responseData[n][m]['price'] = '***';
                                        //break;
                                    }
                                    
                                    price = responseData[n][m]['price'].replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '원';
                                    gradeNm = responseData[n][m]['gradeNm'];
                                    pathDetail += '<tr><td>' + dTime + '</td>' + 
                                                  '<td>' + aTime + '</td>' + 
                                                  '<td>' + price + '</td>' + 
                                                  '<td>' + gradeNm + '</td></tr>';
                                    schedule = pathDetail;
                                    //console.log('pathDetail = ' + pathDetail);
                                }

                            };
                        };
                    };
                };

                if (schedule == '' || schedule == null) {
                    window.alert('해당 경로가 없습니다!!!');
                    return;
                } else {
                    $('#depTerminal option').each(function() {
                        console.log($(this).text());
                    if($(this).text() == sdt)
                        $(this).prop('selected', true);
                    });                             
                $('#arrTerminal option').each(function() {
                        console.log($(this).text());
                    if($(this).text() == sat)
                        $(this).prop('selected', true);
                    });
                }
                $('#d_Path').html(allPath);
                $('.transDetail_table').html(schedule);
                $("#trans_s").modal();
            });

            $('#search-path').click(function() {
                var depT = $('#depTerminal option:selected').text();
                var arrT = $('#arrTerminal option:selected').text();
                var pathDetail = '';
                var torf = false;
                    for (i in responseData) {
                        for (j in responseData[i]) {
                            var dt = responseData[i][j]['depCity'];
                            var at = responseData[i][j]['arrCity'];
                            if (responseData[i][j]['oper'] == null) {
                                if (dt === depT) {
                                    if (at === arrT) {
                                        dTime = responseData[i][j]['depPlandTime'];
                                        dTime = dTime.substring(8, dTime.length);
                                        dTime = dTime.substring(0, 2) + ':' + dTime.substring(2, 4);
                                        aTime = responseData[i][j]['arrPlandTime'];
                                        aTime = aTime.substring(8, aTime.length);
                                        aTime = aTime.substring(0, 2) + ':' + aTime.substring(2, 4);
                                        price = responseData[i][j]['price'].replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '원';
                                        gradeNm = responseData[i][j]['gradeNm'];
                                        pathDetail += '<tr><td>' + dTime + '</td>' + 
                                                      '<td>' + aTime + '</td>' + 
                                                      '<td>' + price + '</td>' + 
                                                      '<td>' + gradeNm + '</td></tr>';

                                        /* $('#depTerminal option').each(function() {
                                            if ($(this).text() == 'dt') 
                                                $(this).prop('selected', true);
                                        });
                                        $('#depTerminal option').each(function() {
                                            if ($(this).text() == 'at') 
                                                $(this).prop('selected', true);
                                        }); */
                                    }
                                }
                            }
                        } // end for j
                    } // end for i
                    if (pathDetail == '') {
                        $('.transDetail_table').html(pathDetail);
                        alert('해당 경로가 없습니다!!!');
                        return;
                    }
                    $('.transDetail_table').html(
                            pathDetail);
                });
    });
      </script>
    </body>
</html>