// fileCreate

$(document).ready(function() {
    $("#uploadFile").on("change", fn_file);
}); // ready end

function btn_submit(){ // 되는지 확인 필요
//	$('[name=frm] #useYn').val('Y');
	$('input[name="useYn"]').val('Y');
	console.log($('input[name="useYn"]').val());
}

// 파일 부분 삭제 함수
function fileDelete(fileNum) {
    // content_files 배열에서 해당 파일 삭제
    content_files.splice(fileNum, 1);  // 삭제된 파일 제거
    // DOM에서 삭제된 파일의 HTML 요소 제거
    $('#file' + fileNum).remove();
    $('input[type="file"]').val('');

    // 파일 번호 재정렬 필요 시 처리 (옵션)
    console.log("content_files : "+content_files);  // 현재 배열 상태 출력
}; // fileDelete end
    
// 파일 고유넘버
var fileNum = 0;
// 첨부파일 배열
var content_files = new Array();

function fn_file(e) {
    // 파일 선택이 되었는지 체크
   var files2 = e.target.files;
    // 파일 배열 담기
   var filesArr = Array.prototype.slice.call(files2);
    
 // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (fArr) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(fArr);
        
        $('#atchfileChange').append(
        	    '<div id="file' + fileNum + '" onclick="fileDelete(' + fileNum + ')">'  
        	    + '<font style="font-size:14px">' + fArr.name + '</font>'  
        	    + '<img src="/resources/images/delete.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
        	    + '</div>' 
        	);

        fileNum ++;
      };
      reader.readAsDataURL(fArr);
    }); // forEach end
 
    //초기화
   $("#fileNm").val("");
    
// function registerAction(){
		
// 	var form = $("form")[0];        
//  	var formData = new FormData(form);
// 		for (var x = 0; x < content_files.length; x++) {
// 			// 삭제 안한것만 담아 준다. 
// 			if(!content_files[x].is_delete){
// 				 formData.append("article_file", content_files[x]);
// 			}
// 		}
// }; // registerAction end -> return false 위에 있어야 함

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
         	console.log("전송 성공");
         	
        },
        error: function(xhr, status, error) {
           console.error("첨부파일 오류 발생", status, error);
           alert("서버 오류: " + error);
       }
   }); // ajax end
   

// 	 return false;
};