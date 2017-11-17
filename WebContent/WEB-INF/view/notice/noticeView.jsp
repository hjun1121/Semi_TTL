<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/notice/noticeView.css">

<title>Insert title here</title>
</head>
<body>
<c:import url="${myContextPath }/temp/header.jsp"></c:import>
	
<div id="divContentsW">
	<div id="divContents">
	
	<h2 id="divTitle">공지사항</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>공지사항</li>
				</ul>
			</div> 
			

		<div class="boardDetailW">
		<!-- 내용시작 -->	
		<div class="boardDetail">
			<div class="boardInfo">
				<p class="boardInfoTitle"><%-- 글 제목 --%>${view.title}</p>
				<p class="writeInfo" id="reg_date"><!-- 날짜 -->${view.reg_date}<span>조회&nbsp;${requestScope.view.hit}</span></p>
				<dl class="writerInfo">
					<dt class="skip">작성자</dt>
					<dd class="writer" id="writer"><span>${view.writer}</span></dd>
					<dt class="skip">이메일</dt>
					<dd class="writerEmail"><span>**brary_4@naver.com</span></dd>
				</dl>
			</div>
			
			<div class="boardContent">
				<div style="text-align: center;" id="contents">
					${requestScope.view.contents}
					<!-- <img border="0" src="./image/ko/local/hjbs.PNG" style="height:1040px; width:720px"> -->
				</div>
			</div>
		</div>
	
	<c:if test="${member.kind eq 10 }">
		<a href="./noticeUpdate.notice?num=${view.num}">UPDATE</a>
		<a href="./noticeDelete.notice?num=${view.num}">DELETE</a>
	</c:if>
	<div class="buttons">
	<a href="noticeList.notice" title="목록">목록</a>
	</div>
	</div>
	
	</div>
</div>

<c:import url="${myContextPath }/temp/footer.jsp"></c:import>
</body>
</html>