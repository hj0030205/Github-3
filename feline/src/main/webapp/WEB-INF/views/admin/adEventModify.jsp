<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
function goodsCategorySelect(goods_category) {
	$.ajax({
		type : "POST",
		url : "eventGoodsList.cat",
		dataType : "json",
		data : {"param":goods_category},
		success : 
			
			function(result) {
			var str="";
			$("#goodsList").empty();
			$.each(result, function(i){
					str += '<tr>';
					str += '<td>' + "<input type='checkbox' id='selected[]' name='selected[]' value='" + result[i].goods_num + "' onclick='checkedValue(this.value)'>" + "</td>";
					str += '<td>' + "<img src='/feline/resources/upload/images/"+ result[i].goods_image_savname + "'/></td><td>" + result[i].goods_name + '</td><td>' + result[i].goods_price + '</td>';
					str += '</tr>';
				});
				$("#goodsList").append(str);
		
		},
		error : function(){
			alert("error");
		}
	})
};


function checkedValue(value) {
	var goods_num = "";
	var arr_goods_num = document.getElementsByName("selected[]");
	for(var i = 0; i < arr_goods_num.length; i++){
		if(arr_goods_num[i].checked == true){
			goods_num = goods_num + "," + arr_goods_num[i].value ;
		} else {
			goods_num = goods_num;
		}
	}
	$('#goods_num').val(goods_num);
	
	console.log(goods_num);

};

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
				<form action="adEventModify.cat" method="post">
					<h3 class="text-themecolor">이벤트 수정</h3>
					<input type="hidden" name="event_num" value="${eventModel.event_num}"/>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/feline/admin/main.cat">관리자
							메인</a></li>
							<li class="breadcrumb-item active">이벤트 수정</li>

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
														value="${eventModel.event_name}">
												</div>
											</div>
											<div class="col-md-6">
												<label class="col-md-6">할인율(단위:%)</label>
												<div class="col-md-12">
													<input type="text" name="dc_rate"
														value="${eventModel.dc_rate}"
														class="form-control form-control-line">
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
														value="<fmt:formatDate value='${eventModel.start_date}' type='date' pattern='yyyy-MM-dd'/>" >
												</div>
											</div>
											<div class="col-md-6">
												<label class="col-md-6">이벤트 종료일</label>
												<div class="col-md-12">
													<input type="date" name="end_date"
														value="<fmt:formatDate value='${eventModel.end_date}' type='date' pattern='yyyy-MM-dd'/>"
														class="form-control form-control-line">
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
												<select id="category1" id="category1" onchange="al();">
													<option value="null">choose one</option>
													<option value="0">사료</option>
													<option value="1">간식</option>
													<option value="2">모래/화장실</option>
													<option value="3">장난감</option>
													<option value="4">위생용품</option>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<label class="col-md-6">카테고리</label>
											<div class="col-md-12">
												<input type="hidden" id="goods_num" name="goods_num" value="${eventModel.goods_num}"/>
												<select id="goods_category1" id="goods_category1" onchange="goodsCategorySelect(this.value);">
													<option>대분류를 선택해주세요</option>
												</select>
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
											<th>선택</th>
											<th>상품이미지</th>
											<th>상품명</th>
											<th>상품가격</th>
										</tr>
									<thead>
									<tbody id="goodsList">
										<c:forEach var="goodsList" items="${goodsList}" varStatus="stat">
											<tr>
												<td></td>
												<td>
													<img src="/feline/resources/upload/images/${goodsList.goods_image_savname}" />
												</td>
												<td>${goodsList.goods_name}</td>
												<td><fmt:formatNumber value="${goodsList.goods_price}" type="number" pattern="#,###"/>&nbsp;원</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>						
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12" style="text-align: center;">
								<input type="submit" class="btn btn-success" value="작성 완료">
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
<script>
	var big = document.getElementById('category1');
	var small = document.getElementById('goods_category1');

	function al() {
		keyValue = big.value;
		switch (keyValue) {

		case '0':
			small.innerHTML = '<option value="0" <c:if test="${goodsModel.goods_category eq 0 }"> selected  </c:if>>유기농/홀리스틱</option><option value="1" <c:if test="${goodsModel.goods_category eq 1 }"> selected </c:if>>피부/피모건강</option><option value="2" <c:if test="${goodsModel.goods_category eq 2 }"> selected </c:if>>헤어볼케어</option><option value="3" <c:if test="${goodsModel.goods_category eq 3 }"> selected </c:if>>다이어트/비뇨건강</option>';
			break;
		case '1':
			small.innerHTML = '<option value="4" <c:if test="${goodsModel.goods_category eq 4 }"> selected </c:if>>캔/파우치</option><option value="5" <c:if test="${goodsModel.goods_category eq 5 }"> selected </c:if>>저키/소시지</option><option value="6" <c:if test="${goodsModel.goods_category eq 6 }"> selected </c:if>>비스켓/트릿</option><option value="7" <c:if test="${goodsModel.goods_category eq 7 }"> selected </c:if>>캣닢/캣그라스</option>';
			break;
		case '2':
			small.innerHTML = '<option value="8" <c:if test="${goodsModel.goods_category eq 8 }"> selected </c:if>>응고형 모래</option><option value="9" <c:if test="${goodsModel.goods_category eq 9 }"> selected </c:if>>흡수형 모래</option><option value="10" <c:if test="${goodsModel.goods_category eq 10 }"> selected </c:if>>화장실/패드</option><option value="11" <c:if test="${goodsModel.goods_category eq 11 }"> selected </c:if>>기타</option>';
			break;
		case '3':
			small.innerHTML = '<option value="12" <c:if test="${goodsModel.goods_category eq 12 }"> selected </c:if>>공/봉제인형</option><option value="13" <c:if test="${goodsModel.goods_category eq 13 }"> selected </c:if>>레이저/낚시</option><option value="14" <c:if test="${goodsModel.goods_category eq 14 }"> selected </c:if>>막대</option><option value="15" <c:if test="${goodsModel.goods_category eq 15 }"> selected </c:if>>캣닢</option>';
			break;
		case '4':
			small.innerHTML = '<option value="16" <c:if test="${goodsModel.goods_category eq 16 }"> selected </c:if>>샴푸/린스</option> <option value="17" <c:if test="${goodsModel.goods_category eq 17 }"> selected </c:if>>구강관리</option><option value="18" <c:if test="${goodsModel.goods_category eq 18 }"> selected </c:if>>눈/귀/피부&피모건강</option><option value="19" <c:if test="${goodsModel.goods_category eq 19 }"> selected </c:if>>브러쉬/털관리</option>';
			break;
		default:
			small.innerHTML = '<option value=20>대분류값을 입력하세요</option>';
			break;

		}

	}
</script>
</html>