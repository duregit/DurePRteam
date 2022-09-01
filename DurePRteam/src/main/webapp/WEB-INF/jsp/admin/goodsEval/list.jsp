<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
					<div class="row">
						<!-- 생활재평가 구분별 항목 설정 -->
						<div class="col-md-12">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">생활재평가 구분별 항목</h3>
								</div>								
								<!-- /.card-header -->
								<div class="card-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>구분-상세코드</th>
												<th>구분-코드명</th>
												<th>항목-상세코드</th>
												<th>항목-코드명</th>
												<th>등록자</th>
												<th>등록시간</th>
												<th>수정자</th>
												<th>수정시간</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="goodsEval" items="${ goodsEvals }">
												<tr data-url="/admin/goodsEval/edit?cgeNo=${ goodsEval.cgeNo }">
													<td>${ goodsEval.gubunDCode }</td>
													<td>${ goodsEval.gubunDText }</td>													
													<td>${ goodsEval.itemDCode }</td>
													<td>${ goodsEval.itemDText }</td>
													<td>${ goodsEval.addUser }</td>
													<td><fmt:formatDate value="${goodsEval.addDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
													<td>${ goodsEval.modUser }</td>
													<td><fmt:formatDate value="${goodsEval.modDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
								<div class="card-footer clearfix">
									<a href="create" class="btn btn-primary">신규</a>										
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
						<!-- /.생활재평가 구분별 항목 설정-->
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
</script>
</html>