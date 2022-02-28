<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>생활재 홍보단 UserList2</title>

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
								<h3 class="card-title">MyPage</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form>
								<div class="card-body">
									<div class="form-group">
										<label for="UserId">아이디</label> 
										<div class="input-group">
											<input type="text" class="form-control" id="UserId" readonly value="ghdrlfehd">
										</div>
									<i class="bi bi-person-fill"></i>		
									</div>							
									<div class="form-group">
										<label for="UserPw">패스워드</label> 
										<div class="input-group">
											<input type="password" class="form-control" id="UserPw" value="1234" readonly>
										</div>
									</div>								
									<div class="form-group">
										<label for="UserNm">이름</label> 
										<input type="text" class="form-control" id="UserNm" value="홍길동" readonly>
									</div>
									<div class="form-group">
										<label for="PIProperty">단협</label> 
										<select class="form-control" id="PIProperty" readonly>
											<option>바른두레생협</option>
											<option>경기두레생협</option>
											<option>안양YMCA등대생협</option>
										</select>
									</div>
									<div class="form-group">
										<label for="suPIProperty">매장</label> 
										<select class="form-control" id="suPIProperty" readonly>
											<option>소사점</option>
										</select>
									</div>
									<div class="form-group">
										<label>주소</label>
										<div style="padding-bottom:5px" class="input-group">
			                                <div class="input-group-prepend">
												<div class="input-group-text">
													<font size="1px">우편주소</font>
												</div>
											</div>
			                                <input type="text" id="Zip" class="form-control" value="14763" readonly/>
			                            </div>
										<div style="padding-bottom:5px" class="input-group">
			                                <div class="input-group-prepend">
												<div class="input-group-text">
													<font size="1px">기본주소</font>
												</div>
											</div>
			                                <input type="text" id="Addr1" value='경기도 부천시 은성로 88(소사본동)' class="form-control" readonly/>
			                            </div>
			                            <div style="padding-bottom:5px" class="input-group">
			                                <div class="input-group-prepend">
												<div class="input-group-text">
													<font size="1px">상세주소</font>
												</div>
											</div>
			                                <input type="text" id="Addr2" value='송암빌딩 1층 1호' class="form-control" readonly/>
			                            </div>
									</div>
									<div class="form-group">
										<label for="UserCTel">휴대폰 번호</label> 
										<input type="text" class="form-control" id="UserCTel" placeholder="' - ' 를 포함해서 입력하세요" value="010-1234-5678" readonly>
									</div>
									<div class="form-group">
										<label for="ACNum">계좌</label> 
										<div style="padding-bottom:5px">
											<select class="form-control" id="ACNum" readonly>
												<option>한국은행</option>
												<option>한국산업은행</option>
												<option selected>중소기업은행</option>
												<option>KB국민은행</option>
											</select>
										</div>
										<input type="text" class="form-control" id="ACNum" placeholder="' - ' 를 제외해서 입력하세요" value="222244445555" readonly>
									</div>
								</div>
								<!-- /.card-body -->

								<div class="card-footer">
									<div class="input-group-prepend"style="float:right;">
										<select style="width:90px" class="form-control">
											<option>=선택=</option>
											<option>가입</option>
											<option>탈퇴</option>
										</select>
										<button style="float:right;margin-left:10px" type="button" class="btn btn-warning">회원상태 변경</button>
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