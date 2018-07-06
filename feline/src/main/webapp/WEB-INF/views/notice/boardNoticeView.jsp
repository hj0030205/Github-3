<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
				<div class="col-sm-12">

					<ul class="breadcrumb">

						<li><a href="/feline/main.cat">메인</a></li>
						<li><a href="noticeList.cat">공지사항</a></li>
						<li>공지사항 상세</li>
					</ul>
				</div>

				<div class="col-sm-12" id="blog-post">


					<div class="box">

						<h1>${noticeModel.subject }</h1>
						<p class="author-date">By ${noticeModel.id }</p>

						<div id="post-content">
							<p>
								<img src="/feline/resources/upload/images/${noticeModel.file_savname }"
									width="100%" /> <br />
								<%-- <c:url var="download" value="noticeFileDownAction">
									<c:param name="no" value="${noticeModel.no } " />
								</c:url>
								<a href="${viewURL}"> ${noticeModel.file_orgname} </a> --%>
							</p>
							<p>${noticeModel.content }</p>
						</div>

					</div>
					<!-- /.box -->
				</div>
				<!-- /#blog-post -->
				<center>
					<c:if test="${sessionScope.id ne null }">
						<c:if test="${sessionScope.id eq 'admin' }">
							<input id="goodsWriteBtn" type="button" value="게시물 등록" class="btn btn-default"
								onclick="javascript:location.href='noticeWrite.cat?currentPage=${currentPage}'"> &nbsp;
						<input id="goodsModifyBtn" type="button" value="게시물 수정" class="btn btn-default"
								onclick="javascript:location.href='noticeModify.cat?no=${noticeModel.no}&currentPage=${currentPage}'"> &nbsp;
						<input id="goodsDeleteBtn" type="button" value="게시물 삭제" class="btn btn-default"
								onclick="javascript:location.href='noticeDelete.cat?no=${noticeModel.no}'"> &nbsp;
						</c:if>
					</c:if>
					<input id="list" type="button" value="목록으로" class="btn btn-primary"
						onclick="javascript:location.href='noticeList.cat?currentPage=${currentPage}'">


					<br /> <br />
				</center>
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
	</div>
</body>
</html>