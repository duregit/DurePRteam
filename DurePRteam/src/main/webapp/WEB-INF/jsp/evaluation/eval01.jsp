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
					<div class="col-sm-12">
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">평가서(기본사항)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="evaluation">
								<input type="hidden" id="evalNo" name="evalNo" value="${ evaluation.evalNo }"/>
								<div class="card-body">
									<div class="form-group">
										<label for="addUser">작성자</label>
										<form:input path="addUser" class="form-control" value="${ evaluation.addUser }" readonly="true" />
									</div>
									<div class="form-group">
										<label for="prName">홍보단명</label>										
										<form:input path="prName" class="form-control" />
									</div>
									<div class="form-group">
										<label for="piproperty">단협</label> 
										<form:select path="piproperty" class="form-control" onchange="pipChange(this)">
											<form:option value="0" label="=선택=" />
											<form:options itemValue="piProperty" itemLabel="piPropname" items="${ selPIProperty }" />
										</form:select>
									</div>
									<div class="form-group">
										<label for="suPIProperty">매장</label>
										<form:select path="suPIProperty" class="form-control">									
											<c:choose>
												<c:when test="${ selSuPIProperty eq null }">
													<form:option value="0" label="=선택=" />
												</c:when>
												<c:otherwise>													
													<form:options itemValue="suPiproperty" itemLabel="suPipropname" items="${ selSuPIProperty }" />
												</c:otherwise>
											</c:choose>
										</form:select>
									</div>
									<div class="form-group">
										<label>진행일</label>
										<div class="input-group date dateYYYYMMDD" id=prDateDiv data-target-input="nearest">
											<form:input path="prDate" class="form-control datetimepicker-input" data-target="#prDateDiv" />
											<div class="input-group-append" data-target="#prDateDiv" data-toggle="datetimepicker">
												<div class="input-group-text">
													<i class="fa fa-calendar"></i>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="prDay">진행요일</label>
										<form:input path="prDay" class="form-control" readonly="true" />
									</div>
									<div class="form-group">
										<label for="gubun">행사구분</label>
										<form:select path="gubun" class="form-control">
											<form:option value="0" label="==선택하세요==" />
											<form:options itemValue="detailCode" itemLabel="text" items="${ selGubuns }" />
										</form:select>
									</div>
									<div class="form-group">
										<label for="weather">날씨</label> 
										<form:select path="weather" class="form-control">
											<form:option value="0" label="==선택하세요==" />
											<form:options itemValue="detailCode" itemLabel="text" items="${ selWeathers }" />
										</form:select>
									</div>
									<div class="form-group">
										<label for="temperatures">기온</label> 
										<form:select path="temperatures" class="form-control">
											<form:option value="0" label="==선택하세요==" />
											<form:options itemValue="detailCode" itemLabel="text" items="${ selTemperatures }" />
										</form:select>
									</div>
								</div>
								<!-- /.card-body -->

								<div class="card-footer" style="text-align:center;">
									<a href="list" class="btn btn-default">목록으로</a>
									<!-- 작성자 O -->
									<c:if test="${ evaluation.addUser eq user.userId }">
										<c:choose>
											<c:when test="${ state eq null or state == 'W' or state == 'N' }">
												<button type="submit" class="btn btn-primary">다음</button>
											</c:when>											
											<c:when test="${ state == 'R' or state == 'C' }">
												<!-- 검토요청 중 or 승인 시 수정 X -->
												<a href="edit02?evalNo=${ evaluation.evalNo }" class="btn btn-primary">다음</a>
											</c:when>
										</c:choose>
									</c:if>
									<!-- 작성자 X -->
									<c:if test="${ evaluation.addUser ne user.userId }">
										<a href="edit02?evalNo=${ evaluation.evalNo }" class="btn btn-primary">다음</a>
									</c:if>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<section class="content-header"></section>
		</div>
		<!-- ./wrapper -->
	</div>
<jsp:include page="/include/_footer.jsp" />
<script type="text/javascript">
$(function() {
	var evalNo = '<c:out value="${ evaluation.evalNo }"></c:out>'
	var userId = '<c:out value="${ user.userId }"></c:out>'
	var addUser = '<c:out value="${ evaluation.addUser }"></c:out>'
	var state = '<c:out value="${ evaluation.state }"></c:out>'
	
	// [수정] 본인이 아닌경우 disabled
	if (addUser != '' && userId != addUser) {
		$("#prName").attr("disabled", "true");
		$("#piproperty").attr("disabled", "true");
		$("#suPIProperty").attr("disabled", "true");
		$("#prDate").attr("disabled", "true");
		$("#gubun").attr("disabled", "true");
		$("#weather").attr("disabled", "true");
		$("#temperatures").attr("disabled", "true");
	} else if(state == 'R' || state == 'C') {
		// 본인이여도 검토요청중 이거나 관리자승인 상태면 disabled
		$("#prName").attr("disabled", "true");
		$("#piproperty").attr("disabled", "true");
		$("#suPIProperty").attr("disabled", "true");
		$("#prDate").attr("disabled", "true");
		$("#gubun").attr("disabled", "true");
		$("#weather").attr("disabled", "true");
		$("#temperatures").attr("disabled", "true");
	}
	
	$("select[name='piproperty']").change(function(){
		//init_select('suPIProperty','=선택=');
		FnSubPropCd('suPIProperty',$(this).val() ,'');
  	});
	
	// 유효성 검사
	$('#evaluation').submit(function() {
        if ($('#prName').val() == '') {
            alert('홍보단 명을 입력하세요.');
            $('#prName').focus();
            return false;
        }
        if ($('#piproperty').val() == '0') {
            alert('단협을 선택하세요.');
            $('#piproperty').focus();
            return false;
        }
        if ($('#suPIProperty').val() == '0') {
        	alert('매장을 선택하세요.');
        	$('#suPIProperty').focus();
            return false;
        }
        if ($('#prDate').val() == '') {
        	alert('진행일을 선택하세요.');
        	$('#prDate').focus();
            return false;
        }
        if ($('#gubun').val() == '0') {
        	alert('행사구분을 선택하세요.');
        	$('#gubun').focus();
            return false;
        }
        if ($('#weather').val() == '0') {
            alert('날씨를 선택하세요.');
            $('#weather').focus();
            return false;
        }
        if ($('#temperatures').val() == '0') {
            alert('기온을 선택하세요.');
            $('#temperatures').focus();
            return false;
        }
    });
});

	function FnSubPropCd(id, pdata, sdata)
	{
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
</script>
</body>
</html>