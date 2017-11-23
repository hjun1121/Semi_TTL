<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){

	$(".rent_btn").click(function() {
		var num = $(this).val();
		$.ajax({
			url: "../book/bookRent.book?ln=${ln}",
			type: "GET",
			data: {
				num:num,
				kind:'${kind}',
				curPage: ${curPage},
				search: '${search}',
				library: ${library},
				rent_id:'${member.id}',
				ln: ${ln}
			},
			success: function(data) {
				alert(data);
				location.href="./libraryBookSearch.library?library=${library}&curPage=${curPage}&ln=${ln}";
			}
		});
	});

	$(".wish_btn").click(function() {
		var num = $(this).val();
		var title = $(this).attr("title");
		
		if (title == 1) {
			$.ajax({
				url: "../book/bookRentWishReturn.book?ln=${ln}",
				type: "GET",
				data: {
					num:num,
					curPage: ${curPage},
					library: ${library},
					rent_id: '${member.id}',
					ln: ${ln}
				},
				success: function(data) {
					alert(data);
					location.href="./libraryBookRecommend.library?library=${library}&curPage=${curPage}&ln=${ln}";
				}
			});

		} else if (title == 0) {
			$.ajax({
				url: "../book/bookRentWish.book?ln=${ln}",
				type: "GET",
				data: {
					num:num,
					curPage: ${curPage},
					library: ${library},
					rent_id:'${member.id}',
					ln: ${ln}
				},
				success: function(data) {
					alert(data);
					location.href="./libraryBookRecommend.library?library=${library}&curPage=${curPage}&ln=${ln}";
				}
			});
		}
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

	<section>

		<div class="row-right">
				<table class = "table">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>저자</td>
						<td>출판사</td>
						<td>분류</td>
						<td>대여여부</td>
						<c:if test="${ not empty member }">
							<td>찜하기</td>
						</c:if>
					</tr>
					<c:forEach items="${ list }" var="dto">
							<tr>
								<td>${dto.num }</td>
								<td><a href="../book/bookInformation.book?num=${dto.num}&library=${library}&ln=${ln}">${dto.title}</a></td>
								<td>${dto.writer }</td>
								<td>${dto.company }</td>
								<td>${dto.type }</td>

								<c:choose>
									<c:when test="${ dto.state == 0 and not empty member }">
										<td><button class = "btn btn-default rent_btn"  type = "submit" id = "rent_btn" value = "${dto.num}">대여</button></td>
									</c:when>
									<c:when test="${ dto.state == 0 and empty member }">
										<td>대여가능</td>
									</c:when>
									<c:when test="${ dto.state == 1 }">
										<td>대여불가</td>
									</c:when>
								</c:choose>
								<c:set var="heart1" value="0" ></c:set>
								<c:set var="heart2" value="0" ></c:set>
								<c:if test="${ not empty member }">
									<c:forEach items="${rent_wish_list}" var="wish">
										<c:if test="${wish.title eq dto.title}">
											<c:choose>
												<c:when test="${heart1 == 0}">
													<td><button class = "btn btn-default wish_btn" type = "submit" value = "${dto.num}" title="1">❤</button></td>
													<c:set var="heart1" value="1" ></c:set>
													<c:set var="heart2" value="1" ></c:set>
												</c:when>
											</c:choose>
										</c:if>
									</c:forEach>
										<c:if test="${heart2 == 0}">
											<td><button class = "btn btn-default wish_btn" type = "submit" value = "${dto.num}" title="0">♡</button></td>
										</c:if>
								</c:if>
							</tr>
					</c:forEach>
				</table>
		</div>

		<div style = "text-align: center;">
			<ul class="pagination pagination-sm">
				<c:if test="${page.curBlock>1}">
				<li><a href = "./libraryBookRecommend.library?curPage=${page.startNum-1}&library=${library}&ln=${ln}">[이전]</a></li>
				</c:if>
				
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li><a
					href="./libraryBookRecommend.library?curPage=${i}&library=${library}&ln=${ln}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${page.curBlock < page.totalBlock}">
				<li><a
					href="./libraryBookRecommend.library?curPage=${requestScope.page.lastNum+1}&library=${library}&ln=${ln}">[다음]</a></li>
				</c:if>
			</ul>
		</div>

	</section>

<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>