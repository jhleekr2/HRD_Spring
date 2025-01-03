<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>스프링 MVC 테스트</h1>
<h3>부서 목록</h3>
<hr>

<table border="1">
<tr>
	<th>부서번호</th>
	<th>부서명</th>
	<th>위치</th>
</tr>

<c:forEach var="dept" items="${list }">
<tr>
	<td>${dept.deptno }</td>
	<td>
		<a href="./info?deptno=${dept.deptno }">
		${dept.dname }
		</a>
	</td>
	<td>${dept.loc }</td>
</tr>
</c:forEach>
</table>
</body>
</html>