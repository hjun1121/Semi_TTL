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
<title>Insert title here</title>
<script type="text/javascript">

	$(function(){
		
		$(".wish_btn").click(function() {
			var num = $(this).val();
			var title = $(this).attr("title");

			if (title == 1) {
				$.ajax({
					url: "./bookBuyWishReturn.market",
					type: "GET",
					data: {
						num:num,
						curPage: ${curPage},
						id: '${member.id}'
					},
					success: function(data) {
						alert(data);
						location.href="./marketTotalList.market?curPage=${curPage}";
					}
				});

			} else if (title == 0) {
				$.ajax({
					url: "./bookBuyWish.market",
					type: "GET",
					data: {
						num:num,
						curPage: ${curPage},
						id: '${member.id}'
					},
					success: function(data) {
						alert(data);
						location.href="./marketTotalList.market?curPage=${curPage}";
					}
				});
			}
		});
		
	});

</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

	<h2>MarketTotal List</h2>
	<table id = "marketList" class="kind" border="1">
			<tr>
				<th>num</th>
				<th>title</th>
				<th>writer</th>
				<th>company</th>
				<th>publish_date</th>
				<th>library</th>
				<th>price</th>
				<th>id</th>
				<th>wish</th>
				<th>approval</th>
				<th>book_state</th>
				<c:if test="${ not empty member }">
					<td>찜</td>
				</c:if>
				<th>*****</th>
			</tr>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.num }</td>
					<td><a href="./marketTotalView.market?num=${dto.num }">${dto.title }</a></td>
					<td>${dto.writer }</td>
					<td>${dto.company }</td>
					<td>${dto.publish_date }</td>
					<td>${dto.library }</td>
					<td>${dto.price }</td>
					<td>${dto.id }</td>
					<td>${dto.wish }</td>
					<td>${dto.approval }</td>
					<td>${dto.book_state }</td>
			<c:set var="heart1" value="0" ></c:set>
			<c:set var="heart2" value="0" ></c:set>
			<c:if test="${ not empty member }">
				<c:forEach items="${buy_wish_list}" var="wish">
					<c:if test="${wish.num eq dto.num}">
						<c:choose>
							<c:when test="${heart1 == 0}">
								<td><button class = "wish_btn" type = "submit" value = "${dto.num}" title="1">❤</button></td>
								<c:set var="heart1" value="1" ></c:set>
								<c:set var="heart2" value="1" ></c:set>
							</c:when>
						</c:choose>
					</c:if>
				</c:forEach>
					<c:if test="${heart2 == 0}">
						<td><button class = "wish_btn" type = "submit" value = "${dto.num}" title="0">♡</button></td>
					</c:if>
			</c:if>
			</tr>
					<td><a href="./bookBuy.market?num=${dto.num }"><input type="button" value="구매"></a></td>
			</c:forEach>
		</table>
		<div style = "text-align: center;">
			<ul class="pagination pagination-sm">
				<c:if test="${page.curBlock>1}">
				<li><a href = "./marketTotalList.market?curPage=${page.startNum-1}">[이전]</a></li>
				</c:if>
				
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li><a id="pa" href="./marketTotalList.market?curPage=${i}">${i}</a></li>
				</c:forEach>

				<c:if test="${page.curBlock < page.totalBlock}">
				<li><a href="./marketTotalList.market?curPage=${page.lastNum+1}">[다음]</a></li>
				</c:if>
			</ul>
		</div>
		
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>











