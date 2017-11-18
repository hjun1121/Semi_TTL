<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<div id="leftBar">
	<c:if test="${not empty sessionScope.member }">
	<ul>
		<li id="leftBar1"><a href="../member/memberUpdatePwCheck.member">회원 정보 수정</a></li>
		<li id="leftBar2"><a href="../market/marketDealsList.market?id=${member.id }&type=3">중고책거래 판/구매 리스트</a></li>
		<li id="leftBar3"><a href="../seat/seatTotalList.seat?id=${member.id }">좌석 예약 내역</a></li>
		<li id="leftBar4"><a href="../book/bookRentList.book?id=${member.id }">책 대여 내역</a></li>
		<li id="leftBar5"><a href="../book/bookOrderList.book?id=${member.id }&state=3">책 신청 내역</a></li>
		<li id="leftBar6"><a href="../market/marketOrderList.market?id=${member.id }">중고 책거래 내역</a></li>
		<li id="leftBar7"><a href="../market/bookBuyWishList.market?id=${member.id }">책 구매 찜</a></li>
		<li id="leftBar8"><a href="../book/bookRentWishList.book?id=${member.id }">책 대여 찜</a></li>
		<li id="leftBar9"><a href="../member/memberLogout.member">로그아웃</a></li>
	</ul>
	</c:if>
</div>
