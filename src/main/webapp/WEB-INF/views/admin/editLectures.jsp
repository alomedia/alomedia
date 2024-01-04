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
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-bottom: 60px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
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
					<h2 class="h2 mb-0 text-gray-800">강의 관리 > 강의 수정</h2>
				</div>
				<hr>
				<div class="container">
					<div class="input-form-backgroud row">
						<div class="input-form col-md-12 mx-auto">
							<h4 class="mb-3">강의 수정</h4>
							<form action="${context}/admin/lectures/${list.lectureId}/edit" method="post" class="validation-form" novalidate>
								<div class="row">
									<div class="col-md mb-3">
										<label for="lectureName">과정 명</label> <input type="text" class="form-control" id="lectureName" name="lectureName" value="${list.lectureName}" required>
										<div class="invalid-feedback">과정명을 입력해주세요.</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-3 mt-3">
										<label for="lectureStart">개강 일</label> <input type="text" id="lectureStart" class="form-control" name="lectureStart" value="${list.lectureStart}">
									</div>

									<div class="col-md-6 mb-3 mt-3">
										<label for="lectureEnd">종강 일</label> <input type="text" id="lectureEnd" class="form-control" name="lectureEnd" value="${list.lectureEnd}">
									</div>
								</div>
								<div class="mt-3">
									<label for="gender">강의 시간</label>
									&nbsp
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="lectureDay" id="weekday" value="평일"> 
										<label class="form-check-label" for="weekday">평일</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="lectureDay" id="weekend" value="주말"> 
										<label class="form-check-label" for="weekend">주말</label>
										 &nbsp
									</div>
									<div class="row">
										<div class="col-md-4 mb-3">
											<input type="text" class="form-control" name="lectureTime" id="lectureTime" value="${list.lectureTime}">
										</div>
									</div>
									<div class="row">
										<div class="col-md-4 mb-3 mt-3">
											<label for="lectureTeacher">강사</label> <input type="text" class="form-control" id="lectureTeacher" name="lectureTeacher" value="${list.lectureTeacher}">
										</div>
										<div class="col-md-4 mb-3 mt-3">
											<label for="lectureRoom">강의실</label> <select class="custom-select d-block w-100" id="lectureRoom" name="lectureRoom">
												<option>1 강의실</option>
												<option>2 강의실</option>
												<option>3 강의실</option>
											</select>
										</div>
										<div class="col-md-4 mb-3 mt-3">
											<label for="lecturePeople">수강 인원</label> 
											<input type="text" class="form-control" id="lecturePeople" name="lecturePeople" value="${list.lecturePeople}">
										</div>
									</div>
									
									<div class="row">
										<div class="col-md-4 mb-3 mt-3">
											<label for="lectureState">상태</label>
											<select class="custom-select d-block w-100" id="lectureState" name="lectureState">
												<option>준비 중</option>
												<option>진행 중</option>
												<option>종강</option>
												<option>기타</option>
											</select>
										</div>
									</div>
									
									<hr class="mb-4">
									<div class="row">
										<div class="col-md-6 mb-3">
											<button class="btn btn-dark btn-lg btn-block" type="button" onClick="location.href='/alomedia/lms/admin/lectures'">목록으로</button>
										</div>
										<div class="col-md-6 mb-3">
											<button class="btn btn-dark btn-lg btn-block" type="submit">확인</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
    
    var lectureDay = "${list.lectureDay}";

    if (lectureDay === '평일') {
        document.getElementById('weekday').checked = true;
    } else if (lectureDay === '주말') {
        document.getElementById('weekend').checked = true;
    }
    
    var lectureState = "${list.lectureState}";
    var selectElement = document.getElementById('lectureState');
    for (var i = 0; i < selectElement.options.length; i++) {
        if (selectElement.options[i].value === lectureState) {
            selectElement.options[i].selected = true;
            break;
        }
    }
  </script>
			<!-- Footer -->
			<%@ include file="./footer/footer.jsp"%>
			<!-- End of Footer -->
		</div>
	</div>
	<!-- End of Page Wrapper -->
</body>
</html>