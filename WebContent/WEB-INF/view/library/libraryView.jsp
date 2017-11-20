<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지도 이동시키기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ae9a40e6a14e760a32a8f15af0199e0"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/library/libraryView.css">
<script type="text/javascript">
	$(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(${library[0].x_position}, ${library[0].y_position}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var markerPosition  = new daum.maps.LatLng(${library[0].x_position}, ${library[0].y_position}); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		 position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		
		$("#1").click(function(){
			// 이동할 위도 경도 위치를 생성합니다 
			 var moveLatLon = new daum.maps.LatLng(${library[0].x_position}, ${library[0].y_position}); 
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);            
		    var markerPosition  = new daum.maps.LatLng(${library[0].x_position}, ${library[0].y_position}); 
		 	// 마커를 생성합니다
		 	var marker = new daum.maps.Marker({
		    	 position: markerPosition
		 	});
		 	// 마커가 지도 위에 표시되도록 설정합니다
		 	marker.setMap(map);
		 	
		});
		
		$("#2").click(function(){
		    var moveLatLon = new daum.maps.LatLng(${library[1].x_position}, ${library[1].y_position});
		    map.panTo(moveLatLon);            
		    var markerPosition  = new daum.maps.LatLng(${library[1].x_position}, ${library[1].y_position}); 
		 	var marker = new daum.maps.Marker({
		    	 position: markerPosition
		 	});
		 	marker.setMap(map);
		})
		
		$("#3").click(function(){
		    var moveLatLon = new daum.maps.LatLng(${library[2].x_position}, ${library[2].y_position});
		    map.panTo(moveLatLon);            
		    var markerPosition  = new daum.maps.LatLng(${library[2].x_position}, ${library[2].y_position}); 
		 	var marker = new daum.maps.Marker({
		    	 position: markerPosition
		 	});
		 	marker.setMap(map);
		});
		
		$("#4").click(function(){
		    var moveLatLon = new daum.maps.LatLng(${library[3].x_position}, ${library[3].y_position});
		    map.panTo(moveLatLon);            
		    var markerPosition  = new daum.maps.LatLng(${library[3].x_position}, ${library[3].y_position}); 
		 	var marker = new daum.maps.Marker({
		    	 position: markerPosition
		 	});
		 	marker.setMap(map);
		});
		
		
		
	});
</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>


<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">찾아오시는길</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/common/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>찾아오시는길</li>
			</ul>
		</div>

<div id="map" style="width:750px;height:350px;"></div>
<p>
    <button class="btn" id="1">기흥도서관</button>
    <button class="btn" id="2">송파도서관</button>
    <button class="btn" id="3">장안도서관</button>
    <button class="btn" id="4">분당도서관</button>
</p>

	</div>
</div>



<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>