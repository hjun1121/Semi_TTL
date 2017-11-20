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
<link rel="stylesheet" href="../css/member/memberJoinAgree.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		$("#btn_NO").click(function(){
			alert("no");
		});
	
		$("#btn_OK").click(function(){
			alert("ok");
		});
	});
</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

<div id="divContentsW">
	<div id="divContents">
			
		<h2 id="divTitle">이용약관</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>이용약관</li>
			</ul>
		</div>

	<form name="form" action="#" method="post">
		<div class="joinCont mt50">
			<h2 class="jsTxt clauseTxt">회원가입 및 정상적인 서비스 이용을 위해 아래 약관을 읽고, 동의 여부 결정해 주세요.</h2>
			
			<div class="eduteClause">
				<div class="ckAll">
					<span class="checkForm">
						도서관 회원 약관 전체 동의&nbsp;<input type="checkbox" name="allCheck" onclick="all_chk()">
						
					</span>
				</div>
				<div class="clauseBox mt40">
					<h3 class="jsTxt">도서관 이용약관</h3>
					<span class="checkForm">
						동의(필수)&nbsp;<input type="checkbox"name="req1">
					</span>
					<div class="clauseCont">
					동의? 어 보감 
					</div>
				</div>
				<div class="clauseBox mt40">
					<h3 class="jsTxt">개인정보 수집 이용동의</h3>
					<span class="checkForm">동의(필수)&nbsp;<input type="checkbox" name="req2">
					</span>
					<div class="clauseCont">
					동의? 어 보감<br>동의? 어 보감<br>동의? 어 보감<br>동의? 어 보감<br>동의? 어 보감<br>동의? 어 보감<br>동의? 어 보감<br>동의? 어 보감<br>동의? 어 보감<br>동의? 어 보감<br>
					</div>
				</div>
				<div class="clauseBox mt40">
					<h3 class="jsTxt">개인정보 제공 동의</h3>
					<span class="checkForm">
						동의(필수)&nbsp;<input type="checkbox" name="req3">
					</span>
					<div class="clauseCont">
					동의? 어 보감
					</div>
				</div>
			</div>
			
					<div class="btnCenter mt30" id="center">
						<span class="button1"><a href="#" class="type4 large" id="btn_NO">취소</a></span> 
						<span class="button1"><a href="#" class="type1 large" id="btn_OK">다음</a></span> 
					</div>
				</div>
			</form>



	</div>
</div>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>