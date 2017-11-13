<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>Book Rent Details</h2>
<form action="../book/bookRentList.book?id=${member.id }" method="post">
		<p><input type="hidden" name="num" value=${bookRentDTO.num }></p>
		<p>title<input type="text" name="title" value='${bookRentDTO.title }'readonly="readonly"></p>
		<p>section<input type="text" name="section" value=${bookRentDTO.section } readonly="readonly"></p>
		<p>writer<input type="text" name="writer" value='${bookRentDTO.writer }' readonly="readonly"></p>
		<p>publish_date<input type="text" name="publish_date" value=${bookRentDTO.publish_date } readonly="readonly"></p>
		<p><input type="hidden" name="id" value=${bookRentDTO.id } readonly="readonly"></p>
		<c:choose>
			<c:when test="${bookRentDTO.library eq 1}">
				<p>library<input type="text" value="기흥구" ></p>
				<input type="hidden" name="library" value=${bookRentDTO.library } readonly="readonly">
			</c:when>
			<c:when test="${bookRentDTO.library eq 2}">
				<p>library<input type="text" value="송파구" ></p>
				<input type="hidden" name="library" value=${bookRentDTO.library } readonly="readonly">
			</c:when>
			<c:when test="${bookRentDTO.library eq 3}">
				<p>library<input type="text" value="장안구" ></p>
				<input type="hidden" name="library" value=${bookRentDTO.library } readonly="readonly">
			</c:when>
			<c:when test="${bookRentDTO.library eq 4}">
				<p>library<input type="text" value="분당구" ></p>
				<input type="hidden" name="library" value=${bookRentDTO.library } readonly="readonly">
			</c:when>
			<c:otherwise>
				<p>library<input type="number" value="없음" ></p>
			</c:otherwise>
		</c:choose>
		<p>in_time<input type="text" name="in_time" value=${bookRentDTO.in_time } readonly="readonly"></p>
		<p>out_time<input type="text" name="out_time" value=${bookRentDTO.out_time } readonly="readonly"></p>
		<p>late_date<input type="text" name="late_date" value=${bookRentDTO.late_date } readonly="readonly"></p>
		<button type="submit">확인</button>
		<a href="./bookRentDelete.book?num=${bookRentDTO.num }"><input type="button" value="내역 삭제"></a>
	</form>	
</body>
</html>