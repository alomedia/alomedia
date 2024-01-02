<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources" />

<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아로미디어</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
<link rel="icon" href="${resPath}/img/favicon.png">
<!-- Bootstrap core CSS -->
<link href="${resPath}/css/bootstrap.min.css" rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<!-- Custom styles for this template -->
<link href="${resPath}/css/signin.css" rel="stylesheet">
</head>
<body class="text-center">

	<main class="form-signin">
		<form action="/alomedia/lms/login" method="post" onsubmit="return validateForm()">
			<!-- <form> -->
			<a href="/alomedia"> <img class="mb-4" src="${resPath}/img/logo.png" alt="로고" width="72" height="57">
			</a>
			<h1 class="h3 mb-3 fw-normal">아로미디어</h1>
			<div class="form-floating">
				<input type="text" class="form-control" id="phone" name="phone" placeholder="id"> <label for="phone">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="password" name="password" placeholder="password"> <label for="password">비밀번호</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
			<p class="mt-5 mb-3 text-muted">Copyright &copy; alomedia</p>
		</form>
		<script>
		    <c:if test="${not empty error}">
		        alert('${error}');
		    </c:if>
		</script>
	</main>
	

	<script>
		function validateForm() {
			var id = document.getElementById('phone').value;
			var password = document.getElementById('password').value;

			if (id.trim() === '' || password.trim() === '') {
				alert('아이디와 비밀번호를 입력하세요.');
				return false;
			}
			return true;
		}
	</script>
</body>
</html>