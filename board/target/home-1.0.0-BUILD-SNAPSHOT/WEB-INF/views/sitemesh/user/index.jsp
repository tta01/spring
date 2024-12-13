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
<meta charset="UTF-8">
	<title> 일반 회원 main </title>
<%-- 	<decorator:head />	 --%>
</head>

<body>

	<jsp:include page="header.jsp" />
<!-- <sitemesh:body /> -->

	<decorator:body />

	<jsp:include page="footer.jsp" />
	
</body>

</html>