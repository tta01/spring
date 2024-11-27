<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mngr Main</title>
<style>
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

  ul.submenu {  
  	display: block;  
  }  

  .active>.submenu {  
  	display: block;  
  }  

  ul.submenu.active {  
        display: block; /* active 클래스가 있을 때 표시     */
  }  

</style>
</head>

<body>
	<div id="title">
		<p>관리자 메인 페이지</p>
		<button id="logoutBtn">로그아웃</button>
	</div>

	<div id="body">
		<ul>
			<li class="top-menu"> 
<%-- 			<c:out value="${menuVOList}"></c:out> --%>
				<!-- 최상위 메뉴  -->
				<c:if test="${menuVOList[0].prntMenuCd == 'web'}">
					<a href="javascript:void(0);" class="top">${menuVOList[0].menuNm}</a>
				</c:if>
				<ul class="all">
				
					<li>
					<!-- 하위 메뉴 (PRNT_MENU_CD == menu.menuCd) -->
		     			<a href="javascript:void(0);" class="menu-item">${menuVOList[1].menuNm}</a>
						<ul class="submenu">
							<c:forEach var="menu" items="${menuVOList}">
						        <c:if test="${menu.prntMenuCd == 'web_S'}">
			       					<li><a href="javascript:void(0);" class="menu-item">${menu.menuNm}</a></li>
						        </c:if>
						    </c:forEach>														
						</ul>
					</li>
					
					<!-- 그 하위 메뉴 -->
					<li>
		     			<a href="javascript:void(0);" class="menu-item">${menuVOList[4].menuNm}</a>
						<c:forEach var="menu" items="${menuVOList}">
							<c:if test="${menu.prntMenuCd == 'web_B'}">
								<li><a href="#">${menu.menuNm}</a></li>
							</c:if>
						</c:forEach>
					</li>
					
						<!-- 그 하위에 하위 메뉴 -->
					<li>
	     				<a href="javascript:void(0);" class="menu-item">${menuVOList[5].menuNm}</a>
							<ul class="submenu">
								<c:forEach var="menu" items="${menuVOList}">
									<c:if test="${menu.prntMenuCd == 'web_N'}">
										<li><a href="#">${menu.menuNm}</a></li>
									</c:if>
								</c:forEach>
							</ul>
					</li>
				</ul>
			</li>
		</ul>
	</div>

<script type="text/javascript">
	$(document).ready(function() {
	    // 페이지 로딩 시 하위 메뉴는 숨겨두고
// 	    $(".submenu").hide();
	    
		 $('.top').click(function() {
			 console.log("11111");
			 var top = $(this).next('.all');
			 console.log("22222");
			 top.stop(true, true).slideToggle(); // 모든 하위 메뉴 열기/닫기
			 console.log("33333");
			 $(this).parent().toggleClass('active');
		 });
	    
	    // 메뉴 클릭 시 하위 메뉴 열고 닫기
	    $('.menu-item').click(function() {
	        var submenu = $(this).next('.submenu'); // 클릭한 메뉴의 하위 메뉴
	        // 현재 하위 메뉴를 열거나 닫기
	        submenu.stop(true, true).slideToggle(); // stop()을 추가하여 애니메이션을 중단하고, 모든 상태를 초기화
	        // 해당 메뉴에 active 클래스 추가/삭제
	        $(this).parent().toggleClass('active');
	    });

// 	    $('.menu-item').click(function() {
//         // 모든 하위 메뉴를 숨기기
//         $(".submenu").slideUp(); 
        
//         // 클릭한 메뉴의 하위 메뉴만 열기
//         var submenu = $(this).next('.submenu'); // 클릭한 메뉴의 하위 메뉴
//         submenu.stop(true, true).slideToggle(); // 해당 하위 메뉴 열기/닫기

//         // 해당 메뉴에 active 클래스 추가/삭제
//         $(this).parent().toggleClass('active');
//     	});
	    
	    // 로그아웃 버튼 클릭 이벤트
	    $("#logoutBtn").click(function() {
	        if (confirm("로그아웃 하시겠습니까?")) {
	            $.ajax({
	                url : '/mngr/logout',
	                type : 'POST',
	                success : function() {
	                    alert("로그아웃 되었습니다.");
	                    window.location.href = '/mngr/login'; // 로그인 페이지로 리디렉션
	                },
	                error : function() {
	                    alert("로그아웃 중 오류가 발생했습니다.");
	                }
	            });
	        }
	    });
	});

</script>
</body>
</html>
