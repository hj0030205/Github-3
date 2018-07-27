<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>

function updateForm(){
	document.location.href="adEventModify.cat?event_num=${eventModel.event_num}";
}

function deleteCheck() {
	if(confirm("정말 삭제하시겠습니까?")==true){
		document.location.href="adEventDelete.cat?event_num=${eventModel.event_num}";
	}else{
		return false;
	}
}

function stopEvent() {
	if(confirm("정말 중지하시겠습니까?")==true){
		document.location.href="adEventStop.cat?event_num=${eventModel.event_num}";
	}else{
		return false;
	}
}

</script>
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
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-6">
												<label class="col-md-6">할인율(단위:%)</label>
												<div class="col-md-12">
													<input type="text" name="dc_rate"
														value="${eventModel.dc_rate}"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>
											<div class="col-md-6">
												<label class="col-md-6">활성화여부</label>
												<div class="col-md-12">
													<c:if test="${eventModel.status eq 0}">
													<input type="text" name="status"
														value="비활성화"
														class="form-control form-control-line" readonly="readonly">
													</c:if>
													<c:if test="${eventModel.status eq 1}">
													<input type="text" name="status"
														value="활성화"
														class="form-control form-control-line" readonly="readonly">
													</c:if>
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
											<th>판매여부</th>
										</tr>
									<thead>
									<tbody id="goodsList">
										<c:forEach var="goodsList" items="${goodsList}" varStatus="stat">
											<tr>
												<td>
													<img src="/feline/resources/upload/images/${goodsList.goods_image_savname}" width="300px" height="200px"/>
												</td>
												<td>${goodsList.goods_name}</td>
												<td><fmt:formatNumber value="${goodsList.goods_price}" type="number" pattern="#,###"/>&nbsp;원</td>
												<c:if test="${goodsList.goods_status==0}">
												<td><font color="red">판매종료</font></td>
												</c:if>
												<c:if test="${goodsList.goods_status==1}">
												<td><font color="blue">판매중</font></td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>						
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12" style="text-align: center;">
								<a class="btn btn-primary" onclick="updateForm()">이벤트 수정</a>
								&nbsp;
								<c:if test="${eventModel.status eq 0}">
								<a class="btn btn-danger" onclick="deleteCheck()">이벤트 삭제</a>
								&nbsp;
								</c:if>
								<c:if test="${eventModel.status eq 1}">
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
									<fmt:formatDate value="${eventModel.start_date}" pattern="yyyy-MM-dd" var="start_date" />
									<c:if test="${today ne start_date}">
										<a class="btn btn-danger" onclick="stopEvent()">이벤트 중지</a>
										&nbsp;
									</c:if>
								
								</c:if>
								<a class="btn btn-warning" href="/feline/admin/adEventList.cat">목록으로</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>