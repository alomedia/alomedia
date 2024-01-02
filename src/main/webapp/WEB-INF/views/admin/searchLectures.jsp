<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page trimDirectiveWhitespaces="true"%>
<c:url var="resPath" value="/resources" />
<c:url var="context" value="/lms" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>관리자 페이지</title>
<link rel="icon" href="${resPath}/img/favicon.png">
<!-- Custom fonts for this template-->
<link href="${resPath}/css/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
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
					<h2 class="h2 mb-0 text-gray-800">강의 관리</h2>
				</div>
				<hr>
				<div class="list">
					<button type="button" class="btn btn-dark mb-2" onClick="location.href='/alomedia/lms/admin/lectures/new'">신규 강의 등록</button>
				</div>
				<table class="table table-hover">
					<thead>
						<tr class="table-secondary">
							<th scope="col">과정명</th>
							<th scope="col">강사명</th>
							<th scope="col">기간</th>
							<th scope="col">수강생</th>
							<th scope="col">강의실</th>
							<th scope="col">시간</th>
							<th scope="col">상태</th>
							<th scope="col">수정</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						<c:forEach var="lecture" items="${lectures}">
							<tr>
								<td>${lecture.lectureName}</td>
								<td>${lecture.lectureTeacher}</td>
								<td>${lecture.lectureStart}~ ${lecture.lectureEnd}</td>
								<td>${lecture.lecturePeople}</td>
								<td>${lecture.lectureRoom}</td>
								<td>${lecture.lectureDay}&nbsp&nbsp${lecture.lectureTime}</td>
								<td>${lecture.lectureState}</td>
								<td><a href="/alomedia/lms/admin/lectures/${lecture.lectureId}/edit">
										<button type="button" class="btn btn-dark">수정</button>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="container">
					<div class="input-form col-md-12 mx-auto">
						<form action="${context}/admin/lectures/search" method="get">
							<div class="row justify-content-md-center">
								<div class="col-md-auto mb-3 mt-3">
									<select name="type" class="custom-select d-block w-100">
										<option value="lectureTeacher" selected>강사명</option>
										<option value="lectureName">과정명</option>
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
							<li class="page-item"><a class="page-link" href="${context}/admin/lectures/search/?page=${currentPage - 1}&type=${param.type}&keyword=${param.keyword}" aria-label="Previous"><span
									aria-hidden="true">&laquo;</span></a></li>
						</c:if>
						<c:forEach var="pageNum" begin="1" end="${totalPages}">
							<li class="page-item <c:if test="${pageNum == currentPage}">active</c:if>"><a class="page-link"
								href="${context}/admin/lectures/search/?page=${pageNum}&type=${param.type}&keyword=${param.keyword}">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link" href="${context}/admin/lectures/search/?page=${currentPage + 1}&type=${param.type}&keyword=${param.keyword}" aria-label="Next"><span
									aria-hidden="true">&raquo;</span></a></li>
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
</body>
</html>