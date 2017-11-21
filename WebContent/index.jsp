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

</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

	<!-- ////////////////// -->
	
		<!-- 메인 Search 시작 -->
		<div id="divSearch">
			<div>
				<h2 class="skip">통합검색</h2>
				<div class="searchForm">
					<ul>
						<li class="on">
							<form name="totalForm" action="#" method="get">
								<input type="hidden" id="service_type" name="service_type" value="brief">
								<fieldset>
									<legend>제목으로 검색</legend>
									<span class="searchBox">
										<input type="text" class="searchInput" title="제목으로 검색" placeholder="제목으로 도서관 소장자료를 검색할 수 있습니다.">
									</span>
									<input type="image" src="${pageContext.request.contextPath }/image/index/searchBtn.png" value="검색" class="searchBtn" title="검색">
								</fieldset>
							</form>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 메인 Search 끝 -->
		<!-- ////////////////// -->
	
	<h2>김앤신(통합포털)</h2>
	<p><a href="./book/bookOrderTotalList.book">Book_TotalList(도서 신청목록)</a>
	
	<!-- 도서관 페이지  -->
	
	<h2>도서관 페이지</h2>
	<p><a href="./library/libraryMain.library?library=1">Kim_Lib</a></p>
	<p><a href="./library/libraryMain.library?library=2">Gee_Lib</a></p>
	<p><a href="./library/libraryMain.library?library=3">Hee_Lib</a></p>
	<p><a href="./library/libraryMain.library?library=4">Ssin_Lib</a></p>
	<div style = "height: 10px"></div>

	
	<c:if test="${not empty sessionScope.member }">
	<p><a href="./market/marketOrder.market?id=${member.id }">마켓판매신청form</a></p><!-- 로그인시만 이용 -->
	</c:if>
	
	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>