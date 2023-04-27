<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	$(document).ready(function(){
		$(".pagination a").on("click", function(e){
			e.preventDefault(); // a tag의 고유한 기능을 막는 방법
			
		});
	});

	
   function goMsg() {
      $("#myModal").modal("show");
   }
   
</script>
</head>
<body>

   <div class="card">
      <div class="card-header">
         <div class="jumbotron jumbotron-fluid">
            <div class="container">
               <h1>Spring BOARD Project</h1>
               <p>Spring WEB MVC, MySQL, jQuery(Ajax), JSON</p>
            </div>
         </div>
      </div>
      <div class="card-body">
         <div class="row">
            <div class="col-lg-2">
               <div class="card">
                  <jsp:include page="left.jsp" />
               </div>
            </div>
            <div class="col-lg-7">
               <div class="card">
                  <div class="card-body">
                     <h4 class="card-title">BOARD</h4>
                     <p class="card-text">제목</p>
                     <table class="table table-bordered table-hover">
                        <thead>
                           <tr>
                              <th>번호</th>
                              <td>제목</td>
                              <td>작성자</td>
                              <td>작성일</td>
                              <td>조회수</td>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach var="vo" items="${list}">
                              <tr>
                                 <td>${vo.num}</td>
                                 <td><c:if test="${vo.blevel==0}">
                                       <c:if test="${vo.bdelete==0}">
                                          <a href="${cpath}/get?num=${vo.num}&page=${pm.cri.page}">${vo.title}</a>
                                       </c:if>
                                       <c:if test="${vo.bdelete==1}">
                                          <a href="javascript:goMsg()">삭제된 게시물입니다.</a>
                                       </c:if>
                                    </c:if> <c:if test="${vo.blevel>0}">
                                       <c:forEach begin="1" end="${vo.blevel}">
                                          <span style="padding-left: 10px"></span>
                                       </c:forEach>
                                       <i class="bi bi-arrow-return-right"></i>
                                       <c:if test="${vo.bdelete==0}">
                                          <a href="${cpath}/get?num=${vo.num}&page=${pm.cri.page}">[RE] ${vo.title}</a>
                                       </c:if>
                                       <c:if test="${vo.bdelete==1}">
                                          <a href="javascript:goMsg()">[RE]삭제된 게시물입니다.</a>
                                       </c:if>
                                    </c:if></td>
                                 <td>${vo.writer}</td>
                                 <td><fmt:formatDate value="${vo.indate}"
                                       pattern="yyyy-MM-dd" /></td>
                                 <td>${vo.count}</td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                     <!-- 페이징 리스트 출력 -->
                     <!-- Center-aligned -->
				  <ul class="pagination justify-content-center">
				  	<c:if test="${pm.prev}">
				  		<li class="page-item"><a class="page-link" href="${pm.startPage-1}">(Prev)</a></li>
				  	</c:if>
				  	<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
				  		<li class="page-item ${pm.cri.page==pageNum ? 'active':''}"><a class="page-link" href="${pageNum}">${pageNum}</a></li>
				  	</c:forEach>
				  	  <c:if test="${pm.next}">
				  		<li class="page-item"><a class="page-link" href="${cpath}/list?page=${pm.endPage+1}">Next</a></li>
				  	</c:if>
  				</ul>
                     
                     
                     
                     
                     <c:if test="${!empty mvo}">
                        <button class="btn btn-warning btn-sm" style="color: white"
                           onclick="location.href='${cpath}/register'">글쓰기</button>
                     </c:if>
                  </div>
               </div>
            </div>
            <div class="col-lg-3">
               <jsp:include page="right.jsp" />
            </div>
         </div>
      </div>
      <div class="card-footer">빅데이터 분석서비스 개발자 양성과정</div>
   </div>
   <!-- modal -->
   <div class="modal" id="myModal">
      <div class="modal-dialog">
         <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
               <h6 class="modal-title">Message</h6>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body"> 삭제된 게시글입니다. </div>
            <!-- Modal footer -->
            <div class="modal-footer">
               <button type="button" class="btn btn-warning" data-dismiss="modal" style="color: #fff"> 닫기 </button>
            </div>
         </div>
      </div>
   </div>
</body>
</html>