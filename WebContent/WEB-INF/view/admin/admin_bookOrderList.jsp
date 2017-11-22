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
<script type="text/javascript">
	$(function(){
		$(".cur").each(function(){
			 if($(this).attr("title") == ${curPage }) {
				 $(this).attr("style", "color:red;");
			 }
		 });
		
		
	});

</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp"></c:import>
</div>

<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">책 신청 내역</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>책 신청 내역</li>
			</ul>
		</div>
		
	<br><br>
	<a href="./bookOrderListAdmin.book?state=3"><input class="btnType3" type="button" value="전체"></a>
	<a href="./bookOrderListAdmin.book?state=1"><input class="btnType3" type="button" value="승인"></a>
	<a href="./bookOrderListAdmin.book?state=0"><input class="btnType3" type="button" value="거절"></a>
	<br><br>
	
	<c:if test="${size eq 0 }">
		<h2 id="divTitle">도서 신청 내역이 없습니다.</h2>
		<br><br><br><br><br><br><br><br><br><br><br>
	</c:if>
	
	<c:if test="${size ne 0 }">
	<div class="listTable">
	<table class="mobileTable tablet" >
	<thead>
		<tr>
			<th>No.</th>
			<th>서명</th>
			<th>저자</th>
			<th>출판사</th>
			<th>출판년도</th>
			<th>가격</th>
			<th>비치도서관</th>
			<th>상태</th>
			<th>취소사유</th>
		</tr>
		<c:forEach items="${orderList}" var="dto">
			<tr>
				<td scope="row" class="footable-first-column">${dto.num}</td>
				<td scope="row" class="footable-first-column">
				<a href="./bookOrderViewAdmin.book?num=${dto.num}">${dto.title}</a></td>
				<td scope="row" style="display: table-cell;">${dto.writer }</td>
				<td scope="row" style="display: table-cell;">${dto.company }</td>
				<td  scope="row" data-class="expand">${dto.publish_date }</td>
				<td scope="row" style="display: table-cell;">${dto.price }</td>
				<c:choose>
					<c:when test="${dto.library eq 1}">
						<td scope="row" style="display: table-cell;">기흥구</td>
					</c:when>
					<c:when test="${dto.library eq 2}">
						<td scope="row" style="display: table-cell;">송파구</td>
					</c:when>
					<c:when test="${dto.library eq 3}">
						<td scope="row" style="display: table-cell;">장안구</td>
					</c:when>
					<c:when test="${dto.library eq 4}">
						<td scope="row" style="display: table-cell;">분당구</td>
					</c:when>
					<c:otherwise>
						<td scope="row" style="display: table-cell;">없음</td>
					</c:otherwise>
				</c:choose>
				<td scope="row" style="display: table-cell;">${dto.state }</td>
				<td scope="row" style="display: table-cell;">${dto.cancel }</td>
			</tr>
		</c:forEach>
	</table>
	
	<div class = "paging" style = "text-align: center;">
		<ul class="pagination pagination-sm">
			<c:if test="${page.curBlock>1}">
			<li><button class="go" id="${page.startNum-1}">[이전]</button></li>
			</c:if>
			
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<li><a class="cur" title="${i }" href="./bookOrderListAdmin.book?curPage=${i}">${i}</a></li>
			</c:forEach>
			
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a href="./bookOrderListAdmin.book?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	</div>
	</c:if>
	</div>
</div>		
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>