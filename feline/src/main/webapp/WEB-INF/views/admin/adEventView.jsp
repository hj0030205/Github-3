<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
.form-control {
	color: black;
	font-size: 19px;
}

.fg {
	font-size: 19px;
}
select{
	width:200px;
	height:25px;
	font-size:17px;
	
}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- ///////////////////////////////row page title/////////////////////////////////////// -->
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<form action="adEventWrite.cat" method="post">
						<h3 class="text-themecolor">이벤트 상세</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/feline/admin/main.cat">관리자
							메인</a></li>
							<li class="breadcrumb-item active">이벤트 상세</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h3>이벤트 정보</h3>
				<div class="card">
					<div class="card-block">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group"></div>
								<div class="form-group">
									<div class="form-group"></div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-6">
												<label class="col-md-6">이벤트명</label>
												<div class="col-md-12">
													<input type="text" name="event_name"
														class="form-control form-control-line"
														value="${eventModel.event_name}" readonly="readonly">
												</div>
											</div>
											<div class="col-md-6">
												<label class="col-md-6">할인율(단위:%)</label>
												<div class="col-md-12">
													<input type="text" name="dc_rate"
														value="${eventModel.dc_rate}"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-6">
												<label class="col-md-6">이벤트 시작일</label>
												<div class="col-md-12">
													<input type="date" name="start_date"
														class="form-control form-control-line"
														value="<fmt:formatDate value='${eventModel.start_date}' type='date' pattern='yyyy-MM-dd'/>" readonly="readonly">
												</div>
											</div>
											<div class="col-md-6">
												<label class="col-md-6">이벤트 종료일</label>
												<div class="col-md-12">
													<input type="date" name="end_date"
														value="<fmt:formatDate value='${eventModel.end_date}' type='date' pattern='yyyy-MM-dd'/>"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-6">
											<label class="col-md-6">대분류</label>
											<div class="col-md-12">
												<c:if test="${goodsModel1.goods_category eq '0' ||goodsModel1.goods_category eq '1' ||goodsModel1.goods_category eq '2' ||goodsModel1.goods_category eq '3'}">사료</c:if>
												<c:if test="${goodsModel1.goods_category eq '4' ||goodsModel1.goods_category eq '5' ||goodsModel1.goods_category eq '6' ||goodsModel1.goods_category eq '7'}">간식</c:if>
												<c:if test="${goodsModel1.goods_category eq '8' ||goodsModel1.goods_category eq '9' ||goodsModel1.goods_category eq '10' ||goodsModel1.goods_category eq '11'}">모래와 화장실</c:if>
												<c:if test="${goodsModel1.goods_category eq '12' ||goodsModel1.goods_category eq '13' ||goodsModel1.goods_category eq '14' ||goodsModel1.goods_category eq '15'}">장난감</c:if>
												<c:if test="${goodsModel1.goods_category eq '16' ||goodsModel1.goods_category eq '17' ||goodsModel1.goods_category eq '18' ||goodsModel1.goods_category eq '19'}">위생용품</c:if>
											</div>
										</div>
										<div class="col-md-6">
											<label class="col-md-6">카테고리</label>
											<div class="col-md-12">
												<c:if test="${goodsModel1.goods_category eq 0}">유기농/홀리스틱</c:if>
												<c:if test="${goodsModel1.goods_category eq 1}">피부/피모건강</c:if>
												<c:if test="${goodsModel1.goods_category eq 2}">헤어볼케어</c:if>
												<c:if test="${goodsModel1.goods_category eq 3}">다이어트/비뇨건강</c:if>
												<c:if test="${goodsModel1.goods_category eq 4}">캔/파우치</c:if>
												<c:if test="${goodsModel1.goods_category eq 5}">저키/소시지</c:if>
												<c:if test="${goodsModel1.goods_category eq 6}">비스켓/트릿</c:if>
												<c:if test="${goodsModel1.goods_category eq 7}">캣닢/캣그라스</c:if>
												<c:if test="${goodsModel1.goods_category eq 8}">응고형 모래</c:if>
												<c:if test="${goodsModel1.goods_category eq 9}">흡수형 모래</c:if>
												<c:if test="${goodsModel1.goods_category eq 10}">화장실/패드</c:if>
												<c:if test="${goodsModel1.goods_category eq 11}">기타</c:if>
												<c:if test="${goodsModel1.goods_category eq 12}">공/봉제인형</c:if>
												<c:if test="${goodsModel1.goods_category eq 13}">레이저/낚시</c:if>
												<c:if test="${goodsModel1.goods_category eq 14}">막대</c:if>
												<c:if test="${goodsModel1.goods_category eq 15}">캣닢</c:if>
												<c:if test="${goodsModel1.goods_category eq 16}">샴푸/린스</c:if>
												<c:if test="${goodsModel1.goods_category eq 17}">구강관리</c:if>
												<c:if test="${goodsModel1.goods_category eq 18}">눈/귀/피부&피모건강</c:if>
												<c:if test="${goodsModel1.goods_category eq 19}">브러쉬/털관리</c:if>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-12">상품목록</label>
							<div class="col-md-12">
								<table class="table">
									<thead>
										<tr>
											<th>상품이미지</th>
											<th>상품명</th>
											<th>상품가격</th>
											<th>할인가격</th>
										</tr>
									<thead>
									<tbody id="goodsList">
										<c:forEach var="goodsList" items="${goodsList}" varStatus="stat">
											<tr>
												<td>
													<img src="/feline/resources/upload/images/${goodsList.goods_image_savname}" />
												</td>
												<td>${goodsList.goods_name}</td>
												<td><fmt:formatNumber value="${goodsList.goods_price}" type="number" pattern="#,###"/>&nbsp;원</td>
												<td><fmt:formatNumber value="${goodsList.goods_price*(100-eventModel.dc_rate)/100}" type="number" pattern="#,###"/>&nbsp;원</td>
										</c:forEach>
									</tbody>
								</table>						
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12" style="text-align: center;">
								<input type="submit" class="btn btn-success" value="수정하기">
								&nbsp; <a class="btn btn-warning" href="/feline/admin/adEventList.cat">목록으로</a>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>