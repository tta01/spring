<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>

<head>
<style type="text/css">

</style>

<meta charset="UTF-8">
<title> File list </title>
</head>

<body>

	<div class="file-body">
	<c:forEach var="item" items="${fileVO}" >
<%-- 		<c:if test="${fileVOList} "> --%>
			<p>${item.afId}</p>
<%-- 		</c:if> --%>
	</c:forEach>
	</div>
	
</body>
</html>