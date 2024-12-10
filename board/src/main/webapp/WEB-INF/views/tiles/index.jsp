<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="/resources/css/common.css">

<meta charset="UTF-8">
<title> 일반 회원 index</title>
</head>

<body>
	<tiles:insertAttribute name="header" />
	
	<tiles:insertAttribute name="body" />
	<p>일반 회원 index</p>
	
	<tiles:insertAttribute name="footer" />
	
</body>

</html>