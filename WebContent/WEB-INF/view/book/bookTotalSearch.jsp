<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookTotalSearch.css">
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
			url: "./bookRent.book",
			type: "GET",
			data: {
				num:num,
				kind:'${kind}',
				curPage: ${curPage},
				search: '${search}',
				rent_id:'${member.id}'
			},
			success: function(data) {
				alert(data);
				location.href="./bookTotalSearch.book?search=${search}&curPage=${curPage}&kind=${kind}";
			}
		});
	});
	
	$(".wish_btn").click(function() {
		var num = $(this).val();
		var title = $(this).attr("title");
		
		if (title == 1) {
			$.ajax({
				url: "../book/bookRentWishReturn.book",
				type: "GET",
				data: {
					num:num,
					kind:'${kind}',
					curPage: ${curPage},
					search: '${search}',
					rent_id:'${member.id}'
				},
				success: function(data) {
					alert(data);
					location.href="./bookTotalSearch.book?&search=${search}&curPage=${curPage}&kind=${kind}";
				}
			});

		} else if (title == 0) {
			$.ajax({
				url: "../book/bookRentWish.book",
				type: "GET",
				data: {
					num:num,
					kind:'${kind}',
					curPage: ${curPage},
					search: '${search}',
					rent_id:'${member.id}'
				},
				success: function(data) {
					alert(data);
					location.href="./bookTotalSearch.book?&search=${search}&curPage=${curPage}&kind=${kind}";
				}
			});
		}
	});

 });
</script>
</head>
<body>
<!-- header -->
<c:import url="${myContextPath}/temp/header.jsp"></c:import>
<!-- header -->

	<div style = "height: 50px"></div>

	<section>
		<div id = "bts_top_section">
			<h2 id="divTitle">소장도서</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="../../index.jsp"><img src="${pageContext.request.contextPath}/image/bookTotalSearch/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>통합검색</li>
					<li>&gt;</li>
					<li>소장도서</li>
				</ul>
			</div>

		<!-- 검색 시작 -->
		<form name="frm" class="form-inline" action="./bookTotalSearch.book" method="post">
			<fieldset>
				<span class="bunch">
					<select id="kind" name = "kind" class="selectBox1">
						<option class = "kind" value="title">서명</option>
						<option class = "kind" value="writer">저자</option>
						<option class = "kind" value="company">출판사</option>
						<option class = "kind" value="type">분류</option>
					</select>
				<input type="text" id = "search" name = "search" value = "${search}" class="inputTextType3 sw" maxlength="100" title="검색어" placeholder="검색어를 입력하세요">
				</span>
				<input type="submit" class="btnType5" value="검색" id = "search">
			</fieldset>
		</form>
		<!-- 검색 끝 -->
		<br>
		
		<div class="listTable">
			<table class="mobileTable tablet">
				<thead>
					<tr>
						<th scope="row" class="footable-first-column">No.</th>
						<th scope="row" data-class="expand">서명</th>
						<th scope="row" style="display: table-cell;">저자</th>
						<th scope="row" style="display: table-cell;">출판사</th>
						<th scope="row" style="display: table-cell;">비치도서관</th>
						<th scope="row" style="display: table-cell;">대여여부</th>
						<c:if test="${ not empty member }">
							<th scope="row" style="display: table-cell;">찜</th>
						</c:if>
					</tr>
				</thead>
										
				<c:forEach items="${ list }" var="dto">
					<tr>
						<td scope="row" class="footable-first-column">${dto.num }</td>
						<td scope="row" data-class="expand"><a href="./bookInformation.book?num=${dto.num}&curPage=${curPage}">${dto.title }</a></td>
						<td scope="row" style="display: table-cell;">${dto.writer }</td>
						<td scope="row" style="display: table-cell;">${dto.company }</td>

						<c:choose>
							<c:when test="${dto.library == 1 }"><td scope="row" style="display: table-cell;"><a href="../library/libraryMain.library?library=1">kim_lib</a></td></c:when>
							<c:when test="${dto.library == 2 }"><td scope="row" style="display: table-cell;"><a href="../library/libraryMain.library?library=2">gee_lib</a></td></c:when>
							<c:when test="${dto.library == 3 }"><td scope="row" style="display: table-cell;"><a href="../library/libraryMain.library?library=3">hs_lib</a></td></c:when>
							<c:when test="${dto.library == 4 }"><td scope="row" style="display: table-cell;"><a href="../library/libraryMain.library?library=4">ssin_lib</a></td></c:when>
						</c:choose>
						<c:choose>
							<c:when test="${ dto.state == 0 and not empty member }">
								<td scope="row" style="display: table-cell;"><button class = "btn btn-default rent_btn"  type = "submit" id = "rent_btn" value = "${dto.num}">대여</button></td>
							</c:when>
							<c:when test="${ dto.state == 0 and empty member }"><td scope="row" style="display: table-cell;">대여가능</td></c:when>
							<c:when test="${ dto.state == 1 }"><td scope="row" style="display: table-cell;">대여불가</td></c:when>
						</c:choose>
						<c:set var="heart1" value="0" ></c:set>
						<c:set var="heart2" value="0" ></c:set>
						<c:if test="${ not empty member }"><c:forEach items="${rent_wish_list}" var="wish">
								<c:if test="${wish.title eq dto.title}">										<c:choose>
										<c:when test="${heart1 == 0}">
											<td scope="row" style="display: table-cell;"><button class = "btn btn-default wish_btn" type = "submit" value = "${dto.num}" title="1">❤</button></td>
											<c:set var="heart1" value="1" ></c:set>
											<c:set var="heart2" value="1" ></c:set>
										</c:when>
									</c:choose>
								</c:if>
							</c:forEach>
								<c:if test="${heart2 == 0}">
									<td scope="row" style="display: table-cell;"><button class = "btn btn-default wish_btn" type = "submit" value = "${dto.num}" title="0">♡</button></td>
								</c:if>
						</c:if>
					</tr>
				</c:forEach>

			</table>
		</div>
		
		<div class = "paging" style = "text-align: center;">
			<ul class="pagination pagination-sm">
				<c:if test="${page.curBlock>1}">
				<li><a href = "./bookTotalSearch.book?curPage=${page.startNum-1}&search=${search}&kind=${kind}"><img width="13" height="17"  src="${pageContext.request.contextPath}/image/bookTotalSearch/prevPage.gif" alt="이전" title="이전"></a></li>
				</c:if>

				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li><a
					href="./bookTotalSearch.book?curPage=${i}&search=${search}&kind=${kind}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${page.curBlock < page.totalBlock}">
				<li><a href="./bookTotalSearch.book?curPage=${requestScope.page.lastNum+1}&search=${search}&kind=${kind}"><img width="13" height="17" src="${pageContext.request.contextPath}/image/bookTotalSearch/nextPage.gif" alt="다음" title="다음"></a></li>
				</c:if>
			</ul>
		</div>
		
<!-- 		<div class="paging"> -->
<!-- 			<ul class="pagination pagination-sm"> -->
<%-- 				<a href="#" class="page" title="처음"><img src="${pageContext.request.contextPath}/image/bookTotalSearch/nextPage.gif" alt="다음" title="다음"></a> --%>
<%-- 				<a href="./bookTotalSearch.book?curPage=${page.startNum-1}&search=${search}&kind=${kind}" class="page" title="이전"><img src="${pageContext.request.contextPath}/image/bookTotalSearch/lastPage.gif" alt="맨뒤" title="맨뒤"></a> --%>
			
<%-- 					<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i"> --%>
<!-- 					<li><a -->
<%-- 						href="./bookTotalSearch.book?curPage=${i}&search=${search}&kind=${kind}">${i}</a></li> --%>
<%-- 					</c:forEach> --%>
			
<%-- 				<a href="#" class="page" title="다음"><img src="${pageContext.request.contextPath}/image/bookTotalSearch/nextPage.gif" alt="다음" title="다음"></a> --%>
<%-- 				<a href="#" class="page" title="맨뒤"><img src="${pageContext.request.contextPath}/image/bookTotalSearch/lastPage.gif" alt="맨뒤" title="맨뒤"></a> --%>
<!-- 			</ul> -->
<!-- 		</div>	 -->
		
	    </div>
	</section>


<!-- footer -->
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
<!-- footer -->

</body>
</html>