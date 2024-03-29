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
<body class="sidebar-mini layout-navbar-fixed">
	<div class="wrapper">
		<!-- 네비게이션 바 -->
		<jsp:include page="/include/_navbar.jsp" />
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
									<!-- 작성자 O -->
									<c:if test="${ planning.addUser eq user.userId }">
										<c:choose>
											<c:when test="${ state eq null or state == 'W' or state == 'N' }">
												<button type="button" class="btn btn-warning" gubun="save" onclick="formSubmit(this)">임시저장</button>
												<button type="button" class="btn btn-primary" gubun="next" onclick="formSubmit(this)">작성완료</button>
											</c:when>											
											<c:when test="${ state == 'R' or state == 'C' }">
												<!-- 검토요청 중 or 승인 시 수정 X -->
												<a href="list" class="btn btn-primary">목록으로</a>
											</c:when>
										</c:choose>
									</c:if>
									<!-- 작성자 X -->
									<c:if test="${ planning.addUser ne user.userId }">
										<a href="list" class="btn btn-primary">목록으로</a>
									</c:if>
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
			$("#planning").attr("action", "/planning/save03?planNo=" + planNo);
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
	var planNo = '<c:out value="${ planning.planNo }"></c:out>'
	var userId = '<c:out value="${ user.userId }"></c:out>'
	var addUser = '<c:out value="${ planning.addUser }"></c:out>'
	var state = '<c:out value="${ planning.state }"></c:out>'
		
	// [수정] 본인이 아닌경우 disabled
	if (addUser != '' && userId != addUser) {
		$("#linkedGoods").attr("disabled", "true");
		$("#prMethod").attr("disabled", "true");
		$("#prMessage").attr("disabled", "true");
		$("#etc").attr("disabled", "true");
	} else if(state == 'R' || state == 'C') {
		// 본인이여도 검토요청중 이거나 관리자승인 상태면 disabled
		$("#linkedGoods").attr("disabled", "true");
		$("#prMethod").attr("disabled", "true");
		$("#prMessage").attr("disabled", "true");
		$("#etc").attr("disabled", "true");
	}
	
	$("#prMethod").change(function(){
		// 홍보도구(05) 선택 시 홍보도구 칸 활성화
		if ($(this).val() == "05") {
			$("#prTools").attr("disabled", false);
		} else {
			$("#prTools").attr("disabled", true);
		}		
	});
	
	// 유효성 검사
	$('#planning').submit(function() {
        if ($('#linkedGoods').val() == '') {
            alert('연계생활재를 입력하세요.');
            $('#linkedGoods').focus();
            return false;
        }
        if ($('#prMethod').val() == '0') {
            alert('홍보방법을 선택하세요.');
            $('#prMethod').focus();
            return false;
        }
        if ($("#prMethod").val() == '05' && $('#prTools').val() == '') {
        	alert('홍보도구(상세)를 입력하세요.');
        	$('#prTools').focus();
            return false;
        }
        if ($('#prMessage').val() == '') {
        	alert('홍보멘트를 입력하세요.');
        	$('#prMessage').focus();
            return false;
        }
        if ($('#etc').val() == '') {
        	alert('기타를 입력하세요.');
        	$('#etc').focus();
            return false;
        }
    });
});
</script>
</html>