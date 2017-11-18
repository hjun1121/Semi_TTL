<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/market/marketOrderList.css">
<script type="text/javascript">
$(function(){
	 var kind = '${kind}';
	 
	 $(".kind").each(function(){
		 if($(this).val() == kind) {
			 $(this).attr("selected", true);
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
		<h2 id="divTitle">중고 책거래 내역</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="../index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>중고 책거래 내역</li>
			</ul>
		</div>

	<div>
		<form name="frm" class="form-inline" action="./marketOrderList.market"
			method="post">
			<div>
				<span> <select name="kind" id="kind">
						<option value="title" class="kind">제목</option>
						<option value="writer" class="kind">저자</option>
						<option value="company" class="kind">출판사</option>
				</select> <input type="text" class="form-control" id="search"
					placeholder="Enter" name="search" value="${search }">
				</span>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-default" value="search">
					</div>
				</div>
			</div>
		</form>
	</div>
	<table class="table" border="1">
		<tr>
			<th>num</th>
			<th>title</th>
			<th>writer</th>
			<th>company</th>
			<th>publish_date</th>
			<th>price</th>
			<th>library</th>
			<th>approval</th>
		</tr>
		<c:forEach items="${marketOrderList }" var="marketOrderList">
			<tr>
				<td>${marketOrderList.num }</td>
				<td>${marketOrderList.title }</td>
				<td>${marketOrderList.writer }</td>
				<td>${marketOrderList.company }</td>
				<td>${marketOrderList.publish_date }</td>
				<td>${marketOrderList.price }</td>
				<c:choose>
					<c:when test="${marketOrderList.library eq 1}">
						<td>기흥구</td>
					</c:when>
					<c:when test="${marketOrderList.library eq 2}">
						<td>송파구</td>
					</c:when>
					<c:when test="${marketOrderList.library eq 3}">
						<td>장안구</td>
					</c:when>
					<c:when test="${marketOrderList.library eq 4}">
						<td>분당구</td>
					</c:when>
					<c:otherwise>
						<td>없음</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${marketOrderList.approval eq 0}">
						<td>거절</td>
					</c:when>
					<c:when test="${marketOrderList.approval eq 1}">
						<td>대기</td>
					</c:when>
					<c:when test="${marketOrderList.approval eq 10}">
						<td>수락</td>
					</c:when>
					<c:otherwise>
						<td>없음</td>
					</c:otherwise>
				</c:choose>
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
				href="./marketOrderList.market?curPage=${i}&id=${id }&kind=${kind}&search=${search}">${i}</a></li>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./marketOrderList.market?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	
	</div>
</div>		
	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>