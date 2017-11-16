<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
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

	<table border="1">
		<tr>
			<td colspan="3">책이름 : ${view.title }</td>
			<td colspan="3">작가 : ${view.writer }</td>
		</tr>
		<tr>
			<td colspan="3">출판사 : ${view.company }</td>
			<td colspan="3">출시년도 : ${view.publish_date }</td>
		</tr>
		<tr>
			<td colspan="6">신청인 : ${view.id }</td>
		</tr>
		<tr>
			<td colspan="6">가격 : ${view.price }</td>
		</tr>
		<tr>
			<td colspan="6">신청도서관 : ${view.library }</td>
		</tr>
	</table>
		<a href="./marketOrderOK.market?num=${view.num }">승인</a>
		<a href="./marketOrderNO.market?num=${view.num }">거절</a>
		<a href="./marketOrderList.market">LIST</a>
		
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>