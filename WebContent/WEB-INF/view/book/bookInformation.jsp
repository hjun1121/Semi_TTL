<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookInformation.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Book Information</title>
<script type="text/javascript">

$(function(){
	
	$(".rent_btn").click(function() {
		var num = $(this).val();
		$.ajax({
			url: "./bookRent.book?library=${library}",
			type: "GET",
			data: {
				num: num,
				rent_id:'${member.id}'
			},
			success: function(data) {
				alert(data);
				location.href="./bookInformation.book?num=${num}&library=${library}";
			}
		});
	});

	$(".wish_btn").click(function() {
		var num = $(this).val();
		var title = $(this).attr("title");

		if (title == 1) {
			$.ajax({
				url: "./bookRentWishReturn.book?library=${library}",
				type: "GET",
				data: {
					num:num,
					rent_id: '${member.id}'
				},
				success: function(data) {
					alert(data);
					location.href="./bookInformation.book?num=${num}&library=${library}";
				}
			});

		} else if (title == 0) {
			$.ajax({
				url: "./bookRentWish.book?library=${library}",
				type: "GET",
				data: {
					num:num,
					rent_id:'${member.id}'
				},
				success: function(data) {
					alert(data);
					location.href="./bookInformation.book?num=${num}&library=${library}";
				}
			});
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
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

	<div style = "height: 30px"></div>

	<section>
			<h2 id="divTitle">상세정보</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="${pageContext.request.contextPath}/index.jsp?library=${library}"><img src="${pageContext.request.contextPath}/image/bookTotalSearch/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>상세정보</li>
				</ul>
			</div>
			
			
			<div class="profile">
					<div class="profileHeader">
	 			   	 	<h3>${book.title}</h3>
	 			   	 	<br>
	   			 		<p>${book.writer} 지음</p>
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
						<tr class="main">
							<th scope="row">도서 분류</th>
							<td>${book.type}</td>
						</tr>
						<tr>
							<th scope="row">출판사</th>
							<td>${book.company}<br></td>
						</tr>
						<tr>
							<th scope="row">출판년도</th>
							<td>${book.publish_date}</td>
						</tr>
						<tr>
							<th scope="row">대여여부</th>
							<c:choose>
								<c:when test="${ book.state == 0 and not empty member }">
									<td><button class = "btn btn-default rent_btn" type = "submit" id = "rent_btn" value = "${book.num}">대여</button></td>
								</c:when>
								<c:when test="${ book.state == 0 and empty member }">
									<td>대여가능</td>
								</c:when>
								<c:when test="${ book.state == 1 }">
									<td>대여불가</td>
								</c:when>
							</c:choose>
						</tr>
						<c:if test="${not empty member}">
							<tr>
								<th scope="row">WISH</th>
								<c:set var="heart1" value="0" ></c:set>
								<c:set var="heart2" value="0" ></c:set>
								<c:if test="${ not empty member }">
									<c:forEach items="${rent_wish_list}" var="wish">
										<c:if test="${wish.title eq book.title}">
											<c:choose>
												<c:when test="${heart1 == 0}">
													<td><button class = "btn btn-default wish_btn" type = "submit" value = "${book.num}" title="1">❤</button></td>
													<c:set var="heart1" value="1" ></c:set>
													<c:set var="heart2" value="1" ></c:set>
												</c:when>
											</c:choose>
										</c:if>
									</c:forEach>
										<c:if test="${heart2 == 0}">
											<td><button class = "btn btn-default wish_btn" type = "submit" value = "${book.num}" title="0">♡</button></td>
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
	   			
   <!-- 소장정보 -->
	<div class="searchInfo">
		<div class="searchHeader">
		    <h3 class="open">소장정보</h3>
		</div>
		<div class="searchContents">
		    <div class="listTable">
		        <table class="searchTable default">
		            <thead>
	                    <tr>
	                        <th scope="row" data-class="expand" class="footable-first-column">No.</th>
	                        <th scope="row" data-hide="expand">소장도서관</th>
	                        <th scope="row" data-hide="phone">도서위치</th>
	                        <th scope="row" data-hide="phone">대여여부</th>
	                        <c:if test="${ not empty member }">
	                        	<th scope="row" data-hide="phone">WISH</th>
	                        </c:if>
	                    </tr>
		            </thead>
		            <tbody>
		                <tr>
		                    <td class="num expand footable-first-column">${book.num}</td>
		                    	<c:choose>
		                    		<c:when test="${book.library eq 1}"><td class="location"><a href="../library/libraryMain.library?library=1">기흥 도서관</a></td></c:when>
		                    		<c:when test="${book.library eq 2}"><td class="location"><a href="../library/libraryMain.library?library=2">송파 도서관</a></td></c:when>
		                    		<c:when test="${book.library eq 3}"><td class="location"><a href="../library/libraryMain.library?library=3">장안 도서관</a></td></c:when>
		                    		<c:when test="${book.library eq 4}"><td class="location"><a href="../library/libraryMain.library?library=4">분당 도서관</a></td></c:when>
		                    	</c:choose>
		                    <td class="callNum">${book.section}</td>
							<c:choose>
								<c:when test="${ book.state == 0 and not empty member }">
									<td><button class = "btn btn-default rent_btn" type = "submit" id = "rent_btn" value = "${book.num}">대여</button></td>
								</c:when>
								<c:when test="${ book.state == 0 and empty member }">
									<td>대여가능</td>
								</c:when>
								<c:when test="${ book.state == 1 }">
									<td>대여불가</td>
								</c:when>
							</c:choose>
      						<c:if test="${not empty member}">
								<c:set var="heart1" value="0" ></c:set>
								<c:set var="heart2" value="0" ></c:set>
								<c:if test="${ not empty member }">
									<c:forEach items="${rent_wish_list}" var="wish">
										<c:if test="${wish.title eq book.title}">
											<c:choose>
												<c:when test="${heart1 == 0}">
													<td><button class = "btn btn-default wish_btn" type = "submit" value = "${book.num}" title="1">❤</button></td>
													<c:set var="heart1" value="1" ></c:set>
													<c:set var="heart2" value="1" ></c:set>
												</c:when>
											</c:choose>
										</c:if>
									</c:forEach>
										<c:if test="${heart2 == 0}">
											<td><button class = "btn btn-default wish_btn" type = "submit" value = "${book.num}" title="0">♡</button></td>
										</c:if>
								</c:if>
							</c:if>
		            </tbody>
		        </table>
		    </div>
		 </div>
		</div> 
		<!-- 소장정보 끝 -->
	   			
	

			<form action="./bookTotalSearch.book?curPage=${curPage}&library=${library}">
				<button class = "adv" type = "submit" >LIST</button>
			</form>
			<div style="height: 100px;"></div>
	</section>
	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>