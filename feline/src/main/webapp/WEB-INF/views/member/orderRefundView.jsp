<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<title>환불조회</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="all">
		<div class="content">
			<div class="container">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<c:choose>
							<c:when test="${sessionScope.id ne null}">
								<li>마이 페이지</li>
							</c:when>
							<c:otherwise>
								<li>주문 내역</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!-- 홈으로가는 링크 생성 -->
				<div class="col-md-3">
					<!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">
								<c:choose>
									<c:when test="${sessionScope.id ne null}">
										마이 페이지
									</c:when>
									<c:otherwise>
										주문 내역
									</c:otherwise>
								</c:choose>
							</h3>
						</div>

						<div class="panel-body">

						<c:choose>
							<c:when test="${sessionScope.id ne null}">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="mypage.cat">마이 페이지</a></li>
									<li><a href="orderList.cat">
									<i class="fa fa-list"></i>나의 주문 내역</a></li>
									<li><a href="orderCancleList.cat">
									<i class="fa fa-times"></i>주문 취소 내역</a></li>	
									<li class="active"><a href="orderRefundList.cat">
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
							</c:when>
							<c:otherwise>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="b_orderList.cat?order_trade_num=${refundModel.order_trade_num}">
									<i class="fa fa-list"></i>나의 주문 내역</a></li>
									<li><a href="b_orderCancleList.cat?order_trade_num=${refundModel.order_trade_num}">
									<i class="fa fa-times"></i>주문 취소 내역</a></li>	
									<li class="active"><a href="b_orderRefundList.cat?order_trade_num=${refundModel.order_trade_num}">
									<i class="fa fa-toggle-on"></i>주문 환불 내역</a></li>	
									<li><a href="b_orderChangeList.cat?order_trade_num=${refundModel.order_trade_num}">
									<i class="fa fa-reply-all"></i>주문 교환 내역</a></li>															
									
								</ul>
							</c:otherwise>
						</c:choose>
							
						</div>

					</div>
					<!-- /.col-md-3 -->

					<!-- *** CUSTOMER MENU END *** -->
				</div>
			<!-- ========================================================================================== -->
				
				<div class="col-md-9" id="customer-orders">
					<div class="box">
						<h3>
							<c:choose>
								<c:when test="${sessionScope.id ne null}">
									환불상세내역 <small>회원전용</small>
								</c:when>
								<c:otherwise>환불상세내역 <small>비회원전용</small></c:otherwise>
							</c:choose>
						</h3>
						<br>
							<h2>환불리스트</h2>
							<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label>취소 번호</label><input type="text" class="form-control"
										id="trade_num" name="trade_num"
										value="${refundModel.trade_num }" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>주문 번호</label> <input type="text" class="form-control"
										id="order_num" name="order_num"
										value="${refundModel.order_num }" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label>환불자 아이디</label> <input type="text"
										class="form-control" id="member_id"
										name="member_id"
										value="${refundModel.member_id }"
										disabled="disabled">
								</div>
							</div>
						</div>
				<!-- ========================================================================================== -->
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>환불 이유</label><input type="text" class="form-control"
										id="trade_reason" name="trade_reason"
										value="${refundModel.trade_reason }" disabled="disabled">
								</div>
							</div>
						</div>			
				<!-- ========================================================================================== -->
						<center><button class="btn btn-primary"
						onclick="javascript:location.href='orderRefundList.cat'">목록</button><center>					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>