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
<link rel="stylesheet" href="/resources/css/common.css">

<style>

/* 전체 컨테이너를 flexbox로 설정 */
.container {
/*     display: flex; */
    height: 100vh; /* 화면 높이를 100%로 설정 */
}

/* 메뉴 리스트 스타일 */
ul {
    padding-left: 20px;
}

li {
    padding: 5px;
}

a {
    text-decoration: none;
    cursor: pointer;
}

.active > a {
	color: red;
}

.menu{
	width: 20%;
}
/*
body, ul, li {
  margin: 0;
  padding: 0;
   list-style: none;   	    /* 해당 태그의 list-style을 none으로 하는 것으로 ●을 제거한다 
}
*/

a {
  color: inherit;   	    /* 부모 엘리먼트의 값을 물려받는다 */
  text-decoration: none;    /* 해당 태그의 text-decoration 속성을 none 값으로 하는 것으로 밑줄을 제거한다 */
}


</style>
</head>

<body>

	<div class="menu" id="menu-container"> </div>

</body>

<script type="text/javascript">
$(document).ready(function() {
	fn_menu_click("web", "menu-container");
});

function fn_menu_click(menuCd, prntElId) {
	$("#menuCd").attr("readonly", true);
	$("#menuNm").attr("readonly", true);
	$("#ord").attr("readonly", true);
	$("#url").attr("readonly", true);

// 	var menuNm = document.getElementById("menuNm").value;
	var subMenuExistYn = false;
	if($("#" + menuCd + "_li ul").length > 0) {
		subMenuExistYn = true;
	}

	$.ajax({
    url: '/mngr/menuAjax',
    data: {"prntMenuCd" : menuCd
    	, "menuCd":menuCd}, // 부모코드 받아와서 menuCd로 
    type: 'GET',
    dataType: 'json',
    success: function(response) {
    	var menuVO = response.menuVO;
    	var menuList = response.menuVOList;
    	console.log(response.menuVO);
    	console.log(response.menuVOList);
    	
    	var html = ""; // html 초기화
    	if (response.menuVOList.length > 0) { // menu 리스트에 메뉴가 하나 이상 있으면
    		html += "<ul>";
    		
	        	for(var i=0; i < menuList.length; i++) { // <li id="web_S_li">< a href='javascript:fn_menu_click("web_S", web_S_li");'>"시스템관리"</a> </li>""
	        		html += "<li id='" + menuList[i].menuCd + "_li'><a href='javascript:fn_menu_click(\"" + menuList[i].menuCd + "\", \"" + menuList[i].menuCd + "_li\");'>" + menuList[i].menuNm + "</a></li>";
	        	}
	        	html += "</ul>";
	        	$("#" + prntElId).append(html);
    	}
    	
   		$("#menu-container li").removeClass("active");
   		$("#" + menuCd + "_li").addClass("active");
    	
    	
    	if (menuVO != null) {
    		$("#menuCd").val(menuVO.menuCd);
            $("#menuNm").val(menuVO.menuNm);
            $("#prntMenuCd").val(menuVO.prntMenuCd);  
            $("#prntMenuNm").val(menuVO.prntMenuNm);  
            $("#ord").val(menuVO.ord); 
            $("#fstmRgstrId").val(menuVO.fstmRgstrId);  
            $("#lastModfrId").val(menuVO.lastModfrId);  
            $("#url").val(menuVO.url);  
    	}
    	
    	if(subMenuExistYn) {
    		// 하위 엘리먼트 삭제
      		$("#" + menuCd + "_li ul").remove();
    	}
    },
    error: function(xhr, status, error) {
        console.error("전송실패", status, error);
        return false;
    }
	});
}
</script>

</html>
