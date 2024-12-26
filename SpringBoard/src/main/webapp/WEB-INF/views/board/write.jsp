<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>

<!-- summernote 삽입 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.js"></script>
<script type="text/javascript">
$(function() {
	
	//작성 버튼 클릭시 submit
	$("#btnWrite").click(function() {
		
		//제목 필수 입력 설정
		if (!$("#title").val() ) {
			alert("제목을 입력하세요");
			
			//게시글 submit 중단
			return false;
		}
		
		//게시글 submit
		$(this).parents("form").submit();
	});
	
	$("#btnCancel").click(function() {
		history.go(-1); //뒤로가기
	});
	
	//summernote 웹 에디터 적용
	$("#content").summernote({
		height: 300
		, placeholder: "내용을 입력하세요"
	});
});
</script>

<div class="container">

<h1 class="text-center">게시글 쓰기</h1>
<hr>
<div class="write col-10 mx-auto">
<%-- <form action="<%=request.getContextPath() %>" method="post" enctype="multipart/form-data"> --%>
<form action="./write" method="post" enctype="multipart/form-data">
<table class="table table-bordered">

<colgroup>
	<col class="col-3">
	<col class="col-9">
</colgroup>

<tr>
	<td class="table-info">닉네임</td>
	<td>${loginnick }</td>
</tr>
<tr>
	<td class="table-info align-middle">제목</td>
	<td><input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요"></td>
</tr>
<tr>
	<td class="table-info">본문</td>
	<td><textarea class="form-control" id="content" name="content" placeholder="내용을 입력하세요"></textarea></td>
</table>

<div class="mb-3">
첨부파일
<input type="file" name="file" class="form-control">
</div>

<div class="text-center mb-5">
	<button type="button" class="btn btn-primary" id="btnWrite">작성</button>
	<button type="button" class="btn btn-danger" id="btnCancel">취소</button>
</div>

</form>
</div>
</div>
</body>
</html>