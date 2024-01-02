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

<title>평가 관리</title>
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
.list {
	display: flex;
	justify-content: space-between;
	align-items: center;
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
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h2 class="h2 mb-0 text-gray-800">평가 관리</h2>
				</div>
				<div>
					<div class="list">
						<h3>출제 대기 중인 평가</h3>
						<button type="button" class="btn btn-primary mb-2"
							onClick="location.href='/alomedia/lms/teacher/exam/new'">평가
							생성</button>
					</div>
					<table class="table table-hover">
						<thead>
							<tr class="table-primary">
								<th>평가명</th>
								<th>제한시간</th>
								<th>응시자</th>
								<th>문제 확인</th>
								<th>등록</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="standbyExam" items="${standbyExams}">
								<tr>
									<td>${standbyExam.examName}</td>
									<td>${standbyExam.timeLimit}분</td>
									<c:choose>
										<c:when test="${standbyExam.examState eq '대기 중'}">
											<td>-</td>
										</c:when>
										<c:otherwise>
											<td> ${standbyExam.examinee}/${lecturePeople}</td>
										</c:otherwise>
									</c:choose>
									<td> <a href="${context}/teacher/exam/${standbyExam.examId}">문제 확인</a></td>
									<c:choose>
										<c:when test="${standbyExam.examState eq '대기 중'}">
											<td>
											<form:form
											action="${context}/teacher/exam/${standbyExam.examId}/start"
											modelAttribute="examList">
											<input type="submit" class="btn btn-primary" value="시험 시작">
										</form:form>
									</td>
										<td>
										<form:form
											action="${context}/teacher/exam/${standbyExam.examId}/remove"
											modelAttribute="examList">
											<input type="submit" class="btn btn-primary" value="삭제">
										</form:form>
									</td>
										</c:when>
										<c:otherwise>
											<td>시험 진행 중</td>
											<td>-</td>
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
								<th>평가일</th>
								<th>응시자</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="finishedExam" items="${finishedExams}" varStatus="status">
								<tr>
									<td>${finishedExam.examName}</td>
									<td>${finishedExam.examDate}</td>
									<td>${examinee[status.index]}/${lecturePeople}</td>
									<td><a
										href="${context}/teacher/exam/${finishedExam.examId}/student">${finishedExam.examState}</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- Footer -->
			<%@ include file="./footer/footer.jsp"%>
			<!-- End of Footer -->
		</div>
		<!-- End of Page Wrapper -->
	</div>
</body>
</html>