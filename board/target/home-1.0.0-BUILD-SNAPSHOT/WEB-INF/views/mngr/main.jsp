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
function fn_openSubMenu() {
    $.ajax({
        type: 'get',
        url: '/mngr/menuAjax',
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
                
                // 최상위 메뉴의 조건
                if (menuList.prntMenuCd === 'web') {
                    str += `<li><button onclick="addBtn(this)">+</button><button onclick="delBtn(this)">-</button>`;
                    str += `<a href="javascript:void(0);" class="menu-list">${menuNm}</a>`;
                    
                    // 하위 메뉴들
                    response.menuVOList.forEach(function(subMenu) {
                        if (subMenu.prntMenuCd === menuList.menuCd) {
                            str += `<li><a href="javascript:void(0);" class="menu-item">${subMenu.menuNm}</a>`;
                            str += `<ul class="submenu">`;

                            // 하위 메뉴에 대한 하위 메뉴들을 다시 확인
                            response.menuVOList.forEach(function(subSubMenu) {
                                if (subSubMenu.prntMenuCd === subMenu.menuCd) {
                                    str += `<li><a href="javascript:void(0);">${subSubMenu.menuNm}</a></li>`;
                                }
                            });
                            str += `</ul></li>`;
                        }
                    });
                    str += `</ul></li>`;
                }
            }
            
            // 동적으로 메뉴 업데이트
            document.getElementById('menu').innerHTML = str;
        },
        error: function(xhr, status, error) {
            console.error("전송실패", status, error);
        }
    });
}; 

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

// 메뉴 클릭 시 하위 메뉴 열기/닫기
$(document).on('click', '.menu-item', function() {
    $(this).next('.submenu').stop(true, true).slideToggle(); // 해당 하위 메뉴 열기/닫기
    $(this).parent().toggleClass('active'); // 해당 메뉴에 active 클래스 추가/삭제
});
</script>

</body>
</html>
