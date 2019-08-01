<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>TRANS - 장거리 교통정보 안내</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">

    <link rel="stylesheet" href="../resources/css/open-iconic-bootstrap.min.css">
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

    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
          <a class="navbar-brand" href="../">TRANS</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
          </button>

          <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a href="../" class="nav-link">홈</a></li>
                    <li class="nav-item"><a href="rooms.html" class="nav-link">교통
                            경로찾기</a></li>
                    <li class="nav-item"><a href="restaurant.html"
                        class="nav-link">여행지 정보</a></li>
                    <li class="nav-item active"><a href="main" class="nav-link">여행커뮤니티</a></li>
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

    <div class="hero-wrap" style="background-image: url('../resources/images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
            <div class="text">
                <p class="breadcrumbs mb-2"><span class="mr-2"><a href="../">홈</a></span> 
                    <span class="mr-2"><a href="main">여행커뮤니티</a></span>
                <h1 class="mb-4 bread" style="font-family: 맑은 고딕; font-size: 400%">글 상세보기</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
  
     <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate order-md-last">
          <ul>
            <li>
                <a href="update?bno=${board.bno}">수정하기</a>
            </li>
        </ul>
          
            <h2 class="mb-3" style="font-family: 맑은 고딕">#${board.bno}. ${board.title}</h2>
            <textarea rows="5" id="content" 
                    name="content" class="form-control" readonly>${board.content}</textarea>
             <br/>
            <p>
              <img src="http://tong.visitkorea.or.kr/cms2/website/55/2613555.jpg" alt="" class="img-fluid">
            </p>
            
          
            <p id="userid" name="userid">
                                 작성자: ${board.userid}</p>
             
             <fmt:formatDate value="${board.reg_date}"
                    pattern="yyyy-MM-dd HH:mm" var="reg_date"/>                    
             <p id="reg_date" name="reg_date">
                                 작성 시간: ${reg_date}</p>
           
            <div class="tag-widget post-tag-container mb-5 mt-5">
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">Life</a>
                <a href="#" class="tag-cloud-link">Sport</a>
                <a href="#" class="tag-cloud-link">Tech</a>
                <a href="#" class="tag-cloud-link">Travel</a>
              </div>
            </div>
            
            <div class="pt-5 mt-5">
              <h3 class="mb-5" style="font-family: 맑은 고딕;">댓글 ${board.reply_cnt}개 </h3>
             
            <!--  
              <ul class="reply-item-list" id="replies">
                
                
              </ul>
            -->
        
         
            <div class="reply-item-list" id="replies">
            </div><!-- 댓글 리스트 -->
              <!-- END reply-item-list -->
  
  
             
              <div class="reply-item-form-wrap pt-5">
                <h3 class="mb-5" style="font-family: 맑은 고딕">댓글 달기</h3>
                <form class="p-5 bg-light">
                  <div class="form-group">
                    <label for="rtext">내용 *</label>
                    <input type="text" class="form-control"  name="rtext" id="rtext2" placeholder="댓글 입력">
                  </div>
                  <div class="form-group">
                    <label for="userid">아이디 *</label>
                    <input type="email" class="form-control" name="userid" id="replier2" readonly value="${signinId}">
                  </div>
                  
                  <div class="form-group">
                    <button id="btnCreateReply" class="btn py-3 px-4 btn-primary">댓글 작성 완료</button>
                  </div>

                </form>
                        

              </div>
            </div>

          </div> <!-- .col-md-8 -->
          
      <script>
      $(document).ready(function () {
        // input[id='bno']에 있는 글번호(bno)를 읽음
        //var bno = $('#bno').val();
        var bno = ${board.bno};
        
        // 서버에서 해당 게시글 번호(bno)에 달린 모든 댓글 목록을 읽어오는 Ajax 함수 정의
        function getAllReplies() {
            $.getJSON('/trans/reply/all/' + bno, function (data) {
                //console.log(data);
                // div[id="replies"] 안에 있는 모든 하위 요소들을 삭제
                $('#replies').empty();
                var list = ''; // div의 하위 요소가 될 HTML 코드들
                
                // 자바스크립트 배열 data의 원소 갯수만큼 콜백 함수의 내용을 반복
                $(data).each(function () {
                    // 콜백 함수 내부에서 this: 배열 data의 원소
                    var date = new Date(this.regdate);
                    var dateString = date.toLocaleDateString() 
                            + ' ' + date.toLocaleTimeString();
                    list += '<div class="comment-form-wrap pt-5 p-5"><div class="reply-item">'
                        + '<input style="display:none" type="text" id="rno" value="'
                        + this.rno
                        + '" readonly />'
                        + '<label for="rtext">내용</label><input type="text" class="form-control" id="rtext" value="'
                        + this.rtext
                        + '" />'
                        + '<label for="replier">작성자</label><p id="replier">'
                        + this.userid
                        + '</p>'
                        + '<button class="btnModify btn px-3 btn-primary">수정</button>'
                        + '<button class="btnDelete btn px-3 btn-primary">삭제</button>'
                        + '</div></div>';
                
                }); // end $.each();
                
                $('#replies').html(list);
            }); // end $.getJSON()
        } // end getAllReplies()
        
        getAllReplies(); // 함수 호출
        
        // 버튼에 이벤트 핸들러 등록
        $('#btnCreateReply').click(function (event) {
        	event.preventDefault();
        	
            // 댓글 내용(input[id="rtext2"]의 value)을 읽음
            var rtext = $('#rtext2').val();
            if (rtext === '') { // 입력된 댓글 내용이 없을 때
                alert('댓글 내용은 반드시 입력해야 합니다.');
                $('#rtext2').focus(); // input에 포커스를 줌
                return; // 이벤트 핸들러 종료
            }
            
            var replier = $('#replier2').val();
            if (replier === '') {
                alert('댓글 작성자 아이디는 반드시 입력해야 합니다.');
                $('#replier2').focus();
                return;
            }
            
            $.ajax({
                url: '/trans/reply',
                type: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-HTTP-Method-Override': 'POST' 
                },
                // JSON.stringify({}): JavaScript 객체를 JSON 형식의 문자열로 변환
                data: JSON.stringify({
                    'bno': bno,
                    'rtext': rtext,
                    'userid': replier
                }),
                success: function (result) {
                    console.log(result);
                    getAllReplies();
                }
            }); // end $.ajax()
            
        }); // end $('#btnCreateReply').click()
        
        $('#replies').on('click', '.reply-item .btnModify', function () {
            // 수정 버튼이 포함된 div 요소에 있는 rno와 rtext를 찾아서 ajax 요청을 보냄
            // $(this): 수정 버튼
            // prevAll(): 같은 부모 요소 밑에 있는 HTML 요소들 중에서 자신보다 먼저 나오는 모든 요소
            var rno = $(this).prevAll('#rno').val();
            var rtext = $(this).prevAll('#rtext').val();
            
            $.ajax({
                url: '/trans/reply/'+ rno,
                type: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                    'X-HTTP-Method-Override': 'PUT'
                },
                data: JSON.stringify({ 'rtext': rtext }),
                success: function (data) {
                    console.log(data);
                    if (data === 's') {
                        alert('댓글 수정 성공');
                        getAllReplies();
                    }
                }
            }); // end $.ajax()
            
        }); // end $('#replies').on()
        
        $('#replies').on('click', '.reply-item .btnDelete', function () {
            var rno = $(this).prevAll('#rno').val();
            var result = confirm(rno + '번 댓글을 정말 삭제할까요?');
            if (result) {
                $.ajax({
                    url: '/trans/reply/' + rno,
                    type: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-HTTP-Method-Override': 'DELETE'
                    },
                    success: function (data) {
                        if (data === 1) {
                            alert('댓글 삭제 성공');
                            getAllReplies();
                        }
                    }
                }); // end $.ajax();
            } // end if
        }); // end $('#replies').on()
        
    }); // end $(document).ready()
    </script>
  
          
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <span class="icon fa fa-search"></span>
                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>카테고리</h3>
                <ul>
                   <li><a href="#">Properties <span>(12)</span></a></li>
                   <li><a href="#">Home <span>(22)</span></a></li>
                   <li><a href="#">House <span>(37)</span></a></li>
                   <li><a href="#">Villa <span>(42)</span></a></li>
                   <li><a href="#">Apartment <span>(14)</span></a></li>
                   <li><a href="#">Condominium <span>(140)</span></a></li>
                </ul>
              </div>
            </div>

      
        </div>
      </div>
      </div>
    </section> <!-- .section -->
 
   
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
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../resources/js/google-map.js"></script>
  <script src="../resources/js/main.js"></script>
    
</body>
</html>