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
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

	<h2>마켓 판/구매 내역 상세히</h2>
	<form action="../market/marketDealsList.market?id=${member.id }&type=3" method="post">
		<p>num<input type="text" name="num" value=${bookDealsDetail.num } readonly="readonly"></p>
		<p>title<input type="text" name="title" value=${bookDealsDetail.title } readonly="readonly"></p>
		<p>writer<input type="text" name="writer" value=${bookDealsDetail.writer } readonly="readonly"></p>
		<p>company<input type="text" name="company" value=${bookDealsDetail.company } readonly="readonly"></p>
		<p>publish_date<input type="text" name="publish_date" value=${bookDealsDetail.publish_date } readonly="readonly"></p>
		<p>t_date<input type="text" name="t_date" value=${bookDealsDetail.t_date } readonly="readonly"></p>
		<p>price<input type="text" name="price" value=${bookDealsDetail.price } readonly="readonly"></p>
		<p>library<input type="text" name="library" value=${bookDealsDetail.library } readonly="readonly"></p>
		
		<c:choose>
			<c:when test="${bookDealsDetail.kind eq 1}">
				<p>kind<input type="text" value="판매" readonly="readonly"></p>
				<input type="hidden" name="kind" value=${bookDealsDetail.kind }>
			</c:when>
			<c:when test="${bookDealsDetail.kind eq 2}">
				<p>kind<input type="text" value="구매" readonly="readonly"></p>
				<input type="hidden" name="kind" value=${bookDealsDetail.kind }>
			</c:when>
		</c:choose>
		
		<c:choose>
			<c:when test="${bookDealsDetail.state eq 1}">
				<p>state<input type="text" value="완료" readonly="readonly"></p>
				<input type="hidden" name="state" value=${bookDealsDetail.state }>
			</c:when>
			<c:when test="${bookDealsDetail.state eq 2}">
				<p>state<input type="text" value="대기" readonly="readonly"></p>
				<input type="hidden" name="state" value=${bookDealsDetail.state }>
			</c:when>
		</c:choose>
	
		<c:choose>
			<c:when test="${bookDealsDetail.delivery eq 2}">
				<p>delivery<input type="text" value="택배" readonly="readonly"></p>
				<input type="hidden" name="delivery" value=${bookDealsDetail.delivery }>
				<input type="text" name="postcode" value=${bookDealsDetail.postCode }>
				<input type="text" name="addr" value=${bookDealsDetail.addr }>
				<input type="text" name="addr2" value=${bookDealsDetail.addr2 }>
			</c:when>
			<c:when test="${bookDealsDetail.delivery eq 1}">
				<p>delivery<input type="text" value="직접수령" readonly="readonly"></p>
				<input type="hidden" name="delivery" value=${bookDealsDetail.delivery }>
			</c:when>
		</c:choose>
		
		<button type="submit">확인</button>
		<a href="./marketDealsDelete.market?num=${bookDealsDetail.num }"><input type="button" value="내역 삭제"></a>
	</form>	
	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>