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
<head>
<style>
.container{
	display: flex;
    flex-direction: row;
}

.admintiles {
    margin-left: 0;
    width: 80%;
}

</style>

<meta charset="UTF-8">
	<title> 관리자 main </title>
</head>

<body>

<%-- <%@ include file="/WEB-INF/views/sitemesh/mngr/header.jsp" %> --%>
	
	<jsp:include page="header.jsp" />
<!-- <div class="container"> -->


<jsp:include page="aside.jsp" />

<!-- 			<div class="admintiles" id="admintiles" > -->
			
	<decorator:body />
			
<!-- 			</div> -->
<!-- </div> -->
	
<jsp:include page="footer.jsp" />	
				
</body>
</html>
