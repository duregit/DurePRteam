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
								<h3 class="card-title">상세 매장코드 ${ not empty commonsSubProp.suPiproperty ? "수정" : "등록" }</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="commonsSubProp">
								<div class="card-body">
									<div class="form-group">
										<label for="suPiproperty">단협코드</label>										
										<input name="piProperty" type="text" class="form-control" value="${ commonProp.piProperty }" readonly disabled />
									</div>
									<div class="form-group">
										<label for="suPiproperty">매장코드</label>										
										<input name="suPiproperty" type="text" class="form-control" value="${ commonsSubProp.suPiproperty }" 
											${ not empty commonsSubProp.suPiproperty ? "readonly" : "" }
											${ not empty commonsSubProp.suPiproperty ? "disabled" : "" } />
									</div>
									<div class="form-group">
										<label for="suPipropname">매장명</label>
										<input name="suPipropname" type="text" class="form-control" value="${ commonsSubProp.suPipropname }" />
									</div>														
									<div class="form-group">
										<label for="supiActive">사용</label>
										<select class="form-control" name="supiActive">
											<option value="Y" ${ commonsSubProp.supiActive == "Y" ? "selected" : "" }>Y</option>
											<option value="N" ${ commonsSubProp.supiActive == "N" ? "selected" : "" }>N</option>
										</select>
									</div>
								</div>
								<!-- /.card-body -->

								<div class="card-footer">
									<button type="submit" class="btn btn-primary">저장</button>
									<a href="/admin/commonProp/list" class="btn btn-warning">목록으로</a>
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
	$(document).ready(function () {
	});
</script>
</html>