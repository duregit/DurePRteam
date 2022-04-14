<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>생활재 홍보단 UserList</title>

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
								<h3 class="card-title">회원관리</h3>
							</div>
							<!-- /.card-header -->
							<form:form method="post" modelAttribute="userLists" >
								<!-- form start -->
									<div class="card-body" >	
										<div class="row">									
											<table class="table table-bordered table-list">
												<tr>
													<td>단협</td>
													<td>
														
													</td>
													<td>매장</td>
													<td>
														<select name="suPIProperty" id="suPIProperty" >
															<option value="0" label="=선택=" />
														</select>
													</td>
													<td>회원상태</td>
													<td>
														<select name="active" id="active" >
															<option value="">=선택=</option>
															<option value="N">대기</option>
															<option value="Y">승인</option>
															<option value="X">탈퇴</option>
														</select>
													</td>
												</tr>
												<tr>
													<td>아이디</td>
													<td>
														<input type="text" id="userId" name="userId">
													</td>
													<td>이름</td>
													<td>
														<input type="text" id="userName" name="userName">
													</td>
													<td colspan="2">
														<button type="button" class="btn btn-info btn-sm float-right">조회</button>
													</td>
												</tr>
											</table>
										</div>
									</div>

										<table class="table table-bordered table-list">
											<thead>
												<tr>
													<th>단협</th>
													<th>매장</th>
													<th>아이디</th>
													<th>이름</th>
												</tr>
											</thead>
											<tbody>
												
											</tbody>
										</table>
							</form:form>
								<!-- /.card-body -->
								<div class="card-footer">
									<div class="input-group-prepend"style="float:right;">
										<select style="width:90px" class="form-control">
											<option>=선택=</option>
											<option>가입</option>
											<option>탈퇴</option>
										</select>
										<button style="float:right;margin-left:10px" type="button" class="btn btn-warning">회원상태 변경</button>
									</div>
								</div>
						</div>
						
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
		</div>
		<!-- ./wrapper -->
	</div>
<jsp:include page="/include/_footer.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$("select[name='piProperty']").change(function(){
	   //init_select('suPIProperty','=선택=');
		FnSubPropCd('suPIProperty',$(this).val() ,'');
   });
});

function FnSubPropCd(id, pdata, sdata)
{
	$("select#suPIProperty option").remove();
	frm = document.join
	
	var piProperty = $('#piProperty').val()
	
	var inputData = {
			"piProperty": piProperty
		}
	
	//alert(inputData);

	var htmlStr = "";
	$.ajax ({
		url: "/join/subPropCode",
		type : "POST",
		data : JSON.stringify(inputData),
		dataType: "json",
		contentType:"application/json;charset=UTF-8",
	    async: false,
		success : function(data) {
			$(data).each(function(index, value){
				var strHtml = ''
//					+ '		<option value = 0 > '+'=선택='+'</option> '
					+ '		<option value = "'+value.suPiproperty+'"> '+value.suPipropname+'</option> '

				$("#suPIProperty").append(strHtml);
			});
		 },
		 error: function(xhr, status, error){
	       //alert(xhr.responseText);
	       alert("error")
	    }
	});
}
</script>
</body>
</html>