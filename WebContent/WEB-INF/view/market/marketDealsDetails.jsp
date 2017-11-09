<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>마켓 판/구매 내역 상세히</h2>
	<form action="../index.jsp" method="post">
		<p>num<input type="text" name="num" value=${bookDealsDetail.num } readonly="readonly"></p>
		<p>title<input type="text" name="title" value=${bookDealsDetail.title } readonly="readonly"></p>
		<p>writer<input type="text" name="writer" value=${bookDealsDetail.writer } readonly="readonly"></p>
		<p>company<input type="text" name="company" value=${bookDealsDetail.company } readonly="readonly"></p>
		<p>publish_date<input type="text" name="publish_date" value=${bookDealsDetail.publish_date } readonly="readonly"></p>
		<p>t_date<input type="text" name="t_date" value=${bookDealsDetail.t_date } readonly="readonly"></p>
		<p>price<input type="text" name="price" value=${bookDealsDetail.price } readonly="readonly"></p>
		<p>library<input type="text" name="library" value=${bookDealsDetail.library } readonly="readonly"></p>
		
		<c:if test="${bookDealsDetail.kind eq 1}">
			<p>kind<input type="text" value="판매" readonly="readonly"></p>
			<input type="hidden" name="kind" value=${bookDealsDetail.kind }>
		</c:if>
		<c:if test="${bookDealsDetail.kind eq 2}">
			<p>kind<input type="text" value="구매" readonly="readonly"></p>
			<input type="hidden" name="kind" value=${bookDealsDetail.kind }>
		</c:if>
		
		<c:if test="${bookDealsDetail.state eq 1}">
			<p>state<input type="text" value="완료" readonly="readonly"></p>
			<input type="hidden" name="state" value=${bookDealsDetail.state }>
		</c:if>
		<c:if test="${bookDealsDetail.state eq 2}">
			<p>state<input type="text" value="대기" readonly="readonly"></p>
			<input type="hidden" name="state" value=${bookDealsDetail.state }>
		</c:if>
		
		<c:if test="${bookDealsDetail.delivery eq 1}">
			<p>delivery<input type="text" value="택배" readonly="readonly"></p>
			<input type="hidden" name="delivery" value=${bookDealsDetail.delivery }>
		</c:if>
		<c:if test="${bookDealsDetail.delivery eq 2}">
			<p>delivery<input type="text" value="직접수령" readonly="readonly"></p>
			<input type="hidden" name="delivery" value=${bookDealsDetail.delivery }>
		</c:if>
		<button type="submit">확인</button>
		<a href="./marketDealsDelete.market?num=${bookDealsDetail.num }"><input type="button" value="내역 삭제"></a>
	</form>	
</body>
</html>