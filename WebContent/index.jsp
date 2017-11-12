<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Total Library Page</title>
</head>
<body>
	<h1>판매신청폼 만들었어?</h1>
	
	<c:if test="${empty sessionScope.member }">
		<p><a href="./member/memberLogin.member">로그인</a>
		<p><a href="./member/memberJoin.member">회원가입</a>
		<p><a href="./member/memberIdFind.member">Id Find</a>
		<p><a href="./member/memberPwFind.member">Pw Find</a>
	</c:if>
	
	<c:if test="${not empty sessionScope.member }">
 	<h1>${sessionScope.member.id }</h1>
 	<h1>MyPage_Hees</h1>
		<p><a href="./member/memberUpdatePwCheck.member">회원 정보 수정★</a></p>
		<p><a href="./market/marketDealsList.market?id=${member.id }">중고책거래 판/구매 리스트★</a></p>
		<p><a href="./seat/seatTotalList.seat?id=${member.id }">좌석 예약 내역★</a></p>
		<p><a href="./book/bookRentList.book?id=${member.id }">책 대여 내역★</a></p>
		<p><a href="./book/bookOrderList.book?id=${member.id }">책 신청 내역★</a></p>
		<p><a href="./market/bookBuyWishList.market?id=${member.id }">책 구매 찜★</a></p>
		<p><a href="./book/bookRentWishList.book?id=${member.id }">책 대여 찜★</a></p>
		<p><a href="./member/memberLogout.member">로그아웃</a>
 	</c:if>

	<h2>김앤신(통합포털)</h2>
	<p><a href="./book/bookTotalSearch.book">Book_search</a>
	<p><a href="./book/bookOrderForm.book">Book_Order(도서 신청서)</a>
	<p><a href="./member/memberLogin.member">로그인</a>
	<p><a href="./member/memberJoin.member">회원가입</a>
	<p><a href="./member/memberLogout.member">로그아웃</a>
	<p><a href="./book/bookOrderTotalList.book">Book_Order(도서 신청)</a>
	<p><a href="./library/libraryView.library">도서관지도</a></p>

	<p></p>
	<!-- 도서관 페이지  -->
	
	<h2>도서관 페이지</h2>
	<p><a href="./library/libraryMain.library?library=1">Kim_Lib</a></p>
	<p><a href="./library/libraryMain.library?library=2">Gee_Lib</a></p>
	<p><a href="./library/libraryMain.library?library=3">Hee_Lib</a></p>
	<p><a href="./library/libraryMain.library?library=4">Ssin_Lib</a></p>
	<div style = "height: 10px"></div>

	
	<p><a href="./member/memberJoinAgree.member">Join Agree</a></p>
	<p>=================================================</p>
	<c:if test="${not empty sessionScope.member }">
	<p><a href="./qna/qnaList.qna">QnaList</a></p>
	<p><a href="./market/marketOrder.market?id=${member.id }">마켓판매신청form</a></p><!-- 로그인시만 이용 -->
	<p><a href="./market/marketDealList_personal.market?id=${member.id }">마켓판매신청 개인확인용</a></p><!-- 로그인시만 이용 -->
	<p>=================================================</p>
	</c:if>

	<c:if test="${not empty member and member.kind eq 10}">
	<h2>admin page</h2>
	<p><a href="./member/memberList.member">회원리스트 / 블랙리스트(관리자)</a></p>
	<p><a href="./market/marketOrderList.market?id=${member.id }">Market Order List(관리자)</a></p>
	<p><a href="./book/bookOrderListAdmin.book?id=${member.id }">book Order List(관리자)</a></p>
	
	<p>=================================================</p>
	</c:if>
	
	<p><a href="./notice/noticeList.notice">공지사항</a></p>
	<p><a href="./seat/seatList.seat">Seat List</a></p>
	<p><a href="./market/marketTotalList.market">Market Total List</a></p>
	<c:if test="${empty sessionScope.member }">
		login plz
	</c:if>

	<c:if test="${sessionScope.member.kind eq 10 }">
		admin page
	</c:if>

</body>
</html>