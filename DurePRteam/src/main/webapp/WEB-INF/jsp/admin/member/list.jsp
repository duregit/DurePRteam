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
						<!-- 사용자관리 -->
						<div class="col-md-12">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">사용자 관리</h3>
								</div>								
								<!-- /.card-header -->
								<!-- form start -->
								<form id="members" name="members" method="post" action="list">
									<div class="card-body">
										<div class="row">
											<div class="col-2">
												<div class="form-group">
													<label for="Apiproperty">단협</label>
													<select id="Apiproperty" name="Apiproperty" class="form-control" onchange="pipChange(this)">
														<option value="0" label="=선택=" />
														<c:forEach var="pip" items="${ selPIProperty }">
															<option value="${ pip.piProperty }" label="${ pip.piPropname }" 
															<c:if test='${ Apiproperty == pip.piProperty }'>selected</c:if>/>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-1">
											</div>
											<div class="col-2">
												<div class="form-group">
													<label for="AsuPIProperty">매장</label>
													<select id="AsuPIProperty" name="AsuPIProperty" class="form-control">
														<option value="0" label="=선택=" />
														<c:forEach var="supip" items="${ selSuPIProperty }">
															<option value="${ supip.suPiproperty }" label="${ supip.suPipropname }" 
															<c:if test='${ AsuPIProperty == supip.suPiproperty }'>selected</c:if>/>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-1">
											</div>
											<div class="col-2">
												<div class="form-group">
													<label for="AuserActive">상태</label>
													<select id="AuserActive" name="AuserActive" class="form-control">
														<option value="" label="=선택=" <c:if test='${ AuserActive == "" }'>selected</c:if>/>
														<option value="N" label="대기" <c:if test='${ AuserActive == "N" }'>selected</c:if>/>
														<option value="Y" label="가입" <c:if test='${ AuserActive == "Y" }'>selected</c:if>/>
														<option value="X" label="탈퇴" <c:if test='${ AuserActive == "X" }'>selected</c:if>/>
													</select>
												</div>
											</div>
											<div class="col-3"></div>
										</div>
										<div class="row">
											<div class="col-2">
												<div class="form-group">
													<label for="AuserId">ID</label>
													<input type="text" class="form-control" id="AuserId" name="AuserId" value=${ AuserId }>
												</div>
											</div>
											<div class="col-1">
											</div>
											<div class="col-2">
												<div class="form-group">
													<label for="AuserName">이름</label>
													<input type="text" class="form-control" id="AuserName" name="AuserName" value=${ AuserName }>
												</div>									
											</div>	
											<div class="col-1">
											</div>
											<div class="col-2">
											</div>
											<div class="col-1">
											</div>
											<div class="col-3">
												<div class="form-group">
													<button type="submit" class="btn btn-info float-right">조회</button>
												</div>
											</div>						
										</div>
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>단협</th>
													<th>매장</th>
													<th>ID</th>
													<th>이름</th>
													<th>상태</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="member" items="${ members }">
													<tr class="${ member.userActive eq 'N' ? 'memberReady' : ''}" data-url="/admin/member/edit?AuserId=${ member.userId }">
														<td>${ member.piPropName }</td>
														<td>${ member.suPIPropName }</td>													
														<td>${ member.userId }</td>
														<td>${ member.userName }</td>
														<td>${ member.userActive eq 'N' ? '회원대기' : (member.userActive eq 'Y' ? '회원가입' : '회원탈퇴') }</td>
														<!--  <td><fmt:formatDate value="${goodsEval.modDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>-->
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</form>
								<!-- /.card-body -->
								<div class="card-footer clearfix">						
									<ul class="pagination pagination-sm m-0 float-right">
										<c:if test="${ paging.prev }">
											<li class="paginate_button page-item">
												<a class="page-link" href="list?page=${ paging.startPage-1 }
													<c:if test="${ Apiproperty ne '0' }">&Apiproperty=${ Apiproperty }</c:if>
													<c:if test="${ AsuPIProperty ne '0' }">&AsuPIProperty=${ AsuPIProperty }</c:if>
													<c:if test="${ AuserActive ne '' }">&AuserActive=${ AuserActive }</c:if>
													<c:if test="${ AuserId ne '' }">&AuserId=${ AuserId }</c:if>
													<c:if test="${ AuserName ne '' }">&AuserName=${ AuserName }</c:if>
												">«</a>
											</li>
										</c:if>
										<c:forEach begin="${ paging.startPage }" end="${ paging.endPage }" var="num">
											<c:if test="${ criteria.page == num }">
												<li class="paginate_button page-item active">
													<a class="page-link" href="list?page=${ num }
														<c:if test="${ Apiproperty ne '0' }">&Apiproperty=${ Apiproperty }</c:if>
														<c:if test="${ AsuPIProperty ne '0' }">&AsuPIProperty=${ AsuPIProperty }</c:if>
														<c:if test="${ AuserActive ne '' }">&AuserActive=${ AuserActive }</c:if>
														<c:if test="${ AuserId ne '' }">&AuserId=${ AuserId }</c:if>
														<c:if test="${ AuserName ne '' }">&AuserName=${ AuserName }</c:if>														
													">${ num }</a>
												</li>
											</c:if>
											<c:if test="${ criteria.page != num }">
												<li class="paginate_button page-item">
													<a class="page-link" href="list?page=${ num }
														<c:if test="${ Apiproperty ne '0' }">&Apiproperty=${ Apiproperty }</c:if>
														<c:if test="${ AsuPIProperty ne '0' }">&AsuPIProperty=${ AsuPIProperty }</c:if>
														<c:if test="${ AuserActive ne '' }">&AuserActive=${ AuserActive }</c:if>
														<c:if test="${ AuserId ne '' }">&AuserId=${ AuserId }</c:if>
														<c:if test="${ AuserName ne '' }">&AuserName=${ AuserName }</c:if>
													">${ num }</a>
												</li>
											</c:if>	
										</c:forEach>
										<c:if test="${ paging.next && paging.endPage > 0 }">
											<li class="paginate_button page-item">
												<a class="page-link" href="list?page=${ paging.endPage+1 }
													<c:if test="${ Apiproperty ne '0' }">&Apiproperty=${ Apiproperty }</c:if>
													<c:if test="${ AsuPIProperty ne '0' }">&AsuPIProperty=${ AsuPIProperty }</c:if>
													<c:if test="${ AuserActive ne '' }">&AuserActive=${ AuserActive }</c:if>
													<c:if test="${ AuserId ne '' }">&AuserId=${ AuserId }</c:if>
													<c:if test="${ AuserName ne '' }">&AuserName=${ AuserName }</c:if>
												">»</a>
											</li>
										</c:if>
									</ul>									
								</div>
							</div>
						</div>
						<!-- /.사용자 관리-->
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
	//단협
	function pipChange(sel) {
		FnSubPropCd('suPIProperty',$(sel).val() ,'');
	}
	
	// 매장
	function FnSubPropCd(id, pdata, sdata) {
		$("select#AsuPIProperty option").remove();
		frm = document.join
		
		var piproperty = $('#Apiproperty').val()
		
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
				
				$("#AsuPIProperty").append(strHtml);
			 },
			 error: function(xhr, status, error){
		       //alert(xhr.responseText);
		       alert("error")
		    }
		});
	}
</script>
</html>