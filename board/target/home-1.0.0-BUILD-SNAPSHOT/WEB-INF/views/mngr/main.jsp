<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Mngr Main </title>
	<style>
		ul {
			list-style-type: none;
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
		.active > .submenu {
			display: block;
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
		<c:out value="${menuVOList}"></c:out>
			<c:forEach var="menu" items="${menuVOList}">
		    <!-- 최상위 메뉴 (PRNT_MENU_CD == 'web') -->
		    <c:if test="${menu.prntMenuCd == 'web'}">
		        <li>
		            <a href="javascript:void(0);" class="menu-item">${menu.menuNm}</a>
		
		            <!-- 하위 메뉴 (PRNT_MENU_CD == menu.menuCd) -->
		            <ul class="submenu">
		                <c:forEach var="subMenu" items="${menuVOList}">
		                    <c:if test="${subMenu.prntMenuCd == menu.menuCd}">
		                        <li>
		                            <a href="javascript:void(0);" class="menu-item">${subMenu.menuNm}</a>
		
		                            <!-- 그 하위 메뉴 (PRNT_MENU_CD == subMenu.menuCd) -->
		                            <ul class="submenu">
		                                <c:forEach var="subSubMenu" items="${menuVOList}">
		                                    <c:if test="${subSubMenu.prntMenuCd == subMenu.menuCd}">
		                                        <li><a href="#">${subSubMenu.menuNm}</a></li>
		                                    </c:forEach>
		                                </ul>
		                            </li>
		                        </c:if>
		                    </c:forEach>
		                </ul>
		            </li>
		        </c:if>
		    </c:forEach>

		</ul>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			// 모든 하위 메뉴를 페이지 로딩 시 보이게 설정
			$(".submenu").show();

			// 메뉴 클릭 시 하위 메뉴 열고 닫기
			$('.menu-item').click(function() {
				var submenu = $(this).next('.submenu'); // 클릭한 메뉴의 하위 메뉴
				// 현재 하위 메뉴를 열거나 닫기
				submenu.slideToggle();
				// 해당 메뉴에 active 클래스 추가/삭제
				$(this).parent().toggleClass('active');
			});

			// 로그아웃 버튼 클릭 이벤트
			$("#logoutBtn").click(function() {
				if (confirm("로그아웃 하시겠습니까?")) {
					$.ajax({
						url: '/mngr/logout',
						type: 'POST',
						success: function() {
							alert("로그아웃 되었습니다.");
							window.location.href = '/mngr/login';  // 로그인 페이지로 리디렉션
						},
						error: function() {
							alert("로그아웃 중 오류가 발생했습니다.");
						}
					});
				}
			});
		});
	</script>
</body>
</html>
