<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="header">
	<div>
		<h1>
			<a href="${pageContext.request.contextPath }/library/libraryMain.library?library=4&ln=4" title="분당 도서관 입니다">
				<img src="${pageContext.request.contextPath }/image/header/hm_lib.png" alt="분당 도서관">
			</a>
		</h1>
		
		<!-- Global Menu -->
		<div id="headerMenu">
			<form class="login">
				<c:if test="${empty sessionScope.member }">
					<a href="${pageContext.request.contextPath }/member/memberLogin.member?library=4&ln=4">
					<img src="${pageContext.request.contextPath }/image/header/login.png?library=4&ln=4" alt="로그인">
					로그인</a>
						&nbsp;|&nbsp;
					<a href="${pageContext.request.contextPath }/member/memberJoinAgree.member?library=4&ln=4">회원가입</a>
				</c:if>	
				<c:if test="${not empty sessionScope.member }">
					<a href="${pageContext.request.contextPath }/member/memberLogout.member?library=4&ln=4">로그아웃</a>
						&nbsp;|&nbsp;
					<a href="${pageContext.request.contextPath }/member/memberUpdatePwCheck.member?library=4&ln=4">마이페이지</a>
				</c:if>
			</form>
			
			<div class="dropdown">
				<span class="dropdown-toggle" data-toggle="dropdown">이용안내  <span class="caret"></span></span>
				<ul class="dropdown-menu">
    				<li><a href="${pageContext.request.contextPath }/notice/noticeList.notice?library=4&ln=4" title="공지사항">공지사항</a></li>
					<li><a href="${pageContext.request.contextPath }/qna/qnaList.qna?library=4&ln=4" title="Qna">QnA</a></li>
					<li><a href="${pageContext.request.contextPath }/library/libraryView.library?library=4&ln=4" title="찾아오시는길">찾아오시는길</a></li>
  				</ul>
			</div>
				
		</div>
		<!-- //Global Menu -->
	</div>
</div>

<div class="header2">
	<div id = "divTopMenu">
		<ul>
			<li><a href = "${pageContext.request.contextPath}/library/libraryBookSearch.library?library=4&ln=4">도서검색</a></li>
			<li><a href = "${pageContext.request.contextPath}/seat/seatList.seat?library=4&ln=4">좌석예약</a></li>
			<li><a href = "${pageContext.request.contextPath}/book/bookOrderTotalList.book?library=4&ln=4">도서신청</a></li>
			<li><a href = "${pageContext.request.contextPath}/market/marketTotalList.market?library=4&ln=4">중고장터</a></li>
			<li><a href = "${pageContext.request.contextPath}/notice/noticeList.notice?library=4&ln=4">공지사항</a></li>
		</ul>
	</div>
</div>
