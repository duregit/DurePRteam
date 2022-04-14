<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>생활재 홍보단 MAIN</title>

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
							<div class="card-footer">								
								<font size="2px">
									${ usermain.userId } 님 환영합니다.
								</font>
							</div>
						
							
							<!-- form start -->
							<form:form method="post" modelAttribute="main"  style="text-align:center;">
								<div style="margin:20px;">
									<button type="button" style="margin:15px;" class="btn btn-success" onclick="location.href='my/my01'">My Page</button>
								<br/>
							<c:choose>
								<c:when test="${usermain.userLevel == 'A' }">
									<button type="button" style="margin:15px;" class="btn btn-success" onclick="location.href='userlist/userlist01'">회원관리</button>						
								<br/>
								</c:when>
							</c:choose>	
									<button type="button" style="margin:15px;" class="btn btn-success" onclick="location.href='planning/plan01'">계획서 작성</button>	
								<br/>
									<button type="button" style="margin:15px;" class="btn btn-success" onclick="location.href='evaluation/eval01'">평가서 작성</button>		
								</div>
								<!-- /.card-body -->

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
	function Fnpage1() {
		frm = document.createElement('form');
		frm.setAttribute('method','post');
		frm.setAttribute('action', 'preview');    
		document.body.appendChild(frm);
		frm.submit();		
	}
</script>
</body>
</html>