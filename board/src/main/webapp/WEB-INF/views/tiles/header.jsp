<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<header>
<p>일반 타일즈 헤더</p>
<!--     <div class="header-top-menu"> -->
<!--         타일즈에서 가져온 메뉴 리스트 -->
<%--         <tiles:importAttribute name="menuList" /> --%>
<!--         <ul class="menu-list"> -->
			
<!-- 			<div id="body"> -->
<!-- 				<ul> -->
<!-- 					<li class="top-menu">  -->
<!-- 						최상위  -->
<%-- 						<c:if test="${menuList[0].prntMenuCd == 'web'}"> --%>
<%-- 							<a href="javascript:void(0);" class="top">${menuList[0].menuNm}</a> --%>
<%-- 						</c:if> --%>
<!-- 						<ul class="all"> -->
						
<!-- 							<li> -->
<!-- 							(PRNT_MENU_CD == menu.menuCd) -->
<%-- 				     			<a href="javascript:void(0);" class="menu-item">${menuList[1].menuNm}</a> --%>
<!-- 								<ul class="submenu"> -->
<%-- 									<c:forEach var="menu" items="${menuList}"> --%>
<%-- 								        <c:if test="${menu.prntMenuCd == 'web_S'}"> --%>
<%-- 					       					<li><a href="javascript:void(0);" class="menu-item">${menu.menuNm}</a></li> --%>
<%-- 								        </c:if> --%>
<%-- 								    </c:forEach>														 --%>
<!-- 								</ul> -->
<!-- 							</li> -->
							
<!-- 							<li> -->
<%-- 				     			<a href="javascript:void(0);" class="menu-item">${menuList[4].menuNm}</a> --%>
<%-- 								<c:forEach var="menu" items="${menuList}"> --%>
<%-- 									<c:if test="${menu.prntMenuCd == 'web_B'}"> --%>
<%-- 										<li><a href="#">${menu.menuNm}</a></li> --%>
<%-- 									</c:if> --%>
<%-- 								</c:forEach> --%>
<!-- 							</li> -->
							
<!-- 							<li> -->
<%-- 			     				<a href="javascript:void(0);" class="menu-item">${menuList[5].menuNm}</a> --%>
<!-- 									<ul class="submenu"> -->
<%-- 										<c:forEach var="menu" items="${menuList}"> --%>
<%-- 											<c:if test="${menu.prntMenuCd == 'web_N'}"> --%>
<%-- 												<li><a href="#">${menu.menuNm}</a></li> --%>
<%-- 											</c:if> --%>
<%-- 										</c:forEach> --%>
<!-- 									</ul> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 		</div> -->
							
<!--         </ul> -->
<!--     </div> -->
</header>

<!-- CSS 스타일링 -->
<style>
    /* 기본 스타일 */
    header {
        background-color: #333;  /* 헤더 배경색 */
        padding: 10px 20px;       /* 패딩 */
        color: #fff;              /* 글자색 */
        font-family: Arial, sans-serif;  /* 기본 글꼴 */
    }

    .header-top-menu {
        display: flex;
        justify-content: center;  /* 가운데 정렬 */
        align-items: center;
    }

    .menu-list {
        list-style-type: none;    /* 기본 목록 스타일 제거 */
        margin: 0;
        padding: 0;
        display: flex;            /* 메뉴 항목을 가로로 나열 */
    }

    .menu-item {
        margin: 0 15px;           /* 메뉴 항목 간의 간격 */
        font-size: 16px;          /* 폰트 크기 */
        text-transform: uppercase; /* 대문자로 변환 */
        cursor: pointer;         /* 마우스 포인터를 손 모양으로 변경 */
        transition: color 0.3s ease; /* 색상 변화 애니메이션 */
    }

    /* 메뉴 항목에 마우스 올렸을 때 색상 변경 */
    .menu-item:hover {
        color: #ff6600;           /* 메뉴 항목에 마우스를 올렸을 때 색상 변경 */
    }
</style>
