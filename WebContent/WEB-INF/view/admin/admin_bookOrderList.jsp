<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/admin_bookOrderList.css">
<title>book order list 관리자용</title>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp"></c:import>
</div>

<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">책 신청목록</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>책 신청목록</li>
			</ul>
		</div>

	
	
	
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
			<a href="./bookOrderViewAdmin.book?num=${dto.num}">${dto.title}</a>
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
				href="./bookOrderListAdmin.book?curPage=${i}">${i}</a></li>
			</c:forEach>
			
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./bookOrderListAdmin.book?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	
	</div>
</div>	
	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>




