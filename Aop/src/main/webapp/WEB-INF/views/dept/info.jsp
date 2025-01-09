<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>스프링 MVC 테스트</h1>
<h3>부서 정보</h3>
<hr>

<h3>부서 번호 : ${res.deptno }</h3>
<h3>부서명 : ${res.dname }</h3>
<h3>위치 : ${res.loc }</h3>
<h3>부서 번호 : ${dept.deptno }</h3>
<h3>부서명 : ${dept.dname }</h3>
<h3>위치 : ${dept.loc }</h3>

<a href="./list"><button>목록</button></a>

</body>
</html>