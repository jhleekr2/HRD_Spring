<%@ page import="java.util.Date" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">

</script>
</head>
<body>

<h1>로그인</h1>
<hr>

<!-- TilesViewResolver라는 JSP 로그인 화면구성 API가 있었다 -->
<!-- 하지만, 지금은 없어진 상태.(React, vue.js 등의 프론트엔드 API에 밀려서 사장됨) -->
로그인 상태 : ${login }<br>
비로그인 상태 : ${empty login }

<hr>

<%-- 비로그인 상태 --%>
<c:if test="${empty login }">

<!-- <form action="/login/login" method="post"> -->
<!-- <form action="./login" method="post"> -->
<form action="<%=request.getContextPath() %>" method="post">

	<label for="id">아이디 <input type="text" name="id" id="id" value="a"></label><br>
	<label for="pw">패스워드 <input type="text" name="pw" id="pw" value="b"></label><br><br>
	
	<button>로그인</button>
	
</form>

</c:if>

세션 아이디 : <%=session.getId() %><br>
세션을 생성한 시간 : <%=new Date(session.getCreationTime()) %><br>
최근(마지막) 접속한 시간 : <%=new Date(session.getLastAccessedTime()) %>

<%-- <c:if test="${login }"> --%>
<%-- login!= null && login == true 를 의미--%>
<c:if test ="${not empty login and login eq true }">
<%-- <c:if test ="${not empty login and login }"> 으로 써도 된다 --%>

<!-- 로그인 버튼과 로그아웃 버튼은 분리시켜야 한다 -->
<!-- 로그아웃 버튼 -->
<!-- <a href="/login/logout" method="get"><button>로그아웃</button></a> -->
<a href="/login/logout"><button>로그아웃</button></a>
</c:if>

</body>
</html>