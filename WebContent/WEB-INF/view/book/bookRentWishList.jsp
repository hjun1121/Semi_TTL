<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#checkAll").click(function() {
		if($("#checkAll").prop("checked")){
			$("input[name=Pcheck]").prop("checked",true);
		}else{
			$("input[name=Pcheck]").prop("checked",false);
		}
	});
	$(".chk").click(function() {
		var boxAll = $('input:checkbox[name=Pcheck]').length
		var boxSelect = $("input:checkbox[name=Pcheck]:checked").length
		$("[name=Pcheck]").each(function(){
			if(boxAll==boxSelect){
				$("input[name=checkAll]").prop("checked",true);
			}else if(boxAll!=boxSelect){
				$("input[name=checkAll]").prop("checked",false);
			}
		});
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
	<h2>Book Rent List-Book_Order</h2>
	<form action="./bookRentWishDelete.book" method="POST">
		<table class="table" border="1">
			<tr>
				<th>전체선택<input type="checkbox" class="chk" id="checkAll" name="checkAll"></th>
				<th>num</th>
				<th>title</th>
				<th>writer</th>
				<th>company</th>
				<th>publish_date</th>
				<th>section</th>
				<th>library</th>
				<th>state</th>
				<th></th>
			</tr>
			<c:forEach items="${bookRentWishList }" var="bookRentWish_list">
				<tr>
					<td><input type="checkbox" class="chk" name="Pcheck" value="${bookRentWish_list.num }"></td>
					<td>${bookRentWish_list.num }</td>
					<td>${bookRentWish_list.title }</td>
					<td>${bookRentWish_list.writer }</td>
					<td>${bookRentWish_list.company }</td>
					<td>${bookRentWish_list.publish_date }</td>
					<td>${bookRentWish_list.section }</td>
					<c:choose>
		            	<c:when test="${bookRentWish_list.library eq 1}">
							<td>기흥구</td>
						</c:when>
						<c:when test="${bookRentWish_list.library eq 2}">
							<td>송파구</td>
						</c:when>
						<c:when test="${bookRentWish_list.library eq 3}">
							<td>장안구</td>
						</c:when>
						<c:when test="${bookRentWish_list.library eq 4}">
							<td>분당구</td>
						</c:when>
						<c:otherwise>
							<td>없음</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
		            	<c:when test="${bookRentWish_list.state eq 0}">
							<td>대여중</td>
						</c:when>
						<c:when test="${bookRentWish_list.state eq 1}">
							<td><a href=""><input type="button" value="대여"></a></td>
						</c:when>
						<c:otherwise>
							<td>없음</td>
						</c:otherwise>
					</c:choose>
					
					<td><a href="./bookRentWishDelete.book?num=${bookRentWish_list.num }"><input type="button" value="삭제"></a></td>
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
				href="./bookRentWishList.book?curPage=${i}&id=${id }">${i}</a></li>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./bookRentWishList.book?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>