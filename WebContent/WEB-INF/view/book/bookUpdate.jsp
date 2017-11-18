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

</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

	<h2>bookorder Update</h2>
	<form action="./bookOrderUpdate.book" method="post">
	<input type="hidden" name="num" value=${bookorder.num }>
		<p>title<input type="text" name="title" value=${bookorder.title } readonly="readonly"></p>
		<p>writer<input type="password" name="writer" value=${bookorder.writer } ></p>
		<p>company<input type="text" name="company" value=${bookorder.company } readonly="readonly"></p>
		<p>publish_date<input type="date" name="publish_date" value=${bookorder.publish_date } ></p>
		<p>contents<input type="text" name="contents" value=${bookorder.contents } readonly="readonly"></p>
		<p>price<input type="text" name="price" value=${bookorder.price } ></p>
		<p>library<input type="text" name="library" value=${bookorder.library } ></p>
		
		<button type="submit">수정</button>
	</form>	
	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>