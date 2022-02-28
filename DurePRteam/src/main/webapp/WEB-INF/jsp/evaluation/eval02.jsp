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
								<h3 class="card-title">평가서(판매결과)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form>
								<div class="card-body">
									<!-- 생활재정보 계획서에 등록된 것 만큼 동적 추가 필요 -->
									<div id="goodsInfo">
										<div class="form-group">
											<label for="PRName">생활재코드</label> 
											<input type="text" class="form-control" id="PRName" readonly>
										</div>
										<div class="form-group">
											<label for="PRName">생활재명</label> 
											<input type="text" class="form-control" id="PRName" readonly>
										</div>
										<div class="form-group">
											<label for="PRName">생산지</label> 
											<input type="text" class="form-control" id="PRName" readonly>
										</div>
									</div>
									<div class="form-group">
										<label for="PRName">판매수량</label> 
										<input type="text" class="form-control" id="PRName">
									</div>
									<div class="form-group">
										<label for="PRName">판매수량</label> 
										<input type="text" class="form-control" id="PRName">
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
									<div class="form-group">
										<label for="reason">생활재구분(선택)</label> 
										<div class="custom-control custom-radio">
											<input class="custom-control-input" type="radio" id="customRadio1" name="customRadio">
											<label for="customRadio1" class="custom-control-label">Custom Radio</label>
										</div>
										<div class="custom-control custom-radio">
											<input class="custom-control-input" type="radio" id="customRadio2" name="customRadio">
											<label for="customRadio2" class="custom-control-label">Custom Radio2</label>
										</div>
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
</body>
<jsp:include page="/include/_footer.jsp" />
</html>