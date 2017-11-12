<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<html>
</head>
<body>
	<h2>MyPage - Book Order List</h2>
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
						<input type="submit" class="btn btn-default" value="search">
					</div>
				</div>
			</div>
		</form>
	</div>
	<h2>Book Order List-Book_Order</h2>
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
</body>
</html>