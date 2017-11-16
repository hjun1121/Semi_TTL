<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/member/memberUpdatePwCheck.css">
<title>회원 정보 수정</title>
</head>
<body>
<div>
	<c:import url="./myPage.jsp"></c:import>
</div>
<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">회원 정보 수정</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="../index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>회원 정보 수정</li>
			</ul>
		</div>
		
		<div class="loginW">
		<form id="login" name="login" action="./memberUpdatePwCheck.member" method="post">
			<fieldset>
			<div class="loginContent">
				<div class="intro"><img src="./image/ko/local/home/loginIco.png" alt="MEMBER LOGIN"><p class="welcome">이화여자대학교 <span>도서관</span>에 오신것을 환영합니다.</p><p>로그인 하시면 더 많은 도서관 서비스를 이용할 수 있습니다.</p></div>
					<dl>
						<dt><label for="id">아이디</label></dt>
						<dd><input id="id" name="id" class="inputTextType1" title="아이디입력" type="text" readonly="readonly" value=${member.id } size="20" maxlength="15" alt="아이디입력"></dd>
					</dl>
					<dl>
						<dt><label for="pw">비밀번호</label></dt>
						<dd><input id="pw" name="pw" class="inputTextType1" title="비밀번호 입력" type="password" value="" size="20" maxlength="20" alt="비밀번호 입력"></dd>
					</dl>
					<p class="loginBtn"><input type="submit" value="로그인"></p>
			</div>
			</fieldset>
		</form>
		</div>
	</div>
</div>
</body>
</html>