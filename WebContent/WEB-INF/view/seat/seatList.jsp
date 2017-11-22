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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/seat/seatList.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#seat_1").click(function(){
			
			$.ajax({
				url: "./seatList.seat",
				type: "POST",
				data: {
					library :1
				},
				success:function(data){
					$("#seatList").html(data.trim());
				}
			});
			
		});//
		
		$("#seat_2").click(function(){
			
			$.ajax({
				url: "./seatList.seat",
				type: "POST",
				data: {
					library :2
				},
				success:function(data){
					$("#seatList").html(data.trim());
				}
			});
			
		});//
		
		$("#seat_3").click(function(){
			
			$.ajax({
				url: "./seatList.seat",
				type: "POST",
				data: {
					library :3
				},
				success:function(data){
					$("#seatList").html(data.trim());
				}
			});
			
		});//
		
		/* $("#seatList").on("click", ".seats" , function(){
			alert("as");
		}); */
		
		
	});
</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

<section id = "section">
<div id = "bts_top_section">
		<div id="divContents">
			<h2 id="divTitle">좌석예약</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>로그인</li>
				</ul>
			</div>
			
<a href="#" id="seat_1">1층 Seat
<c:forEach items="${seat1 }" var="dto" varStatus="count" >
	<c:if test="${count.last }">
		${count.index+1 } 개
	</c:if>
</c:forEach>
</a>
</h2>


<h2>
<a href="#" id="seat_2">2층 Seat
<c:forEach items="${seat2 }" var="dto" varStatus="count" >
	<c:if test="${count.last }">
		${count.index+1 } 개
	</c:if>
</c:forEach>
</a>
</h2>

<h2>
<a href="#" id="seat_3">3층 Seat
<c:forEach items="${seat3 }" var="dto" varStatus="count" >
	<c:if test="${count.last }">
		${count.index+1 } 개
	</c:if>
</c:forEach>
</a>
</h2>

<div id="seatList">
</div>
</div>
</div>
</section>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>