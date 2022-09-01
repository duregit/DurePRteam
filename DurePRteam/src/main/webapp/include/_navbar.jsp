<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 상단 네비게이션 바 -->
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<!-- Left navbar links -->
	<ul class="navbar-nav">		
		<!-- 좌측 네비게이션 아이콘 -->
		<li class="nav-item">
			<a class="nav-link" data-widget="pushmenu" href="#" role="button">
				<i class="fas fa-bars"></i>
			</a>
		</li>
		<!-- PC만 표시 -->
		<!--
		<li class="nav-item d-none d-sm-inline-block">
			<a href="/planning/create" class="nav-link">계획서작성</a>
		</li>
		<li class="nav-item d-none d-sm-inline-block">
			<a href="/planning/list" class="nav-link">계획서조회</a> 
		</li>
		<li class="nav-item d-none d-sm-inline-block">
			<a href="/evaluation/list" class="nav-link">평가서조회</a>
		</li>
		-->
		<!-- PC만 표시 끝 -->
	</ul>	
	<!-- 사용자 정보 표시 -->
	<ul class="navbar-nav ml-auto">
		
		<!-- Navbar Search -->
		<!-- 
		<li class="nav-item">
			<a class="nav-link" href="/planning/list">생활재홍보단</a>
		</li>
		 -->
		<li class="nav-item">
			<a class="nav-link" href="/my/my01" role="button">
				<i class="fa fa-user"></i>
			</a>		
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/logout" role="button">
				<i class="fa fa-lock"></i>
			</a>
		</li>
	</ul>
</nav>
<!-- 상단 네비게이션 바 끝-->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<a href="#" class="brand-link elevation-4" style="text-align: center;">		
		<span class="brand-text font-weight-light">생활재홍보단</span>
	</a>
	<div class="sidebar">
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<!-- 
			<div class="image">
				<img src="../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
			</div>
			 -->
			<div class="info">
				<a href="#">${ user.userName }</a>
				<a href="/logout" class=".ml-auto">[로그아웃]</a>
			</div>
		</div>
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
				<c:if test="${ user.userActive == 'Y' }">
					<li class="nav-item">
						<a href="/planning/create" class="nav-link">
							<i class="nav-icon fab fa-chrome"></i>
							<p>계획서작성</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="/planning/list" class="nav-link">
							<i class="nav-icon fab fa-chrome"></i>
							<p>계획서조회</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="/evaluation/list" class="nav-link">
							<i class="nav-icon fab fa-chrome"></i>
							<p>평가서조회</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="/my/my01" class="nav-link">
							<i class="nav-icon fab fa-chrome"></i>
							<p>마이페이지</p>
						</a>
					</li>
				</c:if>
				<c:if test="${ user.userLevel == 'A' }">
					<li class="nav-item">
			            <a href="#" class="nav-link">
			              	<i class="nav-icon fas fa-table"></i>
			              	<p>관리자페이지
			                	<i class="fas fa-angle-left right"></i>
			              	</p>
			            </a>
			            <ul class="nav nav-treeview">
			            	<li class="nav-item">
								<a href="/admin/member/list" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>사용자 관리</p>
								</a>
							</li>	
			            	<li class="nav-item">
								<a href="/admin/commonProp/list" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>단협, 매장 관리</p>
								</a>
							</li>					
							<li class="nav-item">
								<a href="/admin/commonCode/list" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>공통코드 관리</p>
								</a>
							</li>
			              	<li class="nav-item">
								<a href="/admin/goodsEval/list" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>생활재평가 항목 관리</p>
								</a>
							</li>
			            </ul>
			          </li>
				</c:if>
			</ul>
		</nav>
	</div>
</aside>