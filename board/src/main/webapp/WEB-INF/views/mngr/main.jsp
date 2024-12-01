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
  
	<ul id="menu">
		
	</ul>
	
<script type="text/javascript">
// function fn_openSubMenu() {
$(document).ready(function() {
	
    $.ajax({
        url: '/mngr/menuAjax',
        type: 'GET',
//         data: {
//             "prntMenuCd": prntMenuCd
//         },
        dataType: 'json',
        success: function(response) {
            console.log(response);
            var str = ""; // HTML을 담을 변수
            
            // 최상위 메뉴들을 루프 돌기
            for (var i = 0; i < response.menuVOList.length; i++) {
                var menuList = response.menuVOList[i];
                var menuNm = menuList.menuNm;
                var menuCd = menuList.menuCd; 
//                 debugger;
                
                // 최상위 메뉴의 조건
                console.log(menuList.prntMenuCd === 'web');
                if (menuList.prntMenuCd === 'web') {
                    str += '<li class="root-menu"><a href="javascript:void(0);" class="top-menu" >' + menuNm + '</a>';
                    str +='<ul class="ul-top">';
                    
                    // 하위 메뉴들
                    response.menuVOList.forEach(function(secondMenu) {
                        if (secondMenu.prntMenuCd === menuCd) {
                            str += '<li><a href="javascript:void(0);" class="second-menu">' + secondMenu.menuNm + '</a>';
                            str += '<ul class="ul-second">';
                            
                            // 하위의 하위
                            response.menuVOList.forEach(function(thirdMenu) {
                                if (thirdMenu.prntMenuCd === secondMenu.menuCd) {
                                    str += '<li><a href="/mngr/main" class="third-menu">' + thirdMenu.menuNm + '</a></li>';
                                }
                            });
                            str += '</ul></li>';
                        }
                    });
                    str += '</li></ul></li>';
                }
            }
            
            // 동적으로 메뉴 업데이트
            document.getElementById('menu').innerHTML = str;
        },
        error: function(xhr, status, error) {
            console.error("전송실패", status, error);
        }
    });
}); 

// 로그아웃 버튼 클릭 시 처리
$('#logoutBtn').click(function() {
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
});

$(document).ready(function() {
    // 최상위 메뉴 클릭 시 하위 메뉴 열기/닫기
    $(document).on('click', '.root-menu', function() {
        // 해당 메뉴에 연결된 하위 메뉴 열기/닫기
        $(this).next('.ul-top').stop(true, true).slideToggle();
        $(this).parent().toggleClass('active'); // 해당 메뉴에 active 클래스 추가/삭제
        
        // 다른 최상위 메뉴의 하위 메뉴가 열려있으면 닫기
        $('.root-menu').not(this).next('.ul-top').slideUp();
        $('.root-menu').not(this).parent().removeClass('active');
    });

    // 두 번째 레벨 메뉴 클릭 시 하위 메뉴 열기/닫기
    $(document).on('click', '.second-menu', function() {
        // 해당 메뉴에 연결된 하위 메뉴 열기/닫기
        $(this).next('.ul-second').stop(true, true).slideToggle();
        $(this).parent().toggleClass('active'); // 해당 메뉴에 active 클래스 추가/삭제
    });
});

</script>

</body>
</html>
