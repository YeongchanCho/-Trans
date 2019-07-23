<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TRANS - 회원가입</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
	<body>
	   <h1>회원가입 페이지</h1>
	   <form action="login" method="post">
	       <label>아    이    디</label>
	       <input type="text" name="userId" placeholder="아이디 입력" required/><br/>
	       <label>비  밀  번  호</label>
           <input type="password" name="pwd" placeholder="비밀번호 입력" required/><br/>
	       <label>비밀번호 확인</label>
           <input type="password" name="pwdCheck" placeholder="비밀번호 다시 입력" required/><br/>
	       <label>거  주  지  역</label>
           <input type="text" name="city" placeholder="거주지 입력" required/><br/>
	       <label>전  화  번  호</label>
           <input type="text" name="phone" placeholder="전화번호 입력" required/><br/>
	       <label>이    메    일</label>
           <input type="email" name="email" placeholder="이메일 입력" required/><br/>
	       <label>성           별</label>
           <input type="text" name="gender" placeholder="성별 입력" required/><br/>
	       <label>출 생 연 월 일</label>
           <input type="date" name="birth" placeholder="출생년월일 입력" required/><br/>
	       <input type="submit" value="회원가입"/>
	   </form>
		
	</body>
</html>