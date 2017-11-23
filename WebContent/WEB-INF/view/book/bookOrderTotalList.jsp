<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>도서 신청 리스트</title>
</head>
<body>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

	<section id = "section">
		<div id = "bts_top_section">
			<h2 id="divTitle">도서신청</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/image/bookTotalSearch/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>통합검색</li>
					<li>&gt;</li>
					<li>소장도서</li>
				</ul>
			</div>
	<c:if test="${size eq 0 }">
		<h2 id="divTitle">도서 신청 내역이 없습니다.</h2>
	</c:if>
	<c:if test="${size ne 0 }">
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
					<td scope="row" style="display: table-cell;">${fn:substring(bookOrder_list.id,0,2) }***</td>
					<c:choose>
					<c:when test="${bookOrder_list.state eq 0}">
						<td scope="row" style="display: table-cell;">대기</td>
					</c:when>
					<c:when test="${bookOrder_list.state eq 1}">
						<td scope="row" style="display: table-cell;">거절</td>
					</c:when>
					<c:when test="${bookOrder_list.state eq 2 }">
						<td scope="row" style="display: table-cell;">승인</td>
					</c:when>
					</c:choose>
				</tr>
			</c:forEach>	
			</table>
		</div>
		</c:if>
		<c:if test="${not empty member}">
		<form id = "order_btn" action="./bookOrderForm.book?ln=${ln}">
			<button style = "float: right;" class = "adv" type = "submit">신청하기</button>		
		</form>
		</c:if>
				<div class = "paging" style = "text-align: center;">
			<ul class="pagination pagination-sm">
				<c:if test="${page.curBlock>1}">
				<li><a href = "./bookOrderTotalList.book?curPage=${page.startNum-1}&library=${library}&ln=${ln}"><img width="13" height="16"  src="${pageContext.request.contextPath}/image/bookTotalSearch/prevPage.gif" alt="이전" title="이전"></a></li>
				</c:if>

				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li><a class="cur" title="${i }" href="./bookOrderTotalList.book?curPage=${i}&library=${library}&ln=${ln}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${page.curBlock < page.totalBlock}">
				<li><a href="./bookOrderTotalList.book?curPage=${requestScope.page.lastNum+1}&library=${library}&ln=${ln}"><img width="13" height="16" src="${pageContext.request.contextPath}/image/bookTotalSearch/nextPage.gif" alt="다음" title="다음"></a></li>
				</c:if>
			</ul>
		</div>
		
		</div>
	</section>

<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>