<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Admin Login</title>
</head>

<body>

	<h1>관리자 로그인</h1>
	<form id="loginForm" name="loginForm" action="/mngr/login" method="post">
		<div>
			<p>아이디</p>
			<input type="text" id="mngrId" name="mngrId" placeholder="아이디" required /></td>
			
			<p>비밀번호</p>
			<input type="text" id="pswd" name="pswd" placeholder="비밀번호" required /></td>
			
		</div>
		
		<button type="submit" >로그인</button>
	</form>
	
</body>
<script type="text/javascript">
$(function() {
    $("#loginForm").on("submit", function(e) {
        e.preventDefault();

        var mngrId = $("#mngrId").val();
		var pswd = $("#pswd").val();
// debugger;
        $.ajax({
            url: "/mngr/loginAjax",
            type: "POST",
            data:{
            	"mngrId":mngrId,
            	"pswd":pswd
            },
            dataType: "json",
            success: function(result) {
                if (result.result === 0) { 
                    // 로그인 성공
                    location.href = "/mngr/main";
                    alert("로그인 되었습니다.");
                } else if (result.result === 1) {
                    // 아이디가 존재하지 않음
                    alert("아이디나 비밀번호를 다시 확인해 주세요.");
                } else if (result.result === 2) {
                    // 비밀번호 불일치
                    alert("비밀번호가 맞지 않습니다. 다시 로그인해주세요.");
                }
            },
            error: function(request, status, error) {
                alert("시스템에 오류가 발생하였습니다. 고객센터로 문의바랍니다.");
            }
        });
    });
});

</script>

</html>