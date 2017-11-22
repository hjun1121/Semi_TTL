<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberUpdatePwCheck.css">
<title>회원 정보 수정</title>
</head>
<body>
<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp"></c:import>
</div>
<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">회원 정보 수정</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>회원 정보 수정</li>
			</ul>
		</div>
		
		
		<!-- ////////////// -->
		<div class="loginW">
			<form action="./memberUpdatePwCheck.member" name="frm" method="post">
				<div class="loginContent">
					<div id="login_all">
			
					<!-- menu -->	
					<div id="login_menu">
						<a href="#" class="login_login"><span>정보 수정</span></a>
					</div>
					<!-- id -->
					<div id="login_id">
						<input type="text" id="id" name="id" value=${member.id } readonly="readonly">
					</div>
					<!-- pw -->
					<div id="login_pw">
						<input type="password"  id="pw" name="pw" placeholder="비밀번호 입력">
					</div>
					<!-- 수정버튼 -->
					<div id="login_btn">
						<p class="loginBtn"><input type="submit" value="수정하기"></p>
					</div>	
					
					</div>
				</div>
			</form>
		</div>
		<!-- ////////////// -->
	</div>
</div>

<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>