<%@page import="java.util.List"%>
<%@page import="kr.board.entity.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Board> list = (List<Board>) request.getAttribute("list");%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border='1'>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일자</td>
			<td>조회수</td>
		</tr>
		<%--${}EL --%>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.num}</td>			 
				<td>${vo.title}</td>			 
				<td>${vo.writer}</td>			 
				<td>${vo.indate}</td>			 
				<td>${vo.count}</td>			 			 
			</tr>
		</c:forEach>
	</table>
</body>
</html>