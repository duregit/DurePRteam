<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>생활재홍보단</title>

<jsp:include page="/include/_header.jsp" />
</head>
<body class="sidebar-mini layout-navbar-fixed" onload="initSelect()">
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
								<h3 class="card-title">평가서(생활재평가)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="evaluation">
								<div class="card-body">
									<input type="hidden" id="evalNo" name="evalNo" value="${ evaluation.evalNo }"/>
									<input type="hidden" id="goodsEvallen" name="goodsEvallen" value="${ fn:length(goodsEvals) }"/>
									
									<c:forEach var="goodsEval" items="${ goodsEvals }" varStatus="status">
										<div class="form-group">
											<div class="row">
												<div class="col-5">
													<label for="item${ status.count }">${ goodsEval.itemDText }</label>
												</div>
												<div class="col-7">
													<select class="form-control" id="score${ status.count }" name="score${ status.count }" item="sel${ goodsEval.itemDCode }" cnt="${ status.count }" onchange="scoreChange(this)">
														<option value="0" label="==선택하세요==" />
														<c:forEach var="evalScore" items="${ selEvalScores }">
															<option value="${ evalScore.detailCode }" label="${ evalScore.text }" />
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="form-group" style="display:none;" id="textDiv${ status.count }" item="div${ goodsEval.itemDCode }">
											<div class="row">
												<div class="col-5"></div>
												<div class="col-7">
													<input type="text" class="form-control" id="text${ status.count }" name="text${ status.count }" item="input${ goodsEval.itemDCode }" placeholder="텍스트입력">
												</div>
											</div>
										</div>											
										
									</c:forEach>
									
									<div class="form-group"> 
										<div class="row">
											<div class="col-5">
												<label for="totalScore">종합평가</label>
											</div>
											<div class="col-7">
												<div class="form-group">
													<form:hidden path="totalScore" class="form-control"/>
													<form:input path="totalAVG" class="form-control" readonly="true" />													
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<form:input path="totalText" class="form-control" placeholder="텍스트입력" />
									</div>
									
									<small>※ 평가서의 내용은 전문적인 항목이 아니므로 참고용으로 사용될 예정입니다.</small>
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
												<a href="edit04?evalNo=${ evaluation.evalNo }" class="btn btn-primary">다음</a>
											</c:when>
										</c:choose>
									</c:if>
									<!-- 작성자 X -->
									<c:if test="${ evaluation.addUser ne user.userId }">
										<a href="edit04?evalNo=${ evaluation.evalNo }" class="btn btn-primary">다음</a>
									</c:if>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<section class="content-header"></section>
		</div>
		<!-- ./wrapper -->
	</div>
</body>
<jsp:include page="/include/_footer.jsp" />
<script type="text/javascript">	
	//시작 시 생활재평가 구분별 항목 초기화
	function initSelect() {
		$("#goodsInfo").html("");					// 생활재정보 초기화
		var evalNo = $("#evalNo").val();			// 평가서 번호
		var goodsEvallen = $("#goodsEvallen").val();// 생활재정보 항목 개수
		var inputData = {
			"evalNo": parseInt(evalNo)
		}
		
		$.ajax({
			url : "/evaluationGoodsEval/goodsEval/select",
			type : "POST",
			data: JSON.stringify(inputData),
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
		    async: false,
		    success: function(data){
		    	var evaluationGoodsEvals = data;
		    	//console.log(data);
		    	var evalNo = '<c:out value="${ evaluation.evalNo }"></c:out>'
				var userId = '<c:out value="${ user.userId }"></c:out>'
				var addUser = '<c:out value="${ evaluation.addUser }"></c:out>'	
				
		        if (!($.isEmptyObject(evaluationGoodsEvals))) {
		        	var cnt = 1;
		        	// (수정) 데이터 바인딩
		        	$.each(evaluationGoodsEvals, function(key, value) {
		        		$("[item=sel"+value.item+"]").val(value.score);
		        		$("[item=input"+value.item+"]").val(value.text);
		        		//$("#score"+cnt).val(value.score);
		        		//$("#text"+cnt).val(value.text);
		        		
		        		if (value.score != 0 && value.score <= 3) {
		        			$("[item=div"+value.item+"]").css("display", "");
		        		}
			        	cnt++;
		        	});
		        }
		    },
		    error: function(xhr, status, error){
		       alert(xhr.responseText);
		    },
		    complete: function(xhr, status){}
		});
	}
	// 생활재평가 구분별 항목 선택 이벤트
	function scoreChange(sel) {
		var goodsEvallen = $("#goodsEvallen").val();	// 평가목록 개수
		var totalScore = 0;
		var totalAVG = 0;
		
		var score = $(sel).val();		// 점수
		var cnt = $(sel).attr("cnt");	// 항목 순서 
				
		// 3점이하면 텍스트 활성화
		if (score <= 3 && score != 0) {
			$("#textDiv" + cnt).css("display", "");			
		} else {
			$("#textDiv" + cnt).css("display", "none");
			$("#text" + cnt).val('');
		}		
		// 종합평가 점수 자동계산
		for (var i = 0; i < goodsEvallen; i++) {
			totalScore = totalScore + parseInt($("#score" + (i + 1)).val());
		}
		totalAVG = (totalScore / goodsEvallen);
		$("#totalScore").val(totalScore);			// 총점
		$("#totalAVG").val(totalAVG.toFixed(2));	// 평점
	}
	
	// 생활재평가 저장(ajax) 후 평가서 저장(submit)
	function formSubmit(btn) {
		var evalNo = $("#evalNo").val();		// 평가서 번호
		var state = '<c:out value="${ evaluation.state }"></c:out>'
			
		var btnGubun = $(btn).attr("gubun");	// 버튼 종류
		if (btnGubun == "save") {
			$("#evaluation").attr("action", "/evaluation/save03?evalNo=" + evalNo)
		}
		
		// 평가서 상태(작성중인 경우만 생활재평가 수정)
		if (isEmpty(state) || state == "W") {
			var goodsEvallen = $("#goodsEvallen").val();	// 평가목록 개수
			
			var inputDataArray = [];
			for(var i = 0; i < goodsEvallen; i++) {
				var item = $("#score" + (i + 1)).attr("item").replace("sel", "");	// 평가항목(상세코드)
				//var item = $("#score" + (i + 1)).attr("item");	// 평가항목(상세코드)
				var score = $("#score" + (i + 1)).val();		// 평가점수(상세코드=점수)
				var text = $("#text" + (i + 1)).val();			// 텍스트
				
				// 객체 초기화
				var inputData = {}
				
				inputData.evalNo = evalNo;	// 평가서번호
				inputData.item = item;
				inputData.score = score;
				inputData.text = text;
				
				// 객체배열에 추가
			    inputDataArray.push(inputData);
			}
			console.log("inputDataArray", inputDataArray);
						
			$.ajax({
				url : "/evaluationGoodsEval/goodsEval/insert",
				type : "POST",
				data: JSON.stringify(inputDataArray),
				dataType: "text",
				contentType:"application/json;charset=UTF-8",
			    async: false,
			    success: function(){
			    	$("#evaluation").submit();
			    },
			    error: function(xhr, status, error){
			       alert(xhr.responseText);
			    },
			    complete: function(xhr, status){}
			});
			
		} else {
			$("#evaluation").submit();
		}
	}
	
	//이전페이지
	function prePage() {	
		var evalNo = $("#evalNo").val();		// 평가서 번호	
		if(confirm("이전페이지로 이동하시겠습니까?")) {
			location.href = "edit02?evalNo=" + evalNo;
		} else {
			return false;
		}
	}
$(function() {
	var evalNo = '<c:out value="${ evaluation.evalNo }"></c:out>'
	var userId = '<c:out value="${ user.userId }"></c:out>'
	var addUser = '<c:out value="${ evaluation.addUser }"></c:out>'
	var state = '<c:out value="${ evaluation.state }"></c:out>'
	var goodsEvallen = '<c:out value="${ fn:length(goodsEvals) }"></c:out>'
		
	// [수정] 본인이 아닌경우 disabled
	if (addUser != '' && userId != addUser) {
		$("#totalText").attr("disabled", "true");
		
		for (var i = 1; i <= goodsEvallen; i++) {
      		$("#score" + i).attr("disabled", "true");
      		$("#text" + i).attr("disabled", "true");
		}
	} else if(state == 'R' || state == 'C') {
		// 본인이여도 검토요청중 이거나 관리자승인 상태면 disabled
		$("#totalText").attr("disabled", "true");
		
		for (var i = 1; i <= goodsEvallen; i++) {
      		$("#score" + i).attr("disabled", "true");
      		$("#text" + i).attr("disabled", "true");
		}
	}
	/*
	$("#gubunDCode").change(function(){
		$("#gubunMCode").val($("#gubunDCode option:selected").attr("mcode"));
	});
	*/
	// 유효성 검사
	$('#evaluation').submit(function() {
		var goodsEvallen = $("#goodsEvallen").val();	// 평가목록 개수
		
		for (var i = 1; i <= goodsEvallen; i++) {
      		if ($("#score" + i).val() == '0') {
      			alert('점수를 선택하세요.');
      			$("#score" + i).focus();
                return false;
      		}
    		if ($("#score" + i).val() != 0 && $("#score" + i).val() <= 3 && $("#text" + i).val() == '') {
    			alert('내용을 입력하세요.');
    			$("#text" + i).focus();
                return false;
    		}
		}
		if ($('#totalText').val() == '') {
        	alert('종합평가 내용을 입력하세요.');
            $('#totalText').focus();
            return false;
        }
    });
});
</script>
</html>