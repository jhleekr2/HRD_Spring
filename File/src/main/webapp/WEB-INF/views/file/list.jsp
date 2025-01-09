<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, th, td {
	border: 1px solid #ccc;
	border-collapse: collapse;
}
</style>
</head>
<body>
<h1>파일 목록</h1>
<hr>

<%-- ${list } --%>

<a href="./fileup"><button>파일 업로드</button></a>

<table>
<thead>
<tr>
	<th>파일번호</th>
	<th>제목</th>
	<th>파일명</th>
</tr>
</thead>

<tbody>

<c:forEach var="filetest" items="${list }">
<!-- items 모델에 들어있는것을 var를 통해 하나씩 빠져나온다 -->
<tr>
	<td>${filetest.fileno }</td>
	<td>
		<a href="./download?fileno=${filetest.fileno }">
		${filetest.title }
		</a>
	</td>
	<td>
<%-- 		<a href="/up/${filetest.storedName }">${filetest.originName }</a> --%>
<%--		스프링 프레임워크가 해당 경로에 있는 업로드된 파일을 차단한다 --%>
<%--		차단을 억지로 풀려면 servlet-context.xml 파일을 수정해야 한다 --%>
		<a href="/up/${filetest.storedName }" download="${filetest.originName }" }>${filetest.originName }</a>
<%-- 		<img src="/up/${filetest.storedName }">  --%>
	</td>
</tr>
</c:forEach>

</tbody>

</table>
</body>
</html>