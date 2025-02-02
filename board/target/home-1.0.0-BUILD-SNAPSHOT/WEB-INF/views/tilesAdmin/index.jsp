<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="/resources/css/common.css">

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
<title>관리자 인덱스</title>
</head>

<body>
	
	<tiles:insertAttribute name="header" />
	
	<div class="container">
		<tiles:insertAttribute name="aside"/>
				<div class="admintiles" id="admintiles" >
					
					<tiles:insertAttribute name="body" />
				
				</div>
	</div>
	
	<tiles:insertAttribute name="footer" />
	
				
</body>
</html>
