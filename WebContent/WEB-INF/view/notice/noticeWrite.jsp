<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/notice/noticeWrite.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<c:import url="${myContextPath }/temp/header.jsp"></c:import>

<div class="noticeWrite">
	<div class="col-md-8 col-centered">
		<form action="./noticeWrite.notice" method="post">
			<table class="table">
				<tr>
					<tr>
					<td colspan="2"><input type="text" name="title" placeholder="제목없음"></td>
					<td colspan="2"></td>
					<td id="reg_date"></td>
					<td id="writer"><input type="text" name="writer" readonly="readonly" value="${sessionScope.member.id }"></td>
				</tr>
				<tr>
				 	<td colspan="6" id="contents"><textarea name="contents" placeholder="내용을 입력하세요."></textarea></td>
				</tr>
			</table>
			
			<button class="btn btn-default" type="submit">글쓰기</button>
		</form>
	</div>
</div>

<c:import url="${myContextPath }/temp/footer.jsp"></c:import>		
</body>
</html>