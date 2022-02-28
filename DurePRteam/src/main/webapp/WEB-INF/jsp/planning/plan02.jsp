<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>계획서작성</title>

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
</body>
<jsp:include page="/include/_footer.jsp" />
</html>