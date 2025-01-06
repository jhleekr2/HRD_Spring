<%@ page import="java.util.Date" %>

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

<h1>메인화면</h1>
<hr>

로그인 상태 : ${islogin }<br>
비로그인 상태 : ${empty islogin }

<hr>

<%-- 비로그인 상태 --%>
<c:if test="${empty islogin }">

<a href="./login"><button>로그인</button></a>
<a href="./join"><button>회원가입</button></a>

</c:if>

<%-- <c:if test="${islogin }"> --%>
<%-- islogin!= null && islogin == true 를 의미--%>
<c:if test ="${not empty islogin and islogin}">
<%-- <c:if test ="${not empty islogin and islogin eq true }"> 로 써도 된다 --%>
<!-- 로그인 버튼과 로그아웃 버튼은 분리시켜야 한다 -->
<!-- 로그아웃 버튼 -->
<!-- <a href="/login/logout" method="get"><button>로그아웃</button></a> -->
<a href="./mypage"><button>마이페이지</button></a>
<a href="./logout"><button>로그아웃</button></a>
</c:if>

세션 아이디 : <%=session.getId() %><br>
세션을 생성한 시간 : <%=new Date(session.getCreationTime()) %><br>
최근(마지막) 접속한 시간 : <%=new Date(session.getLastAccessedTime()) %>
</body>
</html>