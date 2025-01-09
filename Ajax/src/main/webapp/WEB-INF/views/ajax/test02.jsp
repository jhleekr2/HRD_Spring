<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
$(function() {
	
	$("#ajax").click(() => {
		$.ajax({
			type: "get",
			url: "./test02_ok",
			data: {},
			dataType: "json", //text와 json 구별할 것!
			success: res => {
				console.log("AJAX 성공");
				
				//응답 데이터 확인( JSON Object )
				console.log( res );
				
			}
			, error: () => {
				console.log("AJAX 실패");
			}
		});
	});
});
</script>
</head>
<body>

<h1>AJAX 테스트 02</h1>
<hr>

<button id="ajax">AJAX 요청 보내기</button>

</body>
</html>