<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 세션 가져오기
    HttpSession Loginsession = request.getSession(false);

    // 세션이 존재하지 않거나 필요한 속성이 없는 경우 로그인 페이지로 리다이렉트
    if (Loginsession == null || Loginsession.getAttribute("name") == null || !Loginsession.getAttribute("userType").equals("강사")) {
        response.sendRedirect("/alomedia"); // 로그인 페이지 URL로 조정
    }
    
    response.setHeader("Pragma", "no-cache"); 
    response.setHeader("Cache-Control", "no-cache"); 
    response.setHeader("Cache-Control", "no-store"); 
    response.setDateHeader("Expires", 0L); 
    
%>

<header class="p-3 text-bg-dark">
    <div class="container">
        <div style="position: absolute; right: 10px">
        	<span style="position: relative; right: 10px">강사 ${name}님</span>
			<button type="button" class="btn btn-primary" onClick="location.href='${context}/logout'">로그아웃</button>
        </div>
    </div>
</header>

