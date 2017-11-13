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
<h2>book buy wish list</h2>
<form action="./bookBuyWishDelete.market" method="POST">
   <table class="table" border="1">
      <tr>
         <th>전체선택<input type="checkbox" class="chk" id="checkAll" name="checkAll"></th>
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
            <td><input type="checkbox" name="Pcheck" class="chk" value="${bookOrderWish_list.num }"></td>
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
            <td><a href="./bookBuyWishDelete.market?num=${bookOrderWish_list.num }"><input type="button" value="삭제"></a></td>
            <c:choose>
            	<c:when test="${bookOrderWish_list.state eq 10 }">
                  <td>구매완료</td>
               </c:when>
               <c:when test="${bookOrderWish_list.state eq 1 }">
                  <td>구매불가</td>
               </c:when>
               <c:when test="${bookOrderWish_list.state eq 2 }">
                  <td><a href="./bookBuy.market?num=${bookOrderWish_list.num }"><input type="button" value="구매"></a></td>
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
            href="./bookBuyWishList.market?curPage=${i}&id=${id }">${i}</a></li>
         </c:forEach>
         <c:if test="${page.curBlock < page.totalBlock}">
         <li><a
            href="./bookBuyWishList.market?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
         </c:if>
      </ul>
   </div>
</body>
</html>