<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/temp/header.css">
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

<!-- header 시작 -->
	<c:import url="../../../temp/header.jsp"></c:import>
<!-- header 끝 -->

	<section>
	
		<div id="divContentsW">
			<div id="divContents">
			<h2 id="divTitle">소장도서</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="./image/ko/local/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>자료검색</li>
					<li>&gt;</li>
					<li>통합검색</li>
					<li>&gt;</li>
					<li>소장도서</li>
				</ul>
			</div>
		</div>
		
		<!-- 검색 시작 -->
				<fieldset>
					<legend>검색</legend>
					<span class="bunch">
					<label class="skip">검색어</label>
						<select id="searchKind" class="selectBox1">
							<option value="title">서명</option>
							<option value="writer">저자</option>
							<option value="company">출판사</option>
							<option value="content">분류</option>
						</select>
					<input type="text" class="inputTextType3 sw" maxlength="100" title="검색어" placeholder="검색어를 입력하세요">
					</span>
					<input type="submit" class="btnType5" value="검색">
				</fieldset>
		<!-- 검색 끝 -->
			
		<div class="listTable">
			<table class="mobileTable tablet">
				<caption>게시판 목록</caption>
				<thead>
					<tr>
						<th scope="row" class="footable-first-column">No.</th>
						<th scope="row" data-class="expand">서명</th>
						<th scope="row" style="display: table-cell;">저자</th>
						<th scope="row" style="display: table-cell;">출판사</th>
						<th scope="row" style="display: table-cell;">출판년도</th>
						<th scope="row" style="display: table-cell;">대여여부</th>
						<c:if test="${ not empty member }">
							<th scope="row" style="display: table-cell;">찜</th>
						</c:if>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach items="${ list }" var="dto">
							<tr>
								<td class="num footable-first-column">${dto.num }</td>
								<td class="title expand"><a href="./bookInformation.book?num=${dto.num}&curPage=${curPage}">${dto.title }</a></td>
								<td class="writer" style="display: table-cell;">${dto.writer }</td>
								<td class="reportDate" style="display: table-cell;">${dto.company }</td>
	
								<c:choose>
									<c:when test="${dto.library == 1 }"><td class="view_cnt" style="display: table-cell;"><a href="../library/libraryMain.library?library=1">kim_lib</a></td></c:when>
									<c:when test="${dto.library == 2 }"><td class="view_cnt" style="display: table-cell;"><a href="../library/libraryMain.library?library=2">gee_lib</a></td></c:when>
									<c:when test="${dto.library == 3 }"><td class="view_cnt" style="display: table-cell;"><a href="../library/libraryMain.library?library=3">hs_lib</a></td></c:when>
									<c:when test="${dto.library == 4 }"><td class="view_cnt" style="display: table-cell;"><a href="../library/libraryMain.library?library=4">ssin_lib</a></td></c:when>
								</c:choose>
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
						
					</tr>	
				</tbody>
			</table>
		</div>
			

		<div class="row-right">
			<form name="frm" class="form-inline" action="./bookTotalSearch.book" method="post">
					<!-- KIND -->
					<div class="form-group">
						<div class="col-sm-10">
							<select name="kind" id = "kind">
								<option class = "kind" value="title">제목</option>
								<option class = "kind" value="writer">저자</option>
								<option class = "kind" value="company">출판사</option>
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
						<td>비치 도서관</td>
						<td>대여여부</td>
						<c:if test="${ not empty member }">
							<td>찜</td>
						</c:if>
					</tr>
					<c:forEach items="${ list }" var="dto">
							<tr>
								<td>${dto.num }</td>
								<td><a href="./bookInformation.book?num=${dto.num}&curPage=${curPage}">${dto.title }</a></td>
								<td>${dto.writer }</td>
								<td>${dto.company }</td>
	
								<c:choose>
									<c:when test="${dto.library == 1 }"><td><a href="../library/libraryMain.library?library=1">kim_lib</a></td></c:when>
									<c:when test="${dto.library == 2 }"><td><a href="../library/libraryMain.library?library=2">gee_lib</a></td></c:when>
									<c:when test="${dto.library == 3 }"><td><a href="../library/libraryMain.library?library=3">hs_lib</a></td></c:when>
									<c:when test="${dto.library == 4 }"><td><a href="../library/libraryMain.library?library=4">ssin_lib</a></td></c:when>
								</c:choose>
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
				<li><a href = "./bookTotalSearch.book?curPage=${page.startNum-1}&search=${search}&kind=${kind}">[이전]</a></li>
				</c:if>

				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li><a
					href="./bookTotalSearch.book?curPage=${i}&search=${search}&kind=${kind}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${page.curBlock < page.totalBlock}">
				<li><a
					href="./bookTotalSearch.book?curPage=${requestScope.page.lastNum+1}&search=${search}&kind=${kind}">[다음]</a></li>
				</c:if>
			</ul>
		</div>

	</section>
	
	
<!--footer 시작 -->
	<c:import url="../../../temp/footer.jsp"></c:import>
<!-- footer 끝 -->
</body>
</html>