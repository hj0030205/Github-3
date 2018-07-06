<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
</head>
<body>
	<div id="all">
		<div id="content">
			<div class="container">
				<!-- 과정 표시 -->

				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<c:choose>
							<c:when test="${goodsModel eq null }">
								<li>상품 등록</li>
							</c:when>
							<c:otherwise>
								<li>상품 수정</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<div class="col-md-12" id="checkout">
					<div class="box">
					<c:choose>
						<c:when test="${goodsModel eq null }">
							<form action="adGoodsWrite.cat" method="post"
								enctype="multipart/form-data">
						<h1>상품 등록 페이지</h1>
						</c:when>
						<c:otherwise>
							<form action="adGoodsModify.cat" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="goods_num" value="${goodsModel.goods_num }" />
								<input type="hidden" name="currentPage" value="${currentPage }" />
								<input type="hidden" name="old_file" value="${goodsModel.goods_image_savname }" />
						<h1>상품 수정 페이지</h1>
						</c:otherwise>
						</c:choose>
						<!-- /.content -->
						<div class="content">
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_name">상품명</label> <input type="text"
											id="goods_name" name="goods_name" class="form-control"
											value="${goodsModel.goods_name }" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_category">카테고리</label> <input type="text"
											id="goods_category" name="goods_category"
											class="form-control"
											value="${goodsModel.goods_category }" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_price">가격</label> <input type="text"
											id="goods_price" name="goods_price" class="form-control"
											value="${goodsModel.goods_price }" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_amount">갯수</label> <input type="text"
											id="goods_amount" name="goods_amount" class="form-control"
											value="${goodsModel.goods_amount }" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_size">사이즈</label> <input type="text"
											id="goods_size" name="goods_size" class="form-control"
											value="${goodsModel.goods_size }" />
									</div>
								</div>
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="upload">이미지</label>
										<input type="file" name="file" />
										<c:if test="${goodsModel.goods_image_savname ne null}">
										&nbsp; * ${goodsModel.goods_image_orgname }파일이 등록되어 있습니다. 
										다시 업로드하면 기존의 파일은 삭제 됩니다.
										</c:if>
									</div>
								</div>
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="goods_content">설명</label>
										<textarea class="form-control" id="goods_content"
											name="goods_content" rows="10">${goodsModel.goods_content }</textarea>
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
								<button type="submit" class="btn btn-primary">
									작성완료<i class="fa fa-chevron-right"></i>
								</button>
							</div>
						</div>
						</form>
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