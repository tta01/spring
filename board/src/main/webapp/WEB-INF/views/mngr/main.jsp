<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin Main</title>
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
</style>
</head>

<body>
  <div id="title">
    <p>관리자 메인 페이지</p>
    <button id="logoutBtn">로그아웃</button>
  </div>
  
	<div id="menu-container">
	</div>
	
<script type="text/javascript">
$(document).ready(function() {
    $.ajax({
        url: '/mngr/menuAjax',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            var str = "";  // str을 빈 문자열로 초기화
            // 첫 번째 메뉴 처리
            for (var i = 0; i < response.menuVOList.length; i++) {
                var menuList = response.menuVOList[i];
                var menuNm = menuList.menuNm;
                var menuCd = menuList.menuCd;

                // 최상위 메뉴 처리
                if (menuList.prntMenuCd === 'web') {
                    str += '<li class="root-menu"><a href="javascript:void(0);" class="top-menu" data-menu-cd="' + menuCd + '" >' + menuNm + '</a>';
                    str += '<ul class="ul-top" style="display:none;">'; // 두 번째 메뉴를 위한 <ul> 생성

                    // 두 번째 메뉴 처리
                    response.menuVOList.forEach(function(secondMenu) {
                        if (secondMenu.prntMenuCd === menuCd) {
                            str += '<li><a href="javascript:void(0);" class="second-menu" data-menu-cd="' + secondMenu.menuCd + '">' + secondMenu.menuNm + '</a>';
                            str += '<ul class="ul-second" style="display:none;">'; // 세 번째 메뉴를 위한 <ul> 생성
                            
                            // 세 번째 메뉴 처리
                            response.menuVOList.forEach(function(thirdMenu) {
                                if (thirdMenu.prntMenuCd === secondMenu.menuCd) {
                                    str += '<li><a href="/mngr/main" class="third-menu">' + thirdMenu.menuNm + '</a></li>';
                                }
                            });
                            str += '</ul></li>';
                        }
                    });
                    str += '</ul></li>';
                }
            }
            
            // 최종적으로 생성된 HTML을 menu-container에 삽입
            $('#menu-container').html('<ul>' + str + '</ul>');
            
            // 최상위 메뉴 클릭 시 하위 메뉴 열기/닫기
            $(".top-menu").click(function() {
                var menuCd = $(this).data("menu-cd");
                var ul = $(this).next("ul");

                // 이미 열린 다른 메뉴는 닫고, 클릭한 메뉴는 열기
                $(".ul-top").not(ul).slideUp();  // 다른 ul은 닫기
                ul.stop(true, true).slideToggle(); // 클릭한 ul만 열기

                // 하위 메뉴가 없으면 생성, 있으면 삭제
                if (ul.children().length === 0) {
                    response.menuVOList.forEach(function(secondMenu) {
                        if (secondMenu.prntMenuCd === menuCd) {
                            var secondMenuHTML = '<li><a href="javascript:void(0);" class="second-menu" data-menu-cd="' + secondMenu.menuCd + '">' + secondMenu.menuNm + '</a>';
                            secondMenuHTML += '<ul class="ul-second">';
                            
                            response.menuVOList.forEach(function(thirdMenu) {
                                if (thirdMenu.prntMenuCd === secondMenu.menuCd) {
                                    secondMenuHTML += '<li><a href="/mngr/main" class="third-menu">' + thirdMenu.menuNm + '</a></li>';
                                }
                            });
                            secondMenuHTML += '</ul></li>';
                            ul.append(secondMenuHTML);
                        }
                    });
                }
            });

            // 두 번째 메뉴 클릭 시 하위 메뉴 열기/닫기
            $(document).on("click", ".second-menu", function() {
                var menuCd = $(this).data("menu-cd");
                var ul = $(this).next("ul");

                // 이미 열린 다른 메뉴는 닫고, 클릭한 메뉴는 열기
                $(".ul-second").not(ul).slideUp();  // 다른 ul은 닫기
                ul.stop(true, true).slideToggle(); // 클릭한 ul만 열기

                // 하위 메뉴가 없으면 생성, 있으면 삭제
                if (ul.children().length === 0) {
                    response.menuVOList.forEach(function(thirdMenu) {
                        if (thirdMenu.prntMenuCd === menuCd) {
                            ul.append('<li><a href="/mngr/main" class="third-menu">' + thirdMenu.menuNm + '</a></li>');
                        }
                    });
                }
            });

        },
        error: function(xhr, status, error) {
            console.error("전송실패", status, error);
        }
    });
});
</script>

</body>
</html>
