<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>삽입페이지<h1>
<form action="insert" method="post">
        <input type="text" name="title" placeholder="제목 입력" required />
        <br/>
        <textarea rows="5" name="content" placeholder="내용 입력" required></textarea>
        <br/>
        <input type="text" name="userid" required />
        <br/>
        <input type="submit" value="작성 완료" />
    </form>
</body>
</html>