<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<link rel="stylesheet" href="/resources/css/common.css">

<!DOCTYPE html>
<html>


<style>
/* 전체적인 폼 디자인 */

</style>

<head>
    <meta charset="UTF-8">
    <title>공지사항 등록</title>
</head>

<body>
<div class="board-list">

    <h1>공지사항 등록</h1>

    <!-- 공지사항 등록 폼 -->
    
	<form name="frm" action="/user/board/createForm" method="post"> <%-- enctype="multipart/form-data"> --%>
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
	        <a href="<c:url value='/user/board/list'/>" >목록</a>
	    </div>
	</form>

</div>
    
</body>

</html>

