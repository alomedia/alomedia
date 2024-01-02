<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h2 class="h2 mb-0 text-gray-800">내 강의실</h2>
				</div>
				<hr>

				<table class="table">
					<tr>
						<th scope="row">성명</th>
						<td>${name}</td>
					</tr>
					<tr>
						<th scope="row">과정</th>
						<td>${curriculum}</td>
					</tr>
					<tr>
						<th scope="row">강사명</th>
						<td>${teacherName}</td>
					</tr>
					<tr>
						<th scope="row">기간</th>
						<td>${lectureStart}~${lectureEnd}</td>
					</tr>
				</table>

				<h3>출석 번호 입력</h3>
				<c:choose>
					<c:when test="${isAttendance}">
						<div class="mb-3">
							<input type="text" name="attendanceNum" id="attendacneNum"
								placeholder="출석처리 되었습니다." disabled="disabled" />
						</div>
					</c:when>
					<c:otherwise>
						<form action="${context}/student/dashboard/AttendanceCheck"
							method="post">
							<div class="mb-3">
								<input type="number" min="1000" max="9999" name="attendanceNum"
									id="attendacneNum" placeholder="숫자 4자리" style="width: 194px" />
								<input type="submit" class="btn btn-primary btn-sm" value="확인" />
							</div>
						</form>
					</c:otherwise>
				</c:choose>

				<table class="table table-bordered">
					<tr class="bg-primary text-light">
						<th scope="col">총 수업 일자</th>
						<th scope="col">출석</th>
						<th scope="col">결석</th>
					</tr>
					<tr>
						<td>${totalDate}</td>
						<td>${totalAttendance}</td>
						<td>${absent}</td>
					</tr>
					<tr class="bg-primary text-light">
						<th scope="col">지각</th>
						<th scope="col">조퇴</th>
						<th scope="col">남은 일수</th>
					</tr>
					<tr>
						<td>${late}</td>
						<td>${leaveEarly}</td>
						<td>${restDay}</td>
					</tr>
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