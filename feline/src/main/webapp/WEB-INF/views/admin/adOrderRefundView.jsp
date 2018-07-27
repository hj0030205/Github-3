<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">주문환불 상세보기</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/feline/admin/main.cat">관리자 메인</a>
					</li>
					<li class="breadcrumb-item"><a href="adOrderRefundList.cat">주문환불 목록</a></li>
					<li class="breadcrumb-item active">주문환불 상세보기</li>
				</ol>
			</div>
		</div>
		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->
		<div class="row">
			<!-- Column -->
			<div class="col-lg-12">
				<h3>주문환불 상세 정보</h3>
				<div class="card">
					<div class="card-block">
						<div class="form-group">
							<div class="row">
								<div class="col-md-4">
									<label class="col-md-5">환불번호</label>
									<div class="col-md-8">
										<input type="text" readonly="readonly"
											value="${refundModel.trade_num}"
											class="form-control form-control-line">
									</div>
								</div>
								
								<div class="col-md-4">
									<label class="col-md-5">회원 아이디</label>
									<div class="col-md-8">
										<input type="text" readonly="readonly"
											value="${refundModel.member_id}"
											class="form-control form-control-line">
									</div>
								</div>
								<div class="col-md-4">
									<label class="col-md-5">주문 번호</label>
									<div class="col-md-8">
										<input type="text" readonly="readonly"
											value="${orderModel.order_num}"
											class="form-control form-control-line">
									</div>
								</div>
								
							</div>
						</div>
						<div class="form-group">	
							<div class="row">
								<div class="col-md-4">
									<label class="col-md-5">환불 이유</label>
									<div class="col-md-12">
										<input type="text" readonly="readonly"
											value="${refundModel.trade_reason}"
											class="form-control form-control-line">
									</div>
								</div>
								<div class="col-md-4">
									<label class="col-md-5">환불 상태</label>
									<div class="col-md-12">
										<c:choose>
											<c:when test="${refundModel.trade_state == 0 }">
												<c:set var="result" value="환불대기중" />
											</c:when>
											<c:when test="${refundModel.trade_state == 1 }">
												<c:set var="result" value="환불수락" />
											</c:when>
											<c:otherwise>
												<c:set var="result" value="환불거절" />
											</c:otherwise>
										</c:choose>
										<input type="text" readonly="readonly"
											value="${result}"
											class="form-control form-control-line">
									</div>
								</div>
							</div>
						</div>
							<div class="col-sm-12">	
								<center>
									<c:choose>
									<c:when test="${refundModel.trade_state==0 }">
									<form action="adOrderRefundAgree.cat" method="post">
										<input type="hidden" name="order_num" value="${refundModel.order_num}" />
										<input type="hidden" name="trade_num" value="${refundModel.trade_num}" />
										<input type="hidden" name="redirect_type" value="detail"/>
										<input type="submit" value="승인" class="btn btn-success" >
									</form>
									<form action="adOrderRefundRefuse.cat" method="post">
										<input type="hidden" name="order_num" value="${refundModel.order_num}" />
										<input type="hidden" name="trade_num" value="${refundModel.trade_num}" />
										<input type="hidden" name="redirect_type" value="detail"/>
										<input type="submit" value="거절" class="btn btn-danger">
									</form>
									</c:when>
									<c:otherwise>
										처리완료
									</c:otherwise>
									</c:choose>
								</center>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
<!-- ======================================================================================================= -->
		
		<div class="row" id="info">
			<div class="col-lg-12">
				<h4>
					<b>주문 내역</b>
				</h4>
				<div class="card">
					<div class="card-block">
						<div class="col-md-2">
							<h4>
								<b>주문 정보 ▽</b>
							</h4>
						</div>
						
						
				<!-- ================================================================ -->
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
				<!-- =========================================================================================== -->	
					<div class="row">
							<div class="col-sm-4">
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
						
				<!-- =================================================================================================== -->	
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
						</div>						
				<!-- ========================================================================================== -->
					<%--	<div class="col-sm-12">
							<center>
							<button class="btn btn-warning" onclick="updateForm()"></button>
							&nbsp; <a class="btn btn-danger" onclick="deleteCheck()"></a>
							</center>
						</div> --%>
				<!-- ========================================================================================== -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>