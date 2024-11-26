<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>

<style>
/* 전체적인 폼 디자인 */
form {
    margin: 20px auto;
    width: 80%;
    max-width: 800px;
}

/* 테이블 디자인 */
.form-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 30px;
}

.form-table th, .form-table td {
    padding: 10px;
    text-align: left;
    vertical-align: middle;
    border: 1px solid #ddd; /* 테두리 추가 */
}

.form-table th {
    background-color: #f1f1f1;
}

/* 입력 필드 및 텍스트 영역 디자인 */
input[type="text"], textarea, input[type="file"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0 10px;
    border: 1px solid #ddd; /* 테두리 추가 */
    border-radius: 5px;
}

textarea {
    resize: vertical;
    height: 150px;
}

/* 버튼들을 한 줄에 배치하는 부모 div */
.form-buttons {
    display: flex;
    justify-content: flex-end; /* 오른쪽 정렬 */
    margin-top: 20px;
}

/* 버튼 스타일 */
button, a {
    padding: 8px 20px; /* 버튼 크기 줄이기 */
    border-radius: 30px;
    font-size: 14px; /* 글자 크기 조금 작게 */
    font-weight: bold;
    color:unset;
    cursor: pointer;
    text-decoration: none; /* 링크에 밑줄 없애기 */
    text-align: center;
    display: inline-block;
    transition: background-color 0.3s ease-in-out, transform 0.3s ease, border-color 0.3s ease;
    border: 2px solid black; 
    background-color: white; 
    margin-right: 15px; /* 버튼 간격 넓히기 */
}

/* 버튼 호버 시 */
button:hover, a:hover {
    background-color: aliceblue; /* 호버 시 더 연한 파스텔톤 배경색 (하늘색 계열) */
    transform: scale(1.05); /* 호버 시 살짝 커지는 효과 */
    border-color: #80C7E5; /* 하늘색 선 색 */
}

/* 버튼이 마지막인 경우 오른쪽 여백 제거 */
.form-buttons a:last-child {
    margin-right: 0;
}
</style>

<head>
    <meta charset="UTF-8">
    <title>공지사항 등록</title>
</head>
<body>
    <h1>공지사항 등록</h1>

    <!-- 공지사항 등록 폼 -->
    
<form name="frm" action="/board/createForm" method="post"> <%-- enctype="multipart/form-data"> --%>
<%--     <p><input type="hidden" id="memId" name="memId" value="${getCurrentLoginVO.memId}" /></p> --%>
    <p><input type="hidden" id="memId" name="memId" value="admin" /></p>

    <table class="form-table">
        <tr>
            <th>공지사항 제목</th>
            <td><input type="text" id="boardTitle" name="boardTitle" placeholder="공지사항 제목입력" required /></td>
        </tr>
        <tr>
            <th>공지사항 내용</th>
            <td><textarea id="boardCntnt" name="boardCntnt" required></textarea></td>
        </tr>
        <!-- <tr>
            <th>공지사항 파일</th>
            <td><input type="file" id="ntbdAfId" name="ntbdAfId" multiple /></td>
        </tr> -->
    </table>

    <div class="form-buttons">
        <button type="submit"> 등록 </button>
        <a href="<c:url value='/board/list'/>" >목록</a>
    </div>
</form>


    
</body>

</html>

