<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>생활재홍보단</title>

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
								<h3 class="card-title">평가서(기본사항)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="evaluation">
								<input type="hidden" id="evalNo" name="evalNo" value="${ evaluation.evalNo }"/>
								<div class="card-body">
									<div class="form-group">
										<label for="addUser">작성자</label>									
										<form:input path="addUser" class="form-control" readonly="true" />
									</div>
									<div class="form-group">
										<label for="PRName">홍보단명</label>										
										<form:input path="prName" class="form-control" />
									</div>
									<div class="form-group">
										<label for="PIProperty">단협</label> 
										<!--<form:select path="piproperty" items="${ piproperties }" itemLabel="piPropName" itemValue="piproperty" />-->
										<select class="form-control" name="piproperty">
											<option value="1">option 1</option>
											<option value="1">option 2</option>
										</select>
									</div>
									<div class="form-group">
										<label for="suPIProperty">매장</label> 
										<select class="form-control" name="suPIProperty">
											<option value="1">option 1</option>
											<option value="1">option 2</option>
										</select>
									</div>
									<div class="form-group">
										<label>진행일</label>
										<div class="input-group date dateYYYYMMDD" id="prDate" data-target-input="nearest">
											<form:input path="prDate" class="form-control datetimepicker-input" data-target="#prDate" />
											<div class="input-group-append" data-target="#prDate" data-toggle="datetimepicker">
												<div class="input-group-text">
													<i class="fa fa-calendar"></i>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="prDay">진행요일</label>
										<form:input path="prDay" class="form-control" readonly="true" />
									</div>
									<div class="form-group">
										<label for="gubun">행사구분</label>
										<form:select path="gubun" class="form-control">
											<form:option value="0" label="==선택하세요==" />
											<form:options itemValue="detailCode" itemLabel="text" items="${ selGubuns }" />
										</form:select>
									</div>
									<div class="form-group">
										<label for="weather">날씨</label> 
										<form:select path="weather" class="form-control">
											<form:option value="0" label="==선택하세요==" />
											<form:options itemValue="detailCode" itemLabel="text" items="${ selWeathers }" />
										</form:select>
									</div>
									<div class="form-group">
										<label for="temperatures">기온</label> 
										<form:select path="temperatures" class="form-control">
											<form:option value="0" label="==선택하세요==" />
											<form:options itemValue="detailCode" itemLabel="text" items="${ selTemperatures }" />
										</form:select>
									</div>
								</div>
								<!-- /.card-body -->

								<div class="card-footer" style="text-align:center;">
									<a href="list" class="btn btn-default">목록으로</a>
									<button type="submit" class="btn btn-primary">다음</button>
								</div>
							</form:form>
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