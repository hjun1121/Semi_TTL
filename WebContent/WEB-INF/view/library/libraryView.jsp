<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>찾아오시는 길</title>
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
		
		$("#11").click(function(){
			window.open("http://map.daum.net/link/to/기흥도서관,${library[0].x_position}, ${library[0].y_position}");
		});
		$("#22").click(function(){
			window.open("http://map.daum.net/link/to/송파도서관,${library[1].x_position}, ${library[1].y_position}");
		});
		$("#33").click(function(){
			window.open("http://map.daum.net/link/to/장안도서관,${library[2].x_position}, ${library[2].y_position}");
		});
		$("#44").click(function(){
			window.open("http://map.daum.net/link/to/분당도서관,${library[3].x_position}, ${library[3].y_position}");
		});
		
		
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    
		});
		
		
	});
</script>
</head>
<body>
<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">찾아오시는길</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp?library=${library}"><img src="${pageContext.request.contextPath }/image/common/home.png" alt="HOME"></a></li>
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
    <br>
    <br>
    <input type="button" class="btn" id="11" value="기흥길찾기">
    <input type="button" class="btn" id="22" value="송파길찾기">
    <input type="button" class="btn" id="33" value="장안길찾기">
    <input type="button" class="btn" id="44" value="분당길찾기">
</p>

	</div>
</div>



<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>