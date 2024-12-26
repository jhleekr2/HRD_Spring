<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:import url="../layout/header.jsp"/>

<div class="container">

<h1 class="text-center">회원가입</h1>
<hr>

<div class="text-center col-8 mx-auto">
<%-- <form action="<%=request.getContextPath() %>" method="post"> --%>
<form action="./join" method="post">
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

<div class="row mb-3">
	<label class="col-3 col-form-label" for="nick">닉네임</label>
	<div class="col-9">
		<input type="text" class="form-control" name="nick" id="nick" value="c"><br>
	</div>
</div>

	<button class="btn btn-primary">회원가입</button>
	
</form>
</div>

</div>
</body>
</html>