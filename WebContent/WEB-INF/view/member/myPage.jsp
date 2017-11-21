<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<div id="leftBar">
	<c:if test="${not empty sessionScope.member }">
	<ul>
		<li id="leftBar1"><a href="../member/memberUpdatePwCheck.member">회원 정보 수정</a></li>
		<li id="leftBar4"><a href="../book/bookRentList.book?id=${member.id }">대여 내역</a></li>
		<li id="leftBar5"><a href="../book/bookOrderList.book?id=${member.id }&state=3">신청 내역</a></li>
		<li id="leftBar8"><a href="../book/bookRentWishList.book?id=${member.id }">대여 찜콩</a></li>
		<li id="leftBar3"><a href="../seat/seatTotalList.seat?id=${member.id }">좌석 예약 내역</a></li>
		<li id="leftBar2"><a href="../market/marketDealsList.market?id=${member.id }&type=3">중고 거래 내역</a></li>
		<li id="leftBar6"><a href="../market/marketOrderList.market?id=${member.id }">중고 거래 현황 </a></li>
		<li id="leftBar7"><a href="../market/bookBuyWishList.market?id=${member.id }">중고 거래 찜콩</a></li>
		<c:if test="${member.kind eq 10 }">
		<li id="leftBar10"><a href="../member/memberList.member">회원리스트(관리자)</a></li>
		<li id="leftBar11"><a href="../book/bookOrderListAdmin.book?state=3">책 신청 내역(관리자)</a></li>
		<li id="leftBar12"><a href="../market/marketOrderAdmin.market">중고 신청 내역(관리자)</a></li>
		</c:if>
		<li id="leftBar9"><a href="../member/memberLogout.member">로그아웃</a></li>
	</ul>
	</c:if>
</div>
