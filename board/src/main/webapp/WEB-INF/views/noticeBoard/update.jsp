<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<link rel="stylesheet" href="/resources/css/common.css">

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
    border: none;
}

textarea {
	white-space: pre-wrap;
	word-break: break-all;
	overflow: auto;
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

.del-btn{
	font-size: 12px;
	width: 100px;
	height: 32px;
	border-radius: 5px;
	border-color: blue;
}
img {

}
</style>

<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
</head>

<body>
    <div class="board-list">
	    <h1>공지사항 수정</h1>
		<c:out value="${boardVO}"></c:out>    
		
    <form name="frm" action="/user/board/updatePost" method="post" enctype="multipart/form-data"> 
    	<p><input type="hidden" name="boardId" value="${boardVO.boardId}" /></p>
	    <p><input type="hidden" id="memId" name="memId" value="${mngrId}" /></p>
	    <p><input type="hidden" id="useYn" name="useYn" value="${useYn}" /></p>
	
	    <table class="form-table">
	    
	        <tr>
	            <th>공지사항 제목</th>
	            <td><input type="text" id="boardTitle" name="boardTitle" placeholder="공지사항 제목입력" value="${boardVO.boardTitle}" required /></td>
	        </tr>
	        <tr>
	            <th>공지사항 내용</th>
	            <td><textarea id="boardCntnt" name="boardCntnt" required >${boardVO.boardCntnt}</textarea></td>
	        </tr>
	        <tr>
	            <th>공지사항 파일</th>
<%-- 	            <c:out value="${fileVO}"></c:out> --%>
	            <td>
	            	<p class="board-title"> 첨부파일 선택 </p>
	            	
<%-- 	            	<c:choose> --%>
	            		<c:if test="${not empty fileVO}">
							<c:forEach var="item" items="${fileVO}" varStatus="status">
									<div id="fileList${status.index}" class="file-link">[ ${item.afOriginNm} ]
<%-- 									<button type="button" class="del-btn" onclick="fn_fileDelete('${status.index}')">파일삭제</button> --%>
<%-- 			            		<img src="/resources/upload/${item.afSaveNm}" width="70%" style="margin-top: 20px;" /> --%>
								<img src="/resources/images/delete.png" onclick="fn_fileDelete(${status.index})"
								 style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/></div>					
							</c:forEach>
						</c:if>
<%-- 	            		<c:otherwise>등록된 파일이 없습니다.</c:otherwise> --%>
<%-- 	            	</c:choose> --%>
		            	<input type="file" id="uploadFile" name="uploadFile" multiple /> 
           				<div id="atchfileChange" style="margin-left: 10px; width: 150%; display: flex; flex-direction: column;"></div>
	            </td>
	        </tr>
	        
	    </table>
	
	    <div class="form-buttons">
	        <button type="submit" onclick="btn_submit()"> 수정 완료 </button>
	        <a href="<c:url value='/user/board/list'/>" >목록</a>
	    </div>
	</form>

</div>

<script type="text/javascript" src="/resources/js/fileUpdate.js"></script>
<script type="text/javascript" src="/resources/js/fileCreate.js"></script>

<script type="text/javascript">

//삭제
// function delbtn() {
	
// 	var file = document.getElementById("fileList").value;
	
// 	console.log("file : "+file);
//     if (confirm("삭제 하시겠습니까?")) {
// 	 $.ajax({	
// 	     url: '/user/board/fileAjax', 
// 	     type: 'POST',
// 	     data: { "file": file },
// 	     dataType: 'json',
// 	     success: function(response) {
// 	         alert("메뉴가 성공적으로 삭제되었습니다.");
// 	    	 console.log("deleteMenu :"+response);
// 	     },
// 	     error: function(xhr, status, error) {
// 	         console.error("메뉴 삭제 중 오류 발생", status, error);
// 	         alert("서버 오류: " + error);
// 	     }
// 	 });
//     }
// }
</script>
    
</body>

</html>

