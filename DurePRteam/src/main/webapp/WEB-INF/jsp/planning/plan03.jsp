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
								<h3 class="card-title">계획서(홍보포인트)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="planning">
								<div class="card-body">
									<input type="hidden" id="planNo" name="planNo" value="${ planning.planNo }"/>
									<div class="form-group">
										<label for="linkedGoods">연계생활재</label>										
										<form:input path="linkedGoods" class="form-control" />
									</div>
									<div class="form-group">
										<label for="prMethod">홍보방법</label> 
										<form:select path="prMethod" class="form-control">
											<form:option value="0" label="==선택하세요==" />
											<form:options itemValue="detailCode" itemLabel="text" items="${ selPRMethod }" />
										</form:select>
									</div>
									<div class="form-group">
										<label for="prTools">홍보도구(상세)</label>
										<form:textarea path="prTools" class="form-control" rows="4" disabled="true"/>
									</div>
									<div class="form-group">
										<label for="prMessage">홍보멘트</label>
										<form:textarea path="prMessage" class="form-control" rows="4" />
									</div>
									<div class="form-group">
										<label for="etc">기타</label>
										<form:textarea path="etc" class="form-control" rows="4" />
									</div>
								</div>
								<!-- /.card-body -->

								<div class="card-footer" style="text-align:center;">
									<button type="button" class="btn btn-default" gubun="pre" onclick="prePage(this)">이전</button>
									<c:set var="state" value="${ planning.state }" />
									<c:choose>
										<c:when test="${ state eq null or state == 'W' }">
											<button type="button" class="btn btn-warning" gubun="save" onclick="formSubmit(this)">임시저장</button>
											<button type="button" class="btn btn-primary" gubun="next" onclick="formSubmit(this)">작성완료</button>
										</c:when>
										<c:when test="${ state == 'R' or state == 'C' }">
											<button type="button" class="btn btn-primary" gubun="next" onclick="formSubmit(this)">목록으로</button>
										</c:when>
									</c:choose>
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
	function formSubmit(btn) {
		var planNo = $("#planNo").val();		// 계획서 번호
		
		var btnGubun = $(btn).attr("gubun");	// 버튼 종류
		if (btnGubun == "save") {
			$("#planning").attr("action", "/planning/save03?planNo=" + planNo)
		}
		
		$("#planning").submit();
	}
	
	//이전페이지
	function prePage() {	
		var planNo = $("#planNo").val();		// 계획서 번호	
		if (confirm("이전페이지로 이동하시겠습니까?")) {
			location.href = "edit02?planNo=" + planNo;
		} else {
			return false;
		}
	}
	
$(function() {
	$("#prMethod").change(function(){
		// 홍보도구(05) 선택 시 홍보도구 칸 활성화
		if ($(this).val() == "05") {
			$("#prTools").attr("disabled", false);
		} else {
			$("#prTools").attr("disabled", true);
		}		
	});
});
</script>
</html>