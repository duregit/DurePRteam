<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
								<h3 class="card-title">평가서(운영2)</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form:form method="post" modelAttribute="evaluation" enctype="multipart/form-data">
								<div class="card-body">		
									<input type="hidden" id="evalNo" name="evalNo" value="${ evaluation.evalNo }"/>							
									<div class="form-group">
										<label for="salesTip">판매팁</label>
										<form:textarea path="salesTip" class="form-control" rows="4" />
									</div>
									<div class="form-group">
										<label for="guestOpinion">조합원의견</label> 
										<form:textarea path="guestOpinion" class="form-control" rows="4" />
									</div>
									<div class="form-group">
										<label for="requestList">개선/요청사항</label> 
										<form:textarea path="requestList" class="form-control" rows="4" />
									</div>
									<div class="form-group">
										<label for="suggestion">이 말은 꼭!!</label> 
										<form:textarea path="suggestion" class="form-control" rows="4" />
									</div>
									
									<!-- 첨부파일 시작 최대(6장) -->
									<div class="form-group">
										<label for="uploadFile">사진첨부(최대 6장)</label>
										<div class="input-group">
											<div class="custom-file">												
												<input type="file" class="custom-file-input" id="uploadFile" name="uploadFile" multiple="multiple" onchange="fileCheck(this)"> 
												<label class="custom-file-label" for="uploadFile">파일선택</label>
											</div>
										</div>
									</div>
									
									<div class="form-group">
				                  		<button type="button" class="btn btn-info" id="uploadBtn">업로드</button>
				                  	</div>			
				                  		
									<!-- 이미지 코드--> 		
									<!-- 
									<div class="form-group">							
										<div class="row">
											<div class="col-4">
												<img src="/dist/img/user1-128x128.jpg" alt="User Image" style="width: 100%;height: 100%;">
											</div>
											<div class="col-4">
												<img src="/dist/img/user1-128x128.jpg" alt="User Image" style="width: 100%;height: 100%;">
											</div>
											<div class="col-4">
												<img src="/dist/img/user1-128x128.jpg" alt="User Image" style="width: 100%;height: 100%;">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-4">
												<img src="/dist/img/user1-128x128.jpg" alt="User Image" style="width: 100%;height: 100%;">
											</div>
											<div class="col-4">
												<img src="/dist/img/user1-128x128.jpg" alt="User Image" style="width: 100%;height: 100%;">
											</div>
											<div class="col-4">
												<img src="/dist/img/user1-128x128.jpg" alt="User Image" style="width: 100%;height: 100%;">
											</div>
										</div>
				                  	</div>
				                  	 -->
									<small>000홍보단님 활동하시느라 고생 많으셨습니다. 주신 평가는 두레생협의 소중한 자산이 되었습니다. 감사합니다.</small>
								</div>
								<!-- /.card-body -->								

								<div class="card-footer" style="text-align:center;">
									<button type="button" class="btn btn-default" gubun="pre" onclick="prePage(this)">이전</button>
									<c:set var="state" value="${ evaluation.state }" />
									<c:choose>
										<c:when test="${ state eq null or state == 'W' }">
											<button type="button" class="btn btn-warning" gubun="save" onclick="formSubmit(this)">임시저장</button>
											<button type="button" class="btn btn-primary" gubun="next" onclick="formSubmit(this)">작성완료</button>
										</c:when>
										<c:when test="${ state == 'R' or state == 'C' }">
											<button type="button" class="btn btn-primary" gubun="next" onclick="formSubmit(this)">목록으로</button>
										</c:when>
									</c:choose>
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
$(function() {
	// input type="file" 파일 선택 후 input에 이름 표시를 위함
	bsCustomFileInput.init();

	// 파일 업로드
	$("#uploadBtn").click(function() {
		var form = $("#evaluation")[0];
		var fileData = new FormData(form);
		
		$.ajax({
			url : "/file/uploadFile",
			type : "POST",
			enctype: 'multipart/form-data',
			data: fileData,
	        processData: false,
	        contentType: false,
	        cache: false,
		    success : function(data) {
		    	alert("파일업로드 성공");
	        },
	        error: function (e) {
	        	alert("파일업로드 실패");
	        }
		});
		
	});
});
	// 첨부파일 체크
	function fileCheck(obj) {
		/*
		for (var i = 0; i < curFileCnt; i++) {
	        const file = obj.files[i];
	        
	        // 첨부파일 리사이징 common.js
	        ResizeImage(file)
		}
		*/
	}
	

	function formSubmit(btn) {
		var evalNo = $("#evalNo").val();		// 평가서 번호
		
		var btnGubun = $(btn).attr("gubun");	// 버튼 종류
		if (btnGubun == "save") {
			$("#evaluation").attr("action", "/evaluation/save05?evalNo=" + evalNo)
		}
		
		$("#evaluation").submit();
	}

	
	//이전페이지
	function prePage() {	
		var evalNo = $("#evalNo").val();		// 평가서 번호	
		if(confirm("이전페이지로 이동하시겠습니까?")) {
			location.href = "edit04?evalNo=" + evalNo;
		} else {
			return false;
		}
	}
</script>
</html>