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
					<h2 class="h2 mb-0 text-gray-800">회원 관리 > 회원 생성</h2>
				</div>
				<hr>
				<div class="container">
					<div class="input-form-backgroud row">
						<div class="input-form col-md-12 mx-auto">
							<h4 class="mb-3">회원가입</h4>
							<form class="validation-form" name="member" method="POST" novalidate>
								<div class="row">
									<div class="col-md mb-3">
										<label for="name">이름</label> <input type="text" class="form-control" id="name" name="name" placeholder="" value="" required>
										<div class="invalid-feedback">이름을 입력해주세요.</div>
									</div>
								</div>
								<div class="mb-3">
									<label for="birth">생년월일</label> <input type="date" class="form-control" id="birth" name="birth" placeholder="" required>
									<div class="invalid-feedback">생년월일을 입력해주세요 ex)2000-01-01</div>
								</div>
								<div class="mb-3">
									<label for="gender">성별</label>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="gender" id="남자" value="남자" required> <label class="form-check-label" for="남자">남자</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="gender" id="여자" value="여자" required> <label class="form-check-label" for="여자">여자</label>
									</div>
									<div class="invalid-feedback">성별을 선택해주세요.</div>
								</div>
								<div class="mb-3">
									<label for="phone">휴대폰</label> <input type="tel" class="form-control" onkeyup="inputPhoneNumber(this);" maxlength="13" id="phone" name="phone" required>
									<div class="invalid-feedback">휴대폰을 입력해주세요.</div>
								</div>
								<div class="mb-3">
									<label for="address">주소</label> <input type="text" class="form-control" id="address" name="address" placeholder="" required>
									<div class="invalid-feedback">주소를 입력해주세요.</div>
								</div>
								<div class="mb-3">
									<label for="email">이메일</label> <input type="email" class="form-control" id="email" name="mail" required>
									<div class="invalid-feedback">이메일을 입력해주세요.</div>
								</div>
								<div class="mb-3">
									<label for="userType">권한</label> <select class="custom-select d-block" id="userType" name="userType">
										<option value="수강생">수강생</option>
										<option value="강사">강사</option>
										<option value="관리자">관리자</option>
									</select>
									<div class="invalid-feedback">권한을 입력해주세요.</div>
								</div>
								<div class="mb-3">
									<label for="curriculum">강의</label> <select class="custom-select d-block" id="curriculum" name="curriculum">
										<option>-</option>
										<c:forEach var="lectureList" items="${ lectureLists }">
											<c:choose>
												<c:when test="${lectureList.lectureState eq '준비 중'}">
													<option>${lectureList.lectureName}</option>
												</c:when>
												<c:when test="${lectureList.lectureState eq '진행 중'}">
													<option>${lectureList.lectureName}</option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
									<div class="invalid-feedback">강의을 입력해주세요.</div>
								</div>
								<hr class="mb-4">
								<div class="row">
									<div class="col-md-6 mb-3">
										<button class="btn btn-dark btn-lg btn-block" type="button" onClick="location.href='/alomedia/lms/admin/members'">목록으로</button>
									</div>
									<div class="col-md-6 mb-3">
										<button class="btn btn-dark btn-lg btn-block" type="submit">가입 완료</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<%@ include file="./footer/footer.jsp"%>
			<!-- End of Footer -->
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

    function inputPhoneNumber(obj) {

       var number = obj.value.replace(/[^0-9]/g, "");
       var phone = "";

       if(number.length < 4) {
           return number;
       } else if(number.length < 7) {
           phone += number.substr(0, 3);
           phone += "-";
           phone += number.substr(3);
       } else if(number.length < 11) {
           phone += number.substr(0, 3);
           phone += "-";
           phone += number.substr(3, 3);
           phone += "-";
           phone += number.substr(6);
       } else {
           phone += number.substr(0, 3);
           phone += "-";
           phone += number.substr(3, 4);
           phone += "-";
           phone += number.substr(7);
       }
       obj.value = phone;
   }
  </script>
	<!-- End of Page Wrapper -->
</body>
</html>