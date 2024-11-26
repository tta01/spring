<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<p>관리자 메인 페이지</p>
<!-- 로그아웃 버튼 -->
<button id="logoutBtn">로그아웃</button>
</body>

<script type="text/javascript">
$(function() {
    $("#logoutBtn").on("click", function() {
    	if(confirm("로그아웃 하시겠습니까?")){
	        $.ajax({
	            url: '/mngr/logout',  // 로그아웃 URL
	            type: 'POST',
	            success: function() {
	            	alert("로그아웃 되었습니다.");
	                window.location.href = '/mngr/login';  // 로그인 페이지로 리디렉션
	            },
	            error: function() {
	            	debugger;
	                alert("로그아웃 중 오류가 발생했습니다.");
	            }
	        });
    	} else {
    		return false;
    	}
    });
});

</script>

</html>

