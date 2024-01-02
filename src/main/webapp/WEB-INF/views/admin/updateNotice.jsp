<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>공지사항 수정</title>
<link rel="icon" href="${resPath}/img/favicon.png">
<!-- Custom fonts for this template-->
<link href="${resPath}/css/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${resPath}/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
textarea {
	width: 100%;
	height: 6.25em;
	border: none;
	resize: none;
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
					<h3 class="h2 mb-0 text-gray-800">공지사항 수정</h3>
				</div>
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="input-form col-md-12 mx-auto">
							<form:form action="${context}/admin/notice/${noticeId}">
								<div class="col-md-7 mb-3">
									<label for="noticeName" class="form-label">제목</label> <input type="text" class="form-control" id="noticeName" name="noticeName" value="${notice.noticeName}" required>
								</div>
								<div class="col-md-7 mb-3">
									<label for="noticeContent" class="form-label">내용</label>
									<textarea class="form-control" id="noticeContent" name="noticeContent" rows="20" required>${notice.noticeContent}</textarea>
								</div>
								<div class="col-md-7 mb-3">
									<div class="row">
										<div class="col-md-auto mb-3">
											<input type="button" class="btn btn-dark" onclick="location.href='${context}/admin/notice'" value="목록으로" />
										</div>
										<div class="col-md-1 mb-3">
											<input type="submit" class="btn btn-dark" value="수정 완료" />
										</div>
									</div>
								</div>
							</form:form>
						</div>
					</div>
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