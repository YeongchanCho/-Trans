<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TRANS - 로그인</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
	<body>
	   <h1>로그인 하기</h1>
	   <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <form action="/trans/user/login" method="post">
                <input type="text" name="userid" placeholder="아이디 입력" required />
                <br />
                <input type="password" name="pwd" placeholder="비밀번호 입력" required />
                <br />
                <input type="submit" value="로그인" />
                <a href="join">회원가입</a>
                <br />
                <input type="hidden" name="target" value="${ target }" />
            </form>
            <div
                style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
                onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;">닫기</span>
            </div>
        </div>

    </div>
	</body>
</html>