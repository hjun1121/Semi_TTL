<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookOrderList.css">
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
		<h2 id="divTitle">책 신청 내역</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="../index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>책 신청 내역</li>
			</ul>
		</div>

	<div>
		<form name="frm" class="form-inline" action="./bookOrderList.book"
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
						<input type="submit" class="btn btn-default">
					</div>
				</div>
			</div>
		</form>
	</div>
	<a href="./bookOrderList.book?id=${member.id }&state=1&kind=${kind}&search=${search}"><input type="button" value="대기"></a>
	<a href="./bookOrderList.book?id=${member.id }&state=0&kind=${kind}&search=${search}"><input type="button" value="취소"></a>
	<a href="./bookOrderList.book?id=${member.id }&state=2&kind=${kind}&search=${search}"><input type="button" value="승인"></a>
	<a href="./bookOrderList.book?id=${member.id }&state=3&kind=${kind}&search=${search}"><input type="button" value="전체"></a>
	<table class="table" border="1">
		<tr>
			<th>num</th>
			<th>title</th>
			<th>writer</th>
			<th>company</th>
			<th>publish_date</th>
			<th>price</th>
			<th>library</th>
			<th>state</th>
			<th>cancel</th>
		</tr>
		<c:forEach items="${bookOrderList }" var="bookOrder_list">
			<tr>
				<td>${bookOrder_list.num }</td>
				<td><a
					href="./bookOrderDetails.book?num=${bookOrder_list.num }">${bookOrder_list.title }</a></td>
				<td>${bookOrder_list.writer }</td>
				<td>${bookOrder_list.company }</td>
				<td>${bookOrder_list.publish_date }</td>
				<td>${bookOrder_list.price }</td>
				<c:choose>
					<c:when test="${bookOrder_list.library eq 1}">
						<td>기흥구</td>
					</c:when>
					<c:when test="${bookOrder_list.library eq 2}">
						<td>송파구</td>
					</c:when>
					<c:when test="${bookOrder_list.library eq 3}">
						<td>장안구</td>
					</c:when>
					<c:when test="${bookOrder_list.library eq 4}">
						<td>분당구</td>
					</c:when>
					<c:otherwise>
						<td>없음</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${bookOrder_list.state eq 0}">
						<td>취소</td>
						<td>${bookOrder_list.cancel }</td>
					</c:when>
					<c:when test="${bookOrder_list.state eq 1}">
						<td>대기</td>
						<td>-</td>
					</c:when>
					<c:otherwise>
						<td>승인</td>
						<td>-</td>
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
					href="./bookOrderList.book?curPage=${i}&id=${id }&kind=${kind}&search=${search}">${i}</a></li>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
				<li><a
					href="./bookOrderList.book?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	
	</div>
</div>	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>