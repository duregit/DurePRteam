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
<body class="sidebar-mini layout-navbar-fixed" onload="fileSelect()">
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
									<div id="fileInfo" style="display:none;">
										<div class="form-group" id="fileDiv1">										
											<div class="row">
												<!-- 1, 2, 3 -->
												<div class="col-4" id="file1"></div>
												<div class="col-4" id="file2"></div>
												<div class="col-4" id="file3"></div>
											</div>
										</div>									
										<div class="form-group" id="fileDiv4">										
											<div class="row">
												<!-- 4, 5, 6 -->
												<div class="col-4" id="file4"></div>
												<div class="col-4" id="file5"></div>
												<div class="col-4" id="file6"></div>
											</div>
										</div>
									</div>
									<small><b>${ evaluation.prName }</b> 홍보단님 활동하시느라 고생 많으셨습니다. 주신 평가는 두레생협의 소중한 자산이 되었습니다. 감사합니다.</small>
								</div>
								<!-- /.card-body -->								

								<div class="card-footer" style="text-align:center;">
									<button type="button" class="btn btn-default" gubun="pre" onclick="prePage(this)">이전</button>
									<c:set var="state" value="${ evaluation.state }" />
									<!-- 작성자 O -->
									<c:if test="${ evaluation.addUser eq user.userId }">
										<c:choose>
											<c:when test="${ state eq null or state == 'W' or state == 'N' }">
												<button type="button" class="btn btn-warning" gubun="save" onclick="formSubmit(this)">임시저장</button>
												<button type="button" class="btn btn-primary" gubun="next" onclick="formSubmit(this)">작성완료</button>
											</c:when>
											<c:when test="${ state == 'R' or state == 'C' }">
												<!-- 검토요청 중 or 승인 시 수정 X -->
												<a href="list" class="btn btn-primary">목록으로</a>
											</c:when>
										</c:choose>
									</c:if>
									<!-- 작성자 X -->
									<c:if test="${ evaluation.addUser ne user.userId }">
										<a href="list" class="btn btn-primary">목록으로</a>
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
</body>
<jsp:include page="/include/_footer.jsp" />
<script type="text/javascript">
$(function() {
	$(".resizeme").aeImageResize({ height: 100, width: 100 });
	
	var evalNo = '<c:out value="${ evaluation.evalNo }"></c:out>'
	var userId = '<c:out value="${ user.userId }"></c:out>'
	var addUser = '<c:out value="${ evaluation.addUser }"></c:out>'
	var state = '<c:out value="${ evaluation.state }"></c:out>'
		
	// [수정] 본인이 아닌경우 disabled
	if (addUser != '' && userId != addUser) {
		$("#salesTip").attr("disabled", "true");
		$("#guestOpinion").attr("disabled", "true");
		$("#requestList").attr("disabled", "true");
		$("#suggestion").attr("disabled", "true");
		$("#uploadFile").attr("disabled", "true");
		$("#uploadBtn").attr("disabled", "true");
	} else if(state == 'R' || state == 'C') {
		// 본인이여도 검토요청중 이거나 관리자승인 상태면 disabled
		$("#salesTip").attr("disabled", "true");
		$("#guestOpinion").attr("disabled", "true");
		$("#requestList").attr("disabled", "true");
		$("#suggestion").attr("disabled", "true");
		$("#uploadFile").attr("disabled", "true");
		$("#uploadBtn").attr("disabled", "true");
	}
		
	// input type="file" 파일 선택 후 input에 이름 표시를 위함
	bsCustomFileInput.init();
	
	// 파일 업로드
	$("#uploadBtn").click(function() {
		if ($("#uploadFile")[0].files.length == 0) {
			alert("파일 선택 후 업로드하세요.");
			return false;
		}
		
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
		    	alert("업로드가 완료되었습니다.");
		    	fileSelect();
	        },
	        error: function (e) {
	        	alert("업로드 실패");
	        }
		});
	});
	
	// 유효성 검사
	$('#evaluation').submit(function() {
        if ($('#salesTip').val() == '') {
            alert('판매팁을 입력하세요.');
            $('#salesTip').focus();
            return false;
        }
        if ($('#guestOpinion').val() == '') {
            alert('조합원의견을 입력하세요.');
            $('#guestOpinion').focus();
            return false;
        }
        if ($('#requestList').val() == '') {
            alert('개선/요청사항을 입력하세요.');
            $('#requestList').focus();
            return false;
        }
        if ($('#suggestion').val() == '') {
            alert('이 말은 꼭!!을 입력하세요.');
            $('#suggestion').focus();
            return false;
        }
    });
});
	// 파일 정보 초기화
	function fileSelect() {		
		// 화면 초기화
		$("#fileInfo").css("display", "none");
		$("#fileDiv1").css("display", "none");
		$("#fileDiv4").css("display", "none");
		for (var i = 0; i < 6; i++) {
			$("#file" + i).html("");
		}
		
		var evalNo = $("#evalNo").val();		// 평가서 번호	
		var inputData = {
			"evalNo": parseInt(evalNo)
		}
		
		$.ajax({
			url : "/file/fileSelect",
			type : "POST",
			data: JSON.stringify(inputData),
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
		    async: false,
		    success: function(data){
		    	var files = data;
		    	//console.log(data);
		    	
		    	var cnt = 1;
		    	var strHtml = ''
		    	
	    		$("#fileInfo").css("display", "");
	    		// 데이터 바인딩
	        	$.each(files, function(key, value) {
	        		// div 활성화
	        		if (cnt == 1 || cnt == 4) {
	        			$("#fileDiv" + cnt).css("display", "");
	        		}
	        		// 실서버용
	        		strHtml = '<a href="/image/'+ value.fileName +'" target="_blank"><img src="/image/'+ value.fileName +'" alt="User Image" style="width: 100%;height: 100%;"></a>'
	        		
	        		// local test용
	        		//strHtml = '<a href="/upload/'+ value.fileName +'" target="_blank"><img src="/upload/'+ value.fileName +'" alt="User Image" style="width: 100%;height: 100%;"></a>'
	        		//strHtml = '<a href="/upload/'+ value.fileName +'" target="_blank"><img class="resizeme" src="/upload/'+ value.fileName +'" alt="User Image" style="width: 100%;height: 100%;"></a>'
	        		
	        		$("#file" + cnt).html("");
	        		$("#file" + cnt).append(strHtml);
	        		
        			cnt++;
	        	});
		    },
		    error: function(xhr, status, error){
		       alert(xhr.responseText);
		    },
		    complete: function(xhr, status){}
		});
	}

	// 첨부파일 체크
	function fileCheck() {
		var uploadFile = $("#uploadFile")[0].files;
		// 파일은 6개까지
		if (uploadFile.length > 6) {
			alert("파일은 6개까지 업로드 가능합니다");
			fileReset();
			return false;
		}
		
		// 파일 용량 및 확장자 체크
		var maxSize = 5 * 1024 * 1024;	// 10MB
		var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
		
		for (var i = 0; i < uploadFile.length; i++) {
			var fileSize = uploadFile[i].size;
			if (fileSize > maxSize){
				alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
				fileReset();
				return false;
			}
			
			if (!(uploadFile[i].name).match(reg)) {
		  		alert("jpg, jpeg, png, gif, bmp 파일만 업로드 가능합니다.");
		  		fileReset();
				return false;
			}
		}
	}

	// 첨부파일 초기화
	function fileReset() {
		var agent = navigator.userAgent.toLowerCase();
		// 파일초기화
		if ((navigator.appName == 'Netscape' && navigator.userAgent
				.search('Trident') != -1)
				|| (agent.indexOf("msie") != -1)) {
			$("#uploadFile").replaceWith($("#uploadFile").clone(true));
		} else {
			$("#uploadFile").val("");
		}
	}
	
	// 임시저장 or 작성완료
	function formSubmit(btn) {
		var evalNo = $("#evalNo").val(); // 평가서 번호

		var btnGubun = $(btn).attr("gubun"); // 버튼 종류
		if (btnGubun == "save") {
			$("#evaluation").attr("action",
					"/evaluation/save05?evalNo=" + evalNo)
		}

		$("#evaluation").submit();
	}

	function getThumbFile(_IMG){
	  //canvas에 이미지 객체를 리사이징해서 담는 과정
	  var canvas = document.createElement("canvas");
	  canvas.width = '100px'; //리사이징하여 그릴 가로 길이
	  canvas.height ='100px'; //리사이징하여 그릴 세로 길이
	  canvas.getContext("2d").drawImage(_IMG, 0, 0, width, height);

	  //canvas의 dataurl를 blob(file)화 하는 과정
	  var dataURL = canvas.toDataURL("image/png"); //png => jpg 등으로 변환 가능
	  var byteString = atob(dataURI.split(',')[1]);
	  var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
	  var ab = new ArrayBuffer(byteString.length);
	  var ia = new Uint8Array(ab);
	  for (var i = 0; i < byteString.length; i++) {
	    ia[i] = byteString.charCodeAt(i);
	  }

	  //리사이징된 file 객체
	  var tmpThumbFile = new Blob([ab], {type: mimeString});
	 
	  return tmpThumbFile;
	}
	
	// 이전페이지
	function prePage() {
		var evalNo = $("#evalNo").val(); // 평가서 번호	
		if (confirm("이전페이지로 이동하시겠습니까?")) {
			location.href = "edit04?evalNo=" + evalNo;
		} else {
			return false;
		}
	}
	 
</script>
</html>