<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	 var kind = '${kind}';
	 
	 $(".kind").each(function(){
		 if($(this).val() == kind) {
			 $(this).attr("selected", true);
		 }
	 });

	$(".rent_btn").click(function() {
		var num = $(this).val();
		$.ajax({
			url: "../bookRent.book",
			type: "GET",
			data: {
				num:num,
				kind:'${kind}',
				curPage: ${curPage},
				search: '${search}',
				library: ${library},
				rent_id:'${member.id}'
			},
			success: function(data) {
				alert(data);
				location.href="./libraryBookSearch.library?library=${library}&search=${search}&curPage=${curPage}&kind=${kind}";
			}
		});
	});

	$(".wish_btn").click(function() {
		var num = $(this).val();
		$.ajax({
			url: "../bookRentWish.book",
			type: "GET",
			data: {
				num:num,
				kind:'${kind}',
				curPage: ${curPage},
				search: '${search}',
				library: ${library},
				id:'${member.id}'
			},
			success: function(data) {
				alert(data);
				location.href="./libraryBookSearch.library?library=${library}&search=${search}&curPage=${curPage}&kind=${kind}";
			}
		});
	});

});

</script>
</head>
<body>

	<h2>도서 검색 페이지</h2>

	<section>

		<div class="row-right">
			<form name="frm" class="form-inline" action="./libraryBookSearch.library?library=${library}" method="post">
					<!-- KIND -->
					<div class="form-group">
						<div class="col-sm-10">
							<select name="kind" id = "kind">
								<option class = "kind" value="title">제목</option>
								<option class = "kind" value="writer">저자</option>
								<option class = "kind" value="company">출판사</option>
								<option class = "kind" value="type">분류</option>
							</select>
						</div>
					</div>

					<!-- SEARCH -->
					<div class="form-group">
						<div class="col-sm-10">
							<input type="text" class="form-control" id="search" placeholder="Enter" name="search" value = "${search}">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" id = "search" class="btn btn-default" value="Search">
						</div>
					</div>
			</form>

				<table class = "table">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>저자</td>
						<td>출판사</td>
						<td>분류</td>
						<td>대여여부</td>
<!-- 						<td>찜하기</td> -->
					</tr>
					<c:forEach items="${ list }" var="dto">
							<tr>
								<td>${dto.num }</td>
								<td><a href="../book/bookInformation.book?num=${dto.num}&rent_id=${member.id}">${dto.title}</a></td>
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
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${ not empty member }"> --%>
<%-- 										<td><button class = "btn btn-default wish_btn"  type = "submit" id = "wish_btn" value = "${dto.num}">♡</button></td> --%>
<%-- 									</c:when> --%>
<%-- 									<c:when test="${ empty member }"> --%>
<!-- 										<td>❤</td> -->
<%-- 									</c:when> --%>
<%-- 								</c:choose> --%>
							</tr>
					</c:forEach>
				</table>

		</div>

		<div style = "text-align: center;">
			<ul class="pagination pagination-sm">
				<c:if test="${page.curBlock>1}">
				<li><a href = "./libraryBookSearch.library?curPage=${page.startNum-1}&search=${search}&kind=${kind}">[이전]</a></li>
				</c:if>
				
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li><a
					href="./libraryBookSearch.library?curPage=${i}&search=${search}&kind=${kind}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${page.curBlock < page.totalBlock}">
				<li><a
					href="./libraryBookSearch.library?curPage=${requestScope.page.lastNum+1}&search=${search}&kind=${kind}">[다음]</a></li>
				</c:if>
			</ul>
		</div>

	</section>

</body>
</html>