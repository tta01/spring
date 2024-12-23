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
<meta charset="UTF-8">
<title> File update </title>
</head>

<body>

	<div class="file-body">

		<c:import url="/WEB-INF/views/noticeBoard/update.jsp">
			<c:param name="uploadFile" value="${uploadFile}" />
			<c:out value="${uploadFile}"></c:out>
		</c:import>
		
	</div>

<script type="text/javascript" src="/resources/js/fileCreate.js"></script>

</body>
</html>