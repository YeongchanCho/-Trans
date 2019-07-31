<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TRANS - 회원가입</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
	<body>
	   <h1>회원가입 페이지</h1>
	   <form action="join" method="post">
	       <label>아    이    디</label>
	       <input type="text" id="userid" name="userid" placeholder="아이디 입력" required/>
	       <input type="button" id="btn" value="아이디 중복 체크" /><br>
	       <div id="result"></div>
            <div id="result2"></div><br>
	       <br/>
	       <label>비  밀  번  호</label>
           <input type="password" id =pw1 name="pwd" placeholder="비밀번호 입력" required/>
           
           <br/>
	       <label>비밀번호 확인</label>
           <input type="password" id=pw2 name="pwdCheck" placeholder="비밀번호 다시 입력" required/>
           <br/>
	       <label>거  주  지  역</label>
           <input type="text" name="city" placeholder="거주지 입력" required/><br/>
	       <label>전  화  번  호</label>
           <input type="text" name="phone" placeholder="전화번호 입력" required/><br/>
	       <label>이    메    일</label>
           <input type="email" name="email" placeholder="이메일 입력" required/><br/>
	       <label>성           별</label>
           <input type="text" name="gender" placeholder="성별 입력" required/><br/>
	       <input type="date" name="birth" placeholder="출생년월일 입력" required/><br/>
	       <input type="submit" value="회원가입"/>
	   </form>
	   <script>
	   $(function(){
		 //비밀번호 확인
		     $('#pw2').blur(function(){
		        if($('#pw1').val() != $('#pw2').val()){
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
                       } else {
                           $('#result2').html('<em>사용할 수 있는 아이디</em>');
                       }
                   }
               });  
               
           }); // end click()
           
       }); // end ready()



        	
	   </script>
		
	</body>
</html>