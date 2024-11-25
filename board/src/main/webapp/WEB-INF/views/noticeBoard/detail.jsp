<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>

    <style>
        /* 테이블 디자인 */
        .detail-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        .detail-table th, .detail-table td {
            padding: 10px;
            text-align: left;
            vertical-align: middle;
            border: 1px solid #ddd;
        }

        .detail-table th {
            background-color: #f1f1f1;
        }

        /* 제목과 내용 디자인 */
        h1 {
            text-align: center;
            font-size: 24px;
            margin-top: 20px;
        }

        .content {
            font-size: 16px;
            line-height: 1.5;
        }

        .file-link {
            color: #1a73e8;
            text-decoration: none;
        }

        .file-link:hover {
            text-decoration: underline;
        }

        .form-buttons {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }

        button, a {
            padding: 12px 25px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            display: inline-block;
            transition: background-color 0.3s ease-in-out, transform 0.3s ease;
        }

        /* 수정 및 삭제 버튼 스타일 */
        button[type="submit"] {
            background-color: #4caf50;
            color: white;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }

        a {
            background-color: #f44336;
            color: white;
            margin-left: 10px;
        }

        a:hover {
            background-color: #e53935;
            transform: translateY(-2px);
        }
    </style>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세보기</title>
</head>

<body>
    <h1>공지사항 상세보기</h1>
    <form id="frm" name="frm" action="/board/detailUpdate" method="GET" enctype="multipart/form-data">
	    <input type="hidden" name="boardId" value="${noticeBoardVO.boardId}" />
	    
	    <table class="detail-table">
	        <tr>
	            <th>공지사항 제목</th>
	            <td>${noticeBoardVO.boardTitle}</td>
	        </tr>
	        <tr>
	            <th>작성자</th>
	            <td>${noticeBoardVO.memId}</td>
	        </tr>
	        <tr>
	            <th>작성일</th>
	            <td><fmt:formatDate value="${noticeBoardVO.boardWritingDt}" pattern="yyyy-MM-dd HH:mm" /></td>
	        </tr>
	        <tr>
	            <th>수정일</th>
	            <td><fmt:formatDate value="${noticeBoardVO.boardUpdtDt}" pattern="yyyy-MM-dd HH:mm" /></td>
	        </tr>
	        <tr>
	            <th>공지사항 내용</th>
	            <td>
	            	<pre class="content">${noticeBoardVO.boardCntnt}</pre> 
	            </td>
<!-- 	        </tr> -->
<!-- 	        <tr> -->
<!-- 	            <th>첨부파일</th> -->
<!-- 	            <td> -->
<%-- 	            <c:forEach var="item" items="${brdList}" varStatus="status"> --%>
<%-- 					    <img src="/resources/upload/${item.ntbdAfId}" /> --%>
<%-- 				</c:forEach> --%>
	<%--                 <c:choose> --%>
	<%--                     <c:when test="${not empty noticeBoardVO.ntbdAfId}"> --%>
	<%--                         <a href="/file/download/${noticeBoardVO.ntbdAfId}" class="file-link" target="_blank">파일 다운로드</a> --%>
	<%--                     </c:when> --%>
	<%--                     <c:otherwise>첨부파일 없음</c:otherwise> --%>
	<%--                 </c:choose> --%>
<!-- 	            </td> -->
	        </tr>
	    </table>

    <!-- 수정 및 삭제 버튼 -->
    <div class="form-buttons">
        <a href="<c:url value='/board/updatePost/${noticeBoardVO.boardId}' />">수정</a>
<!-- 		<button type="button" id="delete" class="list-btn">삭제</button> -->
		<a href="#" id="delete">삭제</a>
<%--         <a href="<c:url value='/board/deletePost?boardId=${noticeBoardVO.boardId}' />">삭제</a> --%>
		<a href="<c:url value='/board/list?page=${noticeBoardVO.page}' />">목록</a>
    </div>
    </form>
    
</body>

</html>

<script type="text/javascript">
$(function(){
$("#delete").on("click",function(){
	console.log("오니");
	
	let result = confirm("삭제하시겠습니까?");
    console.log("Confirm 결과:", result);
    alert(result);
	debugger;
  // 확인 선택 시 form을 submit
     if (result) {
             $("#frm").attr("method", "post");
             $("#frm").attr("action", "/board/deletePost");
             $("#frm").submit();
     } else {
         alert("삭제가 취소되었습니다");
     }
	});
});
</script>
