<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>

<header class="top-bar con-min-width">
	<!--header-->
	<div id="header">
	
		<h1 class="logo">
			<a href="#">K-Startup</a>
		</h1>
		<c:out value="${menuList}" />
		
		<c:if test="${not empty menuList}">
		    <c:forEach var="menu" items="${menuList}">
		        <div>${menu.name}</div>
		    </c:forEach>
		</c:if>
		<c:if test="${empty menuList}">
		    <div>메뉴가 없습니다.</div>
		</c:if>

			
		
		
		<ul id="gnb">
			<li class="dept1"><a href="#">메뉴1</a>
				<ul class="inner_menu">
					<li class="dept2"><a href="#">메뉴1</a></li>
					<li class="dept2"><a href="#">메뉴1</a></li>
					<li class="dept2"><a href="#">메뉴1</a></li>
					<li class="dept2"><a href="#">메뉴1</a></li>
				</ul></li>
			<li class="dept1"><a href="#">메뉴2</a>
				<ul class="inner_menu">
					<li class="dept2"><a href="#">메뉴2</a></li>
					<li class="dept2"><a href="#">메뉴2</a></li>
					<li class="dept2"><a href="#">메뉴2</a></li>
					<li class="dept2"><a href="#">메뉴2</a></li>
				</ul></li>
			<li class="dept1"><a href="#">메뉴3</a>
				<ul class="inner_menu">
					<li class="dept2"><a href="#">메뉴3</a></li>
					<li class="dept2"><a href="#">메뉴3</a></li>
					<li class="dept2"><a href="#">메뉴3</a></li>
				</ul></li>
			<li class="dept1"><a href="#">메뉴4</a>
				<ul class="inner_menu">
					<li class="dept2"><a href="#">메뉴4</a></li>
					<li class="dept2"><a href="#">메뉴4</a></li>
					<li class="dept2"><a href="#">메뉴4</a></li>
				</ul></li>
			<li class="dept1"><a href="#">메뉴5</a>
				<ul class="inner_menu">
					<li class="dept2"><a href="#">메뉴5</a></li>
					<li class="dept2"><a href="#">메뉴5</a></li>
				</ul></li>
		</ul>

		<a href="#" class="menu_bar"> <span></span> <span></span> <span></span>
		</a>
		<!-- 우측에 세줄 클릭시  
		필요하면 위에랑 똑같이 출력해도 됨 -->
		<div class="menu_open">
			<ul>
				<li class="dept1"><a href="#">메뉴</a>
					<ul>
						<li class="dept2"><a href="#">메뉴2</a></li>
						<li class="dept2"><a href="#">메뉴2</a></li>
						<li class="dept2"><a href="#">메뉴2</a></li>
						<li class="dept2"><a href="#">메뉴2</a></li>
					</ul></li>
				<li class="dept1"><a href="#">메뉴</a>
					<ul>
						<li class="dept2"><a href="#">메뉴2</a></li>
						<li class="dept2"><a href="#">메뉴2</a></li>
						<li class="dept2"><a href="#">메뉴2</a></li>
						<li class="dept2"><a href="#">메뉴2</a></li>
					</ul></li>
				<li class="dept1"><a href="#">메뉴</a>
					<ul>
						<li class="dept2"><a href="#">메뉴2</a></li>
						<li class="dept2"><a href="#">메뉴2</a></li>
						<li class="dept2"><a href="#">메뉴2</a></li>
					</ul></li>
				<li class="dept1"><a href="#">메뉴</a>
					<ul>
						<li class="dept2"><a href="#">메뉴2</a></li>
						<li class="dept2"><a href="#">메뉴2</a></li>
						<li class="dept2"><a href="#">메뉴2</a></li>
					</ul></li>
				<li class="dept1"><a href="#">메뉴</a>
					<ul>
						<li class="dept2"><a href="#">메뉴2</a></li>
						<li class="dept2"><a href="#">메뉴2</a></li>
					</ul></li>
			</ul>
		</div>

		<div class="hd_bg"></div>

	</div>
	<!--//header-->

<!-- 	<div class="visual"></div> -->

</header>

<%-- <c:out value="${menuList}" /> --%>
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

<!-- CSS 스타일링 -->
<style>

/* reset css */
html {
	font-size: 10px
}

body {
	font-size: 1.6rem
}

* {
	margin: 0;
	padding: 0;
}

ul li, ol li {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

#header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 2rem;
	position: relative;
}

#header #gnb {
	display: flex;
	z-index: 99;
	margin-left: auto;
}

#header #gnb>.dept1 {
	position: relative;;
	padding: 1rem 2rem;
	text-align: center;
}

#header #gnb>.dept1>a.active {
	color: red;
	font-weight: bold
}

#header #gnb .inner_menu {
	position: absolute;
	top: 100%;
	left: 50%;
	transform: translateX(-50%);
	width: 100%;
	padding-top: 3rem;
	display: none
}

#header #gnb  .dept2 {
	padding: 1rem 0;
	color: #555
}

#header #gnb  .dept2>a:hover, #header #gnb  .dept2>a:active, #header #gnb  .dept2>a:focus
	{
	font-weight: bold
}

#header .menu_bar {
	margin-left: auto;
	z-index: 9999;
	position: relative;
}

#header .menu_bar.active span:nth-child(1) {
	display: none
}

#header .menu_bar.active span:nth-child(2) {
	transform: rotate(130deg)
}

#header .menu_bar.active span:nth-child(3) {
	transform: rotate(45deg);
	top: 0px;
	position: absolute
}

#header .menu_bar span {
	width: 22px;
	height: 2px;
	background: #555;
	display: block;
	margin: 6px
}

.menu_open {
	position: fixed;
	width: 100%;
	height: 100vh;
	background: #fff;
	top: 0;
	left: 0;
	z-index: 999;
	padding: 3rem;
	display: none
}

.menu_open>ul {
	display: flex;
}

.menu_open>ul li {
	width: 20%;
}

.hd_bg {
	background: #fff;
	width: 100%;
	height: 0;
	left: 0;
	z-index: 1;
	position: absolute;
}

.visual {
	background: #ccd1f1;
	width: 100%;
	height: 15vh;
}
</style>
 

</style>

<body>
<script type="text/javascript">

$(document).ready(function() {
	var gnb = $('#gnb');

	// 마우스 over 시
	gnb.mouseenter(function() {
		$('.inner_menu').show();
		// menu bg
		var menuHeight = $('#header').outerHeight();
		var inmeHegiht = $('.inner_menu').outerHeight();
		$('.hd_bg').css({
			'top': menuHeight + 'px',
			height: inmeHegiht + 'px'
		});
	});

	// 마우스  leave 시
	gnb.mouseleave(function() {
		$('.inner_menu').hide();
		$('.hd_bg').css('height', '0')

	});

	//dept2 hover시 dept1 active
	$('.dept1').mouseenter(function() {
		$(this).children().addClass('active');
		$(this).siblings().children().removeClass('active')
	});
	$('.dept1').mouseleave(function() {
		$(this).children().removeClass('active');
	});
	
	/* 햄버거 메뉴 */
	$('.menu_bar').click(function(){
		$(this).toggleClass('active');
		$('.menu_open').slideToggle();
	});
});

</script>

</body>
</html>