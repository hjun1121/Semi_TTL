<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> book 관리자 승인창 </h1>
	<form action="./${book}OrderOKAdmin.${book}" method="post">
				<input type="hidden" name="num" value="${view.num}">
				
			<div>
				<span> 
					책분류
					<select name="kind">
						<option value="type" name="type">총류</option>
						<option value="type" name="type">철학</option>
						<option value="type" name="type">종교</option>
						<option value="type" name="type">사회과학</option>
						<option value="type" name="type">자연과학</option>
						<option value="type" name="type">기술과학</option>
						<option value="type" name="type">예술</option>
						<option value="type" name="type">언어</option>
						<option value="type" name="type">문학</option>
						<option value="type" name="type">역사</option>
					</select>
				</span>
			</div>
			
			<div>
				책 위치 : <input type="text" name="section">
			</div>

				<button>승인</button>
	</form>

</body>
</html>