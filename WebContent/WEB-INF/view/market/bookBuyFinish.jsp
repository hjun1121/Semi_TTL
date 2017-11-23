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
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>
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
					<span class="wbbtn white block">주문번호:20171123</span>
				</li>
				<li style="list-style:none;">
					<span class="wbbtn black block">주문일자 : ${mdd.t_date }</span>
				</li>
			</ul>
		</div>
		<br><br>
		
		
		<span class="tTitle">결제정보</span>
		<div class="order">
			<table id="fTable">	
				<tr>
					<th>최종결제금액</th>
					<c:choose>
						<c:when test="${mdd.delivery eq 1}">
							<td><span id="won">${mdd.price+2500 }</span> 원</td>
						</c:when>
						<c:when test="${mdd.delivery eq 2}">
							<td><span id="won">${mdd.price }</span> 원</td>
						</c:when>
					</c:choose>
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
					<td>${mdd.title }</td>
					<c:choose>
						<c:when test="${mdd.library eq 1}">
							<td>기흥도서관</td>
						</c:when>
						<c:when test="${mdd.library eq 2}">
							<td>송파도서관</td>
						</c:when>
						<c:when test="${mdd.library eq 3}">
							<td>장안도서관</td>
						</c:when>
						<c:when test="${mdd.library eq 4}">
							<td>분당도서관</td>
						</c:when>
					</c:choose>
					<td>${mdd.price }</td>
					<td>1</td>
					<c:choose>
						<c:when test="${mdd.delivery eq 1}">
							<td>택배</td>
						</c:when>
						<c:when test="${mdd.delivery eq 2}">
							<td>직접수령</td>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${mdd.delivery eq 1}">
							<td>${mdd.price+2500 }</td>
						</c:when>
						<c:when test="${mdd.delivery eq 2}">
							<td>${mdd.price }</td>
						</c:when>
					</c:choose>
				</tr>
			</table>
		</div>
		
		<c:if test="${mdd.delivery eq 1}">
			<br><br>
			<span class="tTitle">배송지정보</span>
			<div class="myOrder">
				<table id="tTable">	
					<tr>
						<th>받으시는분</th>
						<td>${member.name }</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>${mdd.postCode}</td>
					</tr>
					<tr>
						<th>나머지주소</th>
						<td>${mdd.addr} ${mdd.addr2}</td>
					</tr>
					<tr>
						<th>전화</th>
						<td>${member.phone}</td>
					</tr>
				</table>
			</div>
		</c:if>
		<c:if test="${mdd.delivery eq 2}">
			<br><br>
			<span class="tTitle">고객 정보</span>
			<div class="myOrder">
				<table id="tTable">	
					<tr>
						<th>받으시는분</th>
						<td>${member.name }</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>${member.postCode}</td>
					</tr>
					<tr>
						<th>나머지주소</th>
						<td>${member.addr} ${member.addr2}</td>
					</tr>
					<tr>
						<th>전화</th>
						<td>${member.phone}</td>
					</tr>
				</table>
			</div>
		</c:if>
		<div class="btn">
			<a href="./marketDealsList.market?library=${library}&ln=${ln}"><input type="button" class="btnType5" value="LIST"></a>
		</div>
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