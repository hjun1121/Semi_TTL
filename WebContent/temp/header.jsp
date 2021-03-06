<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="header">
	<div>
		<h1>
			<a href="${pageContext.request.contextPath }/index.jsp" title="TTL 입니다">
				<img src="${pageContext.request.contextPath }/image/common/ttl.JPG" alt="TTL">
			</a>
		</h1>
		
		<!-- Global Menu -->
		<div id="headerMenu">
			<form class="login">
				<c:if test="${empty sessionScope.member }">
					<a href="${pageContext.request.contextPath }/member/memberLogin.member">
					<img src="${pageContext.request.contextPath }/image/header/login.png" alt="로그인">
					로그인</a>
						&nbsp;|&nbsp;
					<a href="${pageContext.request.contextPath }/member/memberJoinAgree.member">회원가입</a>
				</c:if>	
				<c:if test="${not empty sessionScope.member }">
					<a href="${pageContext.request.contextPath }/member/memberLogout.member">로그아웃</a>
						&nbsp;|&nbsp;
					<a href="${pageContext.request.contextPath }/member/memberUpdatePwCheck.member">마이페이지</a>
				</c:if>
			</form>
			
			<div class="dropdown">
				<span class="dropdown-toggle" data-toggle="dropdown">이용안내  <span class="caret"></span></span>
				<ul class="dropdown-menu">
    				<li><a href="${pageContext.request.contextPath }/notice/noticeList.notice" title="공지사항">공지사항</a></li>
					<li><a href="${pageContext.request.contextPath }/qna/qnaList.qna" title="Qna">QnA</a></li>
					<li><a href="${pageContext.request.contextPath }/library/libraryView.library" title="찾아오시는길">찾아오시는길</a></li>
  				</ul>
			</div>
				
		</div>
		<!-- //Global Menu -->
	</div>
</div>

<div class="header2">
	<div id = "divTopMenu">
		<ul>
			<li><a href = "${pageContext.request.contextPath}/book/bookTotalSearch.book">도서검색</a></li>
			<li><a href = "${pageContext.request.contextPath}/seat/seatList.seat">좌석예약</a></li>
			<li><a href = "${pageContext.request.contextPath}/book/bookOrderTotalList.book">도서신청</a></li>
			<li><a href = "${pageContext.request.contextPath}/market/marketTotalList.market">중고장터</a></li>
			<li><a href = "${pageContext.request.contextPath}/notice/noticeList.notice">공지사항</a></li>
		</ul>
	</div>
</div>
