<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index/index.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/script/main.js"></script>
<title>
	<c:choose>
		<c:when test="${ library == 1 }">기흥 도서관</c:when>
		<c:when test="${ library == 2 }">송파 도서관</c:when>
		<c:when test="${ library == 3 }">장안 도서관</c:when>
		<c:when test="${ library == 4 }">분당 도서관</c:when>
	</c:choose>
</title>

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
		url:"${pageContext.request.contextPath}/notice/noticeAjax.notice",
		type:"POST",
		data: {
		},
		success:function(data){
			$("#noticeForm").html(data);
		}
	});
	
	
	$.ajax({
		url:"${pageContext.request.contextPath}/book/bookAjax.book",
		type:"POST",
		data: {
		},
		success:function(data){
			$("#bookForm").html(data);
		}
	});
	
	$.ajax({
		url:"${pageContext.request.contextPath}/book/bookAjax_new.book",
		type:"POST",
		data: {
		},
		success:function(data){
			$("#bookForm_new").html(data);
		}
	});
	
 	$.ajax({
		url:"${pageContext.request.contextPath}/seat/seatAjax_1.seat",
		type:"POST",
		data: {
			library:1
		},
		success:function(data){
			$("#seatForm_1").html(data);
		}
	});
	
 	$.ajax({
		url:"${pageContext.request.contextPath}/seat/seatAjax_1.seat",
		type:"POST",
		data: {
			library:2
		},
		success:function(data){
			$("#seatForm_2").html(data);
		}
	});
 	
 	$.ajax({
		url:"${pageContext.request.contextPath}/seat/seatAjax_1.seat",
		type:"POST",
		data: {
			library:3
		},
		success:function(data){
			$("#seatForm_3").html(data);
		}
	});
 	
 	$.ajax({
		url:"${pageContext.request.contextPath}/seat/seatAjax_1.seat",
		type:"POST",
		data: {
			library:4
		},
		success:function(data){
			$("#seatForm_4").html(data);
		}
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
</c:choose>

	<!-- ////////////////// -->

		<!-- 메인 Search 시작 -->
		<div id="divSearch">
			<div>
				<h2 class="skip">통합검색</h2>
				<div class="searchForm">
					<ul>
						<li class="on">
							<form name="totalForm" action="${pageContext.request.contextPath}/library/libraryBookSearch.library?library=${library}&ln=${ln}" method="get">
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
							    <a href="${pageContext.request.contextPath}/library/libraryMain.library?library=1" target="_blank" class="bannerImg">
							    	<img src="${pageContext.request.contextPath }/image/index/hj.png" style="width:100%">
							    </a>
							    <div class="text">기흥 도서관</div>
							  </div>
							
							  <div class="mySlides fade_banner">
							    <div class="numbertext">2 / 4</div>
							    <a href="${pageContext.request.contextPath}/library/libraryMain.library?library=2" target="_blank" class="bannerImg">
							   		<img src="${pageContext.request.contextPath }/image/index/hj2.png" style="width:100%">
							    </a>
							    <div class="text">송파 도서관</div>
							  </div>
							
							  <div class="mySlides fade_banner">
							    <div class="numbertext">3 / 4</div>
							    <a href="${pageContext.request.contextPath}/library/libraryMain.library?library=3" target="_blank" class="bannerImg">
							    	<img src="${pageContext.request.contextPath }/image/index/hj3.png" style="width:100%">
							    </a>
							    <div class="text">장안 도서관</div>
							  </div>
							  <div class="mySlides fade_banner">
							    <div class="numbertext">4 / 4</div>
							    <a href="${pageContext.request.contextPath}/library/libraryMain.library?library=4" target="_blank" class="bannerImg">
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
					<a href="${pageContext.request.contextPath}/notice/noticeList.notice" class="more"><img src="${pageContext.request.contextPath }/image/index/more.png" alt="더보기"></a>
					</div>
				</div>
			</div>
			<div class="content2">
				<div class="seat">
					<div>
						<h2>도서관 좌석 현황</h2>
					</div>
					<dl class="readingRoom1">
						<dt>기흥도서관</dt>
						<dd>
							<ul id="seatForm_1">

							</ul>
						</dd>
					</dl>
					<dl class="readingRoom2">
						<dt>송파도서관</dt>
						<dd>
							<ul id="seatForm_2">
							</ul>
						</dd>
					</dl>
					<dl class="readingRoom4">
						<dt>장안도서관</dt>
						<dd>
							<ul id="seatForm_3">
							</ul>
						</dd>
					</dl>
					<dl class="readingRoom3">
						<dt>분당도서관</dt>
						<dd>
							<ul id="seatForm_4">
							</ul>
						</dd>
					</dl>
					<a href="${pageContext.request.contextPath }/seat/seatList.seat" target="_blank" class="more"><img src="${pageContext.request.contextPath }/image/index/more.png" alt="더보기"></a>
				</div>
				
			</div>
			
			<!-- ///////////////////////////////////////// -->

			<!-- ///////////////////////////////////////// -->
			<div class="book">	
				<ul>
				<li class="on"><h2><a href="#">많이 대여한 도서</a></h2>
				
					<div>	
						<div>
							<ul id="bookForm">
								
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
								<ul style="width: 2288px;" id="bookForm_new">
									
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

<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>


</body>
</html>
