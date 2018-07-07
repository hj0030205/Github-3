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
						<li>FAQ</li>
					</ul>
				</div>

				<!-- *** LEFT COLUMN ***
		     _________________________________________________________ -->
				<div class="col-md-9">
					<div class="box" id="contact">
						<h1>자주 찾는 질문들</h1>
						<hr>
						<div class="panel-group" id="accordion">
							<c:forEach var="list" items="${faqList}">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#faq${list.no }"> ${list.subject }</a>
										</h4>
									</div>
									<div id="faq${list.no }"
										class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												${list.content }
											</p>
											<p>
												<c:if test="${sessionScope.id eq 'admin' }">
													<input id="faqBtn" type="button" class="btn btn-default" value="삭제"
														onclick="javascript:location.href='faqDelete.cat?no=${list.no}'" />
													<input id="faqBtn" type="button" class="btn btn-default" value="수정"
														onclick="javascript:location.href='faqModify.cat?no=${list.no}&currentPage=${currentPage }'" />
												</c:if>
											</p>
										</div>
									</div>
								</div>
								<!-- /.panel -->
							</c:forEach>
						</div>
						<!-- /.panel-group -->
						<center>
							<form>
								<select name="searchNum">
									<option value="0">제목</option>
									<option value="1">내용</option>
								</select>
								<input type="text" name="searchKeyword" size="30"/>
								<button type="submit" class="btn btn-default">
									<i class="fa fa-search"></i>
								</button>
							</form>
						</center>
						<c:if test="${sessionScope.id ne null }">
							<c:if test="${sessionScope.id eq 'admin' }">
								<center>
									<input class="btn btn-primary" type="button" value="글쓰기"
										onclick="javascript:location.href='faqWrite.cat?currentPage=${currentPage}'">
								</center>
							</c:if>
						</c:if>
					</div>
				</div>
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
								<li><a
									href="/feline/notice/noticeList.cat">공지사항</a></li>
								<li><a href="/feline/qna/qnaList.cat">Q&A</a></li>
								<li class="active"><a href="faqList.cat">FAQ</a></li>
								
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