<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
							<c:when test="${faqModel eq null }">
								<li>FAQ 등록</li>
							</c:when>
							<c:otherwise>
								<li>FAQ 수정</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<div class="col-md-12" id="checkout">
					<div class="box">
						<c:choose>
							<c:when test="${faqModel eq null }">
								<form action="faqWrite.cat" method="post">
									<h1>FAQ 작성 페이지</h1>
							</c:when>
							<c:otherwise>
								<form action="faqModify.cat" method="post">
									<input type="hidden" name="no" value="${faqModel.no }" /> 
									<input type="hidden" name="currentPage" value="${currentPage }" />
									<h1>FAQ 수정 페이지</h1>
							</c:otherwise>
						</c:choose>

						<!-- /.content -->
						<div class="content">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="subject">제목</label> <input type="text"
											id="subject" name="subject" class="form-control"
											value="${faqModel.subject }" />
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="content">내용</label>
										<textarea class="form-control" id="content" name="content"
											rows="10">${faqModel.content }</textarea>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</div>
						<div class="box-footer">
							<div class="pull-left">
								<a href="faqList.cat" class="btn btn-default">목록으로<i
									class="fa fa-chevron-left"></i></a>
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