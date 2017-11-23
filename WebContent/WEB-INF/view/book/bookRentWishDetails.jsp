<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 대여 찜 상세 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookRentWishDetails.css">
</head>
<body>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp?ln=${ln}"></c:import>
</div>

<div id="divContentsW">
	<div id="divContents">	
			<h2 id="divTitle">대여 상세정보</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="${pageContext.request.contextPath}/index.jsp?ln=${ln}"><img src="${pageContext.request.contextPath}/image/bookTotalSearch/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>MY PAGE</li>
					<li>&gt;</li>
					<li>대여 찜콩</li>
					<li>&gt;</li>
					<li>상세정보</li>
				</ul>
			</div>
			
			<form action="../book/bookRentList.book?id=${member.id }&ln=${ln}" method="post">
			<div class="profile borderIn">
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
									<td>대여가능</td>
								</c:when>
								<c:when test="${ book.state == 1 }">
									<td>대여불가</td>
								</c:when>
							</c:choose>
						</tr>
						<tr>
							<th scope="row">대여도서관</th>
							<c:choose>
								<c:when test="${book.library eq 1}">
									<td>기흥구</td>
									<input type="hidden" name="library" value=${book.library } readonly="readonly">
								</c:when>
								<c:when test="${book.library eq 2}">
									<td>송파구</td>
									<input type="hidden" name="library" value=${book.library } readonly="readonly">
								</c:when>
								<c:when test="${book.library eq 3}">
									<td>장안구</td>
									<input type="hidden" name="library" value=${book.library } readonly="readonly">
								</c:when>
								<c:when test="${book.library eq 4}">
									<td>분당구</td>
									<input type="hidden" name="library" value=${book.library } readonly="readonly">
								</c:when>
								<c:otherwise>
									<td><input type="number" value="없음" ></td>
								</c:otherwise>
							</c:choose>
						</tr>
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
	                        
	                    </tr>
		            </thead>
		            <tbody>
		                <tr>
		                    <td class="num expand footable-first-column">${book.num}</td>
		                    	<c:choose>
		                    		<c:when test="${book.library eq 1}"><td class="location"><a href="../library/libraryMain.library?ln=1">기흥 도서관</a></td></c:when>
		                    		<c:when test="${book.library eq 2}"><td class="location"><a href="../library/libraryMain.library?ln=2">송파 도서관</a></td></c:when>
		                    		<c:when test="${book.library eq 3}"><td class="location"><a href="../library/libraryMain.library?ln=3">장안 도서관</a></td></c:when>
		                    		<c:when test="${book.library eq 4}"><td class="location"><a href="../library/libraryMain.library?ln=4">분당 도서관</a></td></c:when>
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
		            </tbody>
		        </table>
		    </div>
		 </div>
		</div>
		</div> 
		<div class="btn2">
		<a href="./bookRentWishDelete.book?ln=${ln}&num=${book.num}"><input class="btnType5" type="button" value="삭제"></a>
		<a href="../book/bookRentList.book?id=${member.id }&ln=${ln}"><input class="btnType5" type="button" value="LIST"></a>
		</div>
		</form>
	</div>
</div>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>