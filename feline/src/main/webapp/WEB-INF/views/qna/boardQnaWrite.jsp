<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/feline/resources/common/se/js/HuskyEZCreator.js" charset="utf-8" ></script>
<script type="text/javascript" src="/feline/resources/common/se/js/jindo.min.js" charset="utf-8" ></script>

</head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
</head>
<body>
	<div id="all">
		<div id="content">
			<div class="container">
				<!-- 과정 표시 -->

				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<c:choose>
							<c:when test="${qnaModel eq NULL }">
							<li>Q&A 등록</li>
							</c:when>
							<c:when test="${reply eq true }">
							<li>Q&A 답변</li>
							</c:when>
							<c:when test="${modify eq true }">
							<li>Q&A 수정</li>
							</c:when>
						</c:choose>
					</ul>
				</div>

				<div class="col-md-12" id="checkout">
					<div class="box">
						<c:choose>
						<c:when test="${qnaModel eq NULL}">
							<form action="qnaWrite.cat" id="qnaWriteForm" method="post" enctype="multipart/form-data">
							<h1>Q&A 작성 페이지</h1>
						</c:when>
						<c:when test="${reply eq true }">
							<form action="qnaReplyWrite.cat" method="post" enctype="multipart/form-data">
							<input type="hidden" name="ref" value="${qnaModel.ref}"/>
							<input type="hidden" name="re_step" value="${qnaModel.re_step}"/>
							<h1>Q&A 작성 페이지</h1>
						</c:when>
						<c:when test="${modify eq 'true' }">
							<form action="qnaModifyAction.cat" id="qnaWriteForm" method="post" enctype="multipart/form-data">
								<input type="hidden" name="no" value="${qnaModel.no }" />
								<input type="hidden" name="currentPage" value="${currentPage }" />
							<h1>Q&A 수정 페이지</h1>
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
						<!-- /.content -->
						<div class="content">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="subject">제목</label> <input type="text"
											id="subject" name="subject" class="form-control"
											value="${qnaModel.subject }" />
									</div>
								</div>
							</div>

							<%-- <div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="upload">이미지</label>
										<input type="file" name="file"/>
										<c:if test="${qnaModel.image_savname ne null}">
										&nbsp; * ${qnaModel.image_orgname }파일이 등록되어 있습니다. 
										다시 업로드하면 기존의 파일은 삭제 됩니다.
										</c:if>
									</div>
								</div>
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="content">내용</label>
										<textarea class="form-control" id="content"
											name="content" rows="10">${qnaModel.content }</textarea>
									</div>
								</div>
							</div> --%>
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
							<div class="contentDiv">
							 	<textarea class="form-control" id="txtContent" name="content" rows="20" style="width:100%;">
							 	${qnaModel.content }
							 	</textarea>
							</div>
						</div>
					</div>
				</div>
							<!-- /.row -->
						</div>
						<div class="box-footer">
							<div class="pull-left">
								<a href="qnaList.cat?currentPage=${currentPage }"
								 class="btn btn-default">목록으로<i class="fa fa-chevron-left"></i></a>
							</div>
							<c:choose>
							<c:when test="${qnaModel eq NULL }">
							<div class="pull-right">
								<button type="button" class="btn btn-primary" onclick="onWrite()">
									작성완료<i class="fa fa-chevron-right"></i>
								</button>
							</div>
							</c:when>
							<c:when test="${modify eq 'true' }">
							<div class="pull-right">
								<input type="hidden" name="no" value="${qnaModel.no }" />
								<input type="hidden" name="currentPage" value="${currentPage }" />
								<button type="button" class="btn btn-primary" onclick="onModify()">
									수정완료<i class="fa fa-chevron-right"></i>
								</button>
							</div>
							</c:when>
							</c:choose>
						</div>
						</form>
					</div>
					<!-- /.box -->
				</div>
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
	</div>
</body>
<script type="text/javascript">
var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: document.getElementById('txtContent'), // html editor가 들어갈 textarea id
	sSkinURI: "/feline/resources/common/se/SmartEditor2Skin.html",  // html editor가 skin url
	fOnAppLoad: function () { 
        //수정모드를 구현할 때 사용할 부분. 로딩이 끝난 후 값이 체워지게 하는 구현을 하면 된다.
         var subject = '${item.subject}';               
         var content = '${item.content}';         //db에서 불러온 값을 여기에서 체워넣으면 됨.
         document.getElementById("title").value = subject;     
         oEditors.getById["txtContent"].exec("PASTE_HTML", [content]); //로딩이 끝나면 contents를 txtContent에 넣음
     },
     fCreator: "createSEditor2"
 });

var onWrite = function(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
	var qnaWriteForm = document.getElementById("qnaWriteForm");  

		qnaWriteForm.action ="qnaWrite.cat";
		qnaWriteForm.submit();					   

};

 var onModify = function(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
	var qnaWriteForm = document.getElementById("qnaWriteForm");  
	
	qnaWriteForm.action ="qnaModifyAction.cat";
	qnaWriteForm.submit();  
}; 

var pasteHTML = function(filename){
    var sHTML = '<img src="${pageContext.request.contextPath}/resources/common/tempUpload/'+filename+'">';
    oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]);
};

var validationType = function(fileName){
	var type = fileName.substring(fileName.lastIndexOf('.')+1, fileName.length);
	if(type.toUpperCase() == 'JPG' || type.toUpperCase() == 'GIF' || type.toUpperCase() == 'PNG' || type.toUpperCase() == 'BMP'){
		return true;
	}else
		return false;
};

</script>
</html>