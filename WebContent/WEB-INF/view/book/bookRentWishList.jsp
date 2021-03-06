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
<title>도서 대여 찜 리스트</title>
<script type="text/javascript">
$(function(){	
	$(".cur").each(function(){
		 if($(this).attr("title") == ${curPage }) {
			 $(this).attr("style", "color:red;");
		 }
	 });
	
	
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
</head>
<body>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp?ln=${ln}"></c:import>
</div>


<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">대여 찜콩</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp?ln=${ln}"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>대여 찜콩 내역</li>
			</ul>
		</div>
	<c:if test="${size eq 0 }">
		<h2 id="divTitle">대여 찜콩 내역이 없습니다.</h2>
	</c:if>
	<c:if test="${size ne 0 }">
	<form action="./bookRentWishDelete.book?ln=${ln}" method="POST">
		<div class="listTable">
		<table class="mobileTable tablet" >
		<tr>
			<th>전체선택 <input type="checkbox" class="chk" id="checkAll" name="checkAll"></th>
			<th>No.</th>
			<th>서명</th>
			<th>저자</th>
			<th>출판사</th>
			<th>출판년도</th>
			<th>구역</th>
			<th>비치도서관</th>
			<th>상태</th>
			<th></th>
		</tr>
		<c:forEach items="${bookRentWishList}" var="bookRentWishList" varStatus="count">
			<tr>
				<td scope="row" style="display: table-cell;">
				<input type="checkbox" class="chk" name="Pcheck" value="${bookRentWishList.num }">
				</td>
				<td scope="row" class="footable-first-column">${count.count }</td>
 				<td scope="row" style="display: table-cell;">
 				<a href="./bookRentWishDetails.book?num=${bookRentWishList.num }&ln=${ln}">${bookRentWishList.title }</a>
 				</td>
				<td scope="row" style="display: table-cell;">${bookRentWishList.writer }</td>
				<td scope="row" style="display: table-cell;">${bookRentWishList.company }</td>
				<td scope="row" data-class="expand">${bookRentWishList.publish_date }</td>
 				<td scope="row" style="display: table-cell;">${bookRentWishList.section }</td>
				<c:choose>
					<c:when test="${bookRentWishList.library eq 1}">
						<td scope="row" style="display: table-cell;">기흥구</td>
					</c:when>
					<c:when test="${bookRentWishList.library eq 2}">
						<td scope="row" style="display: table-cell;">송파구</td>
					</c:when>
					<c:when test="${bookRentWishList.library eq 3}">
						<td scope="row" style="display: table-cell;">장안구</td>
					</c:when>
					<c:when test="${bookRentWishList.library eq 4}">
						<td scope="row" style="display: table-cell;">분당구</td>
					</c:when>
					<c:otherwise>
						<td scope="row" style="display: table-cell;">*</td>
					</c:otherwise>
				</c:choose>
			
				<c:choose>
					<c:when test="${bookRentWishList.state eq 1}">
						<td scope="row" style="display: table-cell;">대여중</td>
						<td> </td>
					</c:when>
					<c:when test="${bookRentWishList.state eq 0}">
						<td> </td>
						<td scope="row" style="display: table-cell;">
						<a href="./bookRentWishRent.book?num=${bookRentWishList.num }&rent_id=${id}&ln=${ln}">
						<button class = "btn btn-default wish_btn" type = "button" >대여</button></a></td>
					</c:when>
					<c:otherwise>
						<td scope="row" style="display: table-cell;">없음</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
		<tr>
			<td class="btnTD"><button type="submit" id="Pdelete" class="btn btn-default list_btn">삭제 </button></td>
		</tr>
	</table>
	
	</form>
	
	<div class = "paging" style = "text-align: center;">
			<ul class="pagination pagination-sm">
			<c:if test="${page.curBlock>1}">
			<li><button class="go" id="${page.startNum-1}">[이전]</button></li>
			</c:if>
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<li><a class="cur" title="${i }" href="./bookRentWishList.book?curPage=${i}&id=${id }&library=${library}&ln=${ln}">${i}</a></li>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./bookRentWishList.book?curPage=${requestScope.page.lastNum+1}&library=${library}&ln=${ln}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	
	</c:if>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	</div>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>