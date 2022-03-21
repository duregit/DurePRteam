<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>공통코드</title>

<jsp:include page="/include/_header.jsp" />
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
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
					<div class="row">
						<!-- 공통코드 -->
						<div class="col-md-6">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">공통코드</h3>
								</div>								
								<!-- /.card-header -->
								<div class="card-body">
									<div class="row">
										<div class="col-md-4">
											<div class="form-group row">
												<label for="masterCode" class="col-md-3 col-form-label">분류코드</label>
												<div class="col-md-9">
													<input type="text" class="form-control" id="masterCode" placeholder="분류코드">
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group row">
												<label for="masterText" class="col-md-3 col-form-label">코드명</label>
												<div class="col-md-9">
													<input type="text" class="form-control" id="masterText" placeholder="코드명">
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group row">
												<label for="text" class="col-md-3 col-form-label">사용</label>
												<div class="col-md-9">
													<select class="form-control" name="masterActiveYN">
														<option value="">전체</option>
														<option value="Y">Y</option>
														<option value="N">N</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-1">
											<button type="button" class="btn btn-info float-right">조회</button>
										</div>
									</div>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>공통코드</th>
												<th>코드명</th>
												<th>사용</th>
												<th>비고</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="commonCode" items="${ commonCodes }">
												<tr data-url="/admin/commonCodeDetail/list?masterCode=${ commonCode.masterCode }">
													<td>${ commonCode.masterCode }</td>
													<td>${ commonCode.text }</td>													
													<td>${ commonCode.activeYN }</td>
													<td>${ commonCode.remark }</td>
													<td data-url="edit?masterCode=${ commonCode.masterCode }">
														<button type="button" class="btn btn-default" id="edit">수정</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
								<div class="card-footer clearfix">
									<ul class="pagination pagination-sm m-0 float-right">
										<li class="page-item"><a class="page-link" href="#">«</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">»</a></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- /.공통코드-->
						<!-- 공통코드 상세-->
						<div class="col-md-6">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">공통코드 상세</h3>
								</div>								
								<!-- /.card-header -->
								<div class="card-body">
									<div class="row">
										<div class="col-md-4">
											<div class="form-group row">
												<label for="detailCode" class="col-md-5 col-form-label">상세분류코드</label>
												<div class="col-md-7">
													<input type="text" class="form-control" id="detailCode" placeholder="상세분류코드">
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group row">
												<label for="detailText" class="col-md-3 col-form-label">코드명</label>
												<div class="col-md-9">
													<input type="text" class="form-control" id="detailText" placeholder="코드명">
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group row">
												<label for="text" class="col-md-3 col-form-label">사용</label>
												<div class="col-md-9">
													<select class="form-control" name="detailActiveYN">
														<option value="">전체</option>
														<option value="Y">Y</option>
														<option value="N">N</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-1">
											<button type="button" class="btn btn-info float-right">조회</button>
										</div>
									</div>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>공통코드</th>
												<th>코드명</th>
												<th>비고</th>
												<th style="width: 40px">사용</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1.</td>
												<td>Update software</td>
												<td>Update software</td>
												<td><span class="badge bg-danger">55%</span></td>
											</tr>
											<tr>
												<td>2.</td>
												<td>Clean database</td>
												<td>Clean database</td>
												<td><span class="badge bg-warning">70%</span></td>
											</tr>
											<tr>
												<td>3.</td>
												<td>Cron job running</td>
												<td>Cron job running</td>
												<td><span class="badge bg-primary">30%</span></td>
											</tr>
											<tr>
												<td>4.</td>
												<td>Fix and squish bugs</td>
												<td>Cron job running</td>
												<td><span class="badge bg-success">90%</span></td>
											</tr>						
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
								<div class="card-footer clearfix">
									<ul class="pagination pagination-sm m-0 float-right">
										<li class="page-item"><a class="page-link" href="#">«</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">»</a></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- /.공통코드 상세-->
					</div>
					<!-- /.row -->
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
		$("#edit").click(function () {
			//data-url="edit?masterCode=${ commonCode.masterCode }"
			var url = $(this).parent().attr("data-url");
		    location.href = url;
		});
		
		$("#nextStep01").click(function () {
			$("#btnGubun").val("next");
			$("form").attr("action","submit01").submit();
		});
	});
</script>
</html>