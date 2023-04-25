<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<% pageContext.setAttribute("newLineChar", "\n");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 4개의 버튼을 클릭하면 처리하는 부분
		$("button").on("click", function(e){
			var btn = $(this).data("btn"); // data-을 가르킨다.
			//alert(btn);
			var formData = $("#frm");
			if(btn=="list"){
				formData.attr("action","${cpath}/list");
				formData.attr("method","post");
				formData.find("#num").remove();
			}else if(btn=="modify"){
				formData.attr("action","${cpath}/modify");
				formData.attr("method","get");
			}else if(btn=="remove"){
				formData.attr("action","${cpath}/remove");
				formData.attr("method","get");
			}else if(btn=="reply"){
				formData.attr("action","${cpath}/reply");
				formData.attr("method","get");
			}
			formData.submit(); //폼 전송
		});
	})
</script>
</head>
<body>


	<div class="card">
		<div class="card-header">
			<div class="jumbotron jumbotron-fluid">
				<div class="container">
					<h1>Spring BOARD Project</h1>
					<p>Spring WEB MVC, MySQL,jQuery(Ajax), JSON</p>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-lg-2">
					<jsp:include page="left.jsp" />
				</div>
				<div class="col-lg-7">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">BOARD</h4>
							<p class="card-text">게시판 상세 보기</p>
							<table class="table table-bordered table-hover">
								<tr>
									<td style="width: 100px">제목</td>
									<td>${vo.title}</td>
								</tr>
								<tr>
									<td>내용</td>
									<td>${fn:replace(vo.content,newLineChar,"<br/>")}</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td>${vo.writer}</td>
								</tr>
								<tr>
									<td>작성일</td>
									<td><fmt:formatDate value="${vo.indate}" pattern="yyyy-MM-dd"/>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center;">
										<button data-btn="list" class="btn btn-sm btn-warning">목록</button>
									<c:if test="${vo.username eq mvo.username}">									
										<button data-btn="modify" class="btn btn-sm btn-warning">수정</button>
										<button data-btn="remove" class="btn btn-sm btn-warning">삭제</button>
									</c:if>
									<c:if test="${!empty mvo}">
										<button data-btn="reply" class="btn btn-sm btn-warning">답글</button>
									</c:if>
									</td>
								</tr>
							</table> 
							<form id="frm">
								<input type="hidden" name="num" id="num" value="${vo.num}"/>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<jsp:include page="right.jsp" />
				</div>
			</div>
		</div>
		<div class="card-footer">빅데이터 분석서비스 개발자 양성과정(권기현)</div>
	</div>


</body>
</html>
