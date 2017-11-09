<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
</body>
</html>