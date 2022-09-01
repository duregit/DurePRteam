<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
					<div class="col-md-12">
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">계획서 조회</h3>	
							</div>								
							<!-- /.card-header -->
							<!-- form start -->
							<form id="planList" name="planList" method="post" action="list">
								<div class="card-body">
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<select id="Apiproperty" name="Apiproperty" class="form-control form-control-sm" onchange="pipChange(this)">
													<option value="0" label="=단협선택=" />
													<c:forEach var="pip" items="${ selPIProperty }">
														<option value="${ pip.piProperty }" label="${ pip.piPropname }" 
														<c:if test='${ Apiproperty == pip.piProperty }'>selected</c:if>/>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-6">
											<div class="form-group">
												<select id="AsuPIProperty" name="AsuPIProperty" class="form-control form-control-sm">
													<option value="0" label="=매장선택=" />
													<c:forEach var="supip" items="${ selSuPIProperty }">
														<option value="${ supip.suPiproperty }" label="${ supip.suPipropname }" 
														<c:if test='${ AsuPIProperty == supip.suPiproperty }'>selected</c:if>/>
													</c:forEach>
												</select>
											</div>
										</div>										
									</div>
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<div class="input-group date dateYYYYMMDD" id="divMonthFrom" data-target-input="nearest">
													<input type="text" class="form-control form-control-sm datetimepicker-input" id="monthFrom" name="monthFrom" value="${ monthFrom }" data-target="#divMonthFrom" placeholder="시작일">
													<div class="input-group-append" data-target="#divMonthFrom" data-toggle="datetimepicker">
														<div class="input-group-text">
															<i class="fa fa-calendar"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-6">
											<div class="form-group">
												<div class="input-group date dateYYYYMMDD" id="divMonthTo" data-target-input="nearest">
													<input type="text" class="form-control form-control-sm datetimepicker-input" id="monthTo" name="monthTo" value="${ monthTo }" data-target="#divMonthTo" placeholder="종료일">
													<div class="input-group-append" data-target="#divMonthTo" data-toggle="datetimepicker">
														<div class="input-group-text">
															<i class="fa fa-calendar"></i>
														</div>
													</div>
												</div>
											</div>									
										</div>							
									</div>
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<div class="custom-control custom-checkbox">
						                          <input class="custom-control-input" type="checkbox" id="chkMyPlan" name="chkMyPlan" ${ myPlan eq "Y" ? "checked" : "" }>
						                          <input class="custom-control-input" type="hidden" id="myPlan" name="myPlan" value="${ myPlan }">
						                          <label for="chkMyPlan" class="custom-control-label">내 계획서 조회</label>
						                        </div>						                        
											</div>
										</div>
										<div class="col-6">
											<button type="submit" class="btn btn-info btn-sm float-right">조회</button>
										</div>
									</div>
								</div>
							</form>
							<!-- /.card-body -->
							<table class="table table-bordered table-list">
								<thead>
									<tr>
										<th>계획서정보</th>
										<th>작성자</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="planning" items="${ plannings }">
										<tr planNo=${ planning.planNo }>
											<td>
												<a href="edit01?planNo=${ planning.planNo }">
													${ planning.prDate }<br>
													${ planning.suPIPropName }<br>
													<c:choose>
												        <c:when test="${fn:length(planning.gmDesc) gt 10}">
												        	<c:out value="${fn:substring(planning.gmDesc, 0, 11)}..."></c:out>
												        </c:when>
												        <c:otherwise>
												        	<c:out value="${planning.gmDesc}"></c:out>
												        </c:otherwise>
													</c:choose>
												</a>
											</td>
											<td>${ planning.addUser }</td>
											<td>
												<c:set var="state" value="${ planning.state }" />
												<c:set var="ul" value="${ user.userLevel }" />
												<!-- 작성자 O -->
												<c:if test="${ planning.addUser eq user.userId }">
													<c:choose>
														<c:when test="${ state eq null }">
															<button type="button" class="btn btn-default btn-xs btn-state">작성 중</button>
														</c:when>
														<c:when test="${ state == 'W' }">
															<button type="button" class="btn btn-warning btn-xs btn-state" id="requestBtn" onclick="btnRequest(this)">검토요청</button>
														</c:when>													
														<c:when test="${ state == 'N' }">
															<button type="button" class="btn btn-warning btn-xs btn-state" id="requestBtn" onclick="btnRequest(this)">재검토요청</button>
														</c:when>
														<c:when test="${ state == 'R' }">
															<button type="button" class="btn btn-secondary btn-xs btn-state">검토요청 중</button>
														</c:when>
														<c:when test="${ state == 'C' }">
															<button type="button" class="btn btn-primary btn-xs btn-state" id="evalBtn" onclick="btnEval(this)">평가서작성</button>
														</c:when>
														<c:otherwise>
															<button type="button" class="btn btn-default btn-xs btn-state">작성 완료</button>
														</c:otherwise>											
													</c:choose>	
													<c:if test="${ state ne null && state ne 'W' && planning.comment ne null}">
														<button type="button" class="btn btn-info btn-xs btn-state" id="commentBtn" onclick="btnComment('${planning.comment}')" data-toggle="modal" data-target="#modal-default">관리자의견</button>
													</c:if>
												</c:if>
												<!-- 작성자 X -->
												<c:if test="${ planning.addUser ne user.userId }">
													<c:choose>
														<c:when test="${ state eq null }">
															작성 중
														</c:when>
														<c:when test="${ state eq 'W' or state eq 'N' }">
															검토요청
														</c:when>
														<c:when test="${ state eq 'R' and ul ne 'A' }">
															검토요청 중
														</c:when>
														<c:when test="${ state eq 'C' }">
															평가서작성
														</c:when>										
													</c:choose>			
												</c:if>
												<!-- 관리자 -->
												<c:if test="${ ul eq 'A' }">
													<c:choose>														
														<c:when test="${ state eq 'R' }">
															<!-- 관리자 -->
															<div class="row">
																<div class="col-6">
																	<button type="button" class="btn btn-primary btn-xs btn-state" id="confirmBtn" onclick="btnConfirm(this)">승인</button>
																</div>
																<div class="col-6">
																	<button type="button" class="btn btn-danger btn-xs btn-state" id="rejectBtn" onclick="btnReject(this)">반려</button>
																</div>
															</div>
														</c:when>										
														<c:when test="${ state ne null && state ne 'W' }">
															<button type="button" class="btn btn-info btn-xs btn-state" id="commentBtn" onclick="btnComment('${planning.comment}')" data-toggle="modal" data-target="#modal-default">관리자의견</button>
														</c:when>
													</c:choose>			
												</c:if>								
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="card-footer clearfix">
								<a href="create" class="btn btn-primary btn-sm">신규</a>
								<ul class="pagination pagination-sm m-0 float-right">
									<c:if test="${ paging.prev }">
										<li class="paginate_button page-item">
											<a class="page-link" href="list?page=${ paging.startPage-1 }
												<c:if test='${ Apiproperty ne 0 }'>&Apiproperty=${ Apiproperty }</c:if>
												<c:if test='${ AsuPIProperty ne 0 }'>&AsuPIProperty=${ AsuPIProperty }</c:if>
												<c:if test='${ monthFrom ne "" }'>&monthFrom=${ monthFrom }</c:if>
												<c:if test='${ monthTo ne "" }'>&monthTo=${ monthTo }</c:if>
												<c:if test='${ myPlan ne "" }'>&myPlan=${ myPlan }</c:if>
											">«</a></li>
									</c:if>
									<c:forEach begin="${ paging.startPage }" end="${ paging.endPage }" var="num">
										<c:if test="${ criteria.page == num }">
											<li class="paginate_button page-item active">
												<a class="page-link" href="list?page=${ num }
													<c:if test='${ Apiproperty ne 0 }'>&Apiproperty=${ Apiproperty }</c:if>
													<c:if test='${ AsuPIProperty ne 0 }'>&AsuPIProperty=${ AsuPIProperty }</c:if>
													<c:if test='${ monthFrom ne "" }'>&monthFrom=${ monthFrom }</c:if>
													<c:if test='${ monthTo ne "" }'>&monthTo=${ monthTo }</c:if>
													<c:if test='${ myPlan ne "" }'>&myPlan=${ myPlan }</c:if>
												">${ num }</a>
											</li>
										</c:if>
										<c:if test="${ criteria.page != num }">
											<li class="paginate_button page-item">
												<a class="page-link" href="list?page=${ num }
													<c:if test='${ Apiproperty ne 0 }'>&Apiproperty=${ Apiproperty }</c:if>
													<c:if test='${ AsuPIProperty ne 0 }'>&AsuPIProperty=${ AsuPIProperty }</c:if>
													<c:if test='${ monthFrom ne "" }'>&monthFrom=${ monthFrom }</c:if>
													<c:if test='${ monthTo ne "" }'>&monthTo=${ monthTo }</c:if>
													<c:if test='${ myPlan ne "" }'>&myPlan=${ myPlan }</c:if>
												">${ num }</a>
											</li>
										</c:if>	
									</c:forEach>
									<c:if test="${ paging.next && paging.endPage > 0 }">
										<li class="paginate_button page-item">
											<a class="page-link" href="list?page=${ paging.endPage+1 }
												<c:if test='${ Apiproperty ne 0 }'>&Apiproperty=${ Apiproperty }</c:if>
													<c:if test='${ AsuPIProperty ne 0 }'>&AsuPIProperty=${ AsuPIProperty }</c:if>
													<c:if test='${ monthFrom ne "" }'>&monthFrom=${ monthFrom }</c:if>
													<c:if test='${ monthTo ne "" }'>&monthTo=${ monthTo }</c:if>
													<c:if test='${ myPlan ne "" }'>&myPlan=${ myPlan }</c:if>
											">»</a>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<section class="content-header"></section>
			<!-- modal -->
			<!-- 관리자 의견 모달 -->
			<div class="modal fade" id="modal-default" style="display: none;" aria-hidden="true">
				<!-- modal-dialog -->
				<div class="modal-dialog">
					<!-- modal-content -->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">관리자의견</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<textarea class="form-control" id="comment" name="comment" rows="3" cols="" readOnly></textarea>
						</div>
						<div class="modal-footer justify-content-between">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<c:if test="${ ul eq 'A' }">
								<button type="button" class="btn btn-primary">저장</button>
							</c:if>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
		<!-- ./wrapper -->
	</div>
<jsp:include page="/include/_footer.jsp" />
<script type="text/javascript">
$(function(){
	// 내 평가서 조회 체크
	$('#chkMyPlan').change(function() {
		if ($(this).is(":checked")) {
			$('#myPlan').val("Y");
		} else {
			$('#myPlan').val("N");
		}    	
  	});
});
	// 단협
	function pipChange(sel) {
		FnSubPropCd('suPIProperty',$(sel).val() ,'');
	}
	
	// 매장
	function FnSubPropCd(id, pdata, sdata) {
		$("select#suPIProperty option").remove();
		frm = document.join
		
		var piproperty = $('#piproperty').val()
		
		var inputData = {
				"piProperty": piproperty
			}
		
		//alert(inputData);
	
		var htmlStr = "";
		$.ajax ({
			url: "/admin/commonSubProp/subPropCode",
			type : "POST",
			data : JSON.stringify(inputData),
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
		    async: false,
			success : function(data) {
				var strHtml = '<option value="0" label="=매장선택=" />'
				
				$(data).each(function(index, value){
					//alert(value.suPipropname);
					strHtml += '<option value = "'+value.suPiproperty+'"> '+value.suPipropname+'</option> '				
				});
				
				$("#suPIProperty").append(strHtml);
			 },
			 error: function(xhr, status, error){
		       //alert(xhr.responseText);
		       alert("error")
		    }
		});
	}
	
	// 검토요청(재검토)
	function btnRequest(btn) {
		var pageNo = '<c:out value="${criteria.page}"></c:out>';			// 페이지번호
		var Apiproperty = '<c:out value="${Apiproperty}"></c:out>';		// 단협(검색조건)
		var AsuPIProperty = '<c:out value="${AsuPIProperty}"></c:out>';	// 매장(검색조건)
		var monthFrom = '<c:out value="${monthFrom}"></c:out>';			// 시작일(검색조건)
		var monthTo = '<c:out value="${monthTo}"></c:out>';				// 종료일(검색조건)
		var myPlan = '<c:out value="${myPlan}"></c:out>';					// 내계획서조회(검색조건)		
		var planNo = $(btn).closest("tr").attr("planNo");		// 계획서번호
		var inputData = {
			"planNo": parseInt(planNo),
			"pageNo": parseInt(pageNo)
		};
		
		if(confirm("검토요청을 하시겠습니까?")) {
			$.ajax({
				url : "/planning/request",
				type : "POST",
				data: JSON.stringify(inputData),
				dataType: "text",
				contentType:"application/json;charset=UTF-8",
			    async: false,
			    success: function(){
			    	alert("검토요청이 완료되었습니다.");
			    	location.href = "list?page=" + pageNo 
					    			+ "&Apiproperty=" + Apiproperty
					    			+ "&AsuPIProperty=" + AsuPIProperty
					    			+ "&monthFrom=" + monthFrom
					    			+ "&monthTo=" + monthTo
					    			+ "&myPlan=" + myPlan;
			    },
			    error: function(xhr, status, error){
			       alert(xhr.responseText);
			    },
			    complete: function(xhr, status){}
			});
		} else {
			return false;	
		}
	}
	
	// 관리자승인
	function btnConfirm(btn) {
		var pageNo = '<c:out value="${criteria.page}"></c:out>';	// 페이지번호
		var Apiproperty = '<c:out value="${Apiproperty}"></c:out>';		// 단협(검색조건)
		var AsuPIProperty = '<c:out value="${AsuPIProperty}"></c:out>';	// 매장(검색조건)
		var monthFrom = '<c:out value="${monthFrom}"></c:out>';			// 시작일(검색조건)
		var monthTo = '<c:out value="${monthTo}"></c:out>';				// 종료일(검색조건)
		var myPlan = '<c:out value="${myPlan}"></c:out>';					// 내계획서조회(검색조건)	
		var planNo = $(btn).closest("tr").attr("planNo");		// 계획서번호
		var inputData = {
			"planNo": parseInt(planNo),
			"pageNo": parseInt(pageNo)
		};
		
		if(confirm("승인을 하시겠습니까?")) {
			$.ajax({
				url : "/planning/confirm",
				type : "POST",
				data: JSON.stringify(inputData),
				dataType: "text",
				contentType:"application/json;charset=UTF-8",
			    async: false,
			    success: function(){
			    	alert("관리자승인이 완료되었습니다.");
			    	location.href = "list?page=" + pageNo 
					    			+ "&Apiproperty=" + Apiproperty
					    			+ "&AsuPIProperty=" + AsuPIProperty
					    			+ "&monthFrom=" + monthFrom
					    			+ "&monthTo=" + monthTo
					    			+ "&myPlan=" + myPlan;
			    },
			    error: function(xhr, status, error){
			       alert(xhr.responseText);
			    },
			    complete: function(xhr, status){}
			});
		} else {
			return false;	
		}
	}
	
	// 관리자반려
	function btnReject(btn) {
		var pageNo = '<c:out value="${criteria.page}"></c:out>';	// 페이지번호
		var Apiproperty = '<c:out value="${Apiproperty}"></c:out>';		// 단협(검색조건)
		var AsuPIProperty = '<c:out value="${AsuPIProperty}"></c:out>';	// 매장(검색조건)
		var monthFrom = '<c:out value="${monthFrom}"></c:out>';			// 시작일(검색조건)
		var monthTo = '<c:out value="${monthTo}"></c:out>';				// 종료일(검색조건)
		var myPlan = '<c:out value="${myPlan}"></c:out>';					// 내계획서조회(검색조건)	
		var planNo = $(btn).closest("tr").attr("planNo");		// 계획서번호
		var inputData = {
			"planNo": parseInt(planNo),
			"pageNo": parseInt(pageNo)
		};
		
		if(confirm("반려를 하시겠습니까?")) {
			$.ajax({
				url : "/planning/reject",
				type : "POST",
				data: JSON.stringify(inputData),
				dataType: "text",
				contentType:"application/json;charset=UTF-8",
			    async: false,
			    success: function(){
			    	alert("관리자반려가 완료되었습니다.");
			    	location.href = "list?page=" + pageNo 
					    			+ "&Apiproperty=" + Apiproperty
					    			+ "&AsuPIProperty=" + AsuPIProperty
					    			+ "&monthFrom=" + monthFrom
					    			+ "&monthTo=" + monthTo
					    			+ "&myPlan=" + myPlan;
			    },
			    error: function(xhr, status, error){
			       alert(xhr.responseText);
			    },
			    complete: function(xhr, status){}
			});
		} else {
			return false;	
		}
	}
	
	// 관리자의견등록
	function btnComment(comment) {
		var userLevel = '<c:out value="${ user.userLevel }"></c:out>';	// 사용자레벨
		
		// 관리자의견 초기화
		$("#comment").val(comment);
		
		// readOnly 관리자:false, 사용자: true
		if(userLevel == 'A') {
			$("#comment").attr("readOnly", false);	
		}
	}
	
	// 평가서작성
	function btnEval(btn) {
		var planNo = $(btn).closest("tr").attr("planNo");
		
		if(confirm("평가서작성을 하시겠습니까?")) {
	    	location.href = "/evaluation/create?planNo=" + planNo;
		}
	}	
</script>
</body>
</html>