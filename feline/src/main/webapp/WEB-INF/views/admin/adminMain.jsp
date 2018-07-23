<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	var request = ${request}
	
	google.charts.load('current', {'packages' : [ 'corechart' ]});

	google.charts.setOnLoadCallback(drawPieChart1);
	google.charts.setOnLoadCallback(drawPieChart2);
	google.charts.setOnLoadCallback(drawPieChart3);
	google.charts.setOnLoadCallback(drawPieChart4);

	function drawPieChart1() {
		var json = ${memberAgePie};
		var data = new google.visualization.DataTable(json)

		var options = {
			title : '연령별',
			titleTextStyle : {
				fontSize : '15'
			}
		};

		var chart = new google.visualization.PieChart(document.getElementById('pie_chart1'));

		chart.draw(data, options);
		window.addEventListener('resize', function() {chart.draw(data, options);}, false);
	}

	function drawPieChart2() {
		var json = ${memberRegionPie};
		var data = new google.visualization.DataTable(json)

		var options = {
			title : '지역별',
			titleTextStyle : {
				fontSize : '15'
			}
		};

		var chart = new google.visualization.PieChart(document.getElementById('pie_chart2'));

		chart.draw(data, options);
		window.addEventListener('resize', function() {chart.draw(data, options);}, false);
	}

	function drawPieChart3() {
		var json = ${orderAgePie};
		var data = new google.visualization.DataTable(json)

		var options = {
			title : '연령별',
			titleTextStyle : {
				fontSize : '15'
			}
		};

		var chart = new google.visualization.PieChart(document.getElementById('pie_chart3'));

		chart.draw(data, options);
		window.addEventListener('resize', function() {chart.draw(data, options);}, false);
	}

	function drawPieChart4() {
		var json = ${orderRegionPie};
		var data = new google.visualization.DataTable(json)

		var options = {
			title : '지역별',
			titleTextStyle : {
				fontSize : '15'
			}
		};

		var chart = new google.visualization.PieChart(document.getElementById('pie_chart4'));

		chart.draw(data, options);
		window.addEventListener('resize', function() {chart.draw(data, options);}, false);
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">관리자 대쉬보드</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">관리자 메인</a></li>
					<li class="breadcrumb-item active">관리자 대쉬보드</li>
				</ol>
			</div>
		</div>

		 <div class="row">
			<div class="col-sm-6 col-md-2">
				<div class="card">
					<div class="card-block">
						<div class="h1 text-muted text-right mb-4">
							<i class="icon-user-follow"></i>
						</div>
						<div class="h4 mb-0">${todayMember}</div>
						<small class="text-muted text-uppercase font-weight-bold">금일 신규 회원</small>
						<div class="progress progress-xs mt-3 mb-0">
							<div class="progress-bar bg-info" role="progressbar" style="width: 25%" aria-valuenow="25"
								aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
				</div>
			</div>
			<!--/.col-->
			<div class="col-sm-6 col-md-2">
				<div class="card">
					<div class="card-block">
						<div class="h1 text-muted text-right mb-4">
							<i class="icon-basket-loaded"></i>
						</div>
						<div class="h4 mb-0">${todayOrder}</div>
						<small class="text-muted text-uppercase font-weight-bold">금일 신규 주문</small>
						<div class="progress progress-xs mt-3 mb-0">
							<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25"
								aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
				</div>
			</div>
			<!--/.col-->
			<div class="col-sm-6 col-md-2">
				<div class="card">
					<div class="card-block">
						<div class="h1 text-muted text-right mb-4">
							<i class="mdi mdi-coin"></i>
						</div>
						<div class="h4 mb-0">${todayOrderMoney}</div>
						<small class="text-muted text-uppercase font-weight-bold">금일 주문 금액</small>
						<div class="progress progress-xs mt-3 mb-0">
							<div class="progress-bar bg-warning" role="progressbar" style="width: 25%" aria-valuenow="25"
								aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
				</div>
			</div>
			<!--/.col-->
			<div class="col-sm-6 col-md-2">
				<div class="card">
					<div class="card-block">
						<div class="h1 text-muted text-right mb-4">
							<i class="mdi mdi-credit-card"></i>
						</div>
						<div class="h4 mb-0">${countTrade}</div>
						<small class="text-muted text-uppercase font-weight-bold">결제 대기중인 주문</small>
						<div class="progress progress-xs mt-3 mb-0">
							<div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25"
								aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
				</div>
			</div>
			<!--/.col-->
			<div class="col-sm-6 col-md-2">
				<div class="card">
					<div class="card-block">
						<div class="h1 text-muted text-right mb-4">
							<i class="mdi mdi-truck"></i>
						</div>
						<div class="h4 mb-0">${countTrans}</div>
						<small class="text-muted text-uppercase font-weight-bold">배송 준비중인 주문</small>
						<div class="progress progress-xs mt-3 mb-0">
							<div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="25"
								aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
				</div>
			</div>
			<!--/.col-->
			<div class="col-sm-6 col-md-2">
				<div class="card">
					<div class="card-block">
						<div class="h1 text-muted text-right mb-4">
							<i class="mdi mdi-truck-delivery"></i>
						</div>
						<div class="h4 mb-0">${countTrans2}</div>
						<small class="text-muted text-uppercase font-weight-bold">배송 중인 주문</small>
						<div class="progress progress-xs mt-3 mb-0">
							<div class="progress-bar bg-info" role="progressbar" style="width: 25%" aria-valuenow="25"
								aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
				</div>
			</div>
			<!--/.col-->
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-block">
						<div class="row">
							<div class="col-sm-12 col-lg-9">
								<div class="p-5">
									<div class="callout">
										<strong class="h4">금일 신규 회원 통계</strong>
									</div>
								</div>
								<div class="row col-sm-6 col-lg-12">
									<div class="col-lg-6">
										<div id="pie_chart1"></div>
									</div>
									<div class="col-lg-6">
										<div id="pie_chart2"></div>
									</div>
								</div>
								<div class="p-5">
									<div class="callout">
										<strong class="h4">금일 신규 주문 통계</strong>
									</div>
								</div>
								<div class="row col-sm-6 col-lg-12">
									<div class="col-lg-6">
										<div id="pie_chart3"></div>
									</div>
									<div class="col-lg-6">
										<div id="pie_chart4"></div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="callout">
									<strong class="h4">금일 상품 판매 순위</strong>
								</div>
								<hr class="mt-0">
								<c:choose>
									<c:when test="${todayGoodsC==0}">
										<div style="text-align: center;">No Data</div>
									</c:when>
									<c:otherwise>
                      		 			<c:forEach var="list" items="${todaySalesGoods}" varStatus="stat">
											<div class="row">
												<div class="col-lg-3">
													<a href="adGoodsView.cat?book_num=${list.goods_num}"> <img
														src="/feline/resources/upload/images/${list.goods_image_savname}" height="50px">
													</a>
												</div>
												<div class="col-lg-8">
													<p style="font-weight: bold; color: #2692c5;">${list.goods_name}</p>
													<small>판매량 : ${list.goods_hit}</small>
												</div>
											</div>
											<hr class="mt-0">
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<div class="divider text-center">
									<button type="button" class="text-center btn btn-sm btn-link text-muted"
										onclick="window.location.href=''" data-toggle="tooltip"
										data-placement="top" title="show more">
										<i class="icon-options"></i>
									</button>
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