<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main</title>
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

/* 좌측 메뉴 */
.left {
    width: 45%; /* 좌측 영역 너비 50% */
/*     background: #ff0; */
    padding: 20px;
    overflow-y: auto; /* 내용이 넘치면 스크롤이 생기도록 설정 */
}

/* 우측 콘텐츠 */
.right {
    width: 55%; /* 우측 영역 너비 50% */
/*     background: #0ff; */
    padding: 20px;
    overflow-y: auto; /* 내용이 넘치면 스크롤이 생기도록 설정 */
    height: 100vh; /* 우측 영역 높이를 화면에 맞게 설정 */
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
/*     background-color: #f9f9f9; */
    border-left: 2px solid #ddd;
    height: calc(100vh - 40px); /* 우측 영역 높이에서 padding 40px (상하 20px) 제외 */
    overflow-y: auto; /* 내용이 넘치면 스크롤 */
}

.active > a {
	color: red;
}
</style>
</head>

<body>
  <div id="title">
    <p>관리자 메인 페이지</p>
    <button id="logoutBtn" onclick="logoutBtn()">로그아웃</button>
  </div>
  
	<div class="container">
        <div class="left">
			<div id="menu-container"> </div>
        </div>
        
        <div class="right">
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
	        				</div>
	        					<button type="button" id="updateSave" onclick="updateMenu()">수정</button>
	        					<button type="button" id="insertSave" onclick="createMenu()">저장</button>
	        				
        	</div>
        	
        </div>
	</div>
    
	<div id="content"> </div>
	
<script type="text/javascript">
$(document).ready(function() {
	fn_menu_click("web", "menu-container");
});

function fn_menu_click(menuCd, prntElId) {
	$("#menuCd").attr("readonly", true);
	$("#menuNm").attr("readonly", true);
	$("#ord").attr("readonly", true);
	
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

function fn_save() {
	$("#menuCd").val("");
	$("#menuCd").attr("readonly", false);
	$("#menuNm").val("");
	$("#menuNm").attr("readonly", false);
	$("#ord").val("");
	$("#ord").attr("readonly", false);
}

function createMenu() {
	var menuCd = $("#menuCd").val();
    var menuNm = $("#menuNm").val();
    var ord = $("#ord").val();
    var prntMenuCd = $("#prntMenuCd").val();
    var prntMenuNm = $("#prntMenuNm").val();
    var fstmRgstrId = $("#fstmRgstrId").val();
    var lastModfrId = $("#lastModfrId").val();
	
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
            "lastModfrId":lastModfrId
        	},
        dataType: 'json',
        success: function(response) {
          	console.log("createMenu :"+response);
          	
          	var menuVO = response.menuVO;

            // 응답 받은 데이터를 폼에 반영
//             $("#menuCd").val(menuVO.menuCd);
//             $("#menuNm").val(menuVO.menuNm);
//             $("#ord").val(menuVO.ord);

            // 성공 메시지
            alert("메뉴가 생성되었습니다.");
        },
        error: function(xhr, status, error) {
            console.error("메뉴 생성 중 오류 발생", status, error);
            alert("서버 오류: " + error);
        }
    });
}

function fn_update(){
	$("#menuNm").attr("readonly", false);
	$("#ord").attr("readonly", false);
}

// 수정
function updateMenu() {
	alert("!@#123");
	var menuCd = $("#menuCd").val();
    var menuNm = $("#menuNm").val();
    var ord = $("#ord").val();
    var lastModfrId = $("#lastModfrId").val();
	
//     var menuVO = {
//         menuCd: $("#menuCd").val(),
//         menuNm: $("#menuNm").val(),
//         ord: $("#ord").val(),
//         lastModfrId: $("#lastModfrId").val()
//     };

    $.ajax({
        url: '/mngr/updateMenu', 
        type: 'POST',
//         data: JSON.stringify(menuVO), // JSON 형식으로 데이터 전송
		data: {
            "menuCd": menuCd,          
            "menuNm": menuNm,
            "ord": ord,                 
            "lastModfrId":lastModfrId
        	},
        dataType: 'json',
        success: function(response) {
            console.log("updateMenu :"+response);
            
         // 응답 받은 데이터를 폼에 반영
//          $("#menuCd").val(menuVO.menuCd);
//          $("#menuNm").val(menuVO.menuNm);
//          $("#ord").val(menuVO.ord);
//          $("#lastModfrId").val(menuVO.lastModfrId);

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

// 로그아웃
function logoutBtn(){
    if (confirm("로그아웃 하시겠습니까?")) {
        $.ajax({
            url: '/mngr/logout',
            type: 'POST',
            success: function() {
                alert("로그아웃 되었습니다.");
                window.location.href = '/mngr/login'; 
            },
            error: function() {
                alert("로그아웃 중 오류가 발생했습니다.");
            }
        });
    }
}

</script>

</body>
</html>