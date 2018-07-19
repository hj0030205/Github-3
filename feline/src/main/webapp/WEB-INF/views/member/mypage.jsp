<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="all">
		<div class="content">
			<div class="container">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>마이 페이지</li>
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
								<li class="active"><a href="mypage.cat">마이 페이지</a></li>
								<li><a href="orderList.cat">
								<i class="fa fa-list"></i>나의 주문 내역</a></li>
								<li><a href="orderCancleList.cat">
								<i class="fa fa-times"></i>주문 취소 내역</a></li>	
								<li><a href="orderRefundList.cat">
								<i class="fa fa-toggle-on"></i>주문 환불 내역</a></li>	
								<li><a href="orderChangeList.cat">
								<i class="fa fa-reply-all"></i>주문 교환 내역</a></li>															
								<li><a href="/feline/basket/basketList.cat"><i
										class="fa fa-shopping-cart"></i>장바구니</a></li>
								<li><a href="/feline/wishlist/wishList.cat"><i class="fa fa-heart"></i>WISHLIST</a></li>
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
				<!-- -------------------------------사이드바----------------------------------------- -->
				<div class="col-md-9" id="customer-orders">
					<div class="box">
						<h1>마이 페이지</h1>

						<form action="mypage.cat" method="post">
							<table width="100%">
								<tr>
									<th>${memberModel.member_name}님환영합니다.</th>
									<th width="10%" rowspan="4"></th>
									<th><center>
											<h2>총 주문 금액</h2>
										</center></th>
								</tr>
								<tr>
									<th>번호 : ${memberModel.member_phone}</th>
								</tr>
								<tr>
									<th>이메일 : ${memberModel.member_email }</th>
									<th><center>
											${totalPrice }원
										</center></th>
								</tr>
								<tr>
									<th>주소 : ${memberModel.member_zipcode }<br/>${memberModel.member_addr1 }&nbsp;${memberModel.member_addr2 }</th>
								</tr>
							</table>
						</form>
						<hr>
			
									<button class="btn btn-default" style="float: right" 
										onclick="javascript:location.href='orderList.cat?member_id=${memberModel.member_id}'">MORE</button>
						
						<div class="inner">
							<th><strong>최근 주문 정보</strong></th>
						</div>
						<hr />
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>주문일자</th>
										<th>카테고리</th>
										<th>상품명</th>
										<th>주문수량</th>
										<th>주문가격</th>
										<th>주문상태</th>
									</tr>
								</thead>
								<tbody>
							
									<c:forEach var="order" items="${orderList }" varStatus="status">
										<tr>
											<td><fmt:formatDate value="${order.order_date }" pattern="yyyy.MM.dd  HH:MM"/></td>
											<td>
											<c:choose>
											<c:when test="${goodsModel[status.index].goods_category == 0 }">
											유기농/홀리스틱
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 1 }">
											피부/피모건강
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 2 }">
											헤어볼케어
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 3 }">
											다이어트/비뇨건강
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 4 }">
											캔/파우치
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 5 }">
											저키/소시지
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 6 }">
											비스켓/트릿
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 7 }">
											캣닢/캣그라스
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 8 }">
											응고형모래
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 9 }">
											흡수형모래
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 10 }">
											화장실/패드
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 11 }">
											기타
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 12 }">
											공/봉제인형
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 13 }">
											레이져/낚시
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 14 }">
											막대
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 15 }">
											갯닢
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 16 }">
											샴푸/린스
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 17 }">
											구강관리
											</c:when>
											<c:when test="${goodsModel[status.index].goods_category == 18 }">
											눈/귀/피부&피모건강
											</c:when>
											<c:otherwise>
											브러쉬/털관리
											</c:otherwise>
											</c:choose>
											</td>
											<td>${goodsModel[status.index].goods_name }</td>
											<td>${order.order_goods_amount }</td>
											<td>${goodsModel[status.index].goods_price * order.order_goods_amount }</td>
											<td>
											<c:choose>
											<c:when test="${order.order_status == 0}">
											배송준비중
											</c:when>
											<c:when test="${order.order_status == 1}">
											배송중
											</c:when>
											<c:otherwise>
											배송완료
											</c:otherwise>
											</c:choose>
											</td>
										</tr>
										
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>