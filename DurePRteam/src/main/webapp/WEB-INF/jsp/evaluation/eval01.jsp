<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>평가서작성</title>

<jsp:include page="/include/_header.jsp" />
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="min-height: 1345.31px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
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
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="col-sm-12">
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">평가서(기본사항)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form>
								<div class="card-body">
									<div class="form-group">
										<label for="PRName">홍보단명</label> 
										<input type="text" class="form-control" id="PRName">
									</div>
									<div class="form-group">
										<label for="PIProperty">단협</label> 
										<select class="form-control" id="PIProperty">
											<option>option 1</option>
											<option>option 2</option>
										</select>
									</div>
									<div class="form-group">
										<label for="suPIProperty">매장</label> 
										<select class="form-control" id="suPIProperty">
											<option>option 1</option>
											<option>option 2</option>
										</select>
									</div>
									<div class="form-group">
										<label>진행일</label>
										<div class="input-group date" id="reservationdate" data-target-input="nearest">
											<input type="text" class="form-control datetimepicker-input" data-target="#reservationdate">
											<div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
												<div class="input-group-text">
													<i class="fa fa-calendar"></i>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="pDay">진행요일</label> 
										<input type="text" class="form-control" id="pDay" readonly>
									</div>
									<div class="form-group">
										<label for="gubun">행사구분</label> 
										<select class="form-control" id="gubun">
											<option>option 1</option>
											<option>option 2</option>
										</select>
									</div>
									<div class="form-group">
										<label for="reason">날씨</label> 
										<select class="form-control" id="reason">
											<option>option 1</option>
											<option>option 2</option>
										</select>
									</div>
									<div class="form-group">
										<label for="reason">기온</label> 
										<select class="form-control" id="reason">
											<option>option 1</option>
											<option>option 2</option>
										</select>
									</div>
								</div>
								<!-- /.card-body -->

								<div class="card-footer" style="text-align:center;">
									<button type="button" class="btn btn-warning">임시저장</button>
									<button type="button" class="btn btn-primary">다음</button>
								</div>
							</form>
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