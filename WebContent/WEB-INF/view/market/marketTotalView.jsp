<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중고장터 도서 상세페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/market/marketTotalView.css">
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			location.href="./bookBuy.market?num=${dto.num}&library=${library}&ln=${ln}";
		});
		
		$("#btn_NO").click(function(){
			location.href="./marketTotalList.market?library=${library}&ln=${ln}";
		});
		
		$(".wish_btn").click(function() {
			var num = $(this).val();
			var title = $(this).attr("title");

			if (title == 1) {
				$.ajax({
					url: "./bookBuyWishReturn.market?ln=${ln}",
					type: "GET",
					data: {
						num:num,
						curPage: ${curPage},
						id: '${member.id}',
						ln: ${ln}
					},
					success: function(data) {
						alert(data);
						location.href="./marketTotalView.market?num=${num}&curPage=${curPage}&ln=${ln}";
					}
				});

			} else if (title == 0) {
				$.ajax({
					url: "./bookBuyWish.market?ln=${ln}",
					type: "GET",
					data: {
						num:num,
						curPage: ${curPage},
						id: '${member.id}',
						ln: ${ln}
					},
					success: function(data) {
						alert(data);
						location.href="./marketTotalView.market?num=${num}&curPage=${curPage}&ln=${ln}";
					}
				});
			}
		});
	});
	
	
</script>
</head>
<body>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<section id = "section">
<div id = "bts_top_section">

	<div id="divContentsW">
		<div id="divContents">
			
			<h2 id="divTitle">중고 도서 상세보기</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>중고 도서 상세보기</li>
				</ul>
			</div>
	
				<div class="profile">
					<div class="profileHeader">
	 			   	 	<h3>${dto.title }</h3>
	 			   	 	<br>
	   			 		<p>${dto.writer } 지음</p>
					</div>
					<div class="profileContent">
		  			<div class="briefInfo">
		        		<dl>
		           	 	<dd class="bookImg">
		            		<img id="coverimage" src="http://image.aladin.co.kr/product/102/27/cover/8901074605_1.jpg" width="120" height="153" alt="표지이미지" style="">
		           		</dd>
		        		</dl>
		    		</div>
		
				<div class="table">
					<div id="divProfile">
	       				<table id="moreInfo">
	       				<tbody>
						<tr>
							<th scope="row">출판사</th>
							<td>${dto.company}<br></td>
						</tr>
						<tr>
							<th scope="row">출판년도</th>
							<td>${dto.publish_date}</td>
						</tr>
						<tr>
							<th scope="row">정가</th>
							<td><fmt:formatNumber type="currency" currencySymbol="" value="${dto.price/(1-((dto.book_state*2)/10))}"  />원</td>
						</tr>
						<tr>
							<th scope="row">판매가</th>
							<td>${dto.price }원</td>
						</tr>
						<c:if test="${not empty member}">
							<tr>
								<th scope="row">찜하기</th>
								<c:set var="heart1" value="0" ></c:set>
								<c:set var="heart2" value="0" ></c:set>
								<c:if test="${ not empty member }">
									<c:forEach items="${rent_wish_list}" var="wish">
										<c:if test="${wish.num eq dto.num}">
											<c:choose>
												<c:when test="${heart1 == 0}">
													<td><button class = "btn btn-default wish_btn" type = "submit" value = "${dto.num}" title="1">❤</button></td>
													<c:set var="heart1" value="1" ></c:set>
													<c:set var="heart2" value="1" ></c:set>
												</c:when>
											</c:choose>
										</c:if>
									</c:forEach>
										<c:if test="${heart2 == 0}">
											<td><button class = "btn btn-default wish_btn" type = "submit" value = "${dto.num}" title="0">♡</button></td>
										</c:if>
								</c:if>
							</tr>
						</c:if>
						</tbody>
						</table>
	   				</div>
	   			</div>
			</div>
		</div>
	
	
		<div class="searchInfo">
		<div class="searchHeader">
		    <h3 class="open">상세정보</h3>
		</div>
		<div class="searchContents">
		    <div class="listTable">
		        <table class="searchTable default">
		            <thead>
	                    <tr>
	                        <th scope="row" data-class="expand" class="footable-first-column">No.</th>
	                        <th scope="row" data-hide="expand">관할 도서관</th>
	                        <th scope="row" data-hide="phone">도서상태</th>
	                        <th scope="row" data-hide="phone">판매자 아이디</th>
	                        <th scope="row" data-hide="phone">찜</th>
	                    </tr>
		            </thead>
		            <tbody>
		                <tr>
		                    <td class="num expand footable-first-column">${dto.num}</td>
		                    <td>
								<c:if test="${dto.library eq 1 }">
									<a href="${pageContext.request.contextPath }/library/libraryMain.library?library=1&ln=1">기흥 도서관</a>
								</c:if>
								<c:if test="${dto.library eq 2}">
									<a href="${pageContext.request.contextPath }/library/libraryMain.library?library=2&ln=2">송파 도서관</a>
								</c:if>
								<c:if test="${dto.library eq 3}">
									<a href="${pageContext.request.contextPath }/library/libraryMain.library?library=3&ln=3">장안 도서관</a>
								</c:if>
								<c:if test="${dto.library eq 4 }">
									<a href="${pageContext.request.contextPath }/library/libraryMain.library?library=4&ln=4">분당 도서관</a>
								</c:if>
							</td>
		                    <td>
								<c:if test="${dto.book_state eq 3 }">
									하
								</c:if>
								<c:if test="${dto.book_state eq 2}">
									중
								</c:if>
								<c:if test="${dto.book_state eq 1}">
									상
								</c:if>
							</td>
							<td>${dto.id }</td>
							<td>${dto.wish }</td>
      						
		            </tbody>
		        </table>
		    </div>
		 </div>
		</div> 

			<div class="btnCenter mt30" id="center">
				<span class="button1">
					<input type="button" class="type4 large" id="btn_NO" value="취소">
				</span>	
				<span class="button1">
					<input type="button" class="type1 large" id="btn" value="구매">
				</span> 
			</div>
			
		</div>
	</div>
</div>
</section>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>