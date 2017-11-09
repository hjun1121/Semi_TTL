<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>book order list 관리자용</title>
</head>
<body>
	<div>
		<h1>book order list 관리자용</h1>
	</div>
	
	<h1>${fn:toUpperCase(requestScope.book)}</h1>
	
	
	<table class="table table-hover" border="1">
		<tr>
			<td>num</td>
			<td>title</td>
			<td>writer</td>
			<td>company</td>
			<td>publish_date</td>
			<td>price</td>
			<td>library</td>
			<td>state</td>
			<td>cancel</td>
		</tr>
		<c:forEach items="${requestScope.list}" var="dto">
		<c:if test="${dto.state eq 1 }">
		<tr>
			<td>${dto.num}</td>
			<td>
			<c:catch>
			<c:forEach begin="0" end="${dto.depth-1}">
				--
			</c:forEach>
			</c:catch>
			<a href="./${requestScope.book}OrderDetailsAdmin.${requestScope.book}?num=${dto.num}">${dto.title}</a>
			</td>
			<td>${dto.writer}</td>
			<td>${dto.company}</td>
			<td>${dto.publish_date}</td>
			<td>${dto.price}</td>
			<td>${dto.library}</td>
			<td>${dto.state}</td>
			<td>${dto.cancel}</td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	
	
	<div>
		<ul class="pagination">
			<c:if test="${page.curBlock>1}">
			<li><button class="go" id="${page.startNum-1}">[이전]</button></li>
			</c:if>
			
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<li><a
				href="./${requestScope.book}List.${requestScope.book}?curPage=${i}">${i}</a></li>
			</c:forEach>
			
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./${requestScope.book}List.${requestScope.book}?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>




