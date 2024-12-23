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
	<title> Admin Main </title>
<style>
/* 모든 요소에 box-sizing을 border-box로 설정 */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* 전체 컨테이너를 flexbox로 설정 */
.container {
    display: flex;
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

#content {
    padding: 20px;
    width: 500px;
    height: calc(100vh - 40px); /* 우측 영역 높이에서 padding 40px (상하 20px) 제외 */
    overflow-y: auto; /* 내용이 넘치면 스크롤 */
}

.active > a {
	color: red;
}

</style>
	
</head>

<body>
	<div class="main-body">
  		<div id="title" style="display: flex; align-items: center;">
    		<p style="margin-right: 200px;">관리자 메인 페이지</p>
			  <a href="/user/board/list" >게시판</a>
  		</div>
	<div class="container">
		<div id="menu-container"> </div>
       
       	<div id="content">
       		<button type="button" id="createBtn" onclick="fn_save()">메뉴 등록</button>
       		<button type="button" id="deleteBtn" onclick="deleteMenu()">메뉴 삭제</button>
       		<button type="button" id="updateBtn" onclick="fn_update()">메뉴 수정</button>
     		
     		<br/>
      			<div id="menu-list">
	        		<p> 상위코드 : <input id="prntMenuCd" name="prntMenuCd" type="text" readonly="readonly"> </p>
	        		<p> 상위코드명 : <input id="prntMenuNm" name="prntMenuNm" type="text" readonly="readonly"> </p>
	        		<p> 메뉴코드 : <input id="menuCd" name="menuCd" type="text" readonly="readonly"> </p>
	        		<p> 메뉴명 : <input id="menuNm" name="menuNm" type="text"> </p>
	        		<p> 순번 : <input id="ord" name="ord" type="number"> </p>
	        		<p> 등록자 : <input id="fstmRgstrId" name="fstmRgstrId" type="text" readonly="readonly"> </p>
	        		<p> 수정자 : <input id="lastModfrId" name="lastModfrId" type="text" readonly="readonly"> </p>
	        		<p> URL : <input id="url" name="url" type="text" readonly="readonly"> </p>
     			</div>
     			
    			<button type="button" id="updateSave" onclick="updateMenu()">수정</button>
    			<button type="button" id="insertSave" onclick="createMenu()">저장</button>
        				
       	</div>
	</div>
</div>
<script type="text/javascript">

// 저장 버튼
function fn_save() {
	$("#menuCd").val("");
	$("#menuCd").attr("readonly", false);
	$("#menuNm").val("");
	$("#menuNm").attr("readonly", false);
	$("#ord").val("");
	$("#ord").attr("readonly", false);
	$("#url").val("");
	$("#url").attr("readonly", false);
}

// 등록
function createMenu() {
	var menuCd = $("#menuCd").val();
    var menuNm = $("#menuNm").val();
    var ord = $("#ord").val();
    var prntMenuCd = $("#prntMenuCd").val();
    var prntMenuNm = $("#prntMenuNm").val();
    var fstmRgstrId = $("#fstmRgstrId").val();
    var lastModfrId = $("#lastModfrId").val();
    var url = $("#url").val();
	
    $.ajax({
        url: '/mngr/createMenu', 
        type: 'POST',
        data: {
        	"prntMenuCd": prntMenuCd,  
            "prntMenuNm":prntMenuNm,
            "menuCd": menuCd,          
            "menuNm": menuNm,          
            "ord": ord,                 
            "fstmRgstrId":fstmRgstrId,
            "lastModfrId":lastModfrId,
            "url":url
        	},
        dataType: 'json',
        success: function(response) {
          	console.log("createMenu :"+response);

            alert("메뉴가 생성되었습니다.");
        },
        error: function(xhr, status, error) {
            console.error("메뉴 생성 중 오류 발생", status, error);
            alert("서버 오류: " + error);
        }
    });
}

// 수정 버튼
function fn_update(){
	$("#menuNm").attr("readonly", false);
	$("#ord").attr("readonly", false);
	$("#url").attr("readonly", false);
}

// 수정
function updateMenu() {
	var menuCd = $("#menuCd").val();
    var menuNm = $("#menuNm").val();
    var ord = $("#ord").val();
    var lastModfrId = $("#lastModfrId").val();
    var url = $("#url").val();
	
    $.ajax({
        url: '/mngr/updateMenu', 
        type: 'POST',
//         data: JSON.stringify(menuVO), // JSON 형식으로 데이터 전송
		data: {
            "menuCd": menuCd,          
            "menuNm": menuNm,
            "ord": ord,                 
            "lastModfrId":lastModfrId,
            "url":url
        	},
        dataType: 'json',
        success: function(response) {
            console.log("updateMenu :"+response);
            
            alert("메뉴가 성공적으로 수정되었습니다.");
        },
        error: function(xhr, status, error) {
            console.error("메뉴 수정 중 오류 발생", status, error);
            alert("서버 오류: " + error);
        }
    });
}

// 삭제
function deleteMenu() {
	var menuCd = document.getElementById("menuCd").value;
	console.log("menuCd : "+menuCd);
    if (confirm("삭제 하시겠습니까?")) {
	 $.ajax({	
	     url: '/mngr/deleteMenu', 
	     type: 'POST',
	     data: { "menuCd": menuCd },
	     dataType: 'json',
	     success: function(response) {
	         alert("메뉴가 성공적으로 삭제되었습니다.");
	    	 console.log("deleteMenu :"+response);
	     },
	     error: function(xhr, status, error) {
	         console.error("메뉴 삭제 중 오류 발생", status, error);
	         alert("서버 오류: " + error);
	     }
	 });
    }
}

</script>

</body>
</html>