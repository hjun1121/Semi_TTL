<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>QnA Details</h2>
	<form action="./qnaViewCheck.qna" method="post">
	<h3>비밀번호 입력 하세요</h3>
		<input type="hidden" name="num" value=${num }>
		<p>pw<input type="text" name="pw"></p>
		<input type="submit" value="확인"> 
	</form>	
</body>
</html>