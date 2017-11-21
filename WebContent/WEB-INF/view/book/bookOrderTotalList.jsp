<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookOrderTotalList.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".cur").each(function(){
			 if($(this).attr("title") == ${curPage }) {
				 $(this).attr("style", "color:red;");
			 }
		 });
	});

</script>
<title>Insert title here</title>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>
	
	<section id = "section">
		<div id = "bts_top_section">
			<h2 id="divTitle">도서신청</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="../../index.jsp"><img src="${pageContext.request.contextPath}/image/bookTotalSearch/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>통합검색</li>
					<li>&gt;</li>
					<li>소장도서</li>
				</ul>
			</div>
	
		<div class = "listTable">
			<table class = "mobileTable tablet">
				<thead>
					<tr>
						<th scope="row" class="footable-first-column">번호</th>
						<th scope="row" data-class="expand">서명</th>
						<th scope="row" style="display: table-cell;">저자</th>
						<th scope="row" style="display: table-cell;">출판사</th>
						<th scope="row" style="display: table-cell;">신청인</th>
						<th scope="row" style="display: table-cell;">처리상태</th>
					</tr>
				</thead>
				
			<c:forEach items="${bookOrderTotalList}" var="bookOrder_list">
				<tr>
				<td scope="row" class="footable-first-column">${bookOrder_list.num }</td>
	 				<td scope="row" data-class="expand" style="overflow: hidden; max-width: 420px;">${bookOrder_list.title }</td>
					<td scope="row" style="display: table-cell;">${bookOrder_list.writer}</td>
					<td scope="row" style="display: table-cell;">${bookOrder_list.company}</td>
					<td scope="row" style="display: table-cell;">${bookOrder_list.id}</td>
					<c:choose>
					<c:when test="${bookOrder_list.state ne 1}">
						<td scope="row" style="display: table-cell;">대기</td>
					</c:when>
					<c:when test="${bookOrder_list.state ne 0 }">
						<td scope="row" style="display: table-cell;">완료</td>
					</c:when>
					</c:choose>
				</tr>
			</c:forEach>	
			</table>
		</div>
				
		<c:if test="${not empty member}">
		<form id = "order_btn" action="./bookOrderForm.book">
			<button style = "float: right;" class = "btn btn-default" type = "submit">신청하기</button>		
		</form>
		</c:if>

				<div class = "paging" style = "text-align: center;">
			<ul class="pagination pagination-sm">
				<c:if test="${page.curBlock>1}">
				<li><a href = "./bookOrderTotalList.book?curPage=${page.startNum-1}"><img width="13" height="16"  src="${pageContext.request.contextPath}/image/bookTotalSearch/prevPage.gif" alt="이전" title="이전"></a></li>
				</c:if>

				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li><a class="cur" title="${i }" href="./bookOrderTotalList.book?curPage=${i}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${page.curBlock < page.totalBlock}">
				<li><a href="./bookOrderTotalList.book?curPage=${requestScope.page.lastNum+1}"><img width="13" height="16" src="${pageContext.request.contextPath}/image/bookTotalSearch/nextPage.gif" alt="다음" title="다음"></a></li>
				</c:if>
			</ul>
		</div>
		
		</div>
	</section>

<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>