<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
var page=${currentPage}
function update(goods_num){
	document.location.href="adGoodsModify.cat?goods_num=${goodsModel.goods_num}&currentPage="+page;
}
function deleteCheck(goods_num) {
	if(confirm("정말 삭제하시겠습니까?")){
		document.location.href="adGoodsDelete.cat?goods_num="+goods_num+"&currentPage="+page;
	}else{
		return false;
	}
}
</script>
<style>
.form-control[readonly]{
	background-color:white;
	color:black;
	font-size:19px;
}
.fg{ font-size:19px; }
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- ///////////////////////////////row page title/////////////////////////////////////// -->
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">상품 상세 정보</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/feline/admin/main.cat">관리자 메인</a></li>
					<li class="breadcrumb-item active">상품 상세 정보</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h3>상품 정보</h3>
				<div class="card">
					<div class="card-block">
						<div class="row">
							<div class="col-lg-4" style="margin: auto; text-align: center;">
								<div class="col-sm-10">
									<img src="/feline/resources/upload/images/${goodsModel.goods_image_savname}" width="400" height="400" border="0" />
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
											<b>등록일 : </b> <fmt:formatDate value="${goodsModel.goods_date}" pattern="yyyy.MM.dd HH:MM:SS"/> 
										</div>
										<div class="col-md-4 fg">
											<b>품절 여부 :</b> 
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">상품명</label>
								<div class="col-md-12">
									<input type="text" class="form-control form-control-line"
										value="${goodsModel.goods_name}">
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-6">카테고리</label>
										<div class="col-md-12">
											<input type="text" value="${goodsModel.goods_category}"
												class="form-control form-control-line">
										</div>
									</div>
									<div class="col-md-6">
										<label class="col-md-6">가격</label>
										<div class="col-md-12">
											<input type="text" value="${goodsModel.goods_price}"
												class="form-control form-control-line">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-6">상품 갯수</label>
										<div class="col-md-12">
											<input type="text" value="${goodsModel.goods_amount}"
												class="form-control form-control-line">
										</div>
									</div>
									<div class="col-md-6">
										<label class="col-md-6">상품 사이즈</label>
										<div class="col-md-12">
											<input type="text" value="${goodsModel.goods_size}"
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
							<textarea rows="20" class="form-control form-control-line">${goodsModel.goods_content}</textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12" style="text-align: center;">
							<button class="btn btn-warning" onclick="javascript:update()">상품 수정</button>
							&nbsp; <a class="btn btn-danger"
								href="javascript:deleteCheck()">상품 삭제</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- <c:if test="${goodsModel.goods_num!=0}">
		<div class="col-lg-12">
			<h3>goods RegoodsModel</h3>
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
						<table class="table list-items regoodsModel">
							<c:choose>
								<c:when test="${totalCount==0}">
									<tr>
										<td colspan=4>등록된 댓글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="list" items="${regoodsModel}" varStatus="stat">
										<c:url var="goodsModelURL" value="/admin/memberDetail.cat">
											<c:param name="status" value="all" />
											<c:param name="member_id" value="${list.member_id}" />
										</c:url>
										<tr>
											<td>${list.regoodsModel_num}</td>
											<td>
												<!-- member_name regoodsModel에서 조인하기.. --> (<a
												href="${goodsModelURL}">${list.member_id}</a>)
											</td>
											<td>${list.regoodsModel_pw}</td>
											<td>${list.regoodsModel_regdate}</td>
											<td rowspan="2"><a class="mdi mdi-delete" title="Delete"
												href="javascript:deleteCheck2(${list.goodsModel_num})"></a></td>
										</tr>

										<tr>
											<td colspan=3 style="width: 400px;">${list.roodsModel_content}</td>
											<td>${list.star_point}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>

						<table class="paging">
							<tr>
								<td align=center colspan=8>${pagingHtml}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</c:if> --%>
	</div>
</body>
</html>