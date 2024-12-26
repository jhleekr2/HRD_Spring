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
	});
	
	$("#btnList").click(() => location.href = "./list");
	$("#btnUpdate").click(() => location.href = "./update?boardno=${param.boardno }" );
	$("#btnDelete").click(() => location.href = "./delete?boardno=${param.boardno }" );	
});
</script>

<h1 class="text-center">게시글 수정</h1>
<hr>

<!-- <div class="view"> -->

<%-- <h3>게시물 번호 : ${board.boardno }</h3><br> --%>
<%-- <h3>작성자아이디: ${board.writerId }</h3><br> --%>
<%-- <h3>작성자닉네임: ${board.writerNick }</h3><br> --%>
<%-- <h3>제목: ${board.title }</h3><br> --%>
<%-- <h3>본문: ${board.content }</h3><br> --%>
<%-- <h3>조회수: ${board.hit }</h3><br> --%>
<%-- <h3>작성날짜: ${board.writeDate }</h3><br> --%>
<!-- </div> -->

<div class="container">
<div class="update col-10 mx-auto">
<%-- <form action="<%=request.getContextPath() %>" method="post" enctype="multipart/form-data"> --%>
<form action="./update?boardno=${param.boardno }" method="post" enctype="multipart/form-data">
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
	<td><input type="text" class="form-control" id="title" name="title" value="${board.title }"></td>
</tr>
<tr>
	<td class="table-info">본문</td>
	<td><textarea class="form-control" id="content" name="content">${board.content }</textarea>
</table>


<div id="beforeFile">
	기존 첨부파일
	<c:if test="${not empty filelist }">
	<table class="table table-striped table-hover table-sm text-center">
	<colgroup>
		<col style="width: 10%">
		<col style="width: 80%">
		<col style="width: 10%">
	</colgroup>
	<thead>
	<tr class="table-primary">
		<th>파일번호</th>
		<th>파일명</th>
		<th>파일삭제</th>
	</tr>
	</thead>
	
	<tbody>
	<c:forEach var="filelist" items="${filelist }">
	<tr>
		<td>${filelist.fileno }</td>
		<td>
			<a href="./download?fileno=${filelist.fileno }">${filelist.originName }
			</a>
		</td>
		<td>
			<i class="bi bi-trash-fill"></i>
			<input type="checkbox" name="delCheck" value="${filelist.fileno }"> 삭제
		</td>	
	</c:forEach>
		
	</tbody>
	</table>
	</c:if>
		
</div>


<div id="afterfile" class="mb-3">
새 첨부파일
<!-- input name을 다르게 지정한 결과, 백엔드 단에서 골치아픈 문제가 발생한다! -->
<input type="file" name="file" class="form-control">
</div>

<div class="text-center mb-5">
	<button type="button" class="btn btn-primary" id="btnWrite">작성</button>
	<button type="button" class="btn btn-danger" id="btnCancel">취소</button>
</div>

</form>
</div>


<button id="btnList" class="btn btn-success">목록</button>

<%-- <c:if test="${user eq board.writerId }"> --%>
<c:if test="${loginid eq board.writerId }">
<button id="btnUpdate" class="btn btn-warning">수정내용 초기화</button>
<button id="btnDelete" class="btn btn-danger">삭제</button>
</c:if>
</div>
</body>
</html>