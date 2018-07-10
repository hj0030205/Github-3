<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 정보 조회</title>
<script>
$(function() {
	$("#datepicker").datepicker();
	$("#datepicker2").datepicker();
});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">주문 목록</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/feline/admin/main.cat">관리자 메인</a></li>
					<li class="breadcrumb-item active">주문 목록</li>
				</ol>
			</div>
		</div>

		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->
		<div class="col-lg-12">
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
						<!-- 검색창 영역 -->
						<form class="form-inline" action="adOrderList.cat">
							<table class="table">
								<tr>
									<th>기간별 검색 :</th>
									<td style="text-align: left;" colspan=2>
										<input type="text" class="form-control" id="datepicker" placeholder="부터">
										~ <input type="text" class="form-control" id="datepicker2" placeholder="까지">
									</td>
									<%-- <c:if test="${status eq 'all'}">
									<th>주문 상태 : </th>
									<td>
										<input type="radio" name="active" checked="checked" value="0">전체 &nbsp;
										<input type="radio" name="active" value="1">취소됨 &nbsp;
									</td>
									</c:if> --%>
								</tr>
								<tr>
									<th>항목별 검색 :</th>
									<td colspan=2>
										<div class="input-group">
											<select name="searchNum" class="form-control col-md-3">
												<option value="0">주문 번호</option>
												<option value="1">주문 아이디</option>
												<option value="2">전화번호</option>
											</select>
											<input class="form-control col-md-9" type="text" name="searchKeyword">
											<button class="fa fa-search" style="padding-left: 10px;"></button>
										</div>
									</td>
								<%-- 	<c:if test="${status eq 'all'}">
									<td colspan=2>
										<select class="form-control" name="payment_status">
											<option value="0">결제상태</option>
											<option value="1">PS01</option>
											<option value="2">PS02</option>
										</select>
										<select class="form-control" name="order_trans_status">
											<option value="0">배송상태</option>
											<option value="1">ST01</option>
											<option value="2">ST02</option>
											<option value="3">ST03</option>
										</select>
									</td> 
									</c:if> --%>
								</tr>
							</table>
						</form>
						<table class="list-items table table-hover table-striped">
							<thead class="list-header">
								<tr>
									<th>주문번호</th>
									<th>주문자 ID</th>
									<th>결제인</th>
									<th>배송번호</th>
									<th>수취인</th>
									<th>수취인 번호</th>
									<%-- <c:if test="${status eq 'all'}"> --%>
									<th>배송상태</th>
									<th>주문날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(orderList) <= 0}">
										<tr align=center>
											<td colspan=8>주문 내역이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${orderList}" varStatus="stat">
											<!-- 주문번호와 연결되는 URL -->
											<c:url var="viewOrderURL" value="adOrderView.cat">
												<c:param name="order_num" value="${list.order_num}" />
												<c:param name="currentPage" value="${currentPage}" />
											</c:url>
											<tr>
												<td>
													<a href="${viewOrderURL}">${list.order_num}</a>
												</td>
												<td>${list.order_member_id}</td>
												<td>${list.order_trade_payer}</td>
												<td>${list.order_trans_num}</td>
												<td>${list.order_receive_name}</td>
												<td>${list.order_receive_mobile}</td>
												<td><select name="order_status" disabled>
													<option value="0" <c:if test="${list.order_status eq 0 }"> selected  </c:if>>결제완료</option>
													<option value="1" <c:if test="${list.order_status eq 1 }"> selected </c:if>>배송준비</option>
													<option value="2" <c:if test="${list.order_status eq 2 }"> selected </c:if>>배송중</option>
													<option value="3" <c:if test="${list.order_status eq 3 }"> selected </c:if>>배송완료</option>
												</select></td>
												<td><fmt:formatDate value="${list.order_date}" pattern="yyyy.MM.dd HH:MM"/></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<table class="paging">
							<tr align=center>
								<td colspan=8>${pagingHtml}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>