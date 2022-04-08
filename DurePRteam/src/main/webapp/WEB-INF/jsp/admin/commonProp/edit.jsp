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
								<h3 class="card-title">단협코드 ${ not empty commonProp.piProperty ? "수정" : "등록" }</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="commonProp" onSubmit="formChk();return false">
								<div class="card-body">
									<div class="form-group">
										<label for="piProperty">단협코드</label>								
										<form:input path="piProperty" class="form-control"
											readonly="${ not empty commonProp.piProperty ? true : false }"
											disabled="${ not empty commonProp.piProperty ? true : false }" />
									</div>
									<div class="form-group">
										<label for="text">단협명</label>										
										<form:input path="piPropname" class="form-control" />
									</div>															
									<div class="form-group">
										<label for="piActive">사용</label>
										<select class="form-control" name="piActive">
											<option value="Y" ${ commonProp.piActive == "Y" ? "selected" : "" }>Y</option>
											<option value="N" ${ commonProp.piActive == "N" ? "selected" : "" }>N</option>
										</select>
									</div>
									<!-- 
									<div class="form-group">
										<label for="text">수정일자</label>										
										<form:input path="piModDate" class="form-control"
											readonly="${ not empty commonProp.piProperty ? true : false }"
											disabled="${ not empty commonProp.piProperty ? true : false }" />
									</div>	
									<div class="form-group">
										<label for="text">수정자</label>										
										<form:input path="piModUser" class="form-control" 
											readonly="${ not empty commonProp.piProperty ? true : false }"
											disabled="${ not empty commonProp.piProperty ? true : false }" />
									</div>	
									 -->	
								</div>
								<!-- /.card-body -->

								<div class="card-footer">
									<button type="submit" class="btn btn-primary">저장</button>
									<a href="list" class="btn btn-warning">목록으로</a>
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
<script type="text/javascript">
	function formChk() {
		if ($("#piProperty").val().trim() == "") {
			alert("공통코드를 입력하세요");
			$("#piProperty").focus();
			return false;
		}
		$("#commonProp").submit();
	}
</script>
</html>