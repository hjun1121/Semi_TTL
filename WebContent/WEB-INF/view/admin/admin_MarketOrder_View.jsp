<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	
	
		<a href="./${requestScope.market}Approval.${requestScope.market}?num=${requestScope.view.num}">승인</a>
		<a href="./${requestScope.market}Refusal.${requestScope.market}?num=${requestScope.view.num}">승인 거부</a>
		<a href="./marketOrderList.market">LIST</a>
</body>
</html>