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
					<div class="row">
						<!-- 공통코드 -->
						<div class="col-md-6">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">공통코드</h3>
								</div>								
								<!-- /.card-header -->
								<div class="card-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>공통코드</th>
												<th>코드명</th>
												<th>사용</th>
												<th>비고</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="commonCode" items="${ commonCodes }">
												<tr data-url="list?page=${ criteria.page }&masterCode=${ commonCode.masterCode }" class="${ commonCode.masterCode == masterCode ? 'clicked' : '' }">
													<td>${ commonCode.masterCode }</td>
													<td>${ commonCode.text }</td>													
													<td>${ commonCode.activeYN }</td>
													<td>${ commonCode.remark }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
								<div class="card-footer clearfix">
									<a href="create" class="btn btn-primary">신규</a>
									<button type="button" class="btn btn-warning" id="edit">수정</button>													
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
						<!-- /.공통코드-->
						<!-- 공통코드 상세-->
						<div class="col-md-6">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">상세 공통코드</h3>
								</div>								
								<!-- /.card-header -->
								<div class="card-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>상세코드번호</th>												
												<th>코드명</th>
												<th>사용</th>
												<th>비고</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="commonCodeDetail" items="${ commonCodeDetails }">
												<tr data-url="/admin/commonCodeDetail/edit?masterCode=${ commonCodeDetail.masterCode }&detailCode=${ commonCodeDetail.detailCode }">													
													<td>${ commonCodeDetail.detailCode }</td>
													<td>${ commonCodeDetail.text }</td>													
													<td>${ commonCodeDetail.activeYN }</td>
													<td>${ commonCodeDetail.remark }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
								<div class="card-footer clearfix">
									<button type="button" class="btn btn-primary" id="create">신규</button>
								</div>
							</div>
						</div>
						<!-- /.공통코드 상세-->
					</div>
					<!-- /.row -->
				</div>				
				<!-- /.container-fluid -->
			</section>
		</div>
		<!-- ./wrapper -->
	</div>
</body>
<jsp:include page="/include/_footer.jsp" />
<script type="text/javascript">
	$(document).ready(function () {
		// 공통코드 수정
		$("#edit").click(function () {			
		    var url = $('.clicked').attr("data-url");
		    url = url.replace('list','edit');
		    location.href = url;
		});
		
		// 상세공통코드 생성
		$("#create").click(function () {			
		    var masterCode = $('.clicked').attr("data-url");
		    if(masterCode == "" || masterCode == undefined) {
		    	alert("공통코드를 선택하세요");
		    	return false;
		    } else {		    	
		    	var url = $('.clicked').attr("data-url");
		    	url = url.replace('list','create');
		    	url = "/admin/commonCodeDetail/" + url;
			    location.href = url;
		    }		    
		});
	});
</script>
</html>