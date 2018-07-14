<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
						<li>Q&A</li>
					</ul>
				</div>

				<!-- *** LEFT COLUMN ***
		     _________________________________________________________ -->

				<div class="col-sm-9" id="blog-listing">

					<div class="box">

						<h1>Q&A 게시판</h1>

						<hr>

						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번 호</th>
										<th>상품명</th>
										<th>제 목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>답변상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${qnaList}">
										<tr>
											<td>${list.no }</td>
											<td>${list.goods_num }</td>
											<c:url var="viewURL" value="qnaView.cat">
												<c:param name="no" value="${list.no }" />
												<c:param name="currentPage" value="${currentPage }" />
											</c:url>
											<td><c:if test="${list.re_step!=0 }">
												→ &nbsp;
												</c:if> <a href="${viewURL}"> ${list.subject } </a></td>
											<td>${list.id }</td>
											<td><fmt:formatDate value="${list.regdate}"
													pattern="yyyy.MM.dd" /></td>
											<td>
											<c:choose>
												<c:when test="${list.answer==0 }">
													N
												</c:when>
												<c:otherwise>
													Y
												</c:otherwise>
											</c:choose>
											</td>
										</tr>
									</c:forEach>
									<c:if test="${fn:length(qnaList) le 0 }">
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
										<option value="0">작성자</option>
										<option value="1">제목</option>
										<option value="2">내용</option>
									</select> <input type="text" name="searchKeyword" size="30" />
									<button type="submit" class="btn btn-default">
										<i class="fa fa-search"></i>
									</button>
								</form>
							</center>
							<c:if test="${sessionScope.id ne null}">
								<center>
									<input class="btn btn-primary" type="button" value="질문하기"
										onclick="javascript:location.href='qnaWrite.cat?currentPage=${currentPage}'">
								</center>
							</c:if>
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
								<li><a href="/feline/notice/noticeList.cat">공지사항</a></li>
								<li class="active"><a href="qnaList.cat">Q&A</a></li>
								<li><a href="/feline/faq/faqList.cat">FAQ</a></li>
								<li><a href="/feline/map/mapView.cat">찾아오는 길</a></li>								
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