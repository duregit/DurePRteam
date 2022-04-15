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
							<form:form method="post" modelAttribute="userList" >
								<!-- form start -->
									<div class="card-body" >	
										<div class="row">									
											<table class="table table-bordered table-list">
												<tr>
													<td>단협</td>
													<td>
														<form:select path="piProperty" id="piProperty">
															<form:option value="0" label="=선택=" />
															<form:options itemValue="piProperty" itemLabel="piPropname" items="${ piProperty }" />
														</form:select>
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
														<button type="button" class="btn btn-info btn-sm float-right" onclick="FnSearch();">조회</button>
													</td>
												</tr>
											</table>
										</div>
									</div>
							</form:form>
							<form:form method="post" modelAttribute="userList2" >
										<table class="table table-bordered table-list">
											<thead>
												<tr>
													<th style="text-align:center;">
														<input type="checkbox" id="cbx_chkAll"  />														
													</th>
													<th style="text-align:center;">단협</th>
													<th style="text-align:center;">매장</th>
													<th style="text-align:center;">아이디</th>
													<th style="text-align:center;">이름</th>
													<th style="text-align:center;">회원상태</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="usrelist" items="${ userLists }">
												<c:set var="i" value="${i+1}" />		
												<tr>
													<td  style="text-align:center;">
														<input type="checkbox" name="chk" value="${i}">
													</td>
													<td>${ usrelist.piPropName }</td>
													<td>${ usrelist.suPIPropName }</td>
													<td>${ usrelist.userId }</td>
													<td>${ usrelist.userName }</td>
													<td style="text-align:center;">${ usrelist.userActive }</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
								<!-- /.card-body -->
								<div class="card-footer">
									<div class="input-group-prepend"style="float:right;">
										<select style="width:100px" class="form-control">
											<option value="">=선택=</option>
											<option value="N">대기</option>
											<option value="Y">승인</option>
											<option value="X">탈퇴</option>
										</select>
										<button style="float:right;margin-left:10px" type="button" class="btn btn-warning" onclick="FnActiveChg();">회원상태 변경</button>
									</div>
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
<jsp:include page="/include/_footer.jsp" />
<script type="text/javascript">
$(document).ready(function() {
	$("select[name='piProperty']").change(function(){
	   //init_select('suPIProperty','=선택=');
		FnSubPropCd('suPIProperty',$(this).val() ,'');
   });
	
	$("#cbx_chkAll").click(function() {
		if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});

	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;
		//alert(total);
		//alert(checked);

		if(total != checked) $("#cbx_chkAll").prop("checked", false);
		else $("#cbx_chkAll").prop("checked", true); 
	});
	
});


function FnSubPropCd(id, pdata, sdata)
{
	$("select#suPIProperty option").remove();	
	
	var piProperty = $('#piProperty').val()
	
	var inputData = {
			"piProperty": piProperty
		}
	
	//alert(inputData);

	var htmlStr = "";
	$.ajax ({
		url: "/userlist/subPropCode",
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


function FnActiveChg() {
	var checked = $("input[name=chk]:checked").length;
	//var checkVal = $(this).val();
	//alert(checkVal);
	$("input:checkbox[name=chk]:checked").each(function() {
		var checkVal = $(this).val();
		alert(checkVal)
	});
	
	if ($("input[name=chk]:checked").length == 0){
		alert("사용자를 선택해주세요.");
		return;
	}else {
		
		alert("회원상태 변경");
		
	}
}


function FnSearch() {
	//검색 버튼 처리 이벤트
	var userList = $("#userList");
	//alert(userList);
	
	userList.submit();
}

</script>
</body>
</html>