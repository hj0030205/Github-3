<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</script>
<style>
.form-control {
	color: black;
	font-size: 19px;
}

.fg {
	font-size: 19px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- ///////////////////////////////row page title/////////////////////////////////////// -->
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<c:choose>
					<c:when test="${goodsModel.goods_num eq null }">
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
						<c:when test="${goodsModel.goods_num eq null }">
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
							<c:when test="${goodsModel.goods_num eq null }">
								<form class="form-horizontal form-material"
									action="adGoodsWrite.cat" name="goodsForm" method="POST"
									enctype="multipart/form-data">
							</c:when>
							<c:otherwise>
								<form class="form-horizontal form-material"
									action="adGoodsModify.cat" name="goodsForm" method="POST"
									enctype="multipart/form-data">
									<input type="hidden" name="goods_num" value="${goodsModel.goods_num }" />
									<input type="hidden" name="currentPage" value="${currentPage }" />
									<input type="hidden" name="old_file" value="${goodsModel.goods_image_savname }" />
							</c:otherwise>
						</c:choose>
						<div class="row">
							<div class="col-lg-4" style="margin: auto; text-align: center;">
								<div class="col-sm-10">
								<c:if test="${goodsModel.goods_image_savname ne null }">
									<img class="img-fluid" src="/feline/resources/upload/images/${goodsModel.goods_image_savname}" width="200" height="400" border="0"/>
									<br/>
									<label>다시 업로드하면 기존의 파일은 삭제 됩니다.</label>
								</c:if>
								<input type="file" name="file"/>
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
								</div>
								<div class="form-group">
									<label class="col-md-12">상품명</label>
									<div class="col-md-12">
										<input type="text" name="goods_name"
											class="form-control form-control-line"
											value="${goodsModel.goods_name}">
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-6">
											<label class="col-md-6">카테고리</label>
											<div class="col-md-12">
												<input type="text" name="goods_category"
													class="form-control form-control-line"
													value="${goodsModel.goods_category}">
											</div>
										</div>
										<div class="col-md-6">
											<label class="col-md-6">가격</label>
											<div class="col-md-12">
												<input type="text" name="goods_price"
													value="${goodsModel.goods_price}"
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
												<input type="text" name="goods_amount"
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
								<input type="submit" class="btn btn-success" value="작성 완료">
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
</html>