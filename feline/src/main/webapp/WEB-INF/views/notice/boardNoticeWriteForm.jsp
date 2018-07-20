<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
</head>
<body>
	<spring:hasBindErrors name="noticeModel" />
	<div id="all">
		<div id="content">
			<div class="container">
				<!-- 과정 표시 -->

				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<c:choose>
							<c:when test="${noticeModel eq NULL }">
								<li>공지사항 등록</li>
							</c:when>
							<c:otherwise>
								<li>공지사항 수정</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<div class="col-md-12" id="checkout">
					<div class="box">
						<c:choose>
							<c:when test="${noticeModel eq NULL}">
								<form action="noticeWrite.cat" method="post"
									enctype="multipart/form-data">
									<h1>공지사항 작성 페이지</h1>
							</c:when>
							<c:otherwise>
								<form action="noticeModify.cat" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="no" value="${noticeModel.no }" /> <input
										type="hidden" name="currentPage" value="${currentPage }" /> <input
										type="hidden" name="old_file"
										value="${noticeModel.file_savname }" />
									<h1>공지사항 수정 페이지</h1>
							</c:otherwise>
						</c:choose>
						<!-- /.content -->
						<div class="content">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="subject">제목</label> <input type="text"
											id="subject" name="subject" class="form-control"
											value="${noticeModel.subject }" />
										<font color="red"><form:errors path="noticeModel.subject" /></font>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="upload">이미지</label> <input type="file" name="file" />
										<c:if test="${noticeModel.file_savname ne null}">
										&nbsp; * ${noticeModel.file_orgname }파일이 등록되어 있습니다. 
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
										<textarea class="form-control" id="content" name="content"
											rows="10">${noticeModel.content }</textarea>
										<font color="red"><form:errors path="noticeModel.content" /></font>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</div>
						<div class="box-footer">
							<div class="pull-left">
								<a href="noticeList.cat?currentPage=${currentPage }"
									class="btn btn-default">목록으로<i class="fa fa-chevron-left"></i></a>
							</div>
							<div class="pull-right">
								<button type="submit" class="btn btn-primary">
									작성완료<i class="fa fa-chevron-right"></i>
								</button>
							</div>
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

</html>