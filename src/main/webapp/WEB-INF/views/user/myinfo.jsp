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
      
</body>
</html>