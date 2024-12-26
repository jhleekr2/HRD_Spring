<%@ page import="java.util.Date" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:import url="../layout/header.jsp"/>

<div class="container">
<h1 class="text-center">메인 화면</h1>
<hr>

로그인 상태 : ${islogin }<br>
비로그인 상태 : ${empty islogin }

<hr>

<div class="text-center">
<%-- 비로그인 상태 --%>
<c:if test="${empty islogin }">

	<a class="btn btn-info" href="./login">로그인</a>
	<a class="btn btn-primary" href="./join">회원가입</a><br>
	
</c:if>

<%-- <c:if test="${islogin }"> --%>
<%-- islogin!= null && islogin == true 를 의미--%>
<c:if test ="${not empty islogin and islogin eq true }">
<%-- <c:if test ="${not empty islogin and islogin }"> 으로 써도 된다 --%>

<!-- 로그인 버튼과 로그아웃 버튼은 분리시켜야 한다 -->
<!-- 로그아웃 버튼 -->
<!-- <a href="/member/logout" method="get"><button>로그아웃</button></a> -->
<a class="btn btn-success" href="../board/list">게시글 목록</a>
<a class="btn btn-warning" href="./logout">로그아웃</a><br>

</c:if>
세션 아이디 : <%=session.getId() %><br>
세션을 생성한 시간 : <%=new Date(session.getCreationTime()) %><br>
최근(마지막) 접속한 시간 : <%=new Date(session.getLastAccessedTime()) %>
</div>
</div>
</body>
</html>