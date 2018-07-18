<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<title>주문조회</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="all">
		<div class="content">
			<div class="container">
				<!-- 추가 -->
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>주문상세내역</li>
					</ul>
				</div>
				<!-- *** CUSTOMER MENU ***
 ________________________________________________________ -->
				<div class="col-md-3">

					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">마이 페이지</h3>
						</div>

						<div class="panel-body">

							<ul class="nav nav-pills nav-stacked">
								<li><a href="mypage.cat">마이 페이지</a></li>
								<li class="active"><a href="orderList.cat">
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

				</div>
				<!-- *** CUSTOMER MENU END *** -->
			<!-- ========================================================================================== -->
				
				<div class="col-md-9" id="customer-orders">
					<div class="box">
						<h3>
							주문상세내역 <small>회원전용</small>
						</h3>
						<br>
							<h2>주문리스트</h2>
							<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label>주문자 성함</label><input type="text" class="form-control"
										id="order_receive_name" name="order_receive_name"
										value="${orderModel.order_receive_name }" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>주문자 아이디</label> <input type="text" class="form-control"
										id="order_member_id" name="order_member_id"
										value="${orderModel.order_member_id }" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label>받는사람 전화번호</label> <input type="text"
										class="form-control" id="order_receive_phone"
										name="order_receive_phone"
										value="${orderModel.order_receive_phone }"
										disabled="disabled">
								</div>
							</div>
						</div>
				<!-- ========================================================================================== -->
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>주문번호</label><input type="text" class="form-control"
										id="order_num" name="order_num"
										value="${orderModel.order_num }" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-2">
								<div class="form-group">
									<label>주문상품번호</label> <input type="text" class="form-control"
										id="order_goods_num" name="order_goods_num"
										value="${orderModel.goods_num }" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>주문상품 카테고리</label> <input type="text"
										class="form-control" id="order_goods_category"
										name="order_receive_phone"
										value="${goodsModel.goods_category }"
										disabled="disabled">
								</div>
							</div>
						</div>			
				<!-- ========================================================================================== -->
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>주문상품이름</label><input type="text" class="form-control"
										id="order_goods_name" name="order_goods_name"
										value="${goodsModel.goods_name }" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-2">
								<div class="form-group">
									<label>주문상품개수</label> <input type="text" class="form-control"
										id="order_goods_amount" name="order_goods_amount"
										value="${orderModel.order_goods_amount}" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>주문상품사이즈</label> <input type="text" class="form-control"
										id="order_goods_size" name="order_goods_size"
										value="${orderModel.order_goods_size }" disabled="disabled">
								</div>
							</div>
						</div>
				<!-- ========================================================================================== -->
						<div class="row">
							<div class="col-sm-6 col-md-3">
								<div class="form-group">
									<label>받는사람 우편번호</label><input type="text" class="form-control"
										id="order_receive_zipcode" name="order_receive_zipcode"
										value="${orderModel.order_receive_zipcode}"
										disabled="disabled">
								</div>
							</div>
						</div>				
				<!-- ========================================================================================== -->
						<div class="row">
							<div class="col-sm-8">
								<div class="form-group">
									<label>받는사람 기본주소</label> <input type="text"
										class="form-control" id="order_receive_addr1"
										name="order_receive_addr1"
										value="${orderModel.order_receive_addr1}" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label>받는사람 상세주소</label> <input type="text"
										class="form-control" id="order_receive_addr2"
										name="order_receive_addr2"
										value="${orderModel.order_receive_addr2}" disabled="disabled">
								</div>
							</div>
						</div>
				<!-- ========================================================================================== -->
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label>주문자 메모</label> <input type="text" class="form-control"
										id="order_memo" name="order_memo"
										value="${orderModel.order_memo}" disabled="disabled">
								</div>
							</div>
						</div>				
				<!-- ========================================================================================== -->
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label>결제수단</label><input type="text" class="form-control"
										id="order_trade_payer" name="order_trade_payer"
										value="${orderModel.order_trade_payer }" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<label>주문날짜</label> <input type="text" class="form-control"
										id="order_date" name="order_date"
										value="${orderModel.order_trade_date }" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label>주문상태</label> <input type="text" class="form-control"
										id="order_status" name="order_status"
										value="${orderModel.order_status}" disabled="disabled">
								</div>
							</div>
						</div>				
				<!-- ========================================================================================== -->
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label>주문상품가격</label> <input type="text" class="form-control"
										id="goods_price" name="goods_price"
										value="${goodsModel.goods_price}" disabled="disabled">
								</div>
							</div>
						</div>
				<!-- ========================================================================================== -->
						<c:choose>
							<c:when test="${orderModel.order_status == 0 }">
								<button class="btn btn-danger"
								onclick="javascript:location.href='orderCancle.cat?order_num=${orderModel.order_num}'">주문취소
								</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-danger"
								onclick="javascript:location.href='orderChange.cat?order_num=${orderModel.order_num}'">주문교환
								</button>
								
								<button class="btn btn-danger"
								onclick="javascript:location.href='orderRefund.cat?order_num=${orderModel.order_num}'">주문환불
								</button>								
							</c:otherwise>
						</c:choose>
							<button class="btn btn-primary"
								onclick="javascript:location.href='orderList.cat'">목록</button>										
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>