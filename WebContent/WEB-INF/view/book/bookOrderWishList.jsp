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
<script type="text/javascript">
$(document).ready(function() {
	$("#checkAll").click(function() {
		if($("#checkAll").prop("checked")){
			$("input[name=Pcheck]").prop("checked",true);
		}else{
			$("input[name=Pcheck]").prop("checked",false);
		}
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<h2>Book Order List-Book_Order</h2>
<form action="./bookOrderWishDelete.book?library=${library}" method="POST">
	<table class="table" border="1">
		<tr>
			<th>전체선택<input type="checkbox" id="checkAll"></th>
			<th>num</th>
			<th>title</th>
			<th>writer</th>
			<th>publish_date</th>
			<th>library</th>
			<th>price</th>
			<th></th>
			<th>state</th>
		</tr>
		<c:forEach items="${bookOrderWishList }" var="bookOrderWish_list">
			<tr>
				<td><input type="checkbox" name="Pcheck" value="${bookOrderWish_list.num }"></td>
				<td>${bookOrderWish_list.num }</td>
 				<td>${bookOrderWish_list.title }</td>
				<td>${bookOrderWish_list.writer }</td>
				<td>${bookOrderWish_list.publish_date }</td>
				<td>${bookOrderWish_list.library }</td>
				<td>${bookOrderWish_list.price }</td>
				<td><a href="./bookOrderWishDelete.book?num=${bookOrderWish_list.num }"><input type="button" value="삭제"></a></td>
				<c:choose>
					<c:when test="${bookOrderWish_list.state eq 1 }">
						<td>대여불가</td>
					</c:when>
					<c:when test="${bookOrderWish_list.state eq 2 }">
						<td><a href=""><input type="button" value="대여"></a></td>
					</c:when>
				</c:choose>
			</tr>
		</c:forEach>
		<tr>
			<td><button type="submit" id="Pdelete">삭제 </button></td>
		</tr>
	</table>
</form>
	
	<div>
		<ul class="pagination">
			<c:if test="${page.curBlock>1}">
			<li><button class="go" id="${page.startNum-1}">[이전]</button></li>
			</c:if>
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<li><a
				href="./bookOrderWishList.book?curPage=${i}&id=${id}&library=${library}">${i}</a></li>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./bookOrderWishList.book?curPage=${requestScope.page.lastNum+1}&library=${library}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	
<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>