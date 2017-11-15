<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/member/myPage.css">
<title>MyPage</title>
</head>
<body>
<div id="leftBar">
	<c:if test="${not empty sessionScope.member }">
	<ul>
		<li><a href="./memberUpdatePwCheck.member" class="active">회원 정보 수정</a></li>
		<li><a href="../market/marketDealsList.market?id=${member.id }&type=3">중고책거래 판/구매 리스트</a></li>
		<li><a href="../seat/seatTotalList.seat?id=${member.id }">좌석 예약 내역</a></li>
		<li><a href="../book/bookRentList.book?id=${member.id }">책 대여 내역</a></li>
		<li><a href="../book/bookOrderList.book?id=${member.id }&state=3">책 신청 내역</a></li>
		<li><a href="../market/marketOrderList.market?id=${member.id }">중고 책거래 내역</a></li>
		<li><a href="../market/bookBuyWishList.market?id=${member.id }">책 구매 찜</a></li>
		<li><a href="../book/bookRentWishList.book?id=${member.id }">책 대여 찜</a></li>
		<li><a href="../member/memberLogout.member">로그아웃</a></li>
	</ul>
	</c:if>
</div>
</body>
</html>