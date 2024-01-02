<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 	<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar-->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${context}/admin/members">
                <h1 class="sidebar-brand-text mx-3" style="font-size: 1rem">ALO MEDIA</h1>
            </a>

            <hr class="sidebar-divider my-0">

            <li class="nav-item active">
                <a class="nav-link" href="${context}/admin/members">
                    <span>관리자 페이지</span></a>
            </li>

            <hr class="sidebar-divider">

            <div class="sidebar-heading">
                메뉴
            </div>
            
            <li class="nav-item">
                <a class="nav-link" href="${context}/admin/members">
                	<i class="fas fa-fw fa-cog"></i>
                    <span>회원 관리</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="${context}/admin/lectures">
                	<i class="fas fa-fw fa-cog"></i>
                    <span>강의 관리</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="${context}/admin/notice">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>공지사항 관리</span></a>
            </li>

            <!-- Heading -->
            <div class="sidebar-heading">
                info
            </div>

            <li class="nav-item">
                <a class="nav-link" href="${context}/admin/mypage">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>내 정보 수정</span></a>
            </li>
            
        </ul>
        <!-- End of Sidebar -->