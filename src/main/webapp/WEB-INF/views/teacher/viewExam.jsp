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
<title>평가 문제 확인</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
.input-form {
	max-width: 680px;
	margin-bottom: 60px;
	padding: 32px;
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
					<h2 class="h2 mb-0 text-gray-800">평가 문제 확인</h2>
				</div>
				<hr>
				<div class="input-form col-md-12">
					<form:form action="${context}/teacher/exam" method="Get"
						modelAttribute="exam" id="exam" class="exam">
						<ol id="question">
							<div class="row">
								<div class="col-md mb-3">
									<label for="examName">평가명</label> <input type="text"
										class="form-control" name="examName" id="examName"
										value="${examList.examName}" readonly>
								</div>
								<div class="col-md-3 mb-3">
									<label for="timeLimit">단위: 분</label> <input type="number"
										class="form-control" name="timeLimit" id="timeLimit"
										value="${examList.timeLimit}" placeholder="평가 시간" readonly>
								</div>
							</div>
							<hr>
							<c:forEach var="exam" items="${exams}">
								<li id="q1">
									<div class="row">
										<div class="col-md mb-3">
											<textarea class="form-control resizable-textarea" rows="3" style="overflow:hidden; resize: none;"
												readonly>${exam.examContent}</textarea>
										</div>
										<div class="col-md-2 mb-3">
											<input type="number" class="form-control"
												value="${exam.examAllotment}" readonly>
										</div>
									</div>
								</li>
							</c:forEach>
						</ol>
						<hr>
						<input type="submit" class="btn btn-primary" id="submitBtn"
							name="submitBtn" value="완료">
					</form:form>
				</div>
			</div>
			<!-- Footer -->
			<%@ include file="./footer/footer.jsp"%>
			<!-- End of Footer -->
		</div>
		<!-- End of Page Wrapper -->
	</div>
	<script type="text/javascript" src="${resPath}/js/newExam.js"></script>
	<script>
		function resizeTextarea(textarea) {
			textarea.style.height = 'auto';
			textarea.style.height = (textarea.scrollHeight) + 'px';
		}

		window.onload = function() {
			document.querySelectorAll('.resizable-textarea').forEach(
					function(textarea) {
						resizeTextarea(textarea);
					});
		};
	</script>
</body>
</html>