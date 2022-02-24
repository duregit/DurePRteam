<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>평가서조회</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="/plugins/summernote/summernote-bs4.min.css">
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
					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-header">
									<div class="row">
										<div class="col-6">
											<div class="form-group">										
												<select class="form-control form-control" id="gubun">
													<option>단협</option>
													<option>참좋은두레생협</option>
												</select>
											</div>
										</div>
										<div class="col-6">
											<select class="form-control form-control" id="gubun">
												<option>매장</option>
												<option>option 2</option>
											</select>
										</div>										
									</div>
									<div class="row">
										<div class="col-12">
											<div class="form-group">
												<div class="input-group date" id="reservationdate" data-target-input="nearest">
													<input type="text" class="form-control form-control datetimepicker-input" data-target="#reservationdate" placeholder="진행일">
													<div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
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
						                          <label for="customCheckbox1" class="custom-control-label">내 평가서 조회</label>
						                        </div>						                        
											</div>
										</div>
										<div class="col-6">
											<button type="button" class="btn btn-info btn float-right">조회</button>
										</div>
									</div>									
								</div>
								<!-- /.card-header -->
								<div class="card-body p-0">
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
				</div>
				<!-- /.container-fluid -->
			</section>
		</div>
		<!-- ./wrapper -->
	</div>

	<!-- jQuery -->
	<script src="/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script src="/plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script src="/plugins/jqvmap/jquery.vmap.min.js"></script>
	<script src="/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="/plugins/moment/moment.min.js"></script>
	<script src="/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script src="/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script src="/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/dist/js/adminlte.js"></script>
	
	<script type="text/javascript">
	$(function () {
		//Date picker
	    $('#reservationdate').datetimepicker({
	        format: 'L'
	    });
	});
	</script>
</body>
</html>