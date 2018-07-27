<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="col-sm-12">
					<ul class="breadcrumb">

						<li><a href="/feline/main.cat">메인</a></li>
						<li>찾아오는 길</li>
					</ul>
				</div>

				<!-- *** LEFT COLUMN ***
		     _________________________________________________________ -->

				<div class="col-sm-9" id="blog-listing">

					<div class="box">

						<h1>찾아오는 길</h1>
						<hr>
						<div class="table-responsive">
							<div id="map" style="width: 600px; height: 400px;"></div>
							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3390658995eb6aa79de3ab23bd19e9b0"></script>
							<script>
								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new daum.maps.LatLng(37.498909,
											127.032842), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
									
								// 마커가 표시될 위치입니다 
								var markerPosition = new daum.maps.LatLng(
										37.498909, 127.032842);

								// 마커를 생성합니다
								var marker = new daum.maps.Marker({
									position : markerPosition
								});
								
								// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
								var mapTypeControl = new daum.maps.MapTypeControl();
								
								// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
								// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
								map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
								
								// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
								var zoomControl = new daum.maps.ZoomControl();
								map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);

								// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
								// marker.setMap(null);
							</script>
							
							<p>
							<p/>
							<p><strong>주소 : 서울특별시 강남구 역삼동 823-24 남도빌딩</strong></p>
							
						</div>
					</div>
				</div>
				
				<!-- /.container -->

				<!-- /#content -->
				<!-- /.col-md-9 -->

				<!-- *** LEFT COLUMN END *** -->

				<div class="col-md-3">
					<!-- *** BLOG MENU ***
 _________________________________________________________ -->
					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">고객센터</h3>
						</div>

						<div class="panel-body">
							<ul class="nav nav-pills nav-stacked">
								<li><a href="/feline/notice/noticeList.cat">공지사항</a></li>
								<li><a href="/feline/qna/qnaList.cat">Q&A</a></li>
								<li><a href="/feline/faq/faqList.cat">FAQ</a></li>
								<li class="active"><a href="/feline/map/mapView.cat">찾아오는 길</a></li>

							</ul>
						</div>
					</div>
					<!-- /.col-md-3 -->
					<!-- *** BLOG MENU END *** -->
				</div>
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
	</div>
</body>
</html>