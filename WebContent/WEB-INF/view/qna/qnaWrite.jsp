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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/qna/qnaWrite.css">
<script type="text/javascript">
$(function(){
	$(".library").each(function(){
		 if($(this).val() == ${member.library}) {
			 $(this).attr("selected", true);
		 }
	});
});

</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>
<div id="divContentsW">
		<div id="divContents">
			<h2 id="divTitle">글쓰기</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>QnA</li>
					<li>&gt;</li>
					<li>글쓰기</li>
				</ul>
			</div>	
			
			<div class="cstmWrap">
			<form action="./qnaWrite.qna" method="post">
				<input type = "hidden" class = "form-control" name = "id" value = "${member.id }">
				<ul class = "otoForm mt30 borTc3">
					<li>
						<p class="writeTit" >문의</p>
						<select name="type" id="type">
							<option value="1">중고장터문의</option>
							<option value="2">도서신청문의</option>
							<option value="3">이용문의</option>
						</select>
					</li>
					
					<li>
						<p class="writeTit" >제목</p>
						<input type="text" id="title" name="title">
					</li>
					<li>
						<p class="writeTit" >내용</p>
						<input type="text" id="contents" name="contents">
					</li>
					<li>
						<p class="writeTit" >저자</p>
						<input type="text" name="writer" value="${member.id }" readonly="readonly">
					</li>
					<li>
						<p class="writeTit" >정가</p>
						<input type="number" id="price" name="price">
					</li>
					<li>
						<p class="writeTit">도서관명</p>
						<select name="library" id="library">
							<option class="library" value="1">기흥구</option>
							<option class="library" value="2">송파구</option>
							<option class="library" value="3">장안구</option>
							<option class="library" value="4">분당구</option>
						</select>
					</li>
				</ul>
				<div class="btnBox">
					<button id="btn_NO">취소</button>
					<button type="submit" id="btn_OK">확인</button>
				</div>
			</form>
			</div>
		</div>
	</div>

<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>