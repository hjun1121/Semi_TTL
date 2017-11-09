<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> book 관리자 승인창 </h1>
	<form action="./bookOrderOKAdmin.book" method="post">
				<input type="hidden" name="num" value="${num}">
				
			<div>	
			책분류
					<select name="kind">
						<option value="a" >총류</option>
						<option value="b" >철학</option>
						<option value="c" >종교</option>
						<option value="d" >사회과학</option>
						<option value="e" >자연과학</option>
						<option value="f" >기술과학</option>
						<option value="g" >예술</option>
						<option value="h" >언어</option>
						<option value="i" >문학</option>
						<option value="j" >역사</option>
					</select>
			</div>
			
			<div>
				책 위치 : <input type="text" name="section">
			</div>

				<button type="submit">승인</button>
	</form>

</body>
</html>