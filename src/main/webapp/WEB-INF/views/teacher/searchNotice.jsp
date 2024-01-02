<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="resPath" value="/resources" />
<c:url var="context" value="/lms" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지사항</title>
<link rel="icon" href="${resPath}/img/favicon.png">
<!-- Custom fonts for this template-->
<link href="${resPath}/css/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${resPath}/css/sb-admin-2.min.css" rel="stylesheet">
<style>
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
					<h3 class="h2 mb-0 text-gray-800">공지사항</h3>
				</div>
				<div>
					<table class="table table-hover">
						<thead>
							<tr class="table-primary">
								<th>No</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>작성 시간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="adminNotice" items="${adminNotices}">
								<tr class="table-secondary">
									<td style="font-weight: bolder">전체</td>
									<td style="font-weight: bolder"><a href="${context}/teacher/notice/${adminNotice.noticeId}">${adminNotice.noticeName}</a></td>
									<td style="font-weight: bolder">${adminNotice.noticeWriter}</td>
									<td style="font-weight: bolder">${adminNotice.noticeDate}</td>
								</tr>
							</c:forEach>
							<c:forEach var="notice" items="${notices}">
								<tr>
									<td>${notice.noticeId}</td>
									<td><a href="${context}/teacher/notice/${notice.noticeId}">${notice.noticeName}</a></td>
									<td>${notice.noticeWriter}</td>
									<td>${notice.noticeDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="list">
						<div style="position: absolute; right: 30px;">
							<button type="button" class="btn btn-primary" onClick="location.href='${context}/teacher/notice/new'">글 작성</button>
						</div>
						
					</div>
				</div>
				<br>
				<br>
				<div class="container">
					<div class="input-form col-md-12 mx-auto">
						<form action="${context}/teacher/notice/search" method="get">
							<div class="row justify-content-md-center">
								<div class="col-md-auto mb-3 mt-3">
									<select name="type" class="custom-select d-block w-100">
										<option value="noticeName" selected>제목</option>
										<option value="noticeContent">내용</option>
									</select>
								</div>
								<div class="col-md-4 mb-3 mt-3">
									<input type="text" name="keyword" class="form-control" placeholder="검색할 내용을 입력해주세요.">
								</div>
								<div class="col-md-auto mb-3 mt-3">
									<button type="submit" class="btn btn-primary">검색</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link" href="${context}/teacher/notice/search/?page=${currentPage - 1}&type=${param.type}&keyword=${param.keyword}" aria-label="Previous"><span
									aria-hidden="true">&laquo;</span></a></li>
						</c:if>
						<c:forEach var="pageNum" begin="1" end="${totalPages}">
							<li class="page-item <c:if test="${pageNum == currentPage}">active</c:if>"><a class="page-link"
								href="${context}/teacher/notice/search/?page=${pageNum}&type=${param.type}&keyword=${param.keyword}">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link" href="${context}/teacher/notice/search/?page=${currentPage + 1}&type=${param.type}&keyword=${param.keyword}" aria-label="Next"><span
									aria-hidden="true">&raquo;</span></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<!-- Footer -->
			<%@ include file="./footer/footer.jsp"%>
			<!-- End of Footer -->
		</div>
		<!-- End of Page Wrapper -->
	</div>
</body>
</html>