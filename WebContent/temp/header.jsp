<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
		<div class="header">
			<div>
				<h1><a href="#" title="TTL 입니다"><img src="http://blogfiles.naver.net/MjAxNzExMTVfMjkw/MDAxNTEwNzIzNTg0NzA2.-rkKHrZN_-JQH6FouN7rZJRgGCUToUBiAWcpg19ioX8g.vooJD8C4yWyc3Nz0rGs6nkxcnVbJ5TcDe1h1bWzQz70g.PNG.library_4/hj_lib.png" alt="TTL"></a></h1>
				
				<!-- Global Menu -->
				<div id="headerMenu">
				<form class="login">
					<c:if test="${empty sessionScope.member }">
						<a href="./member/memberLogin.member">로그인</a>
							&nbsp;|&nbsp;
						<a href="./member/memberJoin.member">회원가입</a>
					</c:if>	
					<c:if test="${not empty sessionScope.member }">
						<a href="./member/memberLogout.member">로그아웃</a>
						&nbsp;|&nbsp;
						<p><a href="./member/myPage.member">MyPage</a>
					</c:if>
				</form>
					<ul class="language">
						<li class="useInquiry"><a href="#" title="이용문의">이용문의</a>
							<ul>
								<li><a href="#" title="FAQ">FAQ</a></li>
								<li><a href="#" title="1:1문의">1:1문의</a></li>
								<li><a href="#" title="건의게시판">건의게시판</a></li>
							
							</ul>
						</li>
						<li><a href="#" title="ENGLISH">ENG</a></li>
					</ul>
				</div>
				<!-- //Global Menu -->
			</div>
		</div>

		
		<div class="header2">
		</div>
		