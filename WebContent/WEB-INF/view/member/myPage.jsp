<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   



			
<div id="snb">
	<div id="lnb">
	<div class="lnbBox">
		<c:if test="${not empty sessionScope.member }">
		<ul>
			<li class="sub selected">
				<a href="#" target="_self">
					MY MENU
				</a>
				<ul>
					<li id="leftBar1">
						<a href="../member/memberUpdatePwCheck.member?library=${library}&ln=${ln}" class="selected">
							회원 정보 수정
						</a>
					</li>
					<li id="leftBar4">
						<a href="../book/bookRentList.book?id=${member.id }&library=${library}&ln=${ln}">
							대여 내역
						</a>
					</li>
					<li id="leftBar5">
						<a href="../book/bookOrderList.book?id=${member.id }&state=3&library=${library}&ln=${ln}">
							신청 내역
						</a>
					</li>
					<li id="leftBar8">
						<a href="../book/bookRentWishList.book?id=${member.id }&library=${library}&ln=${ln}">
							대여 찜콩
						</a>
					</li>
					<li id="leftBar3">
						<a href="../seat/seatTotalList.seat?id=${member.id }&library=${library}&ln=${ln}">
							좌석예약내역
						</a>
					</li>
					<li id="leftBar2">
						<a href="../market/marketDealsList.market?id=${member.id }&type=3&library=${library}&ln=${ln}">
							중고거래내역
						</a>
					</li>
					<li id="leftBar6">
						<a href="../market/marketOrderList.market?id=${member.id }&library=${library}&ln=${ln}">
							중고거래현황
						</a>
					</li>
					<li  id="leftBar7">
						<a href="../market/bookBuyWishList.market?id=${member.id }&library=${library}&ln=${ln}">
							중고거래찜콩
						</a>
					</li>
					
					<c:if test="${member.kind eq 10 }">
						<li id="leftBar10">
							<a href="../member/memberList.member?library=${library}&ln=${ln}">
								회원리스트(관리자)
							</a>
						</li>
						<li id="leftBar11">
							<a href="../book/bookOrderListAdmin.book?state=3&library=${library}&ln=${ln}">
								책신청내역(관리자)
							</a>
						</li>
						<li id="leftBar12">
							<a href="../market/marketOrderAdmin.market?library=${library}&ln=${ln}">
								중고신청내역(관리자)
							</a>
						</li>
					</c:if>
					
					<li id="leftBar9">
						<a href="../member/memberLogout.member?library=${library}&ln=${ln}">
							로그아웃
						</a>
					</li>
				</ul>
			</li>
		</ul>
		</c:if>
	</div>
	</div>
</div>
