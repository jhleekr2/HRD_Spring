<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<hr>

<%-- <form action="<%=request.getContextPath() %>" method="post"> --%>
<form action="./join" method="post">

	<label for="id">아이디 <input type="text" name="id" id="id" value="a"></label><br>
	<label for="pw">패스워드 <input type="text" name="pw" id="pw" value="b"></label><br>
	<label for="email">이메일 <input type="text" name="email" id="email" value="c"></label><br>
	<label for="phone">전화번호 <input type="text" name="phone" id="phone" value="0"></label>
	
	<button>회원가입</button>
	
</form>

</body>
</html>