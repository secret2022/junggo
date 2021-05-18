<!-- 한글처리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- DAO 

-->


<!-- JSTL -->
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- servlet

 -->

<!doctype html>
<html>
  <head>
    <title>중고거래 사이트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">   <!-- 렌더링 확대와 축소  부트 스트랩 모바일 우선 --> 
   	
  	<link rel="stylesheet"  href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/custom.css">
  	<script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/popper.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    

<script type="text/javascript">

//모달창 종료시 입력값 초기화
	$('.modal').on('hidden.bs.modal', function(e) {
		console.log('modal close');
		$(this).find('form')[0].reset()
	});

//파일 업로드시 리뷰처리
	function handleFileSelect() {
		
		var files = document.getElementById('p_file').files[0];
		var reader = new FileReader();
		//alert("파일명=" + files);       
		reader.onload = (function(theFile) {
			return function(e) {
				//원본 var img_view = ['<img src="', e.target.result, '" name="', escape(theFile.name),'"   width="400" height="200"  alt="tis" />'].join('');
				var img_view = [ '<img src=', e.target.result + '  width="450" height="250"  alt="tis" />' ]
						.join('');
				document.getElementById('preview').innerHTML = img_view;
			};
		})(files);
		reader.readAsDataURL(files);
	}//end
//파일 업로드시 리뷰처리	
	 function handle_FileSelect() {
		console.log("Buy 삽니다.");
		var files = document.getElementById('1p_file').files[0];
		var reader = new FileReader();
		//alert("파일명=" + files);       
		reader.onload = (function(theFile) {
			return function(e) {
				//원본 var img_view = ['<img src="', e.target.result, '" name="', escape(theFile.name),'"   width="400" height="200"  alt="tis" />'].join('');
				var img_view = [ '<img src=', e.target.result + '  width="450" height="250"  alt="tis" />' ]
						.join('');
				document.getElementById('1preview').innerHTML = img_view;
			};
		})(files);
		reader.readAsDataURL(files);
		

	
		/*keyfield 변경시 기존 sval 값 삭제 */
		function myclear() {
			myform.keyword.value = "";
			myform.keyword.focus();
		}

	}//end
</script>
</head>