<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberLogin.css">

<script type="text/javascript">
	$(function(){
		$("#login").click(function(){
			document.frm.submit();
		});
		
		
		$("#idFind").click(function(){
			location.href="./memberIdFind.member";
			
		});
		
		$("#pwFind").click(function(){
			location.href="./memberPwFind.member";
		});
		
		$("#joinF").click(function(){
			location.href="./memberJoinAgree.member";
		});
	});


</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

<section id = "section">
<div id = bts_top_section>
<div id="divContentsW">
		<div id="divContents">
			
			<h2 id="divTitle">로그인</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>로그인</li>
				</ul>
			</div>

	<form action="./memberLogin.member" name="frm" method="post">
	<div id="login_form">
		<div id="login_all">
			
		<!-- menu -->	
			<div id="login_menu">
				<a href="#" class="login_login"><span>로그인</span></a>
			</div>
		<!-- id -->
			<div id="login_id">
				<input type="text"  id="id_text" name="id" placeholder="아이디 입력">
			</div>
		<!-- pw -->
			<div id="login_pw">
				<input type="password"  id="pw_text" name="pw" placeholder="비밀번호 입력">
			</div>
			
		<!-- 로그인버튼 -->
			<div id="login_btn">
				<a href="#" id="login">로그인</a>
			</div>	
		
		<!-- 찾기버튼들 -->
		<ul class="btns">
			<li id="idf"><a href="#" id="idFind" >아이디찾기</a></li>
			<li><a href="#" id="pwFind">비밀번호찾기</a></li>
			<li id="join"><a href="#" id="joinF">회원가입</a></li>
		</ul>
		
			
		</div>
	</div>
	</form>
</div>
</div>
</div>
</section>	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>	
</body>
</html>