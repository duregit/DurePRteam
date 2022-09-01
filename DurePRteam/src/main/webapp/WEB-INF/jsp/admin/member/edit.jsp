<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>생활재홍보단</title>

<jsp:include page="/include/_header.jsp" />
</head>
<body class="sidebar-mini layout-navbar-fixed">
	<div class="wrapper">
		<!-- 네비게이션 바 -->
		<jsp:include page="/include/_navbar.jsp" />
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="min-height: 1345.31px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
				<!-- 
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>General Form</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">General Form</li>
							</ol>
						</div>
					</div>
				 -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="col-sm-12">
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">사용자 상세정보</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="member">
								<div class="card-body">
									<div class="form-group">
										<label for="userActive">가입상태</label>
										<input type="text" class="form-control" disabled="disabled" value="${ member.userActive eq 'N' ? '회원대기' : (member.userActive eq 'Y' ? '회원가입' : '회원탈퇴') }">
									</div>
						        	<div class="form-group">
										<label for="piPropName">단협</label>										
										<form:input path="piPropName" class="form-control" disabled="true" />										
									</div>
									<div class="form-group">
										<label for="suPIPropName">매장</label>										
										<form:input path="suPIPropName" class="form-control" disabled="true" />										
									</div>
									<label for="userId">ID</label>	
									<div class="input-group mb-3">
										<form:input path="userId" class="form-control rounded-0" disabled="true" />										
										<span class="input-group-append">
											<button type="button" class="btn btn-danger btn-flat" id="btnPWReset">비밀번호 초기화</button>
										</span>
									</div>
									<div class="form-group">
										<label for="userName">이름</label>										
										<form:input path="userName" class="form-control" disabled="true" />										
									</div>
									<div class="form-group">
										<label for="userCtel">휴대폰번호</label>										
										<form:input path="userCtel" class="form-control" disabled="true" />										
									</div>
									<div class="form-group">
										<label for="userZip">우편번호</label>										
										<form:input path="userZip" class="form-control" disabled="true" />										
									</div>
									<div class="form-group">
										<label for="userAddr1">주소</label>										
										<form:input path="userAddr1" class="form-control" disabled="true" />										
									</div>
									<div class="form-group">
										<label for="userAddr2">상세주소</label>										
										<form:input path="userAddr2" class="form-control" disabled="true" />										
									</div>
									<div class="form-group">
										<label for="bName">은행</label>										
										<form:input path="bName" class="form-control" disabled="true" />										
									</div>
									<div class="form-group">
										<label for="userACNum">계좌번호</label>										
										<form:input path="userACNum" class="form-control" disabled="true" />										
									</div>
								</div>
								<!-- /.card-body -->

								<div class="card-footer">
									<a href="list" class="btn btn-warning">목록으로</a>
									<c:if test="${ member.userLevel eq 'C' && member.userActive eq 'N' }">
										<button type="button" class="btn btn-primary" id="btnConfirm">승인</button>
									</c:if>
									<c:if test="${ member.userLevel eq 'C' && (member.userActive eq 'N' || member.userActive eq 'Y') }">
										<button type="button" class="btn btn-danger" id="btnDelete">탈퇴</button>							
									</c:if>
									<c:if test="${ member.userLevel eq 'C' && member.userActive eq 'Y' }">
										<button type="button" class="btn btn-info" id="btnAuthority">관리자권한부여</button>
									</c:if>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
		</div>
		<!-- ./wrapper -->
	</div>
</body>
<jsp:include page="/include/_footer.jsp" />

<script type="text/javascript">
$(function() {
	// 비밀번호초기화
	$("#btnPWReset").click(function() {		
		var userId = $("#userId").val();	// 사용자ID
		var inputData = {
			"userId": userId
		}
		if(confirm("비밀번호 초기화 하시겠습니까?")) {
			$.ajax({
				url : "/admin/member/pwReset",
				type : "POST",
				data: JSON.stringify(inputData),
				dataType: "text",
				contentType:"application/json;charset=UTF-8",
			    async: false,
			    success: function(){
			    	alert("비밀번호가 1234 로 초기화 되었습니다.");
			    },
			    error: function(xhr, status, error){
			       alert(xhr.responseText);
			    },
			    complete: function(xhr, status){}
			});
		} else {
			return false;	
		}
	});
	
	// 승인
	$("#btnConfirm").click(function() {		
		var userId = $("#userId").val();	// 사용자ID
		var inputData = {
			"userId": userId
		}
		if(confirm("가입승인 하시겠습니까?")) {
			$.ajax({
				url : "/admin/member/confirm",
				type : "POST",
				data: JSON.stringify(inputData),
				dataType: "text",
				contentType:"application/json;charset=UTF-8",
			    async: false,
			    success: function(){
			    	alert("승인되었습니다.");
			    	location.href = "edit?AuserId=" + userId
			    },
			    error: function(xhr, status, error){
			       alert(xhr.responseText);
			    },
			    complete: function(xhr, status){}
			});
		} else {
			return false;	
		}
	});
	
	// 탈퇴
	$("#btnDelete").click(function() {		
		var userId = $("#userId").val();	// 사용자ID
		var inputData = {
			"userId": userId
		}
		if(confirm("탈퇴 하시겠습니까?")) {
			$.ajax({
				url : "/admin/member/delete",
				type : "POST",
				data: JSON.stringify(inputData),
				dataType: "text",
				contentType:"application/json;charset=UTF-8",
			    async: false,
			    success: function(){
			    	alert("탈퇴되었습니다.");
			    	location.href = "edit?AuserId=" + userId
			    },
			    error: function(xhr, status, error){
			       alert(xhr.responseText);
			    },
			    complete: function(xhr, status){}
			});
		} else {
			return false;	
		}
	});
	
	// 관리자권한
	$("#btnAuthority").click(function() {		
		var userId = $("#userId").val();	// 사용자ID
		var inputData = {
			"userId": userId
		}
		if(confirm("관리자 권한부여 하시겠습니까?")) {
			$.ajax({
				url : "/admin/member/authority",
				type : "POST",
				data: JSON.stringify(inputData),
				dataType: "text",
				contentType:"application/json;charset=UTF-8",
			    async: false,
			    success: function(){
			    	alert("관리자 권한부여 되었습니다.");
			    	location.href = "edit?AuserId=" + userId
			    },
			    error: function(xhr, status, error){
			       alert(xhr.responseText);
			    },
			    complete: function(xhr, status){}
			});
		} else {
			return false;	
		}
	});
});
</script>
</html>