<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>Book Order Details</h2>
	<form action="../book/bookOrderList.book?id=${member.id }" method="post">
		<p><input type="hidden" name="num" value=${bookOrderDetails.num }></p>
		<p>title<input type="text" name="title" value=${bookOrderDetails.title } readonly="readonly"></p>
		<p>writer<input type="text" name="writer" value=${bookOrderDetails.writer } readonly="readonly"></p>
		<p>company<input type="text" name="company" value=${bookOrderDetails.company } readonly="readonly"></p>
		<p>publish_date<input type="text" name="publish_date" value=${bookOrderDetails.publish_date } readonly="readonly"></p>
		<p>contents<input type="text" name="contents" value=${bookOrderDetails.contents } readonly="readonly"></p>
		<p><input type="hidden" name="id" value=${bookOrderDetails.id }></p>
		<p>price<input type="text" name="price" value=${bookOrderDetails.price } readonly="readonly"></p>
		<c:choose>
			<c:when test="${bookOrderDetails.library eq 1}">
				<p>library<input type="text" value="기흥구" ></p>
				<input type="hidden" name="library" value=${bookOrderDetails.library } readonly="readonly">
			</c:when>
			<c:when test="${bookOrderDetails.library eq 2}">
				<p>library<input type="text" value="장안구" ></p>
				<input type="hidden" name="library" value=${bookOrderDetails.library } readonly="readonly">
			</c:when>
			<c:when test="${bookOrderDetails.library eq 3}">
				<p>library<input type="text" value="송파구" ></p>
				<input type="hidden" name="library" value=${bookOrderDetails.library } readonly="readonly">
			</c:when>
			<c:when test="${bookOrderDetails.library eq 4}">
				<p>library<input type="text" value="분당구" ></p>
				<input type="hidden" name="library" value=${bookOrderDetails.library } readonly="readonly">
			</c:when>
			<c:otherwise>
				<p>library<input type="number" value="없음" ></p>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${bookOrderDetails.state eq 0}">
				<p>state<input type="text" value="취소" readonly="readonly"></p>
				<input type="hidden" name="state" value=${bookOrderDetails.state } readonly="readonly">
				<p>cancel<input type="text" name="cancel" value=${bookOrderDetails.cancel } ></p>
			</c:when>
			<c:when test="${bookOrderDetails.state eq 1}">
				<p>state<input type="text" value="대기" readonly="readonly"></p>
				<input type="hidden" name="state" value=${bookOrderDetails.state } readonly="readonly">
			</c:when>
			<c:otherwise>
				<p>state<input type="text" value="승인" readonly="readonly"></p>
				<input type="hidden" name="state" value=${bookOrderDetails.state } readonly="readonly">
			</c:otherwise>
		</c:choose>
		
		
		<button type="submit">확인</button>
		<c:if test="${bookOrderDetails.state eq 2 }">
		<a href="./bookOrderUpdate.book?num=${bookOrderDetails.num }"><input type="button" value="정보 수정"></a>
		<a href="./bookOrderDelete.book?num=${bookOrderDetails.num }"><input type="button" value="신청 취소"></a>
		</c:if>
	</form>	
</body>
</html>