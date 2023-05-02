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
		var pageForm = $("#pageForm")
		$(".pagination a").on("click", function(e){
			e.preventDefault(); // a tag의 고유한 기능을 막는 방법
			var page = $(this).attr('href');
			$("#page").val(page);
			pageForm.submit();// 폼 전송
		});
		// 상세 보기로 이동하는 부분
		$(".move").on("click", function(e){
			e.preventDefault(); // a tag의 고유한 기능을 막는 방법
			var num = $(this).attr("href");
			var tag = "<input type='hidden' name='num' value='"+num+"'>";
			pageForm.append(tag);
			pageForm.attr("action","${cpath}/get");
			pageForm.attr("method","get");
			pageForm.submit();// 폼 전송
		});
		
		// 책 검색 버튼이 클릭 되었을 때 처리
		$("#search").click(function(){
			var bookname= $("#bookname").val();
			if(bookname ==""){
				alert("책 제목을 입력하세요.");
				return false;
			}
			// kakao Daum OpenAPI 이용해서 책을 검색 (요청---AJAX---> 응답)
			$.ajax({
				url:"https://dapi.kakao.com/v3/search/book?target=title",
				headers : {"Authorization":"KakaoAK d4b0460dee59cba9c2e29c509d714add"},
				type:"GET",
				data:{"query":bookname},
				dataType:"json",
				success : bookPrint,
				error : function(){alert("error");}
			});
		});
		
		// 주소를 입력하여 위도와 경도를 뽑아서 지도를 출력하는 기능
		
		$("#mapsearch").click(function(){
			var address=$("#address").val();
			if(address==""){
				alert("주소를 입력하세요.");
				return false;
			}
			$.ajax({
				url:"https://dapi.kakao.com/v2/local/search/address.json",
				headers : {"Authorization":"KakaoAK d4b0460dee59cba9c2e29c509d714add"},
				type:"GET",
				data:{"query": address},
				dataType:"json",
				success : mapPrint,
				error : function(){alert("error");}
			});
		});
			
	
	});
	function mapPrint(data){
		console.log(data);
		var x= data.documents[0].x; //경도
		var y = data.documents[0].y; // 위도
		console.log(x);
		console.log(y);
	}
	
	
	function bookPrint(data){
		console.log(data);
		
		var bList = "<table class='table table-hover'>";
		bList+="<thead>";
		bList+="<tr>";
		bList+="<th>책 이미지</th>";
		bList+="<th>가격</th>";
		bList+="<th>출판사</th>";
		bList+="</tr>";
		bList+="</thead>";
		$.each(data.documents, function(index, book){
			var image = book.thumbnail;
			var price = book.price;
			var url = book.url;
			var publisher = book.publisher;
			bList+="<tbody>";
			bList+="<tr>";
			bList+="<td><a href='"+url+"'><img src='"+image+"' width='50px' heiht='60px'/></td>";
			bList+="<td>"+price+"</td>";
			bList+="<td>"+publisher+"</td>";
			
			
			bList+="</tr>";
			bList+="</tbody>";
		});
		bList+="</table>";
		
		$("#bookList").html(bList);
	}

	
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
                                          <a class="move" href="${vo.num}">${vo.title}</a>
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
                                          <a class="move" href="${vo.num}">[RE] ${vo.title}</a>
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
                     <!-- 검색메뉴 시작-->
                     <form class="form-inline" action="${cpath}/list" method="post">
                     	<div class="container">
                     		<div class="input-group mb-3">
                     			<div class="input-group-append">
                     				<select name="type" class="form-control">
                     					<option value="writer" ${pm.cri.type=='writer' ? 'selected' : ''}>이름</option>
                                   		<option value="title" ${pm.cri.type=='title' ? 'selected' : ''}>제목</option>
                                   		<option value="content" ${pm.cri.type=='content' ? 'selected' : ''}>내용</option>
                     				</select>
                     			</div>
                     			<input type="text" name="keyword" class="form-control" value="${pm.cri.keyword}"/>
                     			<div class="input-group-append">
                     				<button class="btn btn-primary btn-sm">Search</button>
                     			</div>
                     		</div>
                     	</div>
                     </form>
                     <!-- 검색메뉴 끝-->
                     
                     
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
				  		<li class="page-item"><a class="page-link" href="${pm.endPage+1}">Next</a></li>
				  	</c:if>
  				</ul>
                     <!-- 페이징 리스트 출력 끝 -->
                     
                     <form id="pageForm" action="${cpath}/list" method="post">
                        <input type="hidden" id ="page" name="page" value="${pm.cri.page}"/>
                        <input type="hidden" id ="type" name="type" value="${pm.cri.type}"/>
                        <input type="hidden" id ="keyword" name="keyword" value="${pm.cri.keyword}"/>
                        
                     </form>
                     <c:if test="${!empty mvo}">
                        <button class="btn btn-primary btn-sm" style="color: white"
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