<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index/index.css">
<title>Total Library Page</title>
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
<style type="text/css">
	#search_hidden {
		display: none;
	}
</style>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

	<div id = "search_hidden">
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
	</div>

		<!-- Search -->
		<input type="hidden" id="_isSSOLogin" name="_isSSOLogin" value="false">
		<div id="divSearch">
			<div>
				<h2 class="skip">통합검색</h2>
				<div class="searchForm">
					<ul>
						<li class="on" value = "title"><span>제목 검색</span>
							<form name="totalForm" action="/search/tot/result" method="get">	
								<input type="hidden" id="service_type" name="service_type" value="brief">
								<fieldset>
									<legend>제목으로 검색</legend>
									<span class="searchBox">
										<input type="text" class="searchInput" id="type1q" name="q" title="제목으로 검색" placeholder="제목으로 도서관 소장자료를 검색할 수 있습니다.">
										<span class="widesrchBtn"><img  src="./image/index/widesrchDown.gif" style="cursor:pointer"></span>
									</span>
									<input type="image" src="./image/index/searchBtn.png" id = "search" name = "search" value="${search}" class="searchBtn" title="검색">
								</fieldset>
							</form>
						</li>
						<li value = "writer"><a href="#"><span>저자 검색</span></a>
							<form name="discoveryForm" action="/eds/brief/discoveryResult" method="get">
								<input type="hidden" name="st" value="KWRD">
								<input type="hidden" name="si" value="TOTAL">
								<fieldset>
									<legend>저자로 검색</legend>
									<span class="searchBox">
										<input type="text" class="searchInput" name="q" title="저자로 검색" placeholder="저자로 도서관 소장자료를 검색할 수 있습니다.">
									</span>
									<input type="image" src="./image/index/searchBtn.png" id = "search" name = "search" value="${search}" class="searchBtn" title="검색">
								</fieldset>
							</form>
						</li>
						<li value = "company"><a href="#"><span>출판사 검색</span></a>
							<form name="discoveryForm" action="/eds/brief/discoveryResult" method="get">
								<input type="hidden" name="st" value="KWRD">
								<input type="hidden" name="si" value="TOTAL">
								<fieldset>
									<legend>출판사로 검색</legend>
									<span class="searchBox">
										<input type="text" class="searchInput" name="q" title="출판사로 검색" placeholder="출판사로 도서관 소장자료를 검색할 수 있습니다.">
									</span>
									<input type="image" src="./image/index/searchBtn.png" id = "search" name = "search" value="${search}" class="searchBtn" title="검색">
								</fieldset>
							</form>
						</li>
					</ul>
					
				</div>
				<div class="etcOpiton">
					<ul>
						<li><a href="#">상세검색</a></li>
						<li style="display: none"><a href="#">상세검색</a></li>
					</ul>
				</div>
				<div class="shortcut">
					<ul>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
					</ul>
				</div>
				
			</div>
		</div>
		<!-- //Search -->
	
	
	<h2>김앤신(통합포털)</h2>
	<p><a href="./book/bookTotalSearch.book">Book_search</a>
	<p><a href="./book/bookOrderForm.book">Book_Order(도서 신청서)</a>
	<p><a href="./book/bookOrderTotalList.book">Book_TotalList(도서 신청목록)</a>
	<p><a href="./library/libraryView.library">도서관지도</a></p>

	<p></p>
	
	<!-- 도서관 페이지  -->
	
	<h2>도서관 페이지</h2>
	<p><a href="./library/libraryMain.library?library=1">Kim_Lib</a></p>
	<p><a href="./library/libraryMain.library?library=2">Gee_Lib</a></p>
	<p><a href="./library/libraryMain.library?library=3">Hee_Lib</a></p>
	<p><a href="./library/libraryMain.library?library=4">Ssin_Lib</a></p>
	<div style = "height: 10px"></div>

	
	<p>=================================================</p>
	<c:if test="${not empty sessionScope.member }">
	<p><a href="./market/marketOrder.market?id=${member.id }">마켓판매신청form</a></p><!-- 로그인시만 이용 -->
	<p>=================================================</p>
	</c:if>

	<c:if test="${not empty member and member.kind eq 10}">
	<h2>admin page</h2>
	<p><a href="./member/memberList.member">회원리스트 / 블랙리스트(관리자)</a></p>
	<p><a href="./market/marketOrderList.market?id=${member.id }">Market Order List(관리자)</a></p>
	<p><a href="./book/bookOrderListAdmin.book?id=${member.id }">book Order List(관리자)</a></p>
	
	<p>=================================================</p>
	</c:if>
	
	<p><a href="./seat/seatList.seat">Seat List</a></p>
	<p><a href="./market/marketTotalList.market">Market Total List</a></p>
	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>