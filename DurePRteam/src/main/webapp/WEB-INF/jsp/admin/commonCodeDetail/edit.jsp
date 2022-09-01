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
								<h3 class="card-title">상세 공통코드 ${ not empty commonCodeDetail.masterCode ? "수정" : "등록" }</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="commonCodeDetail">
								<div class="card-body">
									<div class="form-group">
										<label for="masterCode">공통코드</label>										
										<!--<form:input path="masterCode" class="form-control" readonly="true" disabled="true" />-->
										<input type="text" class="form-control" value="${ commonCode.masterCode }" readonly disabled />
									</div>
									<div class="form-group">
										<label for="text">코드명</label>
										<input type="text" class="form-control" value="${ commonCode.text }" readonly disabled />
									</div>	
									<div class="form-group">
										<label for="detailCode">상세코드번호 (평점항목은 점수로 입력) ex.상세코드번호: 3 상세코드명: 3점(적절)</label>
										<form:input path="detailCode" class="form-control" placeholder="ex) 01 or 1" maxlength="2"
											readonly="${ not empty commonCodeDetail.masterCode ? true : false }"
											disabled="${ not empty commonCodeDetail.masterCode ? true : false }" />
									</div>
									<div class="form-group">
										<label for="text">상세코드명</label>										
										<form:input path="text" class="form-control" />
									</div>															
									<div class="form-group">
										<label for="activeYN">사용</label>
										<select class="form-control" name="activeYN">
											<option value="Y" ${ commonCodeDetail.activeYN == "Y" ? "selected" : "" }>Y</option>
											<option value="N" ${ commonCodeDetail.activeYN == "N" ? "selected" : "" }>N</option>
										</select>
									</div>
									<div class="form-group">
										<label for="remark">비고</label> 
										<form:input path="remark" class="form-control" />		
									</div>
								</div>
								<!-- /.card-body -->

								<div class="card-footer">
									<button type="submit" class="btn btn-primary">저장</button>
									<a href="/admin/commonCode/list" class="btn btn-warning">목록으로</a>
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