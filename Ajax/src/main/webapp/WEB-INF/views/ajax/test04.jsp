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
			url: "./test04_ok",
			data: {},
			dataType: "html", //text와 json 구별할 것!
			success: res => {
				console.log("AJAX 성공");
				
				//응답 데이터 확인( HTML Text )
				console.log( res );
				
				$("#resultView").html( res );
				
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

<h1>AJAX 테스트 04</h1>
<hr>

<button id="ajax">AJAX 요청 보내기</button>

<hr>
<div id="resultView">
<!-- 원래는 JSON 응답 자료를 DOM API 이용하여 채워넣어야 했지만, 
여기서는 그렇게 안하고 JSP 파일을 넣을 것이다 -->


</div>

</body>
</html>