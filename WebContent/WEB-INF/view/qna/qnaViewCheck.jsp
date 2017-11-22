<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/qna/qnaViewCheck.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

<section id = "section">
<div id = "bts_top_section">
	<div id="divContentsW">
		<div id="divContents">
			
			<h2 id="divTitle">비밀번호 확인</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>QnA</li>
					<li>&gt;</li>
					<li>비밀번호 확인</li>
				</ul>
			</div>

			<div id = "login_all">
				<div id = "login_menu">
					<span>비밀번호 확인</span>
				</div>
				<form action="./qnaViewCheck.qna" method="post">
				<div id = "login_pw">
					<input type = "password" id = "pw_text" name = "pw" placeholder="비밀번호 입력">
				</div>
				<div id = "login_btn">
					<input type="hidden" name="num" value=${num }>
<!-- 				<p>pw<input type="text" name="pw"></p> -->
					<input type = "submit" value = "확인">
				</div>
				</form>
			</div>
			
			</div>
		</div>
	</div>
</section>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>