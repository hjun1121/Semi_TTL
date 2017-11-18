<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마켓 관리자 승인창</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

	<div>
	<h1>마켓 관리자 승인 창</h1>

	</div>
	<h1>${fn:toUpperCase(requestScope.market)}</h1>
	<table class="table table-hover" border="1">
		<tr>
			<td>num</td>
			<td>title</td>
			<td>writer</td>
			<td>company</td>
			<td>publish_date</td>
			<td>price</td>
			<td>library</td>
			<td>신청인 ID</td>
		</tr>
		<c:forEach items="${requestScope.list}" var="dto">
		
		<tr>
			<td>${dto.num}</td>
			<td>
			<c:catch>

			</c:catch>
			<a href="./marketOrderView.market?num=${dto.num}">${dto.title}</a>
			</td>
			<td>${dto.writer}</td>
			<td>${dto.company}</td>
			<td>${dto.publish_date}</td>
			<td>${dto.price}</td>
			<td>${dto.library}</td>
			<td>${dto.id}</td>
		</tr>
		</c:forEach>
	</table>
	
	<div>
		<ul class="pagination">
			<c:if test="${page.curBlock>1}">
			<li><button class="go" id="${page.startNum-1}">[이전]</button></li>
			</c:if>
			
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<li><a
				href="./marketOrderList.market?curPage=${i}">${i}</a></li>
			</c:forEach>
			
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./marketOrderList.market?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>




