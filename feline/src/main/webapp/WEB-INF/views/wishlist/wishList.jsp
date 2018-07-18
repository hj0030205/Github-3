<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<div id="all">

		<div id="content">
			<div class="container">

				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>위시리스트</li>
					</ul>
				</div>

				<div class="col-md-12" id="wishList">

					<div class="box">

						<h1>위시리스트</h1>
						<!-- <p class="text-muted">You currently have 3 item(s) in your cart.</p> -->
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th></th>
										<th>상품명</th>
										<th>사이즈</th>
										<th>가 격</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="wishList" items="${wishList}" varStatus="stat">
										<tr>
											<td><img src="/feline/resources/upload/images/${wishList.goods_image_savname}" /></td>
											<td>
												<a href="/feline/goods/goodsView.cat?goods_num=${wishList.goods_num}">
													${wishList.goods_name}
												</a>
											</td>
											<td>
												<c:if test="${wishList.goods_size ne null}">
													${wishList.goods_size}
												</c:if>
												<c:if test="${wishList.goods_size eq null} ">
												</c:if>
											</td>
											
											<td><fmt:formatNumber value="${wishList.goods_price}" type="number" pattern="#,###"/>&nbsp;원</td>
											
											<td><a
												href="deleteWishList.cat?wish_num=${wishList.wish_num}"><i
													class="fa fa-trash-o"></i></a></td>
											
										</tr>
									</c:forEach>

									<c:if test="${fn:length(wishList) <= 0}">
										<tr>
											<td colspan="6">위시리스트에 상품이 없습니다.</td>
										</tr>
									</c:if>

								</tbody>
								<tfoot>
									

								</tfoot>
							</table>

						</div>
						<!-- /.table-responsive -->

						<div class="box-footer">
							<div class="pull-left">
								<a href="/feline/main.cat" class="btn btn-default"><i
									class="fa fa-chevron-left"></i>쇼핑 계속하기</a>
							</div>
							<!-- <div class="pull-right">
								<button type="button" class="btn btn-primary"
									onclick="javascript:location.href='/feline/order/goodsSettle.cat'">
									주문하기<i class="fa fa-chevron-right"></i>
								</button>
							</div> -->
						</div>

					</div>
					<!-- /.box -->

				</div>
				<!-- /.col-md-3 -->

			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->

	</div>
	<!-- /#all -->

</body>
</html>