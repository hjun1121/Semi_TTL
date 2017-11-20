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

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/market/marketTotalView.css">
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			location.href="./bookBuy.market?num=${dto.num}";
		});
	});
</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>


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
	
	
	
	<table id = "marketList" class="kind" border="1">
			<tr>
				<th>num</th>
				<th>title</th>
				<th>writer</th>
				<th>company</th>
				<th>publish_date</th>
				<th>library</th>
				<th>price</th>
				<th>id</th>
				<th>wish</th>
				<th>approval</th>
				<th>book_state</th>
				<th>buy</th>
			</tr>
				<tr>
					<td>${dto.num }</td>
					<td>${dto.title }</td>
					<td>${dto.writer }</td>
					<td>${dto.company }</td>
					<td>${dto.publish_date }</td>
					<td>${dto.library }</td>
					<td>${dto.price }</td>
					<td>${dto.id }</td>
					<td>${dto.wish }</td>
					<td>${dto.approval }</td>
					<td>${dto.book_state }</td>
					<td><input type="button" id="btn" value="구매하기"></td>
				</tr>
		</table>
		
		
		</div>
	</div>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>