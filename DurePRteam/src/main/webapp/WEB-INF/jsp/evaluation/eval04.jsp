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
								<h3 class="card-title">평가서(운영1)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="evaluation">
								<div class="card-body">
									<input type="hidden" id="evalNo" name="evalNo" value="${ evaluation.evalNo }"/>
									<div class="form-group">
										<small>※ 당일 홍보활동에 대한 평가입니다.<br>소중한 의견 부탁드려요~~</small>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-5">
												<label for="p4Weather">날씨/기후</label>												
											</div>
											<div class="col-7">
												<form:select path="p4Weather" class="form-control score" onchange="scoreChange(this)">
													<form:option value="0" label="==선택하세요==" />
													<form:options itemValue="detailCode" itemLabel="text" items="${ selP4Weathers }" />
												</form:select>
											</div>
										</div>
									</div>
									<div class="form-group">
									<div class="row">
											<div class="col-5">
												<label for="p4Setting">준비/세팅</label>												
											</div>
											<div class="col-7">
												<form:select path="p4Setting" class="form-control score" onchange="scoreChange(this)">
													<form:option value="0" label="==선택하세요==" />
													<form:options itemValue="detailCode" itemLabel="text" items="${ selP4Settings }" />
												</form:select>
											</div>
										</div>
									</div>
									<div class="form-group">
									<div class="row">
											<div class="col-5">
												<label for="p4Ment">홍보물/멘트</label>												
											</div>
											<div class="col-7">
												<form:select path="p4Ment" class="form-control score" onchange="scoreChange(this)">
													<form:option value="0" label="==선택하세요==" />
													<form:options itemValue="detailCode" itemLabel="text" items="${ selP4Ments }" />
												</form:select>
											</div>
										</div>
									</div>
									<div class="form-group">
									<div class="row">
											<div class="col-5">
												<label for="p4Support">매장협조</label>												
											</div>											
											<div class="col-7">
												<form:select path="p4Support" class="form-control score" onchange="scoreChange(this)">
													<form:option value="0" label="==선택하세요==" />
													<form:options itemValue="detailCode" itemLabel="text" items="${ selP4Supports }" />
												</form:select>
											</div>
										</div>
									</div>
									<div class="form-group">
									<div class="row">
											<div class="col-5">
												<label for="p4PRMethod">홍보방법</label>												
											</div>
											<div class="col-7">
												<form:select path="p4PRMethod" class="form-control score" onchange="scoreChange(this)">
													<form:option value="0" label="==선택하세요==" />
													<form:options itemValue="detailCode" itemLabel="text" items="${ selP4PRMethods }" />
												</form:select>
											</div>
										</div>
									</div>
									<div class="form-group">
									<div class="row">
											<div class="col-5">
												<label for="p4GoodsSel">생활재선택</label>												
											</div>
											<div class="col-7">
												<form:select path="p4GoodsSel" class="form-control score" onchange="scoreChange(this)">
													<form:option value="0" label="==선택하세요==" />
													<form:options itemValue="detailCode" itemLabel="text" items="${ selP4GoodsSels }" />
												</form:select>
											</div>
										</div>
									</div>
									<div class="form-group">
									<div class="row">
											<div class="col-5">
												<label for="p4Age">주요연령대</label>												
											</div>
											<div class="col-7">
												<form:select path="p4Age" class="form-control">
													<form:option value="0" label="==선택하세요==" />
													<form:options itemValue="detailCode" itemLabel="text" items="${ selP4Ages }" />
												</form:select>
											</div>
										</div>
									</div>
									<div class="form-group">
									<div class="row">
											<div class="col-5">
												<label for="p4Gender">조합원성별</label>												
											</div>
											<div class="col-7">
												<form:select path="p4Gender" class="form-control">
													<form:option value="0" label="==선택하세요==" />
													<form:options itemValue="detailCode" itemLabel="text" items="${ selP4Genders }" />
												</form:select>
											</div>
										</div>
									</div>
									<div class="form-group">
									<div class="row">
											<div class="col-5">
												<label for="p4Response">조합원호응도</label>												
											</div>
											<div class="col-7">
												<form:select path="p4Response" class="form-control score" onchange="scoreChange(this)">
													<form:option value="0" label="==선택하세요==" />
													<form:options itemValue="detailCode" itemLabel="text" items="${ selP4Responses }" />
												</form:select>
											</div>
										</div>
									</div>
									<div class="form-group">
									<div class="row">
											<div class="col-5">
												<label for="p4Time">주요시간대</label>												
											</div>
											<div class="col-7">
												<form:select path="p4Time" class="form-control">
													<form:option value="0" label="==선택하세요==" />
													<form:options itemValue="detailCode" itemLabel="text" items="${ selP4Times }" />
												</form:select>
											</div>
										</div>
									</div>
									<div class="form-group"> 
										<div class="row">
											<div class="col-5">
												<label for="p4TotalScore">종합평가</label>
											</div>
											<div class="col-7">
												<div class="form-group">
													<form:hidden path="p4TotalScore" class="form-control"/>
													<form:input path="p4TotalAVG" class="form-control" readonly="true" />													
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.card-body -->

								<div class="card-footer" style="text-align:center;">
									<button type="button" class="btn btn-default" gubun="pre" onclick="prePage(this)">이전</button>
									<c:set var="state" value="${ evaluation.state }" />
									<!-- 작성자 O -->
									<c:if test="${ evaluation.addUser eq user.userId }">
										<c:choose>
											<c:when test="${ state eq null or state == 'W' or state == 'N' }">
												<button type="button" class="btn btn-warning" gubun="save" onclick="formSubmit(this)">임시저장</button>
												<button type="button" class="btn btn-primary" gubun="next" onclick="formSubmit(this)">다음</button>
											</c:when>
											<c:when test="${ state == 'R' or state == 'C' }">
												<!-- 검토요청 중 or 승인 시 수정 X -->
												<a href="edit05?evalNo=${ evaluation.evalNo }" class="btn btn-primary">다음</a>
											</c:when>
										</c:choose>
									</c:if>									
									<!-- 작성자 X -->
									<c:if test="${ evaluation.addUser ne user.userId }">
										<a href="edit05?evalNo=${ evaluation.evalNo }" class="btn btn-primary">다음</a>
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
$(function() {
	var evalNo = '<c:out value="${ evaluation.evalNo }"></c:out>'
	var userId = '<c:out value="${ user.userId }"></c:out>'
	var addUser = '<c:out value="${ evaluation.addUser }"></c:out>'
	var state = '<c:out value="${ evaluation.state }"></c:out>'
		
	// [수정] 본인이 아닌경우 disabled
	if (addUser != '' && userId != addUser) {
		$("#p4Weather").attr("disabled", "true");
		$("#p4Setting").attr("disabled", "true");
		$("#p4Ment").attr("disabled", "true");
		$("#p4Support").attr("disabled", "true");
		$("#p4PRMethod").attr("disabled", "true");
		$("#p4GoodsSel").attr("disabled", "true");
		$("#p4Age").attr("disabled", "true");
		$("#p4Gender").attr("disabled", "true");
		$("#p4Response").attr("disabled", "true");
		$("#p4Time").attr("disabled", "true");		
	} else if(state == 'R' || state == 'C') {
		// 본인이여도 검토요청중 이거나 관리자승인 상태면 disabled
		$("#p4Weather").attr("disabled", "true");
		$("#p4Setting").attr("disabled", "true");
		$("#p4Ment").attr("disabled", "true");
		$("#p4Support").attr("disabled", "true");
		$("#p4PRMethod").attr("disabled", "true");
		$("#p4GoodsSel").attr("disabled", "true");
		$("#p4Age").attr("disabled", "true");
		$("#p4Gender").attr("disabled", "true");
		$("#p4Response").attr("disabled", "true");
		$("#p4Time").attr("disabled", "true");
	}
	
	// 유효성 검사
	$('#evaluation').submit(function() {
        if ($('#p4Weather').val() == '0') {
            alert('날씨/기후를 선택하세요.');
            $('#p4Weather').focus();
            return false;
        }
        if ($('#p4Setting').val() == '0') {
            alert('준비/세팅을 선택하세요.');
            $('#p4Setting').focus();
            return false;
        }
        if ($('#p4Ment').val() == '0') {
            alert('홍보물/멘트를 선택하세요.');
            $('#p4Ment').focus();
            return false;
        }
        if ($('#p4Support').val() == '0') {
            alert('매장협조를 선택하세요.');
            $('#p4Support').focus();
            return false;
        }
        if ($('#p4PRMethod').val() == '0') {
            alert('홍보방법을 선택하세요.');
            $('#p4PRMethod').focus();
            return false;
        }
        if ($('#p4GoodsSel').val() == '0') {
            alert('생활재선택을 선택하세요.');
            $('#p4GoodsSel').focus();
            return false;
        }
        if ($('#p4Age').val() == '0') {
            alert('주요연령대를 선택하세요.');
            $('#p4Age').focus();
            return false;
        }
        if ($('#p4Gender').val() == '0') {
            alert('조합원성별을 선택하세요.');
            $('#p4Gender').focus();
            return false;
        }
        if ($('#p4Response').val() == '0') {
            alert('조합원호응도를 선택하세요.');
            $('#p4Response').focus();
            return false;
        }
        if ($('#p4Time').val() == '0') {
            alert('주요시간대를 선택하세요.');
            $('#p4Time').focus();
            return false;
        }
    });
});

	// 항목 선택 이벤트
	function scoreChange(sel) {
		var score = $(sel).val();		// 점수		
		//var totalScore = parseInt(score);
		var totalScore = 0;
		var totalAVG = 0;

		// 종합평가 점수 자동계산
		$(".score").each(function(index, item) {
			totalScore = totalScore + parseInt($(this).val());
		});
		
		totalAVG = (totalScore / $(".score").length);
		
		$("#p4TotalScore").val(totalScore);			// 총점
		$("#p4TotalAVG").val(totalAVG.toFixed(2));	// 평점
	}
	
	// 하단 버튼
	function formSubmit(btn) {
		var evalNo = $("#evalNo").val();		// 계획서 번호
		
		var btnGubun = $(btn).attr("gubun");	// 버튼 종류
		if (btnGubun == "save") {
			$("#evaluation").attr("action", "/evaluation/save04?evalNo=" + evalNo)
		}
		
		$("#evaluation").submit();
	}

	
	//이전페이지
	function prePage() {	
		var evalNo = $("#evalNo").val();		// 평가서 번호	
		if(confirm("이전페이지로 이동하시겠습니까?")) {
			location.href = "edit03?evalNo=" + evalNo;
		} else {
			return false;
		}
	}
</script>
</html>