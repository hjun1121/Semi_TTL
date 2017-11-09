<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var boxAll = $('input:checkbox[name="checkP"]').length
	var boxSelect = $("input:checkbox[name=checkP]:checked").length
	
	$("#checkAll").click(function() {
		if($("#checkAll").prop("checked")){
			$("input[name=checkP]").prop("checked",true);
		}else{
			$("input[name=checkP]").prop("checked",false);
		}
	});
   
	$("[name=checkP]").each(function(){
		$(this).click(function(){
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
<h2>Book Order List-Book_Order</h2>
<form action="./bookBuyWishDelete.book" method="POST">
<<<<<<< HEAD
   <table class="table" border="1">
      <tr>
         <th>전체선택<input type="checkbox" id="checkAll" name="checkAll"></th>
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
            <td><input type="checkbox" name="checkP" value="${bookOrderWish_list.num }"></td>
            <td>${bookOrderWish_list.num }</td>
             <td>${bookOrderWish_list.title }</td>
            <td>${bookOrderWish_list.writer }</td>
            <td>${bookOrderWish_list.publish_date }</td>
            <c:choose>
            	<c:when test="${bookOrderWish_list.library eq 1}">
					<td>기흥구</td>
				</c:when>
				<c:when test="${bookOrderWish_list.library eq 2}">
					<td>송파구</td>
				</c:when>
				<c:when test="${bookOrderWish_list.library eq 3}">
					<td>장안구</td>
				</c:when>
				<c:when test="${bookOrderWish_list.library eq 4}">
					<td>분당구</td>
				</c:when>
				<c:otherwise>
					<td>없음</td>
				</c:otherwise>
			</c:choose>
            <td>${bookOrderWish_list.price }</td>
            <td><a href="./bookBuyWishDelete.book?num=${bookOrderWish_list.num }"><input type="button" value="삭제"></a></td>
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
				<td><input type="checkbox" id="Pcheck${bookOrderWish_list.num }" name="Pcheck" value="${bookOrderWish_list.num }"></td>
				<td>${bookOrderWish_list.num }</td>
 				<td>${bookOrderWish_list.title }</td>
				<td>${bookOrderWish_list.writer }</td>
				<td>${bookOrderWish_list.publish_date }</td>
				<c:choose>
					<c:when test="${bookOrderWish_list.library eq 1}">
						<td>기흥구</td>
					</c:when>
					<c:when test="${bookOrderWish_list.library eq 2}">
						<td>송파구</td>
					</c:when>
					<c:when test="${bookOrderWish_list.library eq 3}">
						<td>장안구</td>
					</c:when>
					<c:when test="${bookOrderWish_list.library eq 4}">
						<td>분당구</td>
					</c:when>
					<c:otherwise>
						<td>없음</td>
					</c:otherwise>
				</c:choose>
				<td>${bookOrderWish_list.price }</td>
				<td><a href="./bookBuyWishDelete.book?num=${bookOrderWish_list.num }"><input type="button" value="삭제"></a></td>
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
            href="./bookBuyWishList.book?curPage=${i}&id=${id }">${i}</a></li>
         </c:forEach>
         <c:if test="${page.curBlock < page.totalBlock}">
         <li><a
            href="./bookBuyWishList.book?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
         </c:if>
      </ul>
   </div>
</body>
</html>