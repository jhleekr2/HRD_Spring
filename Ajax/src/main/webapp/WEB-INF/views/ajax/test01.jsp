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
			url: "./test01_ok",
			data: {},
			dataType: "text", //text와 json 구별할 것!
			success: res => {
				console.log("AJAX 성공");
				
				//응답 데이터
				//데이터타입이 json 타입일때 jQuery가 알아서 Object로 파싱해서 준다
				//이때 JQuery는 파싱 실패시 AJAX 실패 처리를 할 것이다
				console.log( res );
				console.log( JSON.parse(res) );				
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

<h1>AJAX 테스트 01</h1>
<hr>

<button id="ajax">AJAX 요청 보내기</button>

</body>
</html>