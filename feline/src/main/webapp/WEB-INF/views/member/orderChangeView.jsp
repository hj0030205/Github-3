<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<title>교환조회</title>
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
						<li>주문교환상세내역</li>
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
								<li><a href="orderList.cat">
								<i class="fa fa-list"></i>나의 주문 내역</a></li>
								<li><a href="orderCancleList.cat">
								<i class="fa fa-times"></i>주문 취소 내역</a></li>	
								<li><a href="orderRefundList.cat">
								<i class="fa fa-toggle-on"></i>주문 환불 내역</a></li>	
								<li class="active"><a href="orderChangeList.cat">
								<i class="fa fa-reply-all"></i>주문 교환 내역</a></li>															
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

				</div>
				<!-- *** CUSTOMER MENU END *** -->
			<!-- ========================================================================================== -->
				
				<div class="col-md-9" id="customer-orders">
					<div class="box">
						<h3>
							교환상세내역 <small>회원전용</small>
						</h3>
						<br>
							<h2>교환리스트</h2>
							<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label>교환 번호</label><input type="text" class="form-control"
										id="change_num" name="change_num"
										value="${changeModel.change_num }" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>주문 번호</label> <input type="text" class="form-control"
										id="order_num" name="order_num"
										value="${changeModel.order_num }" disabled="disabled">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label>환불자 아이디</label> <input type="text"
										class="form-control" id="member_id"
										name="member_id"
										value="${changeModel.member_id }"
										disabled="disabled">
								</div>
							</div>
						</div>
				<!-- ========================================================================================== -->
						<div class="row">
							<div class="col-sm-10">
								<div class="form-group">
									<label>교환 이유</label><input type="text" class="form-control"
										id="change_reason" name="change_reason"
										value="${changeModel.change_reason }" disabled="disabled">
								</div>
							</div>
						</div>			
				<!-- ========================================================================================== -->
						<center><button class="btn btn-primary"
						onclick="javascript:location.href='orderChangeList.cat'">목록</button><center>					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>