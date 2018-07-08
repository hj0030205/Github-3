<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문조회</title>
</head>
<body>
	<div class="all">
		<div class="content">
			<div class="container">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>주문 내역</li>
					</ul>
				</div>
				<!-- 홈으로가는 링크 생성 -->
				<div class="col-md-3">
					<!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">마이 페이지</h3>
						</div>

						<div class="panel-body">

							<ul class="nav nav-pills nav-stacked">
								<li><a href="mypage.cat">마이 페이지</a></li>
								<li class="active"><a href="orderList.cat"><i
										class="fa fa-list"></i>나의 주문 내역</a></li>
								<li><a href="/feline/basket/basketList.cat"><i
										class="fa fa-heart"></i>장바구니</a></li>
								<li><a href="memberModify.cat"><i
										class="fa fa-address-card"></i>회원정보수정</a></li>
								<li><a href="memberDelete.cat"><i
										class="fa fa-sign-out"></i>회원탈퇴</a></li>
							</ul>
						</div>

					</div>
					<!-- /.col-md-3 -->

					<!-- *** CUSTOMER MENU END *** -->
				</div>

				<p>
					<!-- 추가 -->
				<div class="col-md-9" id="customer-orders">
					<div class="box">
						<h3>
							주문내역 <small>회원전용</small>
						</h3>
						<legend>
							<h2>주문리스트</h2>
						</legend>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>주문일자</th>
									<th>주문번호</th>
									<th>카테고리</th>
									<th>상품명</th>
									<th>주문수량</th>
									<th>상품가격</th>
									<th>주문상태</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="order" items="${orderList}" varStatus="status">
								<tr>
									<td><fmt:formatDate value="${order.order_date}"
													pattern="yyyy.MM.dd HH:MM" /></td>
									<td><a href="orderView.cat?order_num=${order.order_num}">${order.order_num }</a></td>
									<td>${goodsList[status.index].goods_category }</td>
									<td>${goodsList[status.index].goods_name }</td>
									<td>${order.order_goods_amount }</td>
									<td>${goodsList[status.index].goods_price }</td>
									<td>${order.order_status }</td>
									<td>
									<c:choose>
									<c:when test="${order.status == 0}">
									취소완료
									</c:when>
									<c:otherwise>
									정상주문
									</c:otherwise>
									</c:choose>
									</td>
								</tr>	
							</c:forEach>
									<c:if test="${fn:length(orderList) <= 0}">
										<tr bgcolor="#FFFFFF" align="center">
											<th colspan="7">주문하신 상품이 없습니다.</th>
										</tr>
										<tr bgcolor="#777777">
											<th height="1" colspan="7"></th>
										</tr>
									</c:if>
							</tbody>
						</table>
								<br />
						<center>
							<button type="button" class="btn btn-primary"
								onClick="javascript:location.href='mypage.cat'">돌아가기</button>
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>