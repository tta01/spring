<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>


<!DOCTYPE html>
<link rel="stylesheet" href="/resources/css/common.css">

<head>
    <title>게시판 목록</title>
<!--    <div> -->
<%-- 		<c:import url="header.jsp" /> --%>
<!-- 	</div> -->
</head>

<body>

<div class="board-list">
    <h1>게시판 목록</h1>
    
    <div>
        <a href="<c:url value='/user/board/create'/>">새글 작성</a>
    
    </div>
    
	<div class="tb-body">
	    <table>
	        <thead>
	            <tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>작성자</th>
	                <th>작성일</th>
	                <th>수정일</th>
	            </tr>
	        </thead>
	        
	        <tbody>
	<%--         <c:out value="${noticeBoardVO}" /> --%>
	            <c:forEach var="item" items="${noticeVOList}" varStatus="status">
	                <tr>
	                    <td>${item.rnum}</td>
	                    <td><a href="<c:url value='/user/board/detail?boardId=${item.boardId}'/>">${item.boardTitle}</a></td>
	                    <td>${item.memId}</td>
	                    <td><fmt:formatDate value="${item.boardWritingDt}" pattern="yyyy-MM-dd HH:mm"/></td>
	                    <td><fmt:formatDate value="${item.boardUpdtDt}" pattern="yyyy-MM-dd HH:mm"/></td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</div>
    
    <!-- 페이지 출력하고, 이전 다음 생성 -->
	<div>
	    <c:if test="${noticeBoardVO.startPage > 1}">
	        <a href="/user/board/list?page=${noticeBoardVO.page - 1}">이전</a>
	    </c:if>
	    
	    <c:forEach var="i" begin="${noticeBoardVO.startPage}" end="${noticeBoardVO.endPage}" step="1">
	        <c:choose>
	            <c:when test="${i == noticeBoardVO.page}">
	                <span style="font-weight: bold; color:red;">${i}</span>
	            </c:when>
	            <c:otherwise>
	                <a href="/user/board/list?page=${i}">${i}</a>
	            </c:otherwise>
	        </c:choose>
	    </c:forEach>
	    
	    <c:if test="${noticeBoardVO.endPage < noticeBoardVO.maxPage}">
	        <a href="/user/board/list?page=${noticeBoardVO.page + 1}">다음</a>
	    </c:if>
	    
	</div>
</div>
    
<!--     <div> -->
<%--     	<c:import url="footer.jsp"></c:import> --%>
<!--     </div> -->
    
</body>
</html>
