<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>계획서작성</title>

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
					<div class="col-sm-12">
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">계획서(판매계획)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form>
								<div class="card-body">
									<div id="goodsInfo">
										<strong>생활재코드</strong>																	
										<div class="input-group mb-3">
											<input type="text" class="form-control rounded-0"> 
											<span class="input-group-append">
												<button type="button" class="btn btn-info btn-flat">검색</button>
											</span>
										</div>
										<div class="form-group">
											<label for="PRName">생활재명</label> 
											<input type="text" class="form-control" id="PRName" readonly>
										</div>
										<div class="form-group">
											<label for="PRName">생산지</label> 
											<input type="text" class="form-control" id="PRName" readonly>
										</div>
										<div class="form-group">
											<label for="suPIProperty">생활재구분</label> 
											<select class="form-control" id="suPIProperty">
												<option>option 1</option>
												<option>option 2</option>
											</select>
										</div>
										<div class="form-group">
											<label for="PRName">판매목표</label> 
											<input type="text" class="form-control" id="PRName">
										</div>
									</div>
									<div class="form-group">
										<button type="button" class="btn btn-info">생활재 추가</button>
										<button type="button" class="btn btn-danger">생활재 삭제</button>
									</div>
									<div class="form-group">
										<label for="gubun">시작시간</label> 
										<select class="form-control" id="gubun">
											<option>option 1</option>
											<option>option 2</option>
										</select>
									</div>
									<div class="form-group">
										<label for="reason">종료시간</label> 
										<select class="form-control" id="reason">
											<option>option 1</option>
											<option>option 2</option>
										</select>
									</div>
								</div>
								<!-- /.card-body -->

								<div class="card-footer" style="text-align:center;">
									<button type="button" class="btn btn-default">이전</button>
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