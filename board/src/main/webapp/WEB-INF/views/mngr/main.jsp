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
document.addEventListener('DOMContentLoaded', function() {
    // 페이지 로딩 시 하위 메뉴는 숨겨두기
//     document.querySelectorAll('.submenu').forEach(function(submenu) {
//         submenu.style.display = 'none';
//     });

    // .top 클릭 시
    const tops = document.querySelectorAll('.top');
    tops.forEach(function(top) {
        top.addEventListener('click', function() {
            console.log("11111");
            var all = this.nextElementSibling; // .all 요소 가져오기
            console.log("22222");
            if (all.style.display === 'none' || all.style.display === '') {
                all.style.display = 'block'; // 하위 메뉴 보이기
            } else {
                all.style.display = 'none'; // 하위 메뉴 숨기기
            }
            console.log("33333");
            this.parentElement.classList.toggle('active'); // 부모에 active 클래스 토글
        });
    });

    // 메뉴 클릭 시 하위 메뉴 열고 닫기
    const menuItems = document.querySelectorAll('.menu-item');
    menuItems.forEach(function(menuItem) {
        menuItem.addEventListener('click', function() {
            var submenu = this.nextElementSibling; // 클릭한 메뉴의 하위 메뉴
            if (submenu.style.display === 'none' || submenu.style.display === '') {
                submenu.style.display = 'block'; // 하위 메뉴 보이기
            } else {
                submenu.style.display = 'none'; // 하위 메뉴 숨기기
            }
            this.parentElement.classList.toggle('active'); // 부모에 active 클래스 토글
        });
    });

    $(document).ready(function() {
        // 로그아웃 버튼 클릭 이벤트
        $('#logoutBtn').click(function() {
            if (confirm("로그아웃 하시겠습니까?")) {
                $.ajax({
                    url: '/mngr/logout',  // 로그아웃 API URL
                    type: 'POST',          // POST 요청
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
});



// jQuery 
/*	$(document).ready(function() {
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
	});
	*/

</script>
</body>
</html>
