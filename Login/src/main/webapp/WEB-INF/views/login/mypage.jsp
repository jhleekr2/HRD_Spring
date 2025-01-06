<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보 출력</h1>
<hr>

<%-- ${info} --%>
<!-- 개발할때 미리 체크해본다 -->

회원번호 : ${info.no }<br>
아이디 : ${info.id }<br>
이메일 : ${info.email }<br>
전화번호 : ${info.phone }<br>

<a href="./main"><button>메인으로</button></a>
</body>
</html>