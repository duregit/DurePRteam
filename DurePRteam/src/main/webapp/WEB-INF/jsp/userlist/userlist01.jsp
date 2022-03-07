<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>생활재 홍보단 UserList</title>

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
								<h3 class="card-title">회원관리</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-footer">
								<div>								
									<font size="1px">단협&nbsp;&nbsp;
										<select>
											<option>바른두레생협</option>
											<option>경기두레생협</option>
											<option>안양YMCA등대생협</option>
										</select>
										&nbsp;&nbsp;&nbsp;매장&nbsp;&nbsp;
										<select>
											<option>매장1</option>
											<option>매장2</option>
											<option>매장3</option>
										</select>
										&nbsp;&nbsp;&nbsp;회원상태&nbsp;&nbsp;
										<select>
											<option>대기</option>
											<option>가입</option>
											<option>탈퇴</option>
										</select>
									</font>
								</div>							
									<font size="1px">아이디&nbsp;&nbsp;
										<input type="text">
										&nbsp;&nbsp;&nbsp;이름&nbsp;&nbsp;
										<input type="text">
										<button style="float:right;" type="button" class="btn btn-primary btn-xs">조회</button>
									</font>
							</div>
							<!-- form start -->
							<form>
								<div class="card-body">
									<table class="table table-hover table-striped text-center" style="border:1px solid;">
										<thead>
											<tr>
												<th><input type="checkbox" id="checkall" /></th>
												<th>단협</th>
												<th>매장</th>
												<th>아이디</th>
												<th>이름</th>
											</tr>
										</thead>	
										<tbody>
											<tr onclick="fn_contentView()">
												<td><input type="checkbox" id="tr1" /></td>
												<td>바른두레생협</td>
												<td>인덕원점</td>
												<td>0619</td>
												<td>정OO</td>
											</tr>
											<tr>
												<td><input type="checkbox" id="tr2" /></td>
												<td>경기두레생협</td>
												<td>중동점</td>
												<td>dkfuek</td>
												<td>김OO</td>
											</tr>
											<tr>
												<td><input type="checkbox" id="tr3" /></td>
												<td>경기두레생협</td>
												<td>배곧점</td>
												<td>cjkdue</td>
												<td>이OO</td>
											</tr>
											<tr>
												<td><input type="checkbox" id="tr4" /></td>
												<td>안성두레생협</td>
												<td>공도점</td>
												<td>pdkfiel</td>
												<td>최OO</td>
											</tr>
										</tbody>								
									</table>
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
		function fn_contentView() {
			var url = "/userlist/userlist02"
			location.href = url;
		}
	</script>
</body>
</html>