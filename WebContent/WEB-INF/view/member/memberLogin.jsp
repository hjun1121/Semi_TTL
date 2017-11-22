<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberLogin.css">

<script type="text/javascript">
	$(function(){
		
		$("#login").click(function(){
			if($("#id_text").val()==""){
				alert("아이디를 입력해주세요");
				$("#id_text").focus();
			}else if($("#pw_text").val()==""){
				alert("비밀번호를 입력해주세요");
				$("#pw_text").focus();
			}else{
				document.frm.submit();
			}
		});
		
		
		$("#idFind").click(function(){
			location.href="./memberIdFind.member?library=${library}";
			
		});
		
		$("#pwFind").click(function(){
			location.href="./memberPwFind.member?library=${library}";
		});
		
		$("#joinF").click(function(){
			location.href="./memberJoinAgree.member?library=${library}";
		});
	});


</script>
</head>
<body>
<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

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

	<form action="./memberLogin.member?library=${library}" name="frm" method="post">
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
				<a id="login" style="cursor: pointer;">로그인</a>
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