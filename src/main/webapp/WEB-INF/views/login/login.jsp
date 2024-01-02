<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	Object name = request.getAttribute("name");
	Object userType = request.getAttribute("userType");
	Object curriculum = request.getAttribute("curriculum");
	Object phone = request.getAttribute("phone");
	Object id = request.getAttribute("id");
	
	session.setAttribute("name", name);
	session.setAttribute("userType", userType);
	session.setAttribute("curriculum", curriculum);
	session.setAttribute("phone", phone);
	session.setAttribute("id", id);
	
	session.setMaxInactiveInterval(100); // (초) ex) (60) : 1분

	if(userType.equals("수강생")) {
		response.sendRedirect("/alomedia/lms/student/dashboard");
	} else if(userType.equals("강사")) {
		response.sendRedirect("/alomedia/lms/teacher/attendance");
	} else if(userType.equals("관리자")) {
		response.sendRedirect("/alomedia/lms/admin/members");
	} else {
		response.sendRedirect("/alomedia");
	}
%>

</body>
</html>