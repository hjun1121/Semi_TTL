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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/notice/noticeUpdate.css">
<title>공지사항 수정</title>
<script type="text/javascript">
	$(function(){
		$("#btn_OK").click(function(){
			if($("#title2").val() == ""){
				alert("제목을 입력하세요.");
				$("#title2").focus();
			}else if($("#contents2").val() == ""){
				alert("내용을 입력하세요.");
				$("#contents2").focus();
			}else{
				document.frm.submit();
			}
		});
	});
</script>
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
			
			<h2 id="divTitle">수정</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>공지사항</li>
					<li>&gt;</li>
					<li>수정</li>
				</ul>
			</div>

		<div class="cstmWrap">
			<form action="./noticeUpdate.notice?library=${library}&ln=${ln}" name="frm" method="post">
				<input type="hidden" name="num" value="${view.num}">
				<ul class="otoForm mt30 borTc3">
					<li id="writer">
						<p class="writeTit" >작성자</p>
						<input type="text" name="writer" value="${view.writer}" readonly="readonly">
					</li>
					<li id="title" >
						<p class="writeTit" >제목</p>
						<input type="text" id="title2" name="title" value="${view.title}" placeholder="제목없음">
					</li>
					<li id="contents">
						<p class="writeTit">내용</p>
						<div class="textForm js-label mt10">
							<textarea id="contents2" name="contents" cols="30" rows="10">${view.contents}</textarea>
						</div> 
					</li>
				</ul>
				<div class="btnBox">
						<span class="button1"><a href="./noticeList.notice" class="type4 large">취소</a></span> 
						<span class="button1"><input type="button" id="btn_OK" class = "type1 large" value="확인"> </span>
				</div>
				</form>
				
			</div>
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