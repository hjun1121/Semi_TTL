<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Book Information</title>
<script type="text/javascript">

$(function(){
	
	$("#btn").click(function() {
		$.ajax({
			url: "./bookRent.book",
			type: "GET",
			data: {
				num:${book.num},
				rent_id:'${member.id}'
			},
			success: function(data) {
				alert(data);
				location.href="./bookTotalSearch.book";
			}
		});
	});
	
	$(".wish_btn").click(function() {
		var num = $(this).val();
		var title = $(this).attr("title");

		if (title == 1) {
			$.ajax({
				url: "./bookRentWishReturn.book",
				type: "GET",
				data: {
					num:num,
					rent_id: '${member.id}'
				},
				success: function(data) {
					alert(data);
					location.href="./bookInformation.book?num=${num}";
				}
			});

		} else if (title == 0) {
			$.ajax({
				url: "./bookRentWish.book",
				type: "GET",
				data: {
					num:num,
					rent_id:'${member.id}'
				},
				success: function(data) {
					alert(data);
					location.href="./bookInformation.book?num=${num}";
				}
			});
		}
	});

});
</script>

</head>
<body>
	<h2>책 상세정보 페이지</h2>
	<div style = "height: 30px"></div>
	<section>
			<table class="table">
				<tr>
					<td>번호</td>
					<td>서명</td>
					<td>저자</td>
					<td>출판사</td>
					<td>출판년도</td>
					<td>도서위치</td>
					<td>분류</td>
					<td>대여여부</td>
					<c:if test="${not empty member}">
						<td>찜</td>
					</c:if>
				</tr>
				<tr>
					<td>${ book.num }</td>
					<td>${ book.title }</td>
					<td>${ book.writer }</td>
					<td>${ book.company }</td>
					<td>${ book.publish_date }</td>
					<td>${ book.section }</td>
					<td>${ book.type }</td>
					<c:choose>
						<c:when test="${ book.state == 0 and not empty member }">
							<td><button class = "btn btn-default" type = "submit" id = "btn">대여</button></td>
						</c:when>
						<c:when test="${ book.state == 0 and empty member }">
							<td>대여가능</td>
						</c:when>
						<c:when test="${ book.state == 1 }">
							<td>대여불가</td>
						</c:when>
					</c:choose>
					<c:set var="heart1" value="0" ></c:set>
					<c:set var="heart2" value="0" ></c:set>
					<c:if test="${ not empty member }">
						<c:forEach items="${rent_wish_list}" var="wish">
							<c:if test="${wish.title eq book.title}">
								<c:choose>
									<c:when test="${heart1 == 0}">
										<td><button class = "btn btn-default wish_btn" type = "submit" value = "${book.num}" title="1">❤</button></td>
										<c:set var="heart1" value="1" ></c:set>
										<c:set var="heart2" value="1" ></c:set>
									</c:when>
								</c:choose>
							</c:if>
						</c:forEach>
							<c:if test="${heart2 == 0}">
								<td><button class = "btn btn-default wish_btn" type = "submit" value = "${book.num}" title="0">♡</button></td>
							</c:if>
					</c:if>
				</tr>
			</table>
	</section>
</body>
</html>