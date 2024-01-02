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
<title>출결 확인</title>
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
					<h2 class="h2 mb-0 text-gray-800">출결 관리</h2>
				</div>
				<hr>
				<h3>출석 번호 설정</h3>
				<c:choose>
					<c:when test="${empty settingNum}">
						<form action="${context}/teacher/attendance/AttendanceCheck" method="post">
							<div class="row mb-3">
								<div class="col-md-auto mb-3">
									<input type="number" class="form-control" min="1000" max="9999" name="attendanceNum" id="attendacneNum" placeholder="숫자 4자리" style="width: 194px" />
								</div>
								<div class="col-md-auto mb-3">
									<input type="submit" class="btn btn-primary" value="확인" />
								</div>
							</div>
						</form>
					</c:when>
					<c:otherwise>
						<div class="row mb-3">
							<div class="col-md-auto mb-3">
								<input type="text" class="form-control" name="attendanceNum" id="attendacneNum" placeholder="오늘 출석 번호 : ${settingNum}" disabled="disabled" />
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<table class="table table-hover">
					<thead>
						<tr class="table-primary">
							<th scope="col">회원 번호</th>
							<th scope="col">이름</th>
							<th scope="col">전화번호</th>
							<th scope="col">총 출석일</th>
							<th scope="col">지각</th>
							<th scope="col">조퇴</th>
							<th scope="col">결석</th>
							<th scope="col">출결</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						<c:if test="${not empty members and not empty attendance}">
							<c:forEach var="member" items="${members}" varStatus="loop">
								<tr>
									<td>${member.id}</td>
									<td>${member.name}</td>
									<td>${member.phone}</td>
									<td>${attendance[loop.index].totalAttendance}</td>
									<td>${attendance[loop.index].late}</td>
									<td>${attendance[loop.index].leaveEarly}</td>
									<td>${attendance[loop.index].absent}</td>
									<td><c:choose>
											<c:when test="${checkTime[loop.index].attendanceTime eq null}">
											N
										</c:when>
											<c:otherwise>
											${checkTime[loop.index].attendanceTime}
										</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<!-- Footer -->
			<%@ include file="./footer/footer.jsp"%>
			<!-- End of Footer -->
		</div>
		<!-- End of Page Wrapper -->
	</div>
</body>
</html>