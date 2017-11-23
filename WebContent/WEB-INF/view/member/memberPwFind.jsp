<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberIdPwFind.css">
</head>
<body>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

	<div id="divContentsW">
		<div id="divContents">
			
			<h2 id="divTitle">비밀번호 찾기</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>비밀번호 찾기</li>
				</ul>
			</div>
	
	<!--  -->
	
	
	<form action="./memberPwFind.member?library=${library}&ln=${ln}" method="post">
		<div id="idFind_form">
		<div id="idFind_all">
			
		<!-- menu -->	
			<div id="idFind_menu">
				<a href="#" class="idFind_idFind"><span>PW 찾기</span></a>
			</div>
		<!-- id -->
			<div id="idFind_id">
				<input type="text"  id="id" name="id" placeholder="아이디 입력">
			</div>
		<!-- name -->
			<div id="idFind_id">
				<input type="text"  id="name" name="name" placeholder="이름 입력">
			</div>
		<!-- email -->
			<div id="idFind_pw">
				<input type="text"  id="email" name="email" placeholder="이메일 입력">
			</div>
			
		<!-- 로그인버튼 -->
		<div id="list">
		</div>
			
			<div id="idFind_btn">
				<button type="submit" class="Pwbtn">비밀번호 찾기</button>
			</div>	
		
		<!-- 찾기버튼들 -->
		<ul class="btns">
			<li id="log"><a href="./memberLogin.member?library=${library}&ln=${ln}" id="login" >로그인</a></li>
			<li><a href="./memberIdFind.member?library=${library}&ln=${ln}" id="pwFind">아이디 찾기</a></li>
			<li id="join"><a href="./memberJoinAgree.member?library=${library}&ln=${ln}" id="joinF">회원가입</a></li>
		</ul>
		
		</div>
	</div>
	</form>
	
	
	<!-- <form action="./memberPwFind.member" method="post">
		<p>id<input type="text" name="id"></p>
		<p>name<input type="text" name="name"></p>
		<p>email<input type="text" name="email"></p>
		<p><button type="submit">Pw 찾기</button></p>
	</form> -->
	<!--  -->
	</div>
</div>

<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>