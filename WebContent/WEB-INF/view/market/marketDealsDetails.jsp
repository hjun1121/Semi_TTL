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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/market/marketDealsDetails.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>
<div>
	<c:import url="../member/myPage.jsp"></c:import>
</div>

<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">MARKET 내역 검색</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/common/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>MARKET 내역 검색</li>
				<li>&gt;</li>
				<li>MARKET 상세 내역</li>
			</ul>
		</div>
	<form action="../market/marketDealsList.market?id=${member.id }&type=3" method="post">
		<table class="Dtable">
			<tr>
				<th>No.</th>
				<td><input type="text" class="noneBorder" name="num" value=${bookDealsDetail.num } readonly="readonly"></td>
			</tr>
			<tr>
				<th>서명</th>
				<td><input type="text" class="noneBorder" name="title" value=${bookDealsDetail.title } readonly="readonly"></td>
			</tr>
			<tr>
				<th>저자</th>
				<td><input type="text" class="noneBorder" name="writer" value=${bookDealsDetail.writer } readonly="readonly"></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><input type="text" class="noneBorder" name="company" value=${bookDealsDetail.company } readonly="readonly"></td>
			</tr>
			<tr>
				<th>출판년도</th>
				<td><input type="text" class="noneBorder" name="publish_date" value=${bookDealsDetail.publish_date } readonly="readonly"></td>
			</tr>
			<tr>
				<th>거래일자</th>
				<td><input type="text" class="noneBorder" name="t_date" value=${bookDealsDetail.t_date } readonly="readonly"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" class="noneBorder" name="price" value=${bookDealsDetail.price } readonly="readonly"></td>
			</tr>
			<tr>
				<th>비치도서관</th>
				<td><input type="text" class="noneBorder" name="library" value=${bookDealsDetail.library } readonly="readonly"></td>
			</tr>
			<tr>
			<c:choose>
				<c:when test="${bookDealsDetail.kind eq 1}">
					<th>거래</th>
					<td><input type="text" class="noneBorder" value="판매" readonly="readonly"></td>
					<input type="hidden" name="kind" value=${bookDealsDetail.kind }>
				</c:when>
				<c:when test="${bookDealsDetail.kind eq 2}">
					<th>거래</th>
					<td><input type="text" class="noneBorder" value="구매" readonly="readonly"></td>
					<input type="hidden" name="kind" value=${bookDealsDetail.kind }>
				</c:when>
			</c:choose>
			</tr>
			<tr>
			<c:choose>
				<c:when test="${bookDealsDetail.state eq 1}">
					<th>상태</th>
					<td><input type="text" class="noneBorder" value="완료" readonly="readonly"></td>
					<input type="hidden" name="state" value=${bookDealsDetail.state }>
				</c:when>
				<c:when test="${bookDealsDetail.state eq 2}">
					<th>상태</th>
					<td><input type="text" class="noneBorder" value="대기" readonly="readonly"></td>
					<input type="hidden" name="state" value=${bookDealsDetail.state }>
				</c:when>
			</c:choose>
			</tr>
			<c:choose>
			<c:when test="${bookDealsDetail.delivery eq 1}">
				<tr>
				<th>수령방법</th>
				<td><input type="text" class="noneBorder" value="택배" readonly="readonly"></td>
				<input type="hidden" name="delivery" value=${bookDealsDetail.delivery }>
				</tr>
				<tr>
				<th></th>
					<td><input type="text" name="postcode" class="noneBorder" size="5" value=${bookDealsDetail.postCode } readonly="readonly"></tr>
					<tr>
					<th></th>
					<td><input type="text" name="addr" class="noneBorder"  value=${bookDealsDetail.addr } readonly="readonly">
					<input type="text" name="addr2" class="noneBorder" value=${bookDealsDetail.addr2 } readonly="readonly"></td>
				</tr>
			</c:when>
			<c:when test="${bookDealsDetail.delivery eq 2}">
			<tr>
				<th>수령방법</th>
				<td><input type="text" class="noneBorder" value="직접수령" readonly="readonly"></td>
				<input type="hidden" name="delivery" value=${bookDealsDetail.delivery }>
			</tr>
			</c:when>
			</c:choose>
		</table>
		
		<div class="btn">
			<input type="submit" class="btnType5" id="btn" name="btn" value="확인">
			<a href="./marketDealsDelete.market?num=${bookDealsDetail.num }"><input type="button" class="btnType5" value="내역 삭제"></a>
		</div>
	</form>	
	</div>
</div>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>