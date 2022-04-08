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
<body class="hold-transition sidebar-mini layout-fixed" onload="initSelect()">
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
								<h3 class="card-title">평가서(판매결과)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="evaluation">
								<div class="card-body">
									<input type="hidden" id="evalNo" name="evalNo" value="${ evaluation.evalNo }"/>
									<!-- 생활재정보 시작-->
									<div id="goodsInfo">										
									</div>
									<div class="form-group">
										<button type="button" class="btn btn-info" id="addBtn" num="0">생활재 추가</button>
										<button type="button" class="btn btn-danger" id="delBtn">생활재 삭제</button>
									</div>
									<!-- 생활재정보 끝-->
									
									<div class="form-group">
										<label for="orderCnt">발주수량</label> 
										<input type="number" class="form-control" id="orderCnt" name="orderCnt" value="${ evaluation.orderCnt }"/>
									</div>
									<div class="form-group">
										<label for="salesCnt">판매수량</label> 
										<input type="number" class="form-control" id="salesCnt" name="salesCnt" value="${ evaluation.salesCnt }"/>
									</div>
									<div class="form-group">
										<label for="startTime">시작시간</label>
											<form:select path="startTime" class="form-control">
												<form:option value="0" label="==선택하세요==" />
												<form:options itemValue="detailCode" itemLabel="text" items="${ selStartTimes }" />
											</form:select>
										</div>
									<div class="form-group">
										<label for="endTime">종료시간</label> 
										<form:select path="endTime" class="form-control">
											<form:option value="0" label="==선택하세요==" />
											<form:options itemValue="detailCode" itemLabel="text" items="${ selEndTimes }" />
										</form:select>
									</div>
									<div class="form-group">
										<label for="goodsEvalGubun">생활재구분(선택)</label>
										<c:forEach var="gubun" items="${ selgoodsEvalGubuns }" varStatus="status">
											<div class="form-check">
												<input class="form-check-input" type="radio" id="goodsEvalGubun${ status.count }" name="goodsEvalGubun" value="${ gubun.detailCode }" ${ gubun.detailCode == evaluation.goodsEvalGubun ? "checked" : "" }>
					                          	<label class="form-check-label" for="goodsEvalGubun${ status.count }" >${ gubun.text }</label>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- /.card-body -->

								<div class="card-footer" style="text-align:center;">
									<button type="button" class="btn btn-default" gubun="pre" onclick="prePage(this)">이전</button>
									<c:set var="state" value="${ evaluation.state }" />
									<c:choose>
										<c:when test="${ state eq null or state == 'W' }">
											<button type="button" class="btn btn-warning" gubun="save" onclick="formSubmit(this)">임시저장</button>
											<button type="button" class="btn btn-primary" gubun="next" onclick="formSubmit(this)">다음</button>
										</c:when>
										<c:when test="${ state == 'R' or state == 'C' }">
											<button type="button" class="btn btn-primary" gubun="next" onclick="formSubmit(this)">다음</button>
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
	// 시작 시 생활재 정보 초기화
	function initSelect() {
		$("#goodsInfo").html("");				// 생활재정보 초기화
		var evalNo = $("#evalNo").val();		// 평가서 번호	
		var inputData = {
			"evalNo": parseInt(evalNo)
		}
		
		$.ajax({
			url : "/goodsMaster/evaluationSelect",
			type : "POST",
			data: JSON.stringify(inputData),
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
		    async: false,
		    success: function(data){
		    	var evaluationGoodsInfos = data;
		    	console.log(data);
		    	
		        if ($.isEmptyObject(evaluationGoodsInfos)) {
		        	// (신규)생활재 없으면 1개 추가
		        	addGoodsInfo();
		        } else {
		        	// (수정)생활재 있는 개수만큼 추가 후 데이터 바인딩
		        	$.each(evaluationGoodsInfos, function(key, value) {
		        		addGoodsInfo();
		        		var num = $("#addBtn").attr("num");
		        		var divInfo = $("#good"+(num));
		        		divInfo.find("#piproperty").val(value.piproperty);
		        		divInfo.find("#gmSeq").val(value.gmSeq);
		        		divInfo.find("#gmDesc").val(value.gmDesc);
			        	divInfo.find("#gmNo").val(value.gmNo);
			        	divInfo.find("#gmName").val(value.gmName);
			        	divInfo.find("#gmGubun").val(value.gmGubun);
			        	divInfo.find("#salesTarget").val(value.salesTarget);	        		
		        	});
		    	}
		    },
		    error: function(xhr, status, error){
		       alert(xhr.responseText);
		    },
		    complete: function(xhr, status){}
		});
	}
	
	// 생활재 검색	
	var goodsDiv = "";	// 생활재정보 div
	function gmSearch(btn) {
		goodsDiv = $(btn).closest("div").parent();
		var gmSeq = $(btn).closest("div").find("#gmSeq").val();	// 생활재번호
		var inputData = {
			"gmSeq": parseInt(gmSeq)
		}
		// 검색어 체크
		if(typeof gmSeq == "undefined" || gmSeq == null || gmSeq == "") {
			alert('생활재번호를 입력하세요.');
			goodsDiv.find("#gmSeq").focus();
			return false;
		}
		
		$.ajax({
			url : "/goodsMaster/searchGoods",
			type : "POST",
			data: JSON.stringify(inputData),
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
		    async: false,
		    success: function(data){
		        if ($.isEmptyObject(data)) {
		    	    alert('조회 결과가 없습니다.');
		    	    goodsDiv.find("#gmSeq").val("");
		    	    goodsDiv.find("#gmSeq").focus();
					return false;
		        } else {
		        	goodsDiv.find("#piproperty").val(data.goodsMaster.piproperty);
		        	goodsDiv.find("#gmSeq").val(data.goodsMaster.gmSeq);
		        	goodsDiv.find("#gmDesc").val(data.goodsMaster.gmDesc);
		        	goodsDiv.find("#gmNo").val(data.goodsMaster.gmNo);
		        	goodsDiv.find("#gmName").val(data.goodsMaster.gmName);
		        	goodsDiv = "";
		    	}
		    },
		    error: function(xhr, status, error){
		       alert(xhr.responseText);
		    },
		    complete: function(xhr, status){}
		});
	}
	
	// 생활재추가
	function addGoodsInfo() {
		var num = parseInt($("#addBtn").attr("num")) + 1;
		
		if (num > 5) {
			alert("최대 5개까지 입력가능합니다.");
			return false;
		} else {
			// 생활재폼 추가
			var strHtml = ''
			+ '	<div id="good'+ num +'"> '
			+ '		<strong>생활재번호</strong> '																	
			+ '		<div class="input-group mb-3"> '
			+ '			<input type="hidden" id="piproperty" name="piproperty"/> '
			+ '			<input type="hidden" id="gmNo" name="gmNo"/> '
			+ '			<input type="text" class="form-control rounded-0" id="gmSeq"> '												
			+ '			<span class="input-group-append"> '
			+ '				<button type="button" class="btn btn-info btn-flat" onclick="gmSearch(this)">검색</button> '
			+ '			</span> '
			+ '		</div> '									
			+ '		<div class="form-group"> '
			+ '			<label for="gmDesc">생활재명</label> '
			+ '			<input type="text" class="form-control" id="gmDesc" name="gmDesc" readonly> '
			+ '		</div> '
			+ '		<div class="form-group"> '
			+ '			<label for="gmName">생산지</label> '
			+ '			<input type="text" class="form-control" id="gmName" name="gmName" readonly> '
			+ '		</div> '
			+ ' 	<div class="form-group"> '
			+ '			<label for="gmGubun">생활재구분</label> '
			+ '			<select class="form-control" id="gmGubun" name="gmGubun"> '
			+ '				<option value="0">==선택하세요==</option> ' 
			+ '				<c:forEach var="gmGubun" items="${ selGmGubuns }"> '
			+ '					<option value="${ gmGubun.detailCode }">${ gmGubun.text }</option> '
			+ '				</c:forEach> '
			+ '			</select> '
			+ '		</div> '
			+ '		<div class="form-group"> '
			+ '			<label for="salesTarget">판매목표</label> '
			+ '			<input type="text" class="form-control" id="salesTarget" name="salesTarget"> '
			+ '		</div> '
			+ ' </div> ';
			
			$("#goodsInfo").append(strHtml);
			$("#addBtn").attr("num", num);
		}
	}
	
	// 생활재정보 저장(ajax) 후 평가서 저장(submit)
	function formSubmit(btn) {
		var evalNo = $("#evalNo").val();		// 평가서 번호
		var state = '<c:out value="${ evaluation.state }"></c:out>'
			
		var btnGubun = $(btn).attr("gubun");	// 버튼 종류
		if (btnGubun == "save") {
			$("#evaluation").attr("action", "/evaluation/save02?evalNo=" + evalNo)
		}
		
		// 평가서 상태(작성중인 경우만 생활재 수정)
		if (isEmpty(state) || state == "W") {
			var divCnt = $("#addBtn").attr("num");	// 생활재 개수
			
			var inputDataArray = [];
			for(var i = 0; i < divCnt; i++) {
				var divInfo = $("#good"+(i+1));
				
				// 객체 초기화
				var inputData = {}
				
				inputData.evalNo = evalNo;									// 평가서 번호
				inputData.piproperty = divInfo.find("#piproperty").val();	// 단협코드
				inputData.gmSeq = divInfo.find("#gmSeq").val();				// 생활재번호
				inputData.gmDesc = divInfo.find("#gmDesc").val();			// 생활재명
				inputData.gmNo = divInfo.find("#gmNo").val();				// 거래처번호
				inputData.gmName = divInfo.find("#gmName").val();			// 거래처명
				inputData.gmGubun = divInfo.find("#gmGubun").val();			// 생활재구분
				inputData.salesTarget = divInfo.find("#salesTarget").val();	// 판매목표
				
				// 객체배열에 추가
			    inputDataArray.push(inputData);
			}
			
			$.ajax({
				url : "/goodsMaster/evaluationInsert",
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
			location.href = "edit01?evalNo=" + evalNo;
		} else {
			return false;
		}
	}

$(function() {
	//생활재 추가
	$("#addBtn").click(function() {
		addGoodsInfo();
	});	

	//생활재 삭제
	$("#delBtn").click(function() {
		console.log("num", $("#addBtn").attr("num"));
		if ($("#addBtn").attr("num") == 1) {
			alert("최소 1개는 필요합니다.");
			return false;
		} else {
			// 생활재폼 삭제
			var divId = "good"+($("#addBtn").attr("num"));
			$("#" + divId + " *").remove();
			//$("#good"+($("#addBtn").attr("num") +" *")).remove()
			
			$("#addBtn").attr("num", parseInt($("#addBtn").attr("num")) - 1);
		}
	});
});
</script>
</html>