<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 완료</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/market/bookBuyFinish.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>
<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">결제 완료</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/common/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MARKET</li>
				<li>&gt;</li>
				<li>결제 완료</li>
			</ul>
		</div>
		
		<div id="confirm">
			<p>
				<strong>고객님의 주문이 완료 되었습니다.</strong>
				<span id="span2">주문내역 및 배송에 관한 안내는 주문조회 를 통하여 확인 가능합니다.</span>
			</p>
			<ul>
				<li style="list-style:none;">
					<span class="wbbtn white block">주문번호:</span>
				</li>
				<li style="list-style:none;">
					<span class="wbbtn black block">주문일자:</span>
				</li>
			</ul>
		</div>
		<br><br>
		
		
		<span class="tTitle">결제정보</span>
		<div class="order">
			<table id="fTable">	
				<tr>
					<th>최종결제금액</th>
					<td>25000won</td>
				</tr>
				<tr>
					<th>결제수단</th>
					<td>카드</td>
				</tr>
			</table>
		</div>
		
		<br><br>
		<span class="tTitle">주문 상품 정보</span>
		<div class="orderPro">
			<table id="sTable">	
				<tr>
					<th>서명</th>
					<th>도서관명</th>
					<th>판매가</th>
					<th>수량</th>
					<th>배송</th>
					<th>합계</th>
				</tr>
				<tr>
					<td>장희성</td>
					<td>장안도서관</td>
					<td>22500원</td>
					<td>1</td>
					<td>배송</td>
					<td>25000원</td>
				</tr>
			</table>
		</div>
		
		<br><br>
		<span class="tTitle">배송지정보</span>
		<div class="myOrder">
			<table id="tTable">	
				<tr>
					<th>받으시는분</th>
					<td>장희성</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>11111</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>수원시</td>
				</tr>
				<tr>
					<th>전화</th>
					<td>11111</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>