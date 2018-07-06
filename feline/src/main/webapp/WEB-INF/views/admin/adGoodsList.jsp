<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
</head>

<body>
	<div id="all">

		<div id="content">
			<div class="container">
				<div class="col-md-12">
					<!-- 과정 표시 -->
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>관리자 페이지</li>
					</ul>

				</div>

				<div class="col-md-12">
					<!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
					<!-- 사이드바 메뉴(패널형식) -->
					<div class="panel panel-default sidebar-menu">

						<!-- 메뉴바(이름) -->
						<div class="panel-heading">
							<h3 class="panel-title">관리자 기능</h3>
						</div>

						<!-- 메뉴바(메뉴들) -->
						<div class="panel-body">
							<!-- 가로 정렬(1/4) -->
							<div class="col-sm-3">
								<ul class="nav nav-pills nav-stacked">

									<li><a href="adMemberList.cat"><i
											class="fa fa-user"></i> 회원관리</a></li>
								</ul>
							</div>
							<!-- 가로 정렬(1/4) -->
							<div class="col-sm-3">
								<ul class="nav nav-pills nav-stacked">
									<li class="active"><a href="adGoodsList.cat"><i
											class="fa fa-gift"></i> 상품관리</a></li>
								</ul>
							</div>
							<!-- 가로 정렬(1/4) -->
							<div class="col-sm-3">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="adOrderList.cat"><i
											class="fa fa-shopping-cart"></i> 주문관리</a></li>
								</ul>
							</div>
							<!-- 가로 정렬(1/4) -->
							<div class="col-sm-3">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="/feline/notice/noticeList.cat"><i class="fa fa-list"></i>
											고객센터 관리</a></li>
								</ul>
							</div>
						</div>

					</div>
					<!-- /.col-md-3 -->

					<!-- *** CUSTOMER MENU END *** -->
				</div>

				<!-- 메인 바디 메뉴. -->
				<div class="col-md-12" id="customer-orders">
					<div class="box">
						<center>
							<h1>상품 관리</h1>
						</center>
						<hr>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>상품번호</th>
										<th>상품명</th>
										<th>가격</th>
										<th>카테고리</th>
										<th>수량</th>
										<th>등록일</th>
									</tr>
								</thead>

								<tbody>
								<c:forEach var="list" items="${goodsList}">
										<tr>
										<c:url var="viewURL" value="adGoodsView.cat">
												<c:param name="goods_num" value="${list.goods_num }"/>
												<c:param name="currentPage" value="${currentPage }"/>
											</c:url>
											<th>${list.goods_num }</th>
											<td><a href="${viewURL}">
													${list.goods_name }
												</a></td>
											<td>${list.goods_price}</td>
											<td>${list.goods_category }</td>
											<td>${list.goods_amount }</td>
											<td><fmt:formatDate value="${list.goods_date}" pattern="yyyy.MM.dd"/></td>
											
										</tr>
									</c:forEach>
									<c:if test="${fn:length(goodsList) le 0 }">
										<tr bgcolor="#FFFFFF" align="center">
											<td colspan="6">등록된 게시물이 없습니다.</td>
										</tr>
									</c:if>
									<tr align="center">
										<td colspan="6">${pagingHtml }</td>
									</tr>
								</tbody>
							</table>
							<center>
								<form>
									<select name="searchNum">
										<option value="0">상품명</option>
									</select>
									<input type="text" name="searchKeyword" size="30"/>
									<input name="submit" type="submit" value="검색">
									<input type="button" value="상품등록" style="float:right" class="btn btn-default"
									onclick="javascript:location.href='adGoodsWrite.cat?currentPage=${currentPage}'">
								</form>
							</center>
						</div>
						<!-- 상품관리 테이블 목록 -->
					</div>
				</div>

			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
		</div>
</body>

</html>
