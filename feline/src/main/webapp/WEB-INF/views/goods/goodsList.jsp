<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
</head>
<body>
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>상품목록</li>
					</ul>
				</div>

				<div class="col-md-3">
					<!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">
								카테고리<span class="badge pull-right"></span>
							</h3>
						</div>

						<div class="panel-body">
							<ul class="nav nav-pills nav-stacked category-menu">
								<li><a href="#">사료</a>
									<ul>
										<li><a href="/feline/goods/goodsList.cat">유기농/홀리스틱</a></li>
										<li><a href="#">피부/피모건강</a></li>
										<li><a href="#">헤어볼케어</a></li>
										<li><a href="#">다이어트/비뇨건강</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-md-9">
					<div class="box">
						<h1>
							<c:if test="${category >= 0 and category <=4}  ">
							<li class="post2">사료</li>
							</c:if>
							<c:if test="${category >= 0 and category <=4}">
							<li class="post2">간식</li>
							</c:if>	
							<c:if test="${category >= 0 and category <=4}">
							<li class="post2">모래/화장실</li>
							</c:if>	
							<c:if test="${category >= 0 and category <=4}">
							<li class="post2">장난감</li>
							</c:if>
							<c:if test="${category >= 0 and category <=4}">
							<li class="post2">위생용품</li>
							</c:if>
						</h1>
						<p>
							<c:if test="${category eq 0 }" >유기농/홀리스틱</c:if>
							<c:if test="${category eq 1 }" >피부/피모건강</c:if>
							<c:if test="${category eq 2 }" >헤어볼케어</c:if>
							<c:if test="${category eq 3 }" >다이어트/비뇨건강</c:if>
							<c:if test="${category eq 4 }" >캔/파우치</c:if>
							<c:if test="${category eq 5 }" >저키/소시지</c:if>
							<c:if test="${category eq 6 }" >비스켓/트릿</c:if>
							<c:if test="${category eq 7 }" >캣닢/캣그라스</c:if>
							<c:if test="${category eq 8 }" >응고형 모래</c:if>
							<c:if test="${category eq 9 }" >흡수형 모래</c:if>
							<c:if test="${category eq 10 }" >화장실/패드</c:if>
							<c:if test="${category eq 11 }" >기타</c:if>
							<c:if test="${category eq 12 }" >공/봉제인형</c:if>
							<c:if test="${category eq 13 }" >레이저/낚시</c:if>
							<c:if test="${category eq 14 }" >막대</c:if>
							<c:if test="${category eq 15 }" >캣닢</c:if>
							<c:if test="${category eq 16 }" >샴푸/린스</c:if>
							<c:if test="${category eq 17 }" >구강관리</c:if>
							<c:if test="${category eq 18 }" >눈/귀/피부&피모건강</c:if>
							<c:if test="${category eq 19 }" >브러쉬/털관리</c:if>
							
						</p>
					</div>

					<c:if test="${fn:length(goodsList) le 0}">
						등록된 상품이 없습니다
					</c:if> 
					<div class="row products">
						<c:forEach var="goodsList" items="${goodsList}" varStatus="stat">
							<c:url var="viewURL" value="goodsView.cat">
								<c:param name="goods_num" value="${goodsList.goods_num }"/>
								<c:param name="currentPage" value="${currentPage }"/>
							</c:url>						
					
							<div class="col-md-3 col-sm-6">
								<div class="product">
									<div class="flip-container">
										<div class="flipper" style="height: 130px">
											<div class="front">
												<a href="${viewURL}">
													<img
														src="/feline/resources/upload/images/${goodsList.goods_image_savname}"
														width="100%" height="100%" />
												</a>
											</div>
											<div class="back">
												<a href="${viewURL}">
													<img
														src="/feline/resources/upload/images/${goodsList.goods_image_savname}"
														width="100%" height="100%" />
												</a>
											</div>
										</div>
									</div>
									<br /> <br />
									<div class="text">
										<h3>
											<a href="${viewURL}">
													${goods_name}
											</a>
										</h3>
										<p class="price">
											<fmt:formatNumber value="${goodsList.goods_price}" type="number" pattern="#,###"/>&nbsp;원
										</p>
										<p class="buttons">
											<a href="${viewURL}">
												<button class="btn btn-primary">상품 상세보기</button>
											</a>
										</p>
									</div>
									<!-- /.text -->
								</div>
								<!-- /.product -->
							</div>
						</c:forEach>
					</div>
					<!-- /.products -->
					<div class="paging">
						${pagingHtml}
					</div>
				</div>
				<!-- /.col-md-9 -->
			</div>
			<br/>
			<!-- /.container -->
		</div>
	<!-- /#content -->
	</div>
	<!-- /#all -->
</body>
</html>