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
								<h3 class="card-title">상세 공통코드</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="goodsEval">
								<div class="card-body">
									<c:choose>
								        <c:when test="${ goodsEval.cgeNo > 0 }">
								        	<div class="form-group">
												<label for="gubunDCode">구분_상세코드</label>										
												<form:input path="gubunDCode" class="form-control" readonly="${ not empty goodsEval.gubunDCode ? 'true' : '' }" disabled="${ not empty goodsEval.gubunDCode ? 'true' : '' }" />										
											</div>
											<div class="form-group">
												<label for="gubunDText">코드명</label>										
												<form:input path="gubunDText" class="form-control" readonly="${ not empty goodsEval.gubunDText ? 'true' : '' }" disabled="${ not empty goodsEval.gubunDText ? 'true' : '' }" />										
											</div>	
											<div class="form-group">
												<label for="itemDCode">항목_상세코드</label>										
												<form:input path="itemDCode" class="form-control" readonly="${ not empty goodsEval.itemDCode ? 'true' : '' }" disabled="${ not empty goodsEval.itemDCode ? 'true' : '' }" />										
											</div>
											<div class="form-group">
												<label for="itemDText">코드명</label>										
												<form:input path="itemDText" class="form-control" readonly="${ not empty goodsEval.itemDText ? 'true' : '' }" disabled="${ not empty goodsEval.itemDText ? 'true' : '' }" />										
											</div>
								        </c:when>
								        <c:otherwise>
								        	<div class="form-group">
												<label for="gubunDCode">생활재평가 구분</label>														
												<form:hidden path="gubunMCode"/>								
												<select class="form-control" id="gubunDCode" name="gubunDCode">
													<option value="0" label="==선택하세요==" />
													<c:forEach var="gubun" items="${ selGubuns }">
														<option value="${ gubun.detailCode }" mCode="${ gubun.masterCode }" label="${ gubun.text }" />
													</c:forEach>
												</select>
											</div>
											<div class="form-group">
												<label for="itemDCode">생활재평가 항목</label>										
												<form:hidden path="itemMCode"/>								
												<select class="form-control" id="itemDCode" name="itemDCode">
													<option value="0" label="==선택하세요==" />
													<c:forEach var="item" items="${ selItems }">
														<option value="${ item.detailCode }" mCode="${ item.masterCode }" label="${ item.text }" />
													</c:forEach>
												</select>
											</div>
								        </c:otherwise>
									</c:choose>
								</div>
								<!-- /.card-body -->

								<div class="card-footer">
									<button type="submit" class="btn btn-primary">저장</button>
									<c:if test="${ goodsEval.cgeNo > 0 }" >
										<a href="delete?cgeNo=${ goodsEval.cgeNo }" class="btn btn-danger" data-confirm-delete>삭제</a>
									</c:if>
									<a href="/admin/goodsEval/list" class="btn btn-warning">목록으로</a>
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
	$(function() { 
		$("#gubunDCode").change(function(){
			$("#gubunMCode").val($("#gubunDCode option:selected").attr("mcode"));
		});
		
		$("#itemDCode").change(function(){
			$("#itemMCode").val($("#itemDCode option:selected").attr("mcode"));
		});
	})
</script>
</html>