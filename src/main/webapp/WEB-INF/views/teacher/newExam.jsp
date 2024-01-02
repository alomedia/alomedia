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
<title>평가 등록</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="icon" href="${resPath}/img/favicon.png">
<!-- Custom fonts for this template-->
<link href="${resPath}/css/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
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
				<div class="d-sm-flex align-items-center justify-content-between mb-4">
					<h2 class="h2 mb-0 text-gray-800">평가 등록</h2>
				</div>
				<hr>
				<div>
					<%-- 
					<form:form action="/alomedia/lms/teacher/exam/new" modelAttribute="exam" id="exam" class="exam">
						<ol id="question">
							<li>
								<div>
									<label for="examName">평가명 : </label> 
									<input type="text" name="examName" required>
								</div>
								<label for="timeLimit">평가 제한 시간 : </label>
								<input type="number" name="timeLimit" placeholder="단위: 분" required>
							</li>		
							
							
							<li id="q1">
								<div>
									<input type="hidden" name="exams[0].questionNum"  value="1">
									<input type="text" placeholder="문제 : "  name="exams[0].examContent"  required> 
								</div>
								<input type="number" name="exams[0].examAllotment" placeholder="배점" id="num1" onKeyup="Sum()" required>
							</li>
							
							<input type="button" class="btn btn-primary addContent" value="문제 추가" >
						</ol>
						<hr>
					<p><input type="submit" class="btn btn-primary" id="submitBtn" name="submitBtn" value="완료"></p>
					</form:form>
				</div>
				 --%>
					<div class="input-form col-md-12">
						<form:form action="/alomedia/lms/teacher/exam/new" modelAttribute="exam" id="exam" class="exam">
							<ol id="question">
								<div class="row">
									<div class="col-md mb-3">
										<label for="examName">평가명</label> <input type="text" class="form-control" name="examName" id="examName" required>
									</div>
									<div class="col-md-3 mb-3">
										<label for="timeLimit">단위: 분</label> <input type="number" class="form-control" name="timeLimit" id="timeLimit" placeholder="평가 시간" required>
									</div>
								</div>
								<hr>
								<li id="q1">
									<div class="row">
										<div class="col-md mb-3">
											<input type="hidden" class="form-control" name="exams[0].questionNum" value="1">
											<textarea class="form-control" placeholder="문제 : " name="exams[0].examContent" rows="3" required></textarea>
										</div>
										<div class="col-md-2 mb-3">
											<input type="number" class="form-control" name="exams[0].examAllotment" placeholder="배점" required>
											<div class="mt-2">
												<input type="button" class="btn btn-danger deleteContent" value="삭제">
											</div>
										</div>
									</div>
								</li>
								<input type="button" class="btn btn-primary addContent" value="문제 추가">
							</ol>
							<hr>
							<input type="submit" class="btn btn-primary" id="submitBtn" name="submitBtn" value="완료">
						</form:form>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<%@ include file="./footer/footer.jsp"%>
			<!-- End of Footer -->
		</div>
		<!-- end of page Wrapper -->
	</div>
	<script type="text/javascript" src="<c:url value='/resources/js/newExam.js'/>"></script>
</body>
</html>