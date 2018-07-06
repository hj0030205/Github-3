<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
</head>
<script>
function deleteConfirm(){
	if(confirm("정말 삭제하시겠습니까?") == true) { //확인
		location.href='adGoodsDelete.cat?goods_num=${goodsModel.goods_num}';
	} else { //취소
		return;
	}
}
</script>
<body>
	<div id="all">
		<div id="content">
			<div class="container">
				<!-- 과정 표시 -->

				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>상품 상세</li>
					</ul>
				</div>

				<div class="col-md-12" id="checkout">
					<div class="box">
						<h1>상품 상세 페이지</h1>
						<!-- /.content -->
						<div class="content">
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_name">상품명</label> <input type="text"
											id="goods_name" name="goods_name" class="form-control"
											value="${goodsModel.goods_name }"
											readonly="readonly" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_category">카테고리</label> <input type="text"
											id="goods_category" name="goods_category"
											class="form-control"
											value="${goodsModel.goods_category }"
											readonly="readonly" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_price">가격</label> <input type="text"
											id="goods_price" name="goods_price" class="form-control"
											value="${goodsModel.goods_price }"
											readonly="readonly" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_amount">갯수</label> <input type="text"
											id="goods_amount" name="goods_amount" class="form-control"
											value="${goodsModel.goods_amount }"
											readonly="readonly" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_size">사이즈</label> <input type="text"
											id="goods_size" name="goods_size" class="form-control"
											value="${goodsModel.goods_size }"
											readonly="readonly" />
									</div>
								</div>
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="upload">이미지</label>
										<c:if test="${goodsModel.goods_image_savname ne null}">
										<%-- 	<c:url var="download" value="FileDownAction">
												<c:param name="goods_num" value="${goodsModel.goods_num } " />
											</c:url>
											<br/> 
											<a href="${viewURL}"> ${goodsModel.goods_image_orgname} </a> --%>
											<img src="/feline/resources/upload/images/${goodsModel.goods_image_savname }" /><br /> 
										</c:if>
									</div>
								</div>
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label>설명</label> 
										<p>
										<pre>${goodsModel.goods_content }</pre></p>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</div>
						<div class="box-footer">
							<div class="pull-left">
								<a href="adGoodsList.cat?currentPage=${currentPage }"
								 class="btn btn-default">목록으로<i class="fa fa-chevron-left"></i></a>
							</div>
							<div class="pull-right">
								<button class="btn btn-primary" 
								onclick="javascript:location.href='adGoodsWrite.cat?currentPage=${currentPage}'">
								상품 등록&nbsp;<i class="fa fa-chevron-right"></i>
								</button>
								<button class="btn btn-primary" 
								onclick="javascript:location.href='adGoodsModify.cat?goods_num=${goodsModel.goods_num }&currentPage=${currentPage}'">
								상품 수정&nbsp;<i class="fa fa-chevron-right"></i>
								</button>
								<button class="btn btn-primary" 
								onclick="deleteConfirm();"> 상품 삭제&nbsp;<i class="fa fa-chevron-right"></i>
								</button>
							</div>
						</div>
					</div>
					<!-- /.box -->
				</div>
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
	</div>
</body>

</html>