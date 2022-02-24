<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>평가서작성</title>

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
								<h3 class="card-title">평가서(운영2)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form>
								<div class="card-body">									
									<div class="form-group">
										<label for="reason">판매팁</label> 
										<div class="form-group">												 
											<textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="PRName">조합원의견</label> 
										<div class="form-group">												 
											<textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="PRName">개선/요청사항</label> 
										<textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
									</div>
									<div class="form-group">
										<label for="PRName">이 말은 꼭!!</label> 
										<textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
									</div>
									
									<!-- 첨부파일 시작 최대(6장) -->
									<div class="form-group">
										<label for="exampleInputFile">사진첨부</label>
										<div class="input-group">
											<div class="custom-file">
												<input type="file" class="custom-file-input" id="exampleInputFile" multiple> 
												<label class="custom-file-label" for="exampleInputFile">파일선택</label>
											</div>
										</div>
									</div>
									<!-- 이미지 코드--> 
									<!--
									<div class="row">
										<div class="col-sm-4">
					                    	<a href="https://via.placeholder.com/1200/FFFFFF.png?text=1" data-toggle="lightbox" data-title="Photo1" data-gallery="gallery">
					                      		<img src="https://via.placeholder.com/300/FFFFFF?text=1" class="img-fluid mb-2" alt="white sample">
					                    	</a>
					                  	</div>
					                  	<div class="col-sm-4">
					                    	<a href="https://via.placeholder.com/1200/FFFFFF.png?text=1" data-toggle="lightbox" data-title="Photo2" data-gallery="gallery">
					                      		<img src="https://via.placeholder.com/300/FFFFFF?text=1" class="img-fluid mb-2" alt="white sample">
					                    	</a>
					                  	</div>
					                  	<div class="col-sm-4">
					                    	<a href="https://via.placeholder.com/1200/FFFFFF.png?text=1" data-toggle="lightbox" data-title="Photo3" data-gallery="gallery">
					                      		<img src="https://via.placeholder.com/300/FFFFFF?text=1" class="img-fluid mb-2" alt="white sample">
					                    	</a>
					                  	</div>
				                  	</div>
				                  	<div class="row">
										<div class="col-sm-4">
					                    	<a href="https://via.placeholder.com/1200/FFFFFF.png?text=1" data-toggle="lightbox" data-title="Photo4" data-gallery="gallery">
					                      		<img src="https://via.placeholder.com/300/FFFFFF?text=1" class="img-fluid mb-2" alt="white sample">
					                    	</a>
					                  	</div>
					                  	<div class="col-sm-4">
					                    	<a href="https://via.placeholder.com/1200/FFFFFF.png?text=1" data-toggle="lightbox" data-title="Photo5" data-gallery="gallery">
					                      		<img src="https://via.placeholder.com/300/FFFFFF?text=1" class="img-fluid mb-2" alt="white sample">
					                    	</a>
					                  	</div>
					                  	<div class="col-sm-4">
					                    	<a href="https://via.placeholder.com/1200/FFFFFF.png?text=1" data-toggle="lightbox" data-title="Photo6" data-gallery="gallery">
					                      		<img src="https://via.placeholder.com/300/FFFFFF?text=1" class="img-fluid mb-2" alt="white sample">
					                    	</a>
					                  	</div>
				                  	</div>
				                  	 -->
				                  	<div class="form-group">
				                  		<button type="button" class="btn btn-info">업로드</button>
				                  	</div>				                  	
									<div class="form-group">
										<label for="PRName">종합평가</label> 											 
										<input type="text" class="form-control" id="PRName" readonly>
									</div>
									<small>000홍보단님 활동하시느라 고생 많으셨습니다. 주신 평가는 두레생협의 소중한 자산이 되었습니다. 감사합니다.</small>
								</div>
								<!-- /.card-body -->								

								<div class="card-footer" style="text-align:center;">
									<button type="button" class="btn btn-default">이전</button>
									<button type="button" class="btn btn-warning">임시저장</button>
									<button type="button" class="btn btn-primary">검토요청</button>
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