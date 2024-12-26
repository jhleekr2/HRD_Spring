<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>
<%-- 현재 날짜를 Date 객체로 설정 --%>
<%-- 현재 시간 객체 생성 --%>
<c:set var="now" value="<%= new Date() %>" />

<%-- 현재 시간을 'yyyyMMdd' 형식으로 포맷 --%>
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="formattedNow" />

<script type="text/javascript">
    
	function search() {
		const searchValue = document.getElementById('search').value;
		//검색 칸을 비워두면 예외처리
		if (searchValue === '') {
			alert('검색어를 입력하세요');
			return;
		}
		const url = './list?search=' + encodeURIComponent(searchValue);
		window.location.href = url; // 페이지 이동
	}
	
    //체크박스 전체 선택 클릭 이벤트
    function allChecked(target){

        //전체 체크박스 버튼
        const checkbox = document.getElementById('allCheckBox');

        //전체 체크박스 버튼 체크 여부
        const is_checked = checkbox.checked;

        //전체 체크박스 제외한 모든 체크박스
        if(is_checked){
            //체크박스 전체 체크
            chkAllChecked()
        }

        else{
            //체크박스 전체 해제
            chkAllUnChecked()
        }
    }

    //자식 체크박스 클릭 이벤트
    function chkClicked(){

        //체크박스 전체개수
        const allCount = document.querySelectorAll(".chk").length;

        //체크된 체크박스 전체개수
        const query = 'input[name="chk"]:checked'
        const selectedElements = document.querySelectorAll(query)
        const selectedElementsCnt = selectedElements.length;

        //체크박스 전체개수와 체크된 체크박스 전체개수가 같으면 전체 체크박스 체크
        if(allCount == selectedElementsCnt){
             document.getElementById('allCheckBox').checked = true;
        }

        //같지않으면 전체 체크박스 해제
        else{
            document.getElementById('allCheckBox').checked = false;
        }
    }

    //체크박스 전체 체크
    function chkAllChecked(){
        document.querySelectorAll(".chk").forEach(function(v, i) {
            v.checked = true;
        });
    }

    //체크박스 전체 체크 해제
    function chkAllUnChecked(){
        document.querySelectorAll(".chk").forEach(function(v, i) {
            v.checked = false;
        });
    }

    function deleteSelected() {
        const selectedCheckboxes = document.querySelectorAll('input[name="chk"]:checked');
        const selectedIds = Array.from(selectedCheckboxes).map(checkbox => checkbox.value);
        
        if (selectedIds.length === 0) {
            alert('삭제할 게시물을 선택하세요');
            return;
        }
        
        if (confirm('선택한 게시물을 삭제하시겠습니까?')) {
            // AJAX 요청을 통해 삭제
            const xhr = new XMLHttpRequest();
            xhr.open('POST', './listdelete', true);
            xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
            xhr.onload = function () {
                if (xhr.status === 200) {
                    alert('게시물이 삭제되었습니다.');
                    window.location.reload(); // 페이지 새로고침
                } else {
                    alert('삭제 실패: ' + xhr.status);
                }
            };
            xhr.send(JSON.stringify({ ids: selectedIds }));
        }
    }
    
</script>

<div class="container">
<h1 class="text-center">게시글 목록</h1>
<hr>

<div id="result">
<table class="table table-striped table-hover table-sm text-center">
<colgroup>
	<col style="width: 2%">
	<col style="width: 5%">
	<col style="width: 55%">
	<col style="width: 10%">
	<col style="width: 5%">
	<col style="width: 5%">
	<col style="width: 13%">
</colgroup>
<thead>
<tbody>
<tr class="table-primary">
	<th>
	<label class="checkbox-inline">
	<input type="checkbox" id="allCheckBox" onclick="allChecked()">
	</label>
	</th>
	<th>글번호</th>
	<th>제목</th>
	<th>닉네임</th>
	<th>조회수</th>
	<th>추천수</th>
	<th>작성일</th>
<c:forEach var="boardList" items="${list }">
<tr>
	<td>
		<label class="checkbox-inline">
			<input type="checkbox" name="chk" class="chk" onclick="chkClicked()" value="${boardList.boardno}">
		</label>
	</td>
	<td>${boardList.boardno }</td>
	<td><a href="./view?boardno=${boardList.boardno }">${boardList.title }</a></td>
	<!-- 스프링 프레임워크에서는 전달하는 변수명과 DTO 내부 변수명이 일치하지 않으면 문제가 생긴다 -->
	<!-- boardNo로 전달하면 멀쩡하게 작동, but boardno로 전달하면 전달 안됨 -->
	<!-- @RequestParam("boardno") String boardNo 라고 전달매개변수 지정하면 boardno로 전달 가능 -->
	<!-- -> 사실 이는 스프링 프레임워크의 @ModelAttribute 데이터 바인딩과 관련 있다 -->
	<!-- 따라서, 프론트단에서 전달변수명과 DTO 내부 변수명을 일치시켜서 개발하는 것이 낫다 -->
	
	<!-- 최종적으로는 요구조건에 맞게 DTO 내부 변수명을 갈아엎기로 했다-->
	<td>${boardList.writerNick }</td>
	<td>${boardList.hit }</td>
	<td>${boardList.recommend }</td>
	<td>
		<%-- 조회 날짜를 다른 Date객체로 설정 --%>
	<fmt:formatDate var="formattedcommdate" value="${boardList.writeDate }" pattern="yyyyMMdd"/>
	<c:choose>
		<c:when test="${formattedcommdate lt formattedNow }">
			<fmt:formatDate value="${boardList.writeDate }" pattern="yyyy-MM-dd"/>
		</c:when>
				<c:when test="${formattedcommdate ge formattedNow }">
			<fmt:formatDate value="${boardList.writeDate }" pattern="HH:mm"/>
		</c:when>
	</c:choose>
	</td>
</tr>
</c:forEach>
</tbody>
</table>

</div>

</div>

<div class="paging">
<div>

<ul class="pagination justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
	<li class="page-item">
		<a class="page-link" href="./list">&larr; 처음</a>
	</li>
	</c:if>

	<%-- 이전 페이징 리스트로 이동 --%>
	<c:if test="${paging.startPage ne 1 }">
	<li class="page-item">
		<a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }&search=${paging.search}">&laquo;</a>
	</li>
	</c:if>

	<%-- 페이징 번호 리스트 --%>
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<c:if test="${paging.curPage eq i }">
			<li class="page-item active">
				<a class="page-link" href="./list?curPage=${i }&search=${paging.search}">${i }</a>
			</li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li class="page-item">
				<a class="page-link" href="./list?curPage=${i }&search=${paging.search}">${i }</a>
			</li>
		</c:if>
	</c:forEach>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:if test="${paging.endPage ne paging.totalPage }">
	<li class="page-item">
		<a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }&search=${paging.search}">&raquo;</a>
	</li>
	</c:if>
	
	<%-- 마지막 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
	<li class="page-item">
		<a class="page-link" href="./list?curPage=${paging.totalPage }&search=${paging.search}">&rarr; 마지막</a>
	</li>
	</c:if>
	
</ul>

</div>

</div>

<div class="container">
<div class="search">
<div class="row justify-content-center my-3">
	<div class="col-3">
		<input class="form-control" type="text" id="search" name="search" placeholder="검색">
	</div>
	<button type="button" class="btn btn-primary col-1" onclick="search()">검색</button>
	<!-- 검색어를 입력하지 않고 검색버튼을 눌렀을 경우 예외 처리는 추가 JS코드 추가해서 구현한다 -->
</div>
</div>
<div class="command d-flex justify-content-center">
<a class="btn btn-primary float-start" href="./write">글쓰기</a><br>
<button class="btn btn-warning" onclick="deleteSelected()">선택게시물삭제</button>
</div>
</div>
</body>
</html>