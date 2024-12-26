<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>

<script type="text/javascript">
$(function() {
	
    // URL에서 쿼리 문자열 파싱
    const ParamsString = location.search; // location.search로 쿼리 문자열만 가져옴
    console.log(ParamsString);
    
    // URLSearchParams를 사용하여 파라미터 가져오기
    let searchParams = new URLSearchParams(ParamsString);
    let boardno = searchParams.get("boardno"); // boardno 파라미터 가져오기
    console.log("boardno:", boardno); // 확인용 로그
	var isaction = 1; //AJAX DB업데이트 옵션으로 적용, 기본값은 0
	//0: 추천수 확인만
	//1: 추천수 확인 + 자신의 추천여부
	//2: 추천수 업데이트
	console.log(sessionStorage); //자바스크립트에서 세션값 가져오기(순수 JS)
	//잘 되지 않았다 -> 이유:자바스크립트는 클라이언트 측인데 세션값은 서버측에 저장되어있기 때문
	console.log('<%=session.getAttribute("loginid")%>');
	//-> JS안에 자바코드를 넣어서 가져옴
	var loginid = '<%=session.getAttribute("loginid")%>';
<%-- 	var loginid = '<%=session.getAttribute("loginid") != null ? session.getAttribute("loginid") : ""%>'; --%>
	//loginid를 null일때 ""로 가져오도록 구현하고 ""일때 AJAX 호출을 막으면 비로그인 사용자의
	//추천, 댓글 등록 등을 차단할 수 있다(현재 해결되지 않은 버그)

	//접속할 때 추천수 가져오기 구현
	$.ajax({
		//접속할때 추천수 불러오기
		type: "get", //요청 메소드 ( GET | POST )
		url: "./recommend", //요청 URL
		data: { // 요청 파라미터 - name:value 형식으로 요청된다
			boardno: searchParams.get("boardno"),
			loginid: loginid,
			isaction: 1 //1이면 업데이트 하지 않고, 2이면 업데이트 한다
		}, // 위쪽은 요청정보, 아래쪽은 응답정보
		datatype: "json", //응답 데이터 형식
		success: function( result ) { //요청, 응답 성공 콜백 함수
			console.log("AJAX 성공");		
			
			//응답 데이터 확인
			console.log( result );
			
			//div#recommend에 응답 데이터 반영하기
			$("div#recommend").html(result.recommno);
			
			//div#isRecommend에 따라 추천버튼 바꾸기
			if (result.isRecommend == 1) {
			    $("#btnRecomm").text("추천취소");
			} else {
			    $("#btnRecomm").text("추천");
			}
		},
		error: function() { //요청, 응답 실패 콜백 함수
			console.log("AJAX 실패");
		}
	});
	
	
	//목록, 수정, 삭제 버튼 클릭 때의 링크
	$("#btnList").click(() => location.href = "./list");
	$("#btnUpdate").click(() => location.href = "./update?boardno=${param.boardno }" );
	$("#btnDelete").click(() => location.href = "./delete?boardno=${param.boardno }" );
	
	//추천 버튼 클릭때의 구현
	$("#btnRecomm").click(function() {
		console.log("#btnRecomm click");
// 		recomm += 1;
// 		console.log("Current recomm value:", recomm);
		console.log($("#loginid"));
		console.log('<%=session.getAttribute("loginid")%>');
		//AJAX 요청
		$.ajax({
			type: "get", //요청 메소드 ( GET | POST )
			url: "./recommend", //요청 URL		
			data: { // 요청 파라미터 - name:value 형식으로 요청된다
				boardno: searchParams.get("boardno"),
				loginid: loginid,
				isaction: 2
			}, // 위쪽은 요청정보, 아래쪽은 응답정보
			datatype: "json", //응답 데이터 형식
			success: function( result ) { //요청, 응답 성공 콜백 함수
				console.log("AJAX 성공");
			
				//응답 데이터 확인
				console.log( result );
				
				//div#recommend에 응답 데이터 반영하기
				$("div#recommend").html(result.recommno);
				
				//div#isRecommend에 따라 추천버튼 바꾸기
				if (result.isRecommend == 1) {
				    $("#btnRecomm").text("추천취소");
				} else {
				    $("#btnRecomm").text("추천");
				}
				
			},
			error: function() { //요청, 응답 실패 콜백 함수
				console.log("AJAX 실패");
			}
			
		});
		
		
	});
	
	//댓글 작성 버튼 클릭때의 구현
	$("#btnAddComment").click(function() {
// 		location.href = "../comment/insert?boardno=${param.boardno }&content=${content}";
		const content = $("#content").val(); //작성 댓글 내용 가져오기
		const boardno = searchParams.get("boardno"); //boardno 가져오기
		
		//AJAX 요청
		$.ajax({
			type: "post", // 요청 메소드
			url: "../comment/insert",
			data: { // 요청 파라미터
	            boardno: boardno,
	            userid: loginid,
	            content: content
			},
			datatype: "json", //응답 데이터 형식
			success: function(result) { //요청, 응답 성공 콜백 함수
				console.log(result);
				console.log("boardno : " + boardno);
				//댓글목록 갱신 AJAX 요청 등의 추가 작업
				refrashComm(boardno);
				
				
			},
			error: function() { //요청, 응답 실패 콜백 함수
				console.log("댓글 작성 실패");
			}
			
		});
		
	});
	
	//댓글 삭제 버튼 클릭때의 구현을 location.href 방식으로 구현하면 NumberFormatException이 발생한다
	$(document).on("click", ".btnRemoveComment", function() {
		const commentno = $(this).data("commentno"); // data-commentno에서 가져오기
		
		//AJAX 요청
		$.ajax({
			type: "post", // 요청 메소드
			url: "../comment/delete",
			data: { // 요청 파라미터
	            commentno: commentno,
	            userid: loginid
			},
			datatype: "json", //응답 데이터 형식
			success: function(result) { //요청, 응답 성공 콜백 함수
				console.log(result);
				console.log(boardno);
				//댓글목록 갱신 AJAX 요청 등의 추가 작업
				refrashComm(searchParams.get("boardno"));
				
				
			},
			error: function() { //요청, 응답 실패 콜백 함수
				console.log("댓글 삭제 실패");
			}
			
		});
	});


});

function refrashComm2(boardno) {
	$.ajax({
		type: "GET", //요청 메소드
		url: "../comment/view",
		data: { // 요청 파라미터
			boardno: boardno
		},
		datatype: "json",
		success: function(res) { // 요청/응답성공 콜백 함수
			console.log("댓글 새로고침");
			
			
			console.log(res);
			
			
		},
		error: function() {
			console.log("댓글 새로고침 실패");
		}
		});
	
};

function refrashComm(boardno) {
    $.ajax({
        type: "GET",
        url: "../comment/view",
        data: {
            boardno: boardno
        },
        dataType: "json",
        success: function(res) {
            console.log("댓글 새로고침 성공");
            console.log(res);

            var commentContent = "<table class='table table-striped table-hover table-sm text-center'>"+
            "<thead>"+
                "<tr class='table-primary'>"+
                    "<th>댓글번호</th>"+
                    "<th>댓글작성자 아이디</th>"+
                    "<th>댓글내용</th>"+
                    "<th>작성날짜</th>"+
                    "<th>댓글삭제</th>"+
                "</tr>"
            +"</thead>"
            +"<tbody>";

            for (var i = 0; i < res.length; i++) {
                commentContent += "<tr>";
                commentContent += "<td>" + res[i]['commentno'] + "</td>";
                commentContent += "<td>" + res[i]['userid'] + "</td>";
                commentContent += "<td>" + res[i]['content'] + "</td>";
                var date = new Date(res[i]['writeDate']);
                var formattedDate = date.getFullYear() + '-' +
                    ('0' + (date.getMonth() + 1)).slice(-2) + '-' +
                    ('0' + date.getDate()).slice(-2) + ' ' +
                    ('0' + date.getHours()).slice(-2) + ':' +
                    ('0' + date.getMinutes()).slice(-2);
                commentContent += "<td>" + formattedDate + "</td>";
                commentContent += "<td>" +
                    "<button class='btnRemoveComment btn btn-danger' data-commentno='" + res[i]['commentno'] + "'>댓글삭제</button>" +
                    "</td>";
                commentContent += "</tr>";
            }

            commentContent += "</tbody>";
            commentContent += "</table>";

            // 댓글 새로고침 div에 HTML 삽입
            $("#comment").html(commentContent);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("댓글 새로고침 실패:", textStatus, errorThrown);
            console.log("응답 내용:", jqXHR.responseText);
        }
    });
}

</script>

<h1 class="text-center">게시글 상세보기</h1>
<hr>

<div class="container">
<div id="result col-10 mx-auto">

<%-- <h3>게시물 번호 : ${board.boardno }</h3><br> --%>
<%-- <h3>제목: ${board.title }</h3><br> --%>
<%-- <h3>본문: ${board.content }</h3><br> --%>
<%-- <h3>작성자아이디: ${board.writerId }</h3><br> --%>
<%-- <h3>작성자닉네임: ${board.writerNick }</h3><br> --%>
<%-- <h3>조회수: ${board.hit }</h3><br> --%>
<%-- <h3>작성날짜: ${board.writeDate }</h3><br> --%>
<table class="table table-bordered">

<colgroup>
	<col class="col-3">
	<col class="col-9">
</colgroup>

<tr>
	<td class="table-info">게시물 번호</td>
	<td>${board.boardno }</td>
</tr>

<tr>
	<td class="table-info">닉네임 및 작성날짜</td>
    <td>
        <span style="display: flex; justify-content: space-between;">
            <span>${board.writerNick}</span>
            <span><fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd HH:mm"/></span>
        </span>
    </td>
</tr>

<tr>
	<td class="table-info">조회수</td>
	<td>${board.hit }
<tr>
	<td class="table-info align-middle">제목</td>
	<td>${board.title }</td>
</tr>
<tr height="300">
	<td class="table-info">본문</td>
	<td>${board.content }</td>
</tr>
<tr>
	<td class="table-info">추천수</td>
	<td><div id="recommend"></div></td>
</table>

</div>
<!-- <h3>추천수: </h3><div id="recommend"></div> -->
<button id="btnRecomm" class="btn btn-info">추천</button>

<div id="uploadedfile">
<c:if test="${not empty filelist }">
<table class="table table-striped table-hover table-sm text-center">
<colgroup>
	<col style="width: 10%">
	<col style="width: 90%">
</colgroup>
<thead>
<tr class="table-primary">
	<th>파일번호</th>
	<th>파일명</th>
</tr>
</thead>

<tbody>

<c:forEach var="filelist" items="${filelist }">
<!-- items 모델에 들어있는것을 var를 통해 하나씩 빠져나온다 -->
<tr>
	<td>${filelist.fileno }</td>
	<td>
		<a href="./download?fileno=${filelist.fileno }">${filelist.originName }
		</a>
	</td>
<%--  	<td> --%>
<%-- 		<a href="/upload/${filetest.storedName }">${filetest.originName }</a> --%>
<%--		스프링 프레임워크가 해당 경로에 있는 업로드된 파일을 차단한다 --%>
<%--		차단을 억지로 풀려면 servlet-context.xml 파일을 수정해야 한다 --%>
<%-- 		<a href="/upload/${filelist.storedName }" download="${filelist.originName }" }>${filetest.originName }</a> --%>
<%-- 		<img src="/upload/${filetest.storedName }">  --%>
<%--	</td> --%>
</tr>
</c:forEach>
</tbody>
</table>
</c:if>

</div>
<!-- 댓글 부분은 별도의 JSP 파일이나 AJAX 구현도 고려한다 -->
<!-- 우여곡절 끝에 AJAX로 댓글 부분 구현이 완료되었으며, AJAX 댓글 구현할때 주의점이 있다. -->
<!-- JSP EL/JSTL은 서버사이드 코드이고 AJAX응답부는 클라이언트 사이드 코드이므로 둘을 섞어쓰면 에러가 발생한다 -->
<!-- 따라서 둘을 섞어쓸 수 없으며, 굳이 섞어쓰고 싶으면 별도의 JSP 파일을 통한 구현으로 우회해야 한다 -->
<!-- AI인 ChatGPT도 동일한 잘못을 저지르고 있으며, AJAX응답부는 반드시 위에 있는 코드 형식으로 구현해야만 한다. -->
<div id="comment">
<table class='table table-striped table-hover table-sm text-center'>
<colgroup>
	<col style="width: 6%">
	<col style="width: 15%">
	<col style="width: 54%">
	<col style="width: 15%">
	<col style="width: 10%">
</colgroup>

<thead>
<tr class='table-primary'>
	<th>댓글번호</th>
	<th>댓글작성자 아이디</th>
	<th>댓글내용</th>
	<th>작성날짜</th>
	<th>댓글삭제</th>
</tr>
</thead>

<tbody>
<c:forEach var="commentlist" items="${commentlist }">
<tr>
	<th style="font-weight: normal;">${commentlist.commentno }</th>
	<th style="font-weight: normal;">${commentlist.userid }</th>
	<th style="font-weight: normal;">${commentlist.content }</th>
	<th style="font-weight: normal;"><fmt:formatDate value="${commentlist.writeDate }" pattern="yyyy-MM-dd HH:mm"/></th>
	<th>
		<button class="btnRemoveComment btn btn-danger" data-commentno="${commentlist.commentno}">댓글삭제</button>
	</th>
</tr>
</c:forEach>
</tbody>

</table>
</div>

<!-- commentno 변수 정의: -->

<!-- $("#btnRemoveComment").click(function() { ... }) 부분에서 commentno를 가져오려 하고 있지만, 
실제로 정의되지 않았습니다. 
각 댓글에 대한 삭제 버튼을 클릭할 때 해당 댓글의 commentno를 가져와야 합니다. -->
<!-- HTML 수정: -->

<!-- 댓글 삭제 버튼에 data- 속성을 추가하여 각 댓글의 commentno를 저장할 수 있습니다.
 이렇게 하면 JavaScript에서 쉽게 접근할 수 있습니다. -->
<div id="addComment">
<%-- <form action="../comment/insert?boardno=${param.boardno }" method="get"> --%>
<table class="table">

<colgroup>
	<col class="col-1">
	<col class="col-10">
	<col class="col-1">
</colgroup>
<!-- <tr> -->
<!-- 	<td>아이디</td> -->
<%-- 	<td>${loginnick } (${loginid })</td> --%>
<!-- </tr> -->
<tr>
	<td>${loginid }</td>
	<td><textarea class="form-control" id="content" name="content" placeholder="사회의 미풍양속을 해치는 댓글 작성 시 예고 없이 제재될 수 있습니다."></textarea></td>
	<td><button id="btnAddComment" class="btn btn-primary">댓글작성</button></td>
</tr>
</table>
<!-- </form> -->
</div>


<button id="btnList" class="btn btn-success">목록</button>
<!-- 수정, 삭제 버튼은 작성자 아이디와 로그인된 아이디가 같을때만 노출되며  -->
<!-- 백엔드 단에서도 작성자 아이디와 로그인된 아이디가 다른 게시글 수정, 삭제 접근할때에는 -->
<!-- 접근 자체를 막아버리는 로직이 구현되어 있다 -->
<c:if test="${loginid eq board.writerId }">
<button id="btnUpdate" class="btn btn-warning">수정</button>
<button id="btnDelete" class="btn btn-danger">삭제</button>
</c:if>
<hr>

<div id="commentrefrash">

</div>
</div>
<hr>

</body>
</html>