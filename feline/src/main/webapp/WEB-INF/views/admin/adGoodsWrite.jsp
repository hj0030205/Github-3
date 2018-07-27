<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>	

function goodsList() {
	if (confirm("목록으로 이동하시겠습니까?")) {
		document.location.href = "adGoodsList.cat?currentPage=${currentPage}";
	} else {
		return false;
	}
}

function checkCategory(){
	var sel = $("#category1").val();
	var p = document.getElementById("goods_price").value;
	var a = document.getElementById("goods_amount").value;
	
	if(isNaN(p)==true || isNaN(a)==true){
		alert("재고와 가격입련란에는 숫자만 입력해주세요.");
		return false;
	}
	
	if(p.length==1 && p.match("0") || !p){
		alert(p);
		alert("가격입력란에 1이상 입력해주세요.");
		return false;
	}
	if(a.length==1 && a.match("0") || !a){
		alert("재고입력란에 1이상 입력해주세요.");
		return false;
	}
	
	if(sel.match(null)){
		alert("카테고리를 선택해주세요.");
		return false;
	}else{
		document.getElementById("goodsWriteForm").submit();
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

select {
	width: 200px;
	height: 25px;
	font-size: 17px;
}
</style>
</head>
<body>
	<spring:hasBindErrors name="GoodsModel" />
	<div class="container-fluid">
		<!-- ///////////////////////////////row page title/////////////////////////////////////// -->
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<c:choose>
					<c:when test="${goodsModel.goods_num eq null || goodsModel.goods_num == 0 }">
						<h3 class="text-themecolor">상품 등록</h3>
					</c:when>
					<c:otherwise>
						<h3 class="text-themecolor">상품 수정</h3>
					</c:otherwise>
				</c:choose>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/feline/admin/main.cat">관리자
							메인</a></li>
					<c:choose>
						<c:when test="${goodsModel.goods_num eq null || goodsModel.goods_num == 0 }">
							<li class="breadcrumb-item active">상품 등록</li>
						</c:when>
						<c:otherwise>
							<li class="breadcrumb-item active">상품 수정</li>
						</c:otherwise>
					</c:choose>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h3>상품 정보</h3>
				<div class="card">
					<div class="card-block">
					<c:choose>
						<c:when test="${goodsModel.goods_num eq null || goodsModel.goods_num == 0  }">
							<form class="form-horizontal form-material" id="goodsWriteForm"
								action="adGoodsWrite.cat" name="goodsWriteForm" method="POST"
								enctype="multipart/form-data">
						</c:when>
						<c:otherwise>
								<form class="form-horizontal form-material" id="goodsModifyForm"
									action="adGoodsModify.cat" name="goodsModifyForm" method="POST"
									enctype="multipart/form-data">
									<input type="hidden" name="goods_num"
										value="${goodsModel.goods_num }" /> <input type="hidden"
										name="currentPage" value="${currentPage }" /> <input
										type="hidden" name="old_file"
										value="${goodsModel.goods_image_savname }" />
							</c:otherwise>
						</c:choose>
						<div class="row">
							<div class="col-lg-4" style="margin: auto; text-align: center;">
								<div class="col-sm-10">
									<c:if test="${goodsModel.goods_image_savname ne null }">
										<img class="img-fluid"
											src="/feline/resources/upload/images/${goodsModel.goods_image_savname}"
											width="200" height="400" border="0" />
										<br />
										<label>다시 업로드하면 기존의 파일은 삭제 됩니다.</label>
									</c:if>
									<input type="file" name="file" />
								</div>
							</div>
							<div class="col-lg-8">
								<div class="form-group"></div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-4 fg">
												<b>상품번호 : </b> ${goodsModel.goods_num}
											</div>
											<div class="col-md-4 fg">
												<b>등록일 : </b>
												<fmt:formatDate value="${goodsModel.goods_date}"
													pattern="yyyy.MM.dd HH:MM:SS" />
											</div>
											<div class="col-md-4 fg">
												<b>품절 여부 :</b>
											</div>
										</div>
									</div>
									<div class="form-group"></div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-6">
												<label class="col-md-6">상품명</label>
												<div class="col-md-12">
													<input type="text" name="goods_name"
														class="form-control form-control-line"
														value="${goodsModel.goods_name}">
													<font color="red"><form:errors path="goodsModel.goods_name" /></font>
												</div>
											</div>
											<div class="col-md-6">
												<label class="col-md-6">가격</label>
												<div class="col-md-12">
													<input type="text" name="goods_price" id="goods_price"
														value="${goodsModel.goods_price}"
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
												<select id="category1" name="category1" onchange="al();">
													<option value="null" selected>choose one</option>
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
												<select id="goods_category1" name="goods_category">
												</select>
											</div>
										</div>
									</div>

								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-6">
											<label class="col-md-6">상품 갯수</label>
											<div class="col-md-12">
												<input type="text" name="goods_amount" id="goods_amount"
													value="${goodsModel.goods_amount}"
													class="form-control form-control-line">
											</div>
										</div>
										<div class="col-md-6">
											<label class="col-md-6">상품 사이즈</label>
											<div class="col-md-12">
												<input type="text" name="goods_size"
													value="${goodsModel.goods_size}" 
													class="form-control form-control-line">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-12">상품 설명</label>
							<div class="col-md-12">
								<textarea rows="20" class="form-control form-control-line"
									name="goods_content">${goodsModel.goods_content}</textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12" style="text-align: center;">
								<button type="button" class="btn btn-success" onclick="return checkCategory();">작성 완료</button>
								&nbsp; <a class="btn btn-warning" href="javascript:goodsList()">목록으로</a>
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
		if(keyValue==null){
			return false;
		}
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