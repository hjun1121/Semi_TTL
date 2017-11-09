<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Library Page</title>
</head>
<body>
	<c:choose>
		<c:when test="${ library == 1 }"><h2>KIM 도서관 메인 페이지</h2></c:when>
		<c:when test="${ library == 2 }"><h2>GEE 도서관 메인 페이지</h2></c:when>
		<c:when test="${ library == 3 }"><h2>HEE 도서관 메인 페이지</h2></c:when>
		<c:when test="${ library == 4 }"><h2>SSIN 도서관 메인 페이지</h2></c:when>
	</c:choose>
	<div style = "height: 30px"></div>

<<<<<<< HEAD
	<p><a href="./libraryBookSearch.library?library=${library}">도서 검색</a></p>
	<p><a href="./libraryBookRecommend.library?library=${library}">추천 도서</a></p>

=======
	<p><a href="./libraryBookSearch.library?library=1">도서 검색</a></p>
	<p><a href="./libraryBookRecommend.library">추천 도서</a></p>
>>>>>>> 8742d951169cf3760fc5082efe2a1c57b9da9a69
</body>
</html>