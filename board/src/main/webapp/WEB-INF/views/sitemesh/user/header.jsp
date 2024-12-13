<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>

<html>
<!-- <tiles:importAttribute name="menuList" /> -->

<link rel="stylesheet" href="/resources/css/header.css">

<head>
<body>
<header class="top-bar con-min-width">
	<!--header-->
	<div id="header">

		<div class="div-logo">
			<h1 class="logo">
				<a href="#">K-Startup</a>
<%-- 		<c:out value="${menuList}" /> --%>
			</h1>
		</div>
		
		<nav class="menu-header-nav">
			<div class="menu-top-div">
				<ul id="gnb">
					<c:forEach var="menu" items="${menuList}">
						<c:if test="${menu.prntMenuCd == 'web'}">

							<c:forEach var="subMenu" items="${menuList}">
								<c:if test="${menu.menuCd == subMenu.prntMenuCd}">
									<li class="menu-top-li"><span>${subMenu.menuNm}</span>

										<ul class="inner-menu">
											<c:forEach var="lowestMenu" items="${menuList}"
												varStatus="stat">
												<c:if test="${subMenu.menuCd == lowestMenu.prntMenuCd}">
													<li class="menu-mid-li"><a href="${lowestMenu.url}">${lowestMenu.menuNm}</a></li>
												</c:if>
											</c:forEach>
										</ul></li>
								</c:if>
							</c:forEach>

						</c:if>
					</c:forEach>

				</ul>
			</div>
		</nav>

		<a href="#" class="menu-bar"> 
			<span></span> 
			<span></span> 
			<span></span>
		</a>

		<div class="menu-open">
			<ul>
				<li class="dept1"><a href="#">메뉴1</a>
					<ul>
						<li class="dept2"><a href="#">메뉴1</a></li>
						<li class="dept2"><a href="#">메뉴1</a></li>
					</ul></li>
				<li class="dept1"><a href="#">메뉴2</a>
					<ul>
						<li class="dept2"><a href="#">메뉴2</a></li>
						<li class="dept2"><a href="#">메뉴2</a></li>
					</ul></li>
			</ul>
		</div>

	</div>
	
<%-- 	<decorator:head /> --%>
	
</header>
</div>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		var gnb = $('#gnb');

		// 마우스 over 시
		gnb.mouseenter(function() {
			$('.inner-menu').show();
			// menu bg
			var menuHeight = $('#header').outerHeight();
			var inmeHegiht = $('.inner-menu').outerHeight();
		});

		// 마우스  leave 시
		gnb.mouseleave(function() {
			$('.inner-menu').hide();
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
		$('.menu-bar').click(function() {
			$(this).toggleClass('active');
			$('.menu-open').slideToggle();
		});
	});
</script>

</body>

</html>