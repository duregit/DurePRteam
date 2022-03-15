<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>계획서조회</title>

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
					<div class="col-sm-12">
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">계획서 조회</h3>	
								<div class="card-tools">
									<div class="input-group input-group-sm">
										<a href="create"><button type="button" class="btn btn-default btn-sm float-right">신규 작성</button></a>
									</div>
								</div>
							</div>								
							<!-- /.card-header -->
							<div class="card-body">
								<div class="row">
									<div class="col-6">
										<div class="form-group">										
											<select class="form-control form-control-sm" id="gubun">
												<option>단협</option>
												<option>참좋은두레생협</option>
											</select>
										</div>
									</div>
									<div class="col-6">
										<select class="form-control form-control-sm" id="gubun">
											<option>매장</option>
											<option>option 2</option>
										</select>
									</div>										
								</div>
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<div class="input-group date dateYYYYMM" id="pDateFrom" data-target-input="nearest">
												<input type="text" class="form-control form-control-sm datetimepicker-input" id="pDateFrom" data-target="#pDateFrom" placeholder="시작일">
												<div class="input-group-append" data-target="#pDateFrom" data-toggle="datetimepicker">
													<div class="input-group-text">
														<i class="fa fa-calendar"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<div class="input-group date dateYYYYMM" id="pDateTo" data-target-input="nearest">
												<input type="text" class="form-control form-control-sm datetimepicker-input" id="pDateTo" data-target="#pDateTo" placeholder="종료일">
												<div class="input-group-append" data-target="#pDateTo" data-toggle="datetimepicker">
													<div class="input-group-text">
														<i class="fa fa-calendar"></i>
													</div>
												</div>
											</div>
										</div>									
									</div>							
								</div>
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<div class="custom-control custom-checkbox">
					                          <input class="custom-control-input" type="checkbox" id="customCheckbox1" value="option1">
					                          <label for="customCheckbox1" class="custom-control-label">내 계획서 조회</label>
					                        </div>						                        
										</div>
									</div>
									<div class="col-6">
										<button type="button" class="btn btn-info btn-sm float-right">조회</button>
									</div>
								</div>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th style="width: 10px">#</th>
											<th>Task</th>
											<th style="width: 40px">Label</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1.</td>
											<td>Update software</td>
											<td><span class="badge bg-danger">55%</span></td>
										</tr>
										<tr>
											<td>2.</td>
											<td>Clean database</td>
											<td><span class="badge bg-warning">70%</span></td>
										</tr>
										<tr>
											<td>3.</td>
											<td>Cron job running</td>
											<td><span class="badge bg-primary">30%</span></td>
										</tr>
										<tr>
											<td>4.</td>
											<td>Fix and squish bugs</td>
											<td><span class="badge bg-success">90%</span></td>
										</tr>
										<tr>
											<td>1.</td>
											<td>Update software</td>
											<td><span class="badge bg-danger">55%</span></td>
										</tr>
										<tr>
											<td>2.</td>
											<td>Clean database</td>
											<td><span class="badge bg-warning">70%</span></td>
										</tr>
										<tr>
											<td>3.</td>
											<td>Cron job running</td>
											<td><span class="badge bg-primary">30%</span></td>
										</tr>
										<tr>
											<td>4.</td>
											<td>Fix and squish bugs</td>
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
				</div>
				<!-- /.container-fluid -->
			</section>
		</div>
		<!-- ./wrapper -->
	</div>
</body>
<jsp:include page="/include/_footer.jsp" />
</html>