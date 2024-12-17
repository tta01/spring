<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<link rel="stylesheet" href="/resources/css/common.css">

<!DOCTYPE html>
<html>


<style>
/* 전체적인 폼 디자인 */

</style>

<head>
    <meta charset="UTF-8">
    <title>공지사항 등록</title>
</head>

<body>
<div class="board-list">

    <h1>공지사항 등록</h1>

    <!-- 공지사항 등록 폼 -->
    
	<form name="frm" action="/user/board/createForm" method="post" enctype="multipart/form-data">
	<%--     <p><input type="hidden" id="memId" name="memId" value="${getCurrentLoginVO.memId}" /></p> --%>
	    <p><input type="hidden" id="memId" name="memId" value="admin" /></p>
	
	    <table class="form-table">
	        <tr>
	            <th>공지사항 제목</th>
	            <td><input type="text" id="boardTitle" name="boardTitle" placeholder="공지사항 제목입력" required /></td>
	        </tr>
	        <tr>
	            <th>공지사항 내용</th>
	            <td><textarea id="boardCntnt" name="boardCntnt" required></textarea></td>
	        </tr>
	        <tr>
<%-- 		        <c:if test="${.atchFileSn!=null}"> --%>
		            <th>공지사항 파일</th>
		            <td>
			            <input type="file" id="uploadFile" name="uploadFile" multiple />
			            <div id="atchfileChange"></div>
		            </td>
<%-- 		        </c:if> --%>
	        </tr>
	    </table>
	
	    <div class="form-buttons">
	        <button type="submit"> 등록 </button>
	        <a href="<c:url value='/user/board/list'/>" >목록</a>
	    </div>
	</form>

</div>

<script>
$(document).ready(function() {
    $("#uploadFile").on("change", fn_file);
    });
    
//파일 고유넘버
// var fileNum = 0;
// 첨부파일 배열
// var content_files = new Array();

function fn_file(e) {
    // 파일 선택이 되었는지 체크
//     var files = e.target.files;
		
//     // 파일이 선택되었을 경우 파일명 출력
//     if (files.length > 0) {
//         for (var i = 0; i < files.length; i++) {
//             console.log("파일명: " + files[i].name +"," + files[i].size +"," + files[i].type );
//             uploadFile = files[i].name;
//         }
//     } else {
//         console.log("파일이 선택되지 않았습니다.");
//     }
/*
    // 파일 배열 담기
   var filesArr = Array.prototype.slice.call(files);
    
 // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(f);

//         $('#atchfileChange').append(
//        		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
//        		+ '<font style="font-size:12px">' + f.name + '</font>'  
//        		+ '<img src="/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
//        		+ '<div/>'
// 		);

        fileNum ++;
      };
      reader.readAsDataURL(f);
    });
    console.log("content_files"+content_files);
    
    //초기화
    $("#fileNm").val("");
    
/*    
 // 파일 부분 삭제 함수
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no].is_delete = true;
	$('#' + fileNum).remove();
	fileCount --;
    console.log(content_files);
}
  
	// 파일 명, 크기 등등등 SYSTEM.OUT.PRINTLN 으로 ㄹ출력해보기
	// 파일 업로드 될 때가 언제일지를 중점으로 두고!!! ajax를 구현하면 됨 / 저장된 상태는 아님.
	
function registerAction(){
		
	var form = $("form")[0];        
 	var formData = new FormData(form);
		for (var x = 0; x < content_files.length; x++) {
			// 삭제 안한것만 담아 준다. 
			if(!content_files[x].is_delete){
				 formData.append("article_file", content_files[x]);
			}
		}
		*/		
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log("files : "+files);
		
		for(var i =0; i<files.length; i++){
			formData.append("uploadFile", files[i]);
		}
		
	$.ajax({
		url: '/user/board/fileAjax',
        type: 'POST',
        processData : false,
        contentType : false,
        data: formData,
        success: function(response) {
         	console.log("fileAjax :"+response);

         	alert("Uploaded");
        },
        error: function(xhr, status, error) {
           console.error("메뉴 생성 중 오류 발생", status, error);
           alert("서버 오류: " + error);
       }
   });
};
// 	 return false;
// };

</script>
</body>

</html>

