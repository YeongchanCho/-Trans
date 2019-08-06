<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>My Informaiton</title>
</head>
<body>
  <h1>내정보 페이지</h1>
    <ul>
       
        <li><a href="myinfoupdate?userid=${user.userid}">회원 정보 수정</a></li>
       <div><a id="menudelete" href="delete?userid=${user.userid}">회원 탈퇴</a></li></button></form>
      
    </ul>
      <form>
        <div>
            <label for="userid">아이디</label>
            <input type="text" id="userid" name="userid"
                value="${user.userid}" readonly />
        </div>
        <div>
            <label for="pwd">비밀번호</label>
            <input type="text" id="pwd" name="pwd"
                value="${user.pwd}" readonly />
        </div>
     
        <div>
            <label for="city">도시</label>
            <input type="text" id="city" name="city"
                value="${user.city}" readonly />
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="email" id="email" name="email"
                value="${user.email}" readonly />
        </div>
        <div>
            <label for="gender">성별</label>
            <input type="text" id="gender" name="gender"
                value="${user.gender}" readonly />
        </div>
        
        <div>
            <label for="grade">생년월일</label>
            <input type="text" id="birth" name="birth"
                value="${user.birth}" readonly />
        </div>
    </form>
    
    <hr/>
    <div id ="selectBoarduserid">
    
    </div>
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
        function getAllReplies() {
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
                    list += '<div class="reply-item">'
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
                            
                            + '</div>';
                }); // end $.each();
                
                $('#selectBoarduserid').html(list);
            }); // end $.getJSON()
        } // end getAllReplies()
        getAllReplies();
   
        
    }); // end $(document).ready()
    </script>
</body>
</html>