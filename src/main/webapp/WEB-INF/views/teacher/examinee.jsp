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

<title>응시자 확인</title>
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
	max-width: 680px;
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
					<h2 class="h2 mb-0 text-gray-800">평가 관리 > 응시자 목록</h2>
				</div>

				<h2>평가명 : ${examList.examName}</h2>
				<div class="list">
					<table class="table">
						<thead>
							<tr class="table-primary">
								<th>이름</th>
								<th>제출 여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="student" items="${students}">
								<tr>
									<td>${student.name}</td>
									<td>(개발중)</td>
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