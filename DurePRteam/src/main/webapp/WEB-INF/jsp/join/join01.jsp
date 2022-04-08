<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>생활재 홍보단 JOIN</title>

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
								<h3 class="card-title">회원가입</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="join" >
								<div class="card-body">
									<div class="form-group">
										<label for="userId">아이디</label> 
										<div class="input-group">
											<input type="text" class="form-control" id="userId" name="userId">
											<button type="button" style="margin-left:10px;" class="btn btn-danger" onclick="FnCheckId()">
												중복확인
											</button>
										</div>
									<i class="bi bi-person-fill"></i>		
									</div>							
									<div class="form-group">
										<label for="userPW">비밀번호</label> 
										<input type="password" class="form-control" id="userPW" name="userPW">
									</div>								
									<div class="form-group">
										<label for="userName">이름</label> 
										<input type="text" class="form-control" id="userName" name="userName">
									</div>
									<div class="form-group">
										<label for="PIProperty">단협</label>
										<form:select path="piProperty" class="form-control" id="piProperty">
											<form:option value="0" label="=선택=" />
											<form:options itemValue="piProperty" itemLabel="piPropname" items="${ piProperty }" />
										</form:select>
									</div>
									<div class="form-group">
										<label for="suPIProperty">매장</label> 
										<select class="form-control" name="suPIProperty" id="suPIProperty" >
											<option value="0" label="=선택=" />
										</select>
									</div>
									<div class="form-group">
										<label>주소</label>
										<div style="padding-bottom:5px" class="input-group">
			                                <div class="input-group-prepend">
												<div class="input-group-text">
													<font size="1px">우편주소</font>
												</div>
											</div>
			                                <input type="text" id="userZip" name="userZip" class="form-control"/>
			                            </div>
										<div style="padding-bottom:5px" class="input-group">
			                                <div class="input-group-prepend">
												<div class="input-group-text">
													<font size="1px">기본주소</font>
												</div>
											</div>
			                                <input type="text" id="userAddr1" name="userAddr1" class="form-control"/>
			                            </div>
			                            <div style="padding-bottom:5px" class="input-group">
			                                <div class="input-group-prepend">
												<div class="input-group-text">
													<font size="1px">상세주소</font>
												</div>
											</div>
			                                <input type="text" id="userAddr2" name="userAddr2" class="form-control" />
			                            </div>
										<div style="text-align:right;">
										<button type="button" class="btn btn-warning btn-sm">주소검색</button>
										</div>
									</div>
									<div class="form-group">
										<label for="UserCTel">휴대폰 번호</label> 
										<input type="text" class="form-control" id="userCtel" name="userCtel" placeholder="' - ' 를 포함해서 입력하세요">
									</div>
									<div class="form-group">
										<label for="ACNum">계좌</label> 
										<div style="padding-bottom:5px">
											<form:select path="bCode" class="form-control" id="piProperty">
												<form:option value="0" label="=선택=" />
												<form:options itemValue="bCode" itemLabel="bName" items="${ bCode }" />
											</form:select>
										</div>
										<input type="text" class="form-control" id="acNum" name="acNum" placeholder="' - ' 를 제외해서 입력하세요">
									</div>
								</div>
								<!-- /.card-body -->

								<div class="card-footer" style="text-align:center;">
									<button type="button" class="btn btn-primary" onclick="FnSave()">저장</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<iframe name="ifrm_Process" id="ifrm_Process" style="width:100%;height:100px;display:none;" ></iframe>
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
					//alert(value.suPipropname);
					var strHtml = ''
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

	var idck = 0;

	function FnCheckId() {
		frm = document.join
		
		if($('#userId').val() == ""){
			alert("아이디를 입력해주세요.")
			return;
		}
		
		var userId = $('#userId').val()
		
		var inputData = {
			"userId": userId
		}
		
		
		$.ajax({
			url : "/join/joinCheckId",
			type : "POST",
			data : JSON.stringify(inputData),
			dataType: "text",
			contentType:"application/json;charset=UTF-8",
		    async: false,
		    success: function(data){
				//alert(data);
		        if (data > 0) {
		    	    alert('아이디가 존재합니다. 다른 아이디를 입력해주세요.');
		        } else {
		    	    alert('사용 가능한 아이디입니다.');
		    	    idck = 1;
		    	}
		    },
		    error: function(xhr, status, error){
		       //alert(xhr.responseText);
		       alert("error")
		    },
		    complete: function(xhr, status){}
		});
	}
	
	function FnSave() {
		frm = document.join
		
//		if(idck == 0){
//			alert("아이디 중복체크를 해주세요");
//			return false;
//		}
		
//		if($('#UserId').val() == ""){
//			alert("아이디를 입력해주세요.")
//			return;
//		}else if($('#UserPw').val() == ""){
//			alert("비밀번호를 입력해주세요.")
//			return;
//		}else if($('#UserNm').val() == ""){
//			alert("이름을 입력해주세요.")
//			return;
//		}else if($('#PIProperty').val() == ""){
//			alert("단협을 선택해주세요.")
//			return;
//		}else if($('#suPIProperty').val() == ""){
//			alert("매장을 선택해주세요.")
//			return;
//		}else if($('#Zip').val() == "" || $('#Addr1').val() == ""){
//			alert("우편주소 및 기본주소를 입력해주세요.")
//			return;
//		}else if($('#Addr2').val() == ""){
//			alert("상세주소를 입력해주세요.")
//			return;
//		}else if($('#UserCTel').val() == ""){
//			alert("휴대폰번호를 입력해주세요.")
//			return;
//		}else if($('#ACNum').val() == ""){
//			alert("은행을 선택해주세요.")
//			return;
//		}else if($('#ACStr').val() == ""){
//			alert("계좌번호를 입력해주세요.")
//			return;
//		}
		
		//저장

		$("#join").submit();
	}
	

</script>
</body>
</html>