<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	List<String> list = (List<String>)request.getAttribute("list");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	과일 목록 리스트
	
	<table border="1">
		<%for (String f: list) {%>
		<tr>
			<td><%=f %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>