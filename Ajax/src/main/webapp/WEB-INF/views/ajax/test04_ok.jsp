<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSP를 이용해서 HTML이 아닌 JSON 파일을 만들어서 자료를 보내고 응답할 수 있다 -->
<!-- 근데, JSP 문법이 너무 복잡한 단점때문에(서블릿 기반의 태생적 한계) -->
<!-- 사람들이 잘 쓰지 않는다 -->

<table>
<tr>
	<th>data1</th>
	<th>data2</th>
</tr>
<tr>
	<td>${rd.data1 }</td>
	<td>${rd.data2 }</td>
</tr>
</table>