<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookOrderForm.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		var library = ${member.library}
	});

</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

<div id="divContentsW">
		<div id="divContents">
			
			<h2 id="divTitle">도서신청</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>도서신청</li>
				</ul>
			</div>	



	<!-- /// -->
	<div class="cstmWrap">
	<form action="./bookOrderForm.book" method="post">
		<input type = "hidden" class = "form-control" name = "id" value = "${member.id}">
		<ul class = "otoForm mt30 borTc3">
			<li id="title" >
				<p class="writeTit" >도서명</p>
				<input type="text" name="title">
			</li>
			<li id="title" >
				<p class="writeTit" >저자</p>
				<input type="text" name="writer">
			</li>
			<li id="title" >
				<p class="writeTit" >출판사</p>
				<input type="text" name="company">
			</li>
			<li id="title" >
				<p class="writeTit" >출판년도</p>
				<input type="text" name="publish_date" placeholder = "출판년도는 숫자만 입력해 주세요">
			</li>
			<li id="title" >
				<p class="writeTit" >가격</p>
				<input type="text" name="price">
			</li>
			<li id="contents">
				<p class="writeTit">신청사유</p>
				<div class="textForm js-label mt10">
					<textarea id="label001" name="contents" cols="30" rows="10"> </textarea>
				</div> 
			</li>
			<li id="title">
				<p class="writeTit">비치 도서관</p>
				<select name = "library" style="height: 40px;">
					<option value = "1" id = "1">기흥구</option>
					<option value = "2" id = "2">송파구</option>
					<option value = "3" id = "3">장안구</option>
					<option value = "4" id = "4">분당구</option>
				</select>
			</li>
		</ul>
		<div class="btnBox">
			
			<span class="button1"><a href="${pageContext.request.contextPath }/index.jsp" class="type4 large">취소</a></span>
			<span class="button1"><button class = "type1 large" type = "submit">신청</button></span> 
		</div>
		
	</form>
	</div>
	<!-- /// -->
	
	
	</div>
</div>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>