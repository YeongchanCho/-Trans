<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시판 상세보기 페이지</h1>

    <nav>
        <ul>
            <li>
                <a href="../">메인 페이지</a>
            </li>
            <li>
                <a href="main">게시판 메인 페이지</a>
            </li>
            <li>
                <a href="update?bno=${board.bno}">수정하기</a>
            </li>
        </ul>
    </nav>
    
    <form>
        <div>
            <label for="bno">글 번호</label>
            <input type="number" id="bno" name="bno"
                value="${board.bno}" readonly />
        </div>
        <div>
            <label for="title">글 제목</label>
            <input type="text" id="title" name="title"
                value="${board.title}" readonly />
        </div>
        <div>
            <label for="content">내용</label>
            <textarea rows="5" id="content" 
                    name="content" readonly>${board.content}</textarea>
        </div>
        <div>
            <label for="userid">작성자</label>
            <input type="text" id="userid" name="userid"
                value="${board.userid}" readonly />
        </div>
        <div>
            <label for="reply_cnt">댓글 갯수</label>
            <input type="number" id="reply_cnt" name="reply_cnt"
                value="${board.reply_cnt}" readonly />
        </div>
        <div>
            <label for="reg_date">작성 시간</label>
            <input type="text" id="reg_date" name="reg_date"
                value="${board.reg_date}" readonly />
        </div>
    </form>
    
    <hr/>
</body>
</html>