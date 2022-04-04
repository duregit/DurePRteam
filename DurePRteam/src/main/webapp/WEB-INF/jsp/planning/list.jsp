<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
					<div class="col-md-12">
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">계획서 조회</h3>	
							</div>								
							<!-- /.card-header -->
							<div class="card-body">
								<div class="row">
									<div class="col-6">
										<div class="form-group">										
											<select class="form-control form-control-sm" id="gubun">
												<option>단협</option>
												<option>참좋은두레생협</option>
											</select>
										</div>
									</div>
									<div class="col-6">
										<select class="form-control form-control-sm" id="gubun">
											<option>매장</option>
											<option>option 2</option>
										</select>
									</div>										
								</div>
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<div class="input-group date dateYYYYMM" id="pDateFrom" data-target-input="nearest">
												<input type="text" class="form-control form-control-sm datetimepicker-input" id="pDateFrom" data-target="#pDateFrom" placeholder="시작일">
												<div class="input-group-append" data-target="#pDateFrom" data-toggle="datetimepicker">
													<div class="input-group-text">
														<i class="fa fa-calendar"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<div class="input-group date dateYYYYMM" id="pDateTo" data-target-input="nearest">
												<input type="text" class="form-control form-control-sm datetimepicker-input" id="pDateTo" data-target="#pDateTo" placeholder="종료일">
												<div class="input-group-append" data-target="#pDateTo" data-toggle="datetimepicker">
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
					                          <input class="custom-control-input" type="checkbox" id="customCheckbox1" value="option1">
					                          <label for="customCheckbox1" class="custom-control-label">내 계획서 조회</label>
					                        </div>						                        
										</div>
									</div>
									<div class="col-6">
										<button type="button" class="btn btn-info btn-sm float-right">조회</button>
									</div>
								</div>								
							</div>
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
													${ planning.prDate } ${ planning.suPIPropName } <br>
													<c:choose>
												        <c:when test="${fn:length(planning.gmDesc) gt 13}">
												        	<c:out value="${fn:substring(planning.gmDesc, 0, 12)}..."></c:out>
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
											<c:choose>
												<c:when test="${ state eq null }">
													<button type="button" class="btn btn-default btn-sm">작성 중</button>
												</c:when>
												<c:when test="${ state == 'W' }">
													<button type="button" class="btn btn-warning btn-sm" id="requestBtn">검토요청</button>
												</c:when>
												<c:when test="${ state == 'R' and state == ''}">
													<!-- 관리자 -->
													<button type="button" class="btn btn-secondary btn-sm" id="confirmBtn">관리자승인</button>
												</c:when>
												<c:when test="${ state == 'R' }">
													<button type="button" class="btn btn-secondary btn-sm">검토요청 중</button>
												</c:when>
												<c:when test="${ state == 'C' }">
													<button type="button" class="btn btn-primary btn-sm" id="evalBtn">평가서작성</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-default btn-sm">평가서작성 중</button>
												</c:otherwise>											
											</c:choose>											
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="card-footer clearfix">
								<a href="create" class="btn btn-primary btn-sm">신규</a>
								<ul class="pagination pagination-sm m-0 float-right">
									<c:if test="${ paging.prev }">
										<li class="paginate_button page-item"><a class="page-link" href="list?page=${ paging.startPage-1 }">«</a></li>
									</c:if>
									<c:forEach begin="${ paging.startPage }" end="${ paging.endPage }" var="num">
										<c:if test="${ criteria.page == num }">
											<li class="paginate_button page-item active"><a class="page-link" href="list?page=${ num }">${ num }</a></li>
										</c:if>
										<c:if test="${ criteria.page != num }">
											<li class="paginate_button page-item"><a class="page-link" href="list?page=${ num }">${ num }</a></li>
										</c:if>	
									</c:forEach>
									<c:if test="${ paging.next && paging.endPage > 0 }">
										<li class="paginate_button page-item"><a class="page-link" href="list?page=${ paging.endPage+1 }">»</a></li>
									</c:if>
								</ul>
							</div>
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
		// 검토요청
		$("#requestBtn").click(function () {
			var pageNo = <c:out value="${criteria.page}"></c:out>;	// 페이지번호
			var planNo = $(this).closest("tr").attr("planNo");		// 계획서번호
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
				    	location.href = "list?page=" + pageNo;
				    },
				    error: function(xhr, status, error){
				       alert(xhr.responseText);
				    },
				    complete: function(xhr, status){}
				});
			} else {
				return false;	
			}
		});
		
		// 관리자승인
		$("#confirmBtn").click(function () {
			var pageNo = <c:out value="${criteria.page}"></c:out>;	// 페이지번호
			var planNo = $(this).closest("tr").attr("planNo");		// 계획서번호
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
				    	location.href = "list?page=" + pageNo;
				    },
				    error: function(xhr, status, error){
				       alert(xhr.responseText);
				    },
				    complete: function(xhr, status){}
				});
			} else {
				return false;	
			}
		});
		
		// 평가서작성
		$("#evalBtn").click(function () {
			var planNo = $(this).closest("tr").attr("planNo");
			
			if(confirm("평가서작성을 하시겠습니까?")) {
		    	location.href = "/evaluation/create?planNo=" + planNo;
			}
		});
	});
</script>
</html>