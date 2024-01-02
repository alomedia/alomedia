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
<title>평가 결과</title>
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
					<h1 class="h2 mb-0 text-gray-800">평가 결과</h1>
				</div>
				<hr>
				<div class="input-form col-md-12">
					<form action="${context}/student/exam" method="get">
						<c:forEach var="exam" items="${exams}" varStatus="status">
							<div>
								<label>${exam.questionNum}번 문제</label> 
								<span> 배점 : ${exam.examAllotment}</span>
								<textarea class="form-control resizable-textarea" rows="1" style="overflow:hidden; resize: none;"
								readonly>${exam.examContent}</textarea>
								
								<div style="margin: 20px 0"></div>
								<label>${exam.questionNum}번 답안</label>
								<textarea class="form-control resizable-textarea" rows="3" style="overflow:hidden; resize: none;"
								readonly>${examSubmits[status.index].ans}</textarea>
								
								<div style="margin: 20px 0"></div>
								<label>강사 코멘트    점수 : ${examSubmits[status.index].score}</label>	
								<textarea class="form-control resizable-textarea" rows="3" style="overflow:hidden; resize: none;"
								readonly>${examSubmits[status.index].teacherComent}</textarea>
								<div style="margin: 20px 0"><hr></div>
							</div>
								</c:forEach>
						<input type="submit" class="btn btn-primary" id="submitBtn" name="submitBtn" value="완료">
					</form>
				</div>
			</div>
			<!-- Footer -->
			<%@ include file="./footer/footer.jsp"%>
			<!-- End of Footer -->
		</div>
	</div>
	<!-- End of Page Wrapper -->
</body>
</html>