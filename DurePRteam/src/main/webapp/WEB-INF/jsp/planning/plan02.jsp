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
								<h3 class="card-title">계획서(판매계획)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="planning">
								<div class="card-body">
									<input type="hidden" name="planId" value="${ planning.planNo }"/>
									
									<!-- 생활재정보 -->
									<div id="goodsInfo">
										<div id="good1">
											<strong>생활재코드</strong>																	
											<div class="input-group mb-3">
												<input type="hidden" id="piproperty" name="piproperty"/>
												<input type="hidden" id="gmNo" name="gmNo"/>
												<input type="text" class="form-control rounded-0" id="gmSeq">												
												<span class="input-group-append">
													<button type="button" class="btn btn-info btn-flat" data-search-goods>검색</button>
												</span>
											</div>											
											<div class="form-group">
												<label for="gmDesc">생활재명</label> 
												<input type="text" class="form-control" id="gmDesc" name="gmDesc" readonly>
											</div>
											<div class="form-group">
												<label for="gmName">생산지</label> 
												<input type="text" class="form-control" id="gmName" name="gmName" readonly>
											</div>
											<div class="form-group">
												<label for="gmGubun">생활재구분</label>
												<select class="form-control" id="salesTarget" name="salesTarget">
													<c:forEach var="gmGubun" items="${ selGmGubuns }">
														<option value="${ gmGubun.detailCode }">${ gmGubun.text }</option>
													</c:forEach>
												</select>
											</div>
											<div class="form-group">
												<label for="salesTarget">판매목표</label> 
												<input type="text" class="form-control" id="salesTarget" name="salesTarget">
											</div>
										</div>										
									</div>
									<div class="form-group">
										<button type="button" class="btn btn-info" id="addBtn" num="1">생활재 추가</button>
										<button type="button" class="btn btn-danger" id="delBtn">생활재 삭제</button>
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
								</div>
								<!-- /.card-body -->

								<div class="card-footer" style="text-align:center;">
									<button type="button" class="btn btn-default">이전</button>
									<button type="button" class="btn btn-warning">임시저장</button>
									<button type="button" class="btn btn-primary">다음</button>
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
	
	var goodsDiv = "";
	
	// 생활재 조회
	$("[data-search-goods]").click(function() {
		goodsDiv = $(this).closest("div").parent();
		var gmSeq = $(this).closest("div").find("#gmSeq").val();	// 생활재번호
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
		        if (data.length == 0) {
		    	    alert('조회 결과가 없습니다.');
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
	});   
	
	//생활재 추가
	$("#addBtn").click(function() {
		console.log("num", $(this).attr("num"));
		var num = parseInt($(this).attr("num")) + 1);
		if (num > 6) {
			alert("최대 5개까지 입력가능합니다.");
			return false;
		} else {
			// 생활재폼 추가
			var strHtml = '';
			+ '	<div id="good'+ num +'"> '
			+ '		<strong>생활재코드</strong> '																	
			+ '		<div class="input-group mb-3"> '
			+ '			<input type="hidden" id="piproperty" name="piproperty"/> '
			+ '			<input type="hidden" id="gmNo" name="gmNo"/> '
			+ '			<input type="text" class="form-control rounded-0" id="gmSeq"> '												
			+ '			<span class="input-group-append"> '
			+ '				<button type="button" class="btn btn-info btn-flat" data-search-goods>검색</button> '
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
			+ '			<select class="form-control" id="salesTarget" name="salesTarget"> '
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
			$(this).attr("num", num);
		}
	});

	//생활재 삭제
	$("#delBtn").click(function() {
		console.log("num", $("#addBtn").attr("num"));
		if ($("#addBtn").attr("num") == 1) {
			alert("최소 1개는 필요합니다.");
			return false;
		} else {
			// 생활재폼 삭제
			var strHtml = '';
			$("#addBtn").attr("num", parseInt($("#addBtn").attr("num")) - 1);
		}

	});
</script>
</html>