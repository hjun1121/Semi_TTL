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
	<div class="col-md-8 col-centered">
		<table class="table" border="1px">
			<tr>
				<td colspan="2">
					<%-- 글 제목 --%>책이름:${requestScope.view.title}</td>
				<td id="reg_date">
					<!-- 작가 -->작가: ${requestScope.view.writer}</td>
				<td id="hit">
					<!-- 출판사 -->출판사: ${requestScope.view.publish_date}</td>
			</tr>
			<tr>
				<td colspan="6" id="writer">
					<!-- 작성자 -->신청인: ${requestScope.view.id}
				</td>
			</tr>
			<tr>
				<td colspan="6" id="contents">
					<!--가격 -->가격: ${requestScope.view.price}
				</td>
			</tr>
			<tr>
				<td colspan="6" id="contents">
					<!-- 도서관 -->신청도서관: ${requestScope.view.library}
				</td>
			</tr>
			
		</table>
	</div>
	
	
		<a href="./${requestScope.market}Approval.${requestScope.market}?num=${requestScope.view.num}">승인</a>
		<a href="./${requestScope.market}Refusal.${requestScope.market}?num=${requestScope.view.num}">승인 거부</a>
		<a href="./${requestScope.market}ApplicationList.${requestScope.market}">LIST</a>
</body>
</html>