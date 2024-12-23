<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<link rel="stylesheet" href="/resources/css/common.css">

<style>
#atchfileChange {
  margin-left: 10px;
  width: 150%;
  display: flex;
  justify-content: space-between;
}
#editor {
	background-color: #0000; 
	border: none;
	padding: 10px;
}

</style>

<div class="board-list">

    <h1>공지사항 등록</h1>

    <!-- 공지사항 등록 폼 -->
    
	<form name="frm" action="/user/board/createForm" method="post" enctype="multipart/form-data">
	    <p><input type="hidden" id="memId" name="memId" value="${mngrId}" /></p>
	    <p><input type="hidden" id="useYn" name="useYn" value="${useYn}" /></p>
	
	    <table class="form-table">
	        <tr>
	            <th>공지사항 제목</th>
	            <td><input type="text" id="boardTitle" name="boardTitle" placeholder="공지사항 제목입력" required /></td>
	        </tr>
	        <tr>
	            <th>공지사항 내용</th>
				<textarea id="boardCntnt" name="boardCntnt" required ></textarea>
	        </tr>
	        <tr>
	            <th>공지사항 파일</th>
	            <td>
	            	<input type="file" id="uploadFile" name="uploadFile" multiple />
	            	<div id="atchfileChange" style="margin-left: 10px; width: 150%; display: flex; flex-direction: column;"></div>
	            </td>
	        </tr>
	    </table>
	
	    <div class="form-buttons">
	        <button type="submit" onclick="btn_submit()"> 등록 </button>
	        <a href="<c:url value='/user/board/list'/>" >목록</a>
	    </div>
	</form>

</div>

<script type="text/javascript" src="/resources/js/fileCreate.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    CKEDITOR.replace('boardCntnt');
});

//html 태그 사라지는 오류 해결
CKEDITOR.config.allowedContent = true;

</script>


