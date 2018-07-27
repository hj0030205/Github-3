<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">차트</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">관리자 메인</a></li>
					<li class="breadcrumb-item active">상품 차트</li>
				</ol>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
						<div class="booksales-wrapper col-lg-12">
							<div class="row">
								<div class="col-sm-6 col-lg-3">
									<div>
										<div class="callout">
											<strong class="h4">최근 7일 판매량 기준 순위</strong>
										</div>
									</div>
									<hr class="mt-0">
									<c:forEach var="list" items="${weekGoodsSelling}" varStatus="stat">
										<div class="row">
											<div class="pl-2 col-lg-3">
												<a href="adGoodsView.cat?goods_num=${list.goods_num}"> 
												<img src="/feline/resources/upload/images/${list.goods_image_savname}" height="50px">
												</a>
											</div>
											<div class="col-lg-8">
												<p style="font-weight: bold; color: #2692c5;">${list.goods_name}</p>
												<small>판매량 : ${list.goods_hit}</small>
											</div>
										</div>
										<hr class="mt-0">
									</c:forEach>
								</div>
								<hr class="pl-0">
								<div class="col-sm-6 col-lg-3">
									<div>
										<div class="callout">
											<strong class="h4">저번 달 판매량 기준 순위</strong>
										</div>
									</div>
									<hr class="mt-0">
									<c:forEach var="list" items="${monthGoodsSelling}" varStatus="stat">
										<div class="row">
											<div class="col-lg-3">
												<a href="adGoodsView.cat?goods_num=${list.goods_num}"> 
												<img src="/feline/resources/upload/images/${list.goods_image_savname}" height="50px">
												</a>
											</div>
											<div class="col-lg-8">
												<p style="font-weight: bold; color: #2692c5;">${list.goods_name}</p>
												<small>판매량 : ${list.goods_hit}</small>
											</div>
										</div>
										<hr class="mt-0">
									</c:forEach>
								</div>
								<hr class="pl-0">
								<div class="col-sm-6 col-lg-3">
									<div>
										<div class="callout">
											<strong class="h4">전체 판매량 기준 순위</strong>
										</div>
									</div>
									<hr class="mt-0">
										<c:forEach var="list" items="${GoodsSelling}" varStatus="stat">
										<div class="row">
											<div class="col-lg-3">
												<a href="adGoodsView.cat?goods_num=${list.goods_num}"> 
												<img src="/feline/resources/upload/images/${list.goods_image_savname}" height="50px">
												</a>
											</div>
											<div class="col-lg-8">
												<p style="font-weight: bold; color: #2692c5;">${list.goods_name}</p>
												<small>판매량 : ${list.goods_hit}</small>
											</div>
										</div>
										<hr class="mt-0">
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->

	</div>
</body>
</html>