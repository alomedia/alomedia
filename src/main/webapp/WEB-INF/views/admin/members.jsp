<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page trimDirectiveWhitespaces="true"%>
<c:url var="resPath" value="/resources" />
<c:url var="context" value="/lms" />
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>관리자 페이지</title>
<link rel="icon" href="${resPath}/img/favicon.png">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="${resPath}/css/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="${resPath}/css/sb-admin-2.min.css" rel="stylesheet">
<style>
form {
	text-align: center;
}

.list {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.btn {
	margin-left: auto;
}

html, body {
	height: 100%;
}

body {
	display: flex;
	flex-direction: column;
}

#content-wrapper {
	flex: 1;
}

footer.sticky-footer {
	margin-top: auto;
}
</style>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<%@ include file="./sidebar/sidebar.jsp"%>
		<!-- End of Sidebar -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Sidebar -->
			<%@ include file="./header/header.jsp"%>
			<!-- End of Sidebar -->
			<!-- Begin Page Content -->
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="d-sm-flex align-items-center justify-content-between mb-4">
					<h2 class="h2 mb-0 text-gray-800">회원 관리</h2>
				</div>
				<hr>
				<div class="list">
					<h3>회원 목록</h3>
					<button type="button" class="btn btn-dark mb-2" onClick="location.href='/alomedia/lms/admin/members/new'">회원 생성</button>
				</div>
				<table class="table membersTable table-hover">
					<thead>
						<tr class="table-secondary">
							<th scope="col">회원 번호</th>
							<th scope="col">이름</th>
							<th scope="col">휴대폰</th>
							<th scope="col">이메일</th>
							<th scope="col">생년월일</th>
							<th scope="col">권한</th>
							<th scope="col">과정</th>
							<th scope="col">출결 관리</th>
							<th scope="col">탈퇴</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						<c:forEach var="member" items="${ members }">
							<tr>
								<td>${ member.id }</td>
								<td>${ member.name}</td>
								<td>${ member.phone }</td>
								<td>${ member.mail }</td>
								<td>${ member.birth }</td>
								<td>${ member.userType }</td>
								<td>${ member.curriculum }</td>
								<td><c:choose>
										<c:when test="${member.userType eq '수강생'}">
											<a href="${context}/admin/members/member/${member.id}">이동</a>
										</c:when>
										<c:otherwise>
											<span>-</span>
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${member.userType eq '수강생'}">
											<form action="${context}/admin/members/${member.id}/remove" method="POST">
												<input type="submit" class="btn btn-dark btn-sm delete" id="${member.id}" value="탈퇴">
											</form>
										</c:when>
										<c:when test="${member.userType eq '강사'}">
											<form action="${context}/admin/members/${member.id}/remove" method="POST">
												<input type="submit" class="btn btn-dark btn-sm delete" id="${member.id}" value="탈퇴">
											</form>
										</c:when>
										<c:otherwise>
											<span>-</span>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="container">
					<div class="input-form col-md-12 mx-auto">
						<form action="${context}/admin/members/search" method="get">
							<div class="row justify-content-md-center">
								<div class="col-md-auto mb-3 mt-3">
									<select name="type" class="custom-select d-block w-100">
										<option value="name" selected>이름</option>
										<option value="curriculum">과정명</option>
									</select>
								</div>
								<div class="col-md-4 mb-3 mt-3">
									<input type="text" name="keyword" class="form-control" placeholder="검색할 내용을 입력해주세요.">
								</div>
								<div class="col-md-auto mb-3 mt-3">
									<button type="submit" class="btn btn-dark">검색</button>
								</div>
							</div>
						</form>
					</div>
				</div>

				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						</c:if>
						<c:forEach var="pageNum" begin="1" end="${totalPages}">
							<li class="page-item <c:if test="${pageNum == currentPage}">active</c:if>"><a class="page-link" href="?page=${pageNum}">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link" href="?page=${currentPage + 1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<!-- Footer -->
			<%@ include file="./footer/footer.jsp"%>
			<!-- End of Footer -->
		</div>
	</div>
	<!-- End of Page Wrapper -->
	<script type="text/javascript" src="<c:url value='/resources/js/basic.js'/>"></script>
</body>
</html>