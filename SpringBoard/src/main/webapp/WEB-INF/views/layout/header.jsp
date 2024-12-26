<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Board</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"> 

<!-- Bootstrap JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>
<style type="text/css">
.wrap {
	width: 1200px;
}

.header h1 a {
	text-decoration: none;
	color: inherit;
}
#header, #footer {
 	background: #99f;
}
</style>
</head>
<body>
<div id="header" class="text-center">
<h1 class="lh-lg fw-bold">Spring Board</h1><!-- CSS행간 설정 - lh-lg, 폰트 스타일 설정 - fh-bold -->
<h3><a href="/member/main">메인 화면으로</a></h3>

</div>