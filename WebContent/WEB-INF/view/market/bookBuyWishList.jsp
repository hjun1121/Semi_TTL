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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/market/bookBuyWishList.css">
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
<title>도서 구매 희망 리스트</title>
</head>
<body>
<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp"></c:import>
</div>


<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">MARKET 찜콩</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="../index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>MARKET 찜콩</li>
			</ul>
		</div>
	<br><br>
	<c:if test="${size eq 0 }">
		<h2 id="divTitle">MARKET 찜콩 내역이 없습니다.</h2>
		<br><br><br>
	</c:if>
	<c:if test="${size ne 0 }">
<form action="./bookBuyWishDelete.market?library=${library}" method="POST">
		<div class="listTable">
		<table class="mobileTable tablet" >
		<tr>
			<th>전체선택 <input type="checkbox" class="chk" id="checkAll" name="checkAll"></th>
			<th>No.</th>
			<th>서명</th>
			<th>저자</th>
			<th>출판사</th>
			<th>출판년도</th>
			<th>비치도서관</th>
			<th>가격</th>
			<th></th>
			<th>상태</th>
		</tr>
		<c:forEach items="${bookBuyWishList }" var="bookBuyWishList">
			<tr>
				<td scope="row" style="display: table-cell;">
				<input type="checkbox" name="Pcheck" class="chk" value="${bookBuyWishList.num }">
				</td>
				<td scope="row" class="footable-first-column">${bookBuyWishList.num }</td>
 				<td scope="row" style="display: table-cell;">${bookBuyWishList.title }</td>
				<td scope="row" style="display: table-cell;">${bookBuyWishList.writer }</td>
				<td scope="row" style="display: table-cell;">${bookBuyWishList.company }</td>
				<td scope="row" data-class="expand">${bookBuyWishList.publish_date }</td>
				<c:choose>
					<c:when test="${bookBuyWishList.library eq 1}">
						<td scope="row" style="display: table-cell;">기흥구</td>
					</c:when>
					<c:when test="${bookBuyWishList.library eq 2}">
						<td scope="row" style="display: table-cell;">송파구</td>
					</c:when>
					<c:when test="${bookBuyWishList.library eq 3}">
						<td scope="row" style="display: table-cell;">장안구</td>
					</c:when>
					<c:when test="${bookBuyWishList.library eq 4}">
						<td scope="row" style="display: table-cell;">분당구</td>
					</c:when>
					<c:otherwise>
						<td scope="row" style="display: table-cell;">*</td>
					</c:otherwise>
				</c:choose>
				<td scope="row" data-class="expand">${bookBuyWishList.price }</td>
				<td><a href="./bookBuyWishDelete.market?num=${bookBuyWishList.num }&library=${library}">
				<button class = "btn btn-default wish_btn" type = "button" >삭제</button>
				</a></td>
				<c:choose>
	            	<c:when test="${bookBuyWishList.state eq 10 }">
	                  <td scope="row" style="display: table-cell;">구매완료</td>
	               </c:when>
	               <c:when test="${bookBuyWishList.state eq 2 }">
	                  <td scope="row" style="display: table-cell;">구매불가</td>
	               </c:when>
	               <c:when test="${bookBuyWishList.state eq 1 }">
	                  <td>
	                  <a href="./bookBuy.market?num=${bookBuyWishList.num }&library=${library}">
	                  <button class = "btn btn-default wish_btn" type = "button" >구매</button>
						</a>
	                  </td>
	               </c:when>
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
         <li><a
            href="./bookBuyWishList.market?curPage=${i}&id=${id }&library=${library}">${i}</a></li>
         </c:forEach>
         <c:if test="${page.curBlock < page.totalBlock}">
         <li><a
            href="./bookBuyWishList.market?curPage=${requestScope.page.lastNum+1}&library=${library}">[다음]</a></li>
         </c:if>
      </ul>
 </div>
 </c:if>
	</div>
	</div>
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