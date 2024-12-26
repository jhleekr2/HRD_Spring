<%@ page import="java.util.Date" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="../layout/header.jsp"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
$(function() {
	$("#loginid").focus();
	
	//폼 태그가 submit될 때 처리
	$("form").submit(function() {
	
		if( $("#id").val() == '') {
			alert("아이디를 입력하세요");
			$("#id").focus();
			
			//submit 처리 중단
			return false;
		}
		
		if( $("#pw").val() == '') {
			alert("패스워드를 입력하세요");
			$("#pw").focus();
			
			//submit 처리 중단
			return false;
		}
	})

})
</script>

<div class="container">

<h1 class="text-center">로그인</h1>
<hr>

<!-- TilesViewResolver라는 JSP 로그인 화면구성 API가 있었다 -->
<!-- 하지만, 지금은 없어진 상태.(React, vue.js 등의 프론트엔드 API에 밀려서 사장됨) -->
로그인 상태 : ${islogin }<br>
비로그인 상태 : ${empty islogin }

<hr>

<div class="text-center col-8 mx-auto">
<%-- 비로그인 상태 --%>
<c:if test="${empty islogin }">

<!-- <form action="/member/login" method="post"> -->
<!-- <form action="./login" method="post"> -->

<form action="<%=request.getContextPath() %>" method="post">
<div class="row mb-3">
	<label class="col-3 col-form-label" for="id">아이디</label>
	<div class="col-9">
		<input type="text" class="form-control" name="id" id="id" value="a"><br>
	</div>
</div>

<div class="row mb-3">
	<label class="col-3 col-form-label" for="pw">패스워드</label>
	<div class="col-9">
		<input type="text" class="form-control" name="pw" id="pw" value="b"><br>
	</div>	
</div>
<!-- 	<button class="btn btn-info">로그인</button> -->
	<!-- 로그인 버튼과 메인 화면으로 버튼을 가로로 배치 -->
	<!-- 이때 bootstrap의 d-flex를 사용한다. -->
    <div class="d-flex justify-content-center">
        <button class="btn btn-info me-2">로그인</button>
        <a class="btn btn-primary" href="./main">메인 화면으로</a>
    </div>
</form>

</c:if>


<%-- <c:if test="${islogin }"> --%>
<%-- islogin!= null && islogin == true 를 의미--%>
<c:if test ="${not empty islogin and islogin eq true }">
<%-- <c:if test ="${not empty islogin and islogin }"> 으로 써도 된다 --%>

<!-- 로그인 버튼과 로그아웃 버튼은 분리시켜야 한다 -->
<!-- 로그아웃 버튼 -->
<!-- <a href="/member/logout" method="get"><button>로그아웃</button></a> -->
<a class="btn btn-warning" href="./logout">로그아웃</a>
<a class="btn btn-primary" href="./main">메인 화면으로</a><br>
</c:if>


세션 아이디 : <%=session.getId() %><br>
세션을 생성한 시간 : <%=new Date(session.getCreationTime()) %><br>
최근(마지막) 접속한 시간 : <%=new Date(session.getLastAccessedTime()) %><br>
</div>
</div>

</body>
</html>