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
								<h3 class="card-title">평가서(생활재)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form>
								<div class="card-body">
									<label for="PRName">맛평가</label> 
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">												
												<select class="form-control" id="gubun">
													<option>option 1</option>
													<option>option 2</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">												 
												<input type="text" class="form-control" id="PRName">
											</div>
										</div>
									</div>
									<label for="PRName">가격평가</label> 
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">												
												<select class="form-control" id="gubun">
													<option>option 1</option>
													<option>option 2</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">												 
												<input type="text" class="form-control" id="PRName">
											</div>
										</div>
									</div>
									<!-- 내용 동적 추가 필요 -->
									
									<label for="PRName">종합평가</label> 
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">												 
												<input type="text" class="form-control" id="PRName" readonly>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">												 
												<input type="text" class="form-control" id="PRName">
											</div>
										</div>
									</div>
									
									<small>※ 평가서의 내용은 전문적인 항목이 아니므로 참고용으로 사용될 예정입니다.</small>
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
</body>
<jsp:include page="/include/_footer.jsp" />
</html>