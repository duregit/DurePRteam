<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>생활재 홍보단 LOGIN</title>

<jsp:include page="/include/_header.jsp" />
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="min-height: 1345.31px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="col-sm-12">
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">생활재 홍보단</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="login" >
								<div class="card-body">
									<div class="form-group">
										<div class="input-group">
			                                <div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fa fa-user"></i>
												</div>
											</div>
			                                <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" class="form-control" />
			                            </div>
			                         </div>
									<div class="form-group">
										<div class="input-group">
			                                <div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fa fa-lock"></i>
												</div>
											</div>
			                                <input type="password" id="userPW" name="userPW" placeholder="비밀번호를 입력하세요" class="form-control" />
			                            </div>
									</div>
									
									<c:if test="${msg == false}">
										<p style="color:f00;">로그인에 실패했습니다. 아이디 또는 비밀번호를 다시 입력하세요.</p>
									</c:if>


								</div>
								<!-- /.card-body -->

								<div class="card-footer">																					
									<button type="button" class="btn btn-warning float-left" onclick="FnJoin()">회원가입</button>				
									<button type="button" class="btn btn-primary float-right" onclick="FnSave()">로그인</button>	
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
<jsp:include page="/include/_footer.jsp" />
<script type="text/javascript">
	function FnJoin() {
		frm = document.createElement('form');
		frm.setAttribute('method','get');
		frm.setAttribute('action', 'join/join01');    
		document.body.appendChild(frm);
		frm.submit();		
	}
	
	function FnLogin() {
		frm = document.login
		
		//if($('#userId').val() == ""){
		//	alert("아이디를 입력해주세요.")
		//	return;
		//}else if($('#userPw').val() == ""){
		//	alert("비밀번호를 입력해주세요.")
		//	return;
		//}
		
		frm.submit();
	}
	
	function FnSave() {
		frm = document.login
		
		alert("로그인 하시겠습니까?");
		
		//저장

		$("#login").submit();
	}
	
</script>
</body>
</html>