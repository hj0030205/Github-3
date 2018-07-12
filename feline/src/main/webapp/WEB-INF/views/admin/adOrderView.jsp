<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 상세보기</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">주문 상세보기</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main.cat">관리자 메인</a></li>
					<li class="breadcrumb-item"><a
						href="adOrderList.cat?currentPage=${currentPage }">주문 목록</a></li>
					<li class="breadcrumb-item active">주문 상세보기</li>
				</ol>
			</div>
		</div>

		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->

		<div class="col-lg-12">
			<div class="card">
				<div class="card-block">
					<h2>주문 정보 상세보기(#${orderModel.order_num })</h2>
					<div class="table-responsive">
						<table class="table order">
							<%-- <c:url var="viewMemberURL" value="adMemberView.cat">
								<c:param name="member_id" value="${orderModel.member_id}" />
							</c:url> --%>
							<tr>
								<th>거래번호</th>
								<td>${orderModel.order_trade_num}</td>
								<th>주문날짜</th>
								<td><fmt:formatDate value="${orderModel.order_date}" pattern="yyyy.MM.dd HH:MM" /></td>
							</tr>
							<tr>
								<th>주문자</th>
								<td>
									${orderModel.order_member_id} <%-- (<a href="${viewMemberURL}">${orderModel.member_id}</a>) --%>
								</td>
								<th>주문 상태</th>
									<td><select name="order_status" id="order_status" disabled>
											<option value="0"
												<c:if test="%{orderModel.order_status==0}"> selected </c:if>>결제완료</option>
											<option value="1"
												<c:if test="%{orderModel.order_status==1}"> selected </c:if>>배송준비</option>
											<option value="2"
												<c:if test="%{orderModel.order_status==2}"> selected </c:if>>배송중</option>
											<option value="3"
												<c:if test="%{orderModel.order_status==3}"> selected </c:if>>배송완료</option>
									</select></td>
								</tr>
							<tr>
								<th width=15%>결제인</th>
								<td width=35%>${orderModel.order_trade_payer}</td>
								<th width=15%>결제 방법</th>
								<td width=35%>${orderModel.order_trade_type}</td>
							</tr>
						</table>
						<br>
						<h2>주문 상품 목록</h2>
						<table class="table order">
							<tr>
								<th width=15>상품 번호</th>
								<th width=15>상품 카테고리</th>
								<th width=40>상품 이름</th>
								<th width=15>상품 가격</th>
								<th width=15>상품 수량</th>
							</tr>
								<c:url var="viewURL" value="adGoodsView.cat">
									<c:param name="goods_num" value="${orderModel.goods_num}" />
								</c:url>
								<tr>
									<td><a href="${viewURL}">${orderModel.goods_num}</a></td>
									<td>${goodsModel.goods_category }</td>
									<td>${goodsModel.goods_name}</td>
									<td><fmt:formatNumber value="${goodsModel.goods_price}" type="number" pattern="#,###"/>&nbsp;원</td>
									<td>${orderModel.order_goods_amount}</td>
								</tr>
							<tr>
								<td colspan=5><b>총 구매 금액 : 
								<font color="red">
								<fmt:formatNumber value="${orderModel.order_goods_amount * goodsModel.goods_price}" type="number" pattern="#,###"/>&nbsp;원</font></b></td>
							</tr>
						</table>
						<h2>배송 정보 상세보기</h2>
						<table class="table order">
							<tr>
								<th>배송번호</th>
								<td>${orderModel.order_trade_num}</td>
							</tr>
							<tr>
								<th>수취인</th>
								<td>${orderModel.order_receive_name}</td>
							</tr>
							<tr>
								<th>수취인 전화번호</th>
								<td>${orderModel.order_receive_phone}</td>
							</tr>
							<tr>
								<th>우편번호</th>
								<td>${orderModel.order_receive_zipcode}</td>
								<th>주소</th>
								<td colspan=3>${orderModel.order_receive_addr1}&nbsp;${orderModel.order_receive_addr2}</td>
							</tr>
							<tr>
								<th>요청 사항</th>
								<td colspan=3>${orderModel.order_memo}</td>
							</tr>
							<tr>
								<td colspan=5>
								<a class="btn btn-warning" href="adOrderModify.cat?order_num=${orderModel.order_num }&currentPage=${currentPage}">주문 수정</a>&nbsp;
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>