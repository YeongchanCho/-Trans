<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 정보 수정 페이지</h1>
<form action="myinfoupdate" method="post">
        <div>
            <label for="userid">아이디</label>
            <input type="text" id="userid" name="userid"
                value="${user.userid}" readonly="readonly"" />
        </div>
        <div>
            <label for="pwd">비밀번호</label>
            <input type="text" id="pwd" name="pwd"
                value="${user.pwd}" required="required" />
        </div>
    
        <div>
            <label for="city">도시</label>
            <input type="text" id="city" name="city"
                value="${user.city}" required="required" />
        </div>
         <div>
            <label for="phone">전화 번호</label>
            <input type="text" id="phone" name="phone"
                value="${user.phone}" required="required" />
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="email" id="email" name="email"
                value="${user.email}" required="required" />
        </div>
        <div>
            <label for="gender">성별</label>
            <input type="text" id="gender" name ="gender"
                value="${user.gender}" required="required" />
        </div>
        <div>
            <label for="birth">생년월일</label>
            <input type="date" id="birth" name="birth"
                value="${user.birth}" required="required" />
        </div>
        
        <div>
            <input type="submit" value="수정 완료" />
        </div>
    </form>
</body>
</html>