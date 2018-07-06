<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="col-sm-12">
					<ul class="breadcrumb">

						<li><a href="/feline/main.cat">메인</a></li>
						<li>공지사항</li>
					</ul>
				</div>

				<!-- *** LEFT COLUMN ***
		     _________________________________________________________ -->

				<div class="col-sm-9" id="blog-listing">

					<div class="box">

						<h1>공지사항</h1>
						<hr>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번 호</th>
										<th>제 목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${noticeList}">
										<tr>
											<td>${list.no}</td>
											<c:url var="viewURL" value="noticeView.cat">
												<c:param name="no" value="${list.no }" />
												<c:param name="currentPage" value="${currentPage }" />
											</c:url>
											<td><a href="${viewURL}"> ${list.subject } </a></td>
											<td>${list.id }</td>
											<td><fmt:formatDate value="${list.regdate}"
													pattern="yyyy.MM.dd" /></td>
											<td>${list.readhit }</td>
										</tr>

									</c:forEach>
									<c:if test="${fn:length(noticeList) le 0 }">
										<tr>
											<td colspan="5"><center>등록된 게시물이 없습니다.</center></td>
										</tr>
									</c:if>
								</tbody>
							</table>
							<center>
								<div class="pages">${pagingHtml }</div>
								<form>
									<select name="searchNum">
										<option value="0">제목</option>
										<option value="1">내용</option>
									</select> <input type="text" name="searchKeyword" size="30" />
									<button type="submit" class="btn btn-default">
										<i class="fa fa-search"></i>
									</button>
								</form>
								<c:if test="${sessionScope.id ne null }">
									<c:if test="${sessionScope.id eq 'admin' }">
										<input id="noticeWriteBtn" type="button" value="게시물 등록"
											class="btn btn-default"
											onclick="javascript:location.href='noticeWrite.cat?currentPage=${currentPage}'"> &nbsp;
									</c:if>
								</c:if>
							</center>
							
						</div>
					</div>
				</div>


				<!-- /.container -->

				<!-- /#content -->
				<!-- /.col-md-9 -->

				<!-- *** LEFT COLUMN END *** -->


				<div class="col-md-3">
					<!-- *** BLOG MENU ***
 _________________________________________________________ -->
					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">고객센터</h3>
						</div>

						<div class="panel-body">

							<ul class="nav nav-pills nav-stacked">
								<li class="active"><a href="noticeList.cat">공지사항</a></li>
								<li><a href="/feline/qna/qnaList.cat">Q&A</a></li>
								<li><a href="/feline/faq/faqList.cat">FAQ</a></li>
							</ul>
						</div>

					</div>
					<!-- /.col-md-3 -->

					<!-- *** BLOG MENU END *** -->

				</div>


			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
	</div>
</body>
</html>