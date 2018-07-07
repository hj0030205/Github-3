<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>찾아오는길</title>
</head>
<body>
	위치 : <div id="map" style="width: 300px; height: 200px;"></div>
               <script type="text/javascript"
                  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3390658995eb6aa79de3ab23bd19e9b0"></script>
               <script>
                  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                   mapOption = { 
                       center: new daum.maps.LatLng(37.498909,127.032842), // 지도의 중심좌표
                       level: 3 // 지도의 확대 레벨
                   };

               var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

               // 마커가 표시될 위치입니다 
               var markerPosition  = new daum.maps.LatLng(37.498909,127.032842); 

               // 마커를 생성합니다
               var marker = new daum.maps.Marker({
                   position: markerPosition
               });

               // 마커가 지도 위에 표시되도록 설정합니다
               marker.setMap(map);

               // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
               // marker.setMap(null);    
               </script>
               
               <p> 
</body>
</html>