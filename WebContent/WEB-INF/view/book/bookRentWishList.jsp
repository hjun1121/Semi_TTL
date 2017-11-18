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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookRentWishList.css">
<title></title>
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
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp"></c:import>
</div>


<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">책 대여 찜</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="../index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>책 대여 찜</li>
			</ul>
		</div>

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
		            	<c:when test="${bookRentWish_list.state eq 1}">
							<td>대여중</td>
						</c:when>
						<c:when test="${bookRentWish_list.state eq 0}">
							<td><a href="./bookRentWishRent.book?num=${bookRentWish_list.num }&rent_id=${id}&library=${bookRentWish_list.library}"><input type="button" value="대여"></a></td>
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
	
	</div>
</div>	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>