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
<script type="text/javascript">
	$(function(){
		/* $("#btn").click(function(){
			
			$.ajax({
				url: "./seatInfo.seat",
				type: "POST",
				data: {
					state: '${seat.state }',
					id : '${member.id }',
					seat_num : '${seat.seat_num }'
				},
				success:function(data){
					
				}
			});
		});// */
	});
</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

<p>seat Info</p>
<table border="1">
	<tr>
		<th>Seat_Num</th>
		<th>Library</th>
		<th>State</th>
		<th>Id</th>
		<th>Time</th>
	</tr>
	<tr>
		<td>${seat.seat_num }</td>
		<td>${seat.library }</td>
		<td>${seat.state }</td>
		<td>${seat.id }</td>
		<td>${seat.reserve_time }</td>
	</tr>
</table>
<form action="./seatInfo.seat" method="post">
	<input type="hidden" name="seat_num" value=${seat.seat_num }>
	<input type="hidden" name="id" value=${member.id }>
	<!-- <input type="button" id="btn" value="예약하기"> -->
	<button type="submit"> 예약</button>
</form>

<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>