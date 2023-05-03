<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<div class="card" style="min-height: 500px; , max-hegith: 100px">
	<div class="row">
		<div class="col-lg-12">
			<div class="card-body">
				<c:if test="${empty mvo}">

					<h4 class="card-title">GUEST</h4>

					<p class="card-text">회원님! Welcome</p>
					<form action="${cpath}/login" method="post">
						<div class="form-group">
							<label>아이디</label> <input type="text" name="username"
								class="form-control" />
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input type="password" name="password"
								class="form-control" />
						</div>
						<button class="btn btn-sm btn-primary form-control">로그인</button>
					</form>
				</c:if>
				<c:if test="${!empty mvo}">
					<form action="${cpath}/logout" method="post">
						<h4 class="card-title">${mvo.name}</h4>
						<p class="card-text">회원님! Welcome</p>
						<button class="btn btn-sm btn-primary form-control">로그아웃</button>
					</form>
				</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="card-body">
				<p class="card-text">MAP VIEW</p>
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="address"
						placeholder="Search" />
					<div class="input-group-append">
						<a id="mapsearch" type="button" class="btn btn-secondary">GO</a>
					</div>
				</div>
				<div id="map" style="width:100%; height: 150px"></div>
			</div>
		</div>
		<!-- col_end -->
	</div>
	<!-- row_end -->
</div>