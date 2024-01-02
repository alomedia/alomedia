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
}

.input-form {
	max-width: 500px;
	margin-bottom: 60px;
	padding: 32px;
}

  #content-wrapper {
    flex: 1;
  }
  
   footer.sticky-footer {
    position: relative;
    bottom: 0;
    width: 100%;
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
					<h2 class="h2 mb-0 text-gray-800">내 정보 수정</h2>
				</div>
				<hr>
				<div class="container">
					<div class="input-form-backgroud row">
						<div class="input-form col-md-12 mx-auto">
							<form class="validation-form" name="member" method="POST" onsubmit="return validateForm()" novalidate>
								<div class="row">
									<div class="col-md mb-3">
										<label for="name">이름</label> <input type="text" class="form-control" id="name" name="name" value="${member.name}" required readonly>
									</div>
								</div>
								<div class="mb-3">
									<label for="password" class="col-form-label">비밀번호</label> 
									<input type="password" class="form-control" id="password" name="password" required>
									<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
								</div>
								<div class="mb-3">
									<label for="passwordTwo" class="col-form-label">비밀번호 재입력</label> 
									<input type="password" class="form-control" id="passwordTwo" name="passwordTwo" required>
									<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
								</div>
								<div class="mb-3">
									<label for="birth" class="col-form-label">생년월일</label> <input type="text" class="form-control" id="birth" name="birth" value="${member.birth}" required readonly>
								</div>
								<div class="mb-3">
									<label for="gender" class="col-form-label">성별</label> <input type="text" class="form-control" id="gender" name="gender" value="${member.gender}" required readonly>
								</div>

								<div class="mb-3">
									<label for="phone" class="col-form-label">휴대폰</label> <input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" required readonly>
								</div>
								<div class="mb-3">
									<label for="address" class="col-form-label">주소</label> <input type="text" class="form-control" id="address" name="address" value="${member.address}" required>
									<div class="invalid-feedback">주소를 입력해주세요.</div>
								</div>

								<div class="mb-3">
									<label for="mail" class="col-form-label">이메일</label> 
									<input type="email" class="form-control" id="mail" name="mail" value="${member.mail}" required>
									<div class="invalid-feedback">이메일을 입력해주세요.</div>
								</div>
								<hr class="mb-4">
								<input type="submit" class="btn btn-dark" value="수정하기">
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
	<!-- End of Page Wrapper -->
	<script type="text/javascript">
	    window.addEventListener('load', () => {
	        const forms = document.getElementsByClassName('validation-form');
	
	        Array.prototype.filter.call(forms, (form) => {
	            form.addEventListener('submit', function (event) {
	                var password = document.getElementById('password').value;
	                var passwordTwo = document.getElementById('passwordTwo').value;
	
	                if (form.checkValidity() === false) {
	                    event.preventDefault();
	                    event.stopPropagation();
	                } else {
	                    if (password === passwordTwo) {
	                        alert('수정되었습니다.');
	                    } else {
	                        alert('비밀번호가 일치하지 않습니다.');
	                        event.preventDefault();
	                    }
	                }
	                form.classList.add('was-validated');
	            }, false);
	        });
	    }, false);
	</script>
</body>
</html>