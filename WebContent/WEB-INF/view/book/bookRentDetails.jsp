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
		<c:choose>
			<c:when test="${empty bookRentDTO.out_time }">
				<td>out_time<input type="text" value="*"></td>
			</c:when>
			<c:when test="${! empty bookRentDTO.out_time }">
				<td>out_time<input type="text" name="out_time" value=${bookRentDTO.out_time } readonly="readonly"></td>
			</c:when>
			<c:otherwise>
				<td>0</td>
			</c:otherwise>
		</c:choose>
		<p>late_date<input type="text" name="late_date" value=${bookRentDTO.late_date } readonly="readonly"></p>
		<button type="submit">확인</button>
		<c:choose>
			<c:when test="${empty bookRentDTO.out_time }">
				<a href="./bookReturn.book?num=${bookRentDTO.num }"><input type="button" value="반납"></a>
			</c:when>
		</c:choose>
		<a href="./bookRentDelete.book?num=${bookRentDTO.num }"><input type="button" value="내역 삭제"></a>
	</form>	
	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>