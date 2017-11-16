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
<title>Library Page</title>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

	<c:choose>
		<c:when test="${ library == 1 }"><h2>KIM 도서관 메인 페이지</h2></c:when>
		<c:when test="${ library == 2 }"><h2>GEE 도서관 메인 페이지</h2></c:when>
		<c:when test="${ library == 3 }"><h2>HEE 도서관 메인 페이지</h2></c:when>
		<c:when test="${ library == 4 }"><h2>SSIN 도서관 메인 페이지</h2></c:when>
	</c:choose>
	<div style = "height: 30px"></div>

	<p><a href="./libraryBookSearch.library?library=${library}">도서 검색</a></p>
	<p><a href="./libraryBookRecommend.library?library=${library}">추천 도서</a></p>

<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>