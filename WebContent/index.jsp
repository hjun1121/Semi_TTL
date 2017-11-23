<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${npageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/index/index.css">

<title>Total Library Page</title>

<script type="text/javascript" src="${pageContext.request.contextPath }/script/main.jsp"></script>
<script type="text/javascript">
	
	var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	}

</script>

<script type="text/javascript">
$(function(){
	$.ajax({
		url:"./notice/noticeAjax.notice",
		type:"POST",
		data: {
		},
		success:function(data){
			$("#noticeForm").html(data);
		}
	});
	
	
	$.ajax({
		url:"./book/bookAjax.book",
		type:"POST",
		data: {
		},
		success:function(data){
			$("#bookForm").html(data);
		}
	});
	
	$.ajax({
		url:"./book/bookAjax_new.book",
		type:"POST",
		data: {
		},
		success:function(data){
			$("#bookForm_new").html(data);
		}
	});
	
});
</script>


<script type="text/javascript" src="${pageContext.request.contextPath }/script/main.jsp"></script>

</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

	<!-- ////////////////// -->
	
		<!-- 메인 Search 시작 -->
		<div id="divSearch">
			<div>
				<h2 class="skip">통합검색</h2>
				<div class="searchForm">
					<ul>
						<li class="on">
							<form name="totalForm" action="./book/bookTotalSearch.book" method="get">
								<input type="hidden" id="service_type" name="service_type" value="brief">
								<fieldset>
									<legend>제목으로 검색</legend>
									<span class="searchBox">
										<input type="text" class="searchInput" name="search" title="제목으로 검색" placeholder="제목으로 도서관 소장자료를 검색할 수 있습니다.">
									</span>
									<input type="image" id="btnS" src="${pageContext.request.contextPath }/image/index/searchBtn.png" value="검색" class="searchBtn" title="검색">
								</fieldset>
							</form>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 메인 Search 끝 -->
		
		<br><br><br>
		
		<!-- 메인  컨텐츠 시작 -->
		
		<div class="contents">
			<div class="content1">
				<div>
					<div class="banner">
						<div class="slideshow-container">
							  <div class="mySlides fade_banner" style="display: block;">
							    <div class="numbertext">1 / 4</div>
							    <a href="./library/libraryMain.library?library=1" target="_blank" class="bannerImg">
							    	<img src="${pageContext.request.contextPath }/image/index/hj.png" style="width:100%">
							    </a>
							    <div class="text">기흥 도서관</div>
							  </div>
							
							  <div class="mySlides fade_banner">
							    <div class="numbertext">2 / 4</div>
							    <a href="./library/libraryMain.library?library=2" target="_blank" class="bannerImg">
							   		<img src="${pageContext.request.contextPath }/image/index/hj2.png" style="width:100%">
							    </a>
							    <div class="text">송파 도서관</div>
							  </div>
							
							  <div class="mySlides fade_banner">
							    <div class="numbertext">3 / 4</div>
							    <a href="./library/libraryMain.library?library=3" target="_blank" class="bannerImg">
							    	<img src="${pageContext.request.contextPath }/image/index/hj3.png" style="width:100%">
							    </a>
							    <div class="text">장안 도서관</div>
							  </div>
							  <div class="mySlides fade_banner">
							    <div class="numbertext">4 / 4</div>
							    <a href="./library/libraryMain.library?library=4" target="_blank" class="bannerImg">
							   		<img src="${pageContext.request.contextPath }/image/index/hj4.png" style="width:100%">
							    </a>
							    <div class="text">분당 도서관</div>
							  </div>
							
							<div >
								<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
								<a class="next" onclick="plusSlides(1)">&#10095;</a>
							</div>
						
						</div>
						<br>
						
					</div>
					<div class="notice">
						<h2>공지사항</h2>
						<ul>
							<li id="noticeForm">
							</li>			
						</ul>
					<a href="./notice/noticeList.notice" class="more"><img src="${pageContext.request.contextPath }/image/index/more.png" alt="더보기"></a>
					</div>
				</div>
			</div>
			<div class="content2">
				<div class="seat">
					<div>
						<h2>열람실 좌석 현황</h2>
					</div>
					<dl class="readingRoom1">
						<dt>중앙도서관</dt>
						<dd>
							<ul>
								<li><img src="${pageContext.request.contextPath }/image/index/readingRoom2.png" alt="자유열람실" id="roomName0_2" title="자유열람실"> <span id="useSeat0_2">105</span> / <span id="totalSeat0_2">292</span></li>
								<li><img src="${pageContext.request.contextPath }/image/indexreadingRoom1.png" alt="PC실" id="roomName0_1" title="PC실"> <span id="useSeat0_1">47</span> / <span id="totalSeat0_1">124</span></li>
								<li><img src="${pageContext.request.contextPath }/image/index/readingRoom3.png" alt="노트북실" id="roomName0_3" title="노트북실"> <span id="useSeat0_3">51</span> / <span id="totalSeat0_3">139</span></li>
							</ul>
						</dd>
					</dl>
					<dl class="readingRoom2">
						<dt>법학도서관</dt>
						<dd>
							<ul>
								<li><img src="${pageContext.request.contextPath }/image/index/readingRoom2.png" alt="법학 자유열람실" id="roomName0_4" title="법학 자유열람실"> <span id="useSeat0_4">0</span> / <span id="totalSeat0_4">88</span></li>
							</ul>
						</dd>
					</dl>
					<dl class="readingRoom3">
						<dt>ECC열람실</dt>
						<dd>
							<ul>
								<li><img src="${pageContext.request.contextPath }/image/index/readingRoom5.png" alt="이화 신한열람실" id="roomName1_4" title="이화 신한열람실"> <span id="useSeat1_4">49</span> / <span id="totalSeat1_4">300</span></li>
								<li><img src="${pageContext.request.contextPath }/image/index/readingRoom6.png" alt="이화 신한노트북석" id="roomName1_5" title="이화 신한노트북석"> <span id="useSeat1_5">114</span> / <span id="totalSeat1_5">191</span></li>
								<li><img src="${pageContext.request.contextPath }/image/index/readingRoom4.png" alt="이화 YBM열람실" id="roomName1_2" title="이화 YBM열람실"> <span id="useSeat1_2">47</span> / <span id="totalSeat1_2">294</span></li>
								<li><img src="${pageContext.request.contextPath }/image/index/readingRoom2.png" alt="자유열람실" id="roomName1_1" title="자유열람실"> <span id="useSeat1_1">54</span> / <span id="totalSeat1_1">280</span></li>
							</ul>
						</dd>
					</dl>
					<a href="#" target="_blank" class="more"><img src="${pageContext.request.contextPath }/image/index/more.png" alt="더보기"></a>
				</div>
				
			</div>
			
			<!-- ///////////////////////////////////////// -->

			<!-- ///////////////////////////////////////// -->
			<div class="book">	
				<ul>
				<li class="on"><h2><a href="#">많이 대여한 도서</a></h2>
				
					<div>	
						<div>
							<ul id="bookForm" style="width: 2288px;">
								
							</ul>
						</div>
					</div>
					<div class="btns">
						<a href="#" class="prev"><img src="${pageContext.request.contextPath }/image/index/prev.png" alt="이전"></a>
						<a href="#" class="next"><img src="${pageContext.request.contextPath }/image/index/next.png" alt="다음"></a>
					</div>
				 	
				</li>
				<li class=""><h2><a href="#">신규도서</a></h2>
				 		<div>	
							<div>
								<ul id="bookForm_new" style="width: 2288px;">
									
								</ul>
							</div>
						</div>
						<div class="btns">
							<a href="#" class="prev"><img src="${pageContext.request.contextPath }/image/index/prev.png" alt="이전"></a>
							<a href="#" class="next"><img src="${pageContext.request.contextPath }/image/index/next.png" alt="다음"></a>
						</div>
					</li>
				</ul>
			</div>
			<!-- ///////////////////////////////////////// -->
		</div>
		
		<!-- 메인 컨텐츠 끝 -->
		<br><br><br><br>
		<!-- ////////////////// -->

<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>