<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>학생</title>
<link rel="icon" href="${resPath}/img/favicon.png">
<!-- Custom fonts for this template-->
<link href="${resPath}/css/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
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
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h2 mb-0 text-gray-800">평가</h1>
				</div>
				<hr>
				<h3>진행 중인 평가</h3>
				<table class="table table-hover">
					<thead>
						<tr class="table-primary">
							<th>평가명</th>
							<th>제한시간</th>
							<th>응시</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="examList" items="${examLists}" varStatus="status">
							<tr>
								<td>${examList.examName}</td>
								<td>${examList.timeLimit}분</td>
								<c:choose>
									<c:when test="${isExams[status.index]}">
										<td>제출 완료</td>
									</c:when>
									<c:otherwise>
										<td><a href="${context}/student/exam/${examList.examId}">시험
												응시</a></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="margin: 60px 0">
					<hr>
				</div>
				<h3>지난 평가</h3>
				<table class="table table-hover">
					<thead>
						<tr class="table-primary">
							<th>평가명</th>
							<th>점수</th>
							<th>P/N</th>
							<th>상세 확인</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="submitList" items="${submitLists}">
							<tr>
								<td>${submitList.examName}</td>
								<c:choose>
									<c:when test="${submitList.totalScore eq null}">
										<td>채점 중</td>
									</c:when>
									<c:otherwise>
										<td>${submitList.totalScore}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${submitList.totalScore eq null}">
										<td>채점 중</td>
									</c:when>
									<c:when test="${submitList.totalScore >= 60}">
										<td>P</td>
									</c:when>
									<c:otherwise>
										<td>N</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${submitList.totalScore eq null}">
										<td>채점 중</td>
									</c:when>
									<c:otherwise>
										<td><a
											href="${context}/student/exam/${submitList.examId}/result">이동</a></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- Footer -->
			<%@ include file="./footer/footer.jsp"%>
			<!-- End of Footer -->
		</div>
	</div>
	<!-- End of Page Wrapper -->
</body>
</html>