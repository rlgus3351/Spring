<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-7">
		<div class="card">
			<div class="card-body">
				<table class="table table-bordered table-hover"
					style="text-align: center">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작가</th>
							<th>출판사</th>
							<th>ISBN</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${list}">
							<tr style="text-align: center">
								<td style="color: red">${book.num}</td>
								<td>${book.title}</td>
								<td>${book.author}</td>
								<td>${book.company}</td>
								<td>${book.isbn}</td>
								<td>${book.count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>