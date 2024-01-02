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
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
					<h2 class="h2 mb-0 text-gray-800">회원관리 > 수강생 관리</h2>
				</div>
				<hr>
				<div class="row mb-3">
					<h3 class="col-auto">
						<span style="color: #000000">${member.name}</span>님
					</h3>
					<div class="col-auto">
						<form action="${context}/admin/members/member/${member.id}/reset" method="post">
							<button type="submit" class="btn btn-dark reset" id="${member.id}" >비밀번호 초기화</button>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div>
							<table class="table atable">
								<tbody>
									<tr>
										<th class="table-secondary">이름</th>
										<td>${member.name}</td>
									</tr>
									<tr>
										<th class="table-secondary">성별</th>
										<td>${member.gender}</td>
									</tr>
									<tr>
										<th class="table-secondary">주소</th>
										<td>${member.address}</td>
									</tr>
									<tr>
										<th class="table-secondary">과정</th>
										<td>${member.curriculum}</td>
									</tr>
									<tr>
										<th class="table-secondary">담당 강사</th>
										<td>${lecture.lectureTeacher}</td>
									</tr>
									<tr>
										<th class="table-secondary">교육기간</th>
										<td>${lecture.lectureStart}~${lecture.lectureEnd}</td>
									</tr>
									<tr>
										<th class="table-secondary">수업 시간</th>
										<td>${lecture.lectureTime}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="col">
						<table class="table">
							<thead>
								<tr class="table-secondary">
									<th>총 수업 일자</th>
									<th>출석</th>
									<th>결석</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${totalDate}</td>
									<td>${attendance.totalAttendance}</td>
									<td>${attendance.absent}</td>
								</tr>
								<tr class="table-secondary">
									<th>지각</th>
									<th>조퇴</th>
									<th>남은 일수</th>
								</tr>
								<tr>
									<td>${attendance.late}</td>
									<td>${attendance.leaveEarly}</td>
									<td>${restDay}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<hr class="my-6">
				<h3 style="color: #000000">출결 관리</h3>
				<table class="table">
					<thead>
						<tr class="table-secondary">
							<th>날짜</th>
							<th>상태</th>
							<th>사유</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>(개발중)</td>
							<td>(개발중)</td>
							<td><select class="form-select form-select-lg mb-3" aria-label="Large select example">
									<option selected>무단결석</option>
									<option value="1">병결</option>
									<option value="2">기타</option>
							</select></td>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="col text-right">
						<div class="row justify-content-end">
							<div class="col-auto">
								<button type="button" class="btn btn-dark mr-3" onClick="location.href='/alomedia/lms/admin/members'">목록으로</button>
							</div>
							<div class="col-auto">
								<form action="${context}/admin/members/member/${memberId}" method="post">
									<button type="submit" class="btn btn-dark">확인</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<%@ include file="./footer/footer.jsp"%>
			<!-- End of Footer -->
		</div>
	</div>
	<!-- End of Page Wrapper -->
	<script type="text/javascript" src="<c:url value='/resources/js/reset.js'/>"></script>
</body>
</html>