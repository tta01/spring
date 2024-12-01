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
    width: 50%; /* 좌측 영역 너비 50% */
/*     background: #ff0; */
    padding: 20px;
    overflow-y: auto; /* 내용이 넘치면 스크롤이 생기도록 설정 */
}

/* 우측 콘텐츠 */
.right {
    width: 50%; /* 우측 영역 너비 50% */
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
    
</style>
</head>

<body>
  <div id="title">
    <p>관리자 메인 페이지</p>
    <button id="logoutBtn">로그아웃</button>
  </div>
  
	<div class="container">
        <div class="left">
			<div id="menu-container"> </div>
        </div>
        
        <div class="right">
        	<div id="content"> </div>
        </div>
	</div>
    
    
	
	<div id="content"> </div>
	
<script type="text/javascript">
$(document).ready(function() {
    $.ajax({
        url: '/mngr/menuAjax',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            var str = "";  // str을 빈 문자열로 초기화

            // 첫 번째 메뉴 처리 (최상위 메뉴)
            for (var i = 0; i < response.menuVOList.length; i++) {
                var menuList = response.menuVOList[i];
                var menuNm = menuList.menuNm;
                var menuCd = menuList.menuCd;

                // 최상위 메뉴 처리
                if (menuList.prntMenuCd === 'web') {
                    str += '<li class="root-menu"><a href="javascript:void(0);" class="top-menu" data-menu-cd="' + menuCd + '" >' + menuNm + '</a>';
                    str += '<ul class="ul-top"></ul>'; // 두 번째 메뉴는 아직 추가하지 않음
                    str += '</li>';
                }
            }
            
            // 최종적으로 생성된 HTML을 menu-container에 삽입
            $('#menu-container').html('<ul>' + str + '</ul>');
            
            // 메뉴 클릭 시 하위 메뉴 추가/삭제
            $(".top-menu").click(function() {
                var menuCd = $(this).data("menu-cd");
                var ul = $(this).next("ul");

                // 하위 메뉴가 없으면 추가, 있으면 삭제
                if (ul.hasClass("ul-top")) {
                    // ul-top 하위 메뉴가 없으면 생성
                    if (ul.children().length === 0) {
                        response.menuVOList.forEach(function(secondMenu) {
                            // 두 번째 메뉴만 추가
                            if (secondMenu.prntMenuCd === menuCd) {
                                var secondMenuHTML = '<li><a href="javascript:void(0);" class="second-menu" data-menu-cd="' + secondMenu.menuCd + '">' + secondMenu.menuNm + '</a>';
                                secondMenuHTML += '<ul class="ul-second"></ul>';

                                secondMenuHTML += '</ul></li>';
                                ul.append(secondMenuHTML); // 두 번째 메뉴 추가
                            }
                        });
                    } else {
                        // 하위 메뉴가 있으면 삭제
                        ul.empty();
                    }
                }
            });

            // 두 번째 메뉴 클릭 시 하위 메뉴 추가/삭제
            $(document).on("click", ".second-menu", function(event) {
                event.stopPropagation();  // 클릭 이벤트 여기서만
                var menuCd = $(this).data("menu-cd"); // data- 뒤에 붙은  id 값으로 불러올 수 있음
                var ul = $(this).next("ul");

                // 하위 메뉴가 없으면 생성, 있으면 삭제
                if (ul.hasClass("ul-second")) {
                    // ul-second 하위 메뉴가 없으면 생성
                    if (ul.children().length === 0) {
                        response.menuVOList.forEach(function(thirdMenu) {
                            // 최하위 메뉴가 하위 메뉴에 속하면 생성하게 / 두 번째 부모코드와 메뉴코드가 일치하는 것만 출력
                            if (thirdMenu.prntMenuCd === menuCd) {
                                ul.append('<li><a href="javascript:location.href="/mngr/main"" class="third-menu">' + thirdMenu.menuNm + '</a></li>');
                            }
                        });
                    } else {
                        // 하위 메뉴가 있으면 삭제. 동적으로 추가된 메뉴들만 제거
                        // remove();를 사용하면 DOM에서 해당 태그를 포함하여 하위(자식) 다 삭제
//                         ul.remove();
                        ul.empty();
                    }
                }
            });
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

</script>

</body>
</html>