<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookRentDetails.css">
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>
<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp"></c:import>
</div>

<div id="divContentsW">
	<div id="divContents">	
			<h2 id="divTitle">대여 상세정보</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/image/bookTotalSearch/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>MY PAGE</li>
					<li>&gt;</li>
					<li>대여 내역</li>
					<li>&gt;</li>
					<li>상세정보</li>
				</ul>
			</div>
			
			<form action="../book/bookRentList.book?id=${member.id }" method="post">
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
								<c:when test="${bookRentDTO.library eq 1}">
									<td>기흥구</td>
									<input type="hidden" name="library" value=${bookRentDTO.library } readonly="readonly">
								</c:when>
								<c:when test="${bookRentDTO.library eq 2}">
									<td>송파구</td>
									<input type="hidden" name="library" value=${bookRentDTO.library } readonly="readonly">
								</c:when>
								<c:when test="${bookRentDTO.library eq 3}">
									<td>장안구</td>
									<input type="hidden" name="library" value=${bookRentDTO.library } readonly="readonly">
								</c:when>
								<c:when test="${bookRentDTO.library eq 4}">
									<td>분당구</td>
									<input type="hidden" name="library" value=${bookRentDTO.library } readonly="readonly">
								</c:when>
								<c:otherwise>
									<td><input type="number" value="없음" ></td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th>대여시간</th>
							<td>${bookRentDTO.in_time }</td>
						</tr>
						<tr>
							<th>반납시간</th>
							<c:choose>
								<c:when test="${empty bookRentDTO.out_time }">
									<td>*</td>
								</c:when>
								<c:when test="${! empty bookRentDTO.out_time }">
									<td>${bookRentDTO.out_time }</td>
								</c:when>
								<c:otherwise>
									<td>0</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th>연체일</th>
							<td>${bookRentDTO.late_date }일</td>
						</tr>
						</tbody>
						</table>
	   				</div>
	   			</div>
			</div>
		</div>
	</form>   			
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
		                    		<c:when test="${book.library eq 1}"><td class="location"><a href="../library/libraryMain.library?library=1">형준 도서관</a></td></c:when>
		                    		<c:when test="${book.library eq 2}"><td class="location"><a href="../library/libraryMain.library?library=2">지현 도서관</a></td></c:when>
		                    		<c:when test="${book.library eq 3}"><td class="location"><a href="../library/libraryMain.library?library=3">희성 도서관</a></td></c:when>
		                    		<c:when test="${book.library eq 4}"><td class="location"><a href="../library/libraryMain.library?library=4">현민 도서관</a></td></c:when>
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
		<c:choose>
			<c:when test="${empty bookRentDTO.out_time }">
				<a href="./bookReturn.book?num=${bookRentDTO.num }&bnum=${bookRentDTO.bnum }"><input class="btnType5" type="button" value="반납"></a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${not empty bookRentDTO.out_time }">
				<a href="./bookRentDelete.book?bnum=${bookRentDTO.bnum }"><input class="btnType5" type="button" value="삭제"></a>
			</c:when>
		</c:choose>
		<a href="../book/bookRentList.book?id=${member.id }"><input class="btnType5" type="button" value="LIST"></a>
		</div>
	</div>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>