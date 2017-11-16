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

<h2>QnA Details</h2>
<form action="./qnaWrite.qna" method="post">
		<p>
		<select name="type">
			<option value="1">중고장터문의</option>
			<option value="2">도서신청문의</option>
			<option value="3">이용문의</option>
		</select>
		</p>
		<p>title<input type="text" name="title"></p>
		<p>contents<input type="text" name="contents"></p>
		<p>writer<input type="text" name="writer" value="${member.id }" readonly="readonly"></p>
		<p>password<input type="text" name="pw"></p>
		
		<p>
		<select name="library" name="library">
			<option class="library" value="1">기흥구</option>
			<option class="library" value="2">송파구</option>
			<option class="library" value="3">장안구</option>
			<option class="library" value="4">분당구</option>
		</select>
		</p>
		<button type="submit">확인</button>
</form>	

<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>