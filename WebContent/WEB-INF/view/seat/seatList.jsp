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
			
		});
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
			
		});
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
			
		});
		$("#seat_4").click(function(){
			$.ajax({
				url: "./seatList.seat",
				type: "POST",
				data: {
					library :4
				},
				success:function(data){
					$("#seatTable").attr.display("block");
				}
			});
			
		});
	});
</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

<section id = "section">
<div id = "bts_top_section">
		<div id="divContents">
			<h2 id="divTitle">좌석 현황</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>좌석 현황</li>
				</ul>
			</div>
			<div class = "listTable">
			<table class = "mobileTable tablet">
				<thead>
					<tr>
						<th scope="row" style="display: table-cell;">명칭</th>
						<th scope="row" style="display: table-cell;">전체</th>
						<th scope="row" style="display: table-cell;">잔여좌석</th>
						<th scope="row" style="display: table-cell;">상세</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row" style="display: table-cell;">기흥 도서관</td>
						<td scope="row" style="display: table-cell;">
						<c:forEach items="${seat1 }" var="dto" varStatus="count" >
							<c:if test="${count.last }">
								${count.index+1 } 개
							</c:if>
						</c:forEach>
						</td>
						<td scope="row" style="display: table-cell;">잔여좌석</td>
						<td><a href="#" id="seat_1"><button class="detail">상세</button></a></td>
					</tr>
					<tr>
						<td scope="row" style="display: table-cell;">송파 도서관</td>
						<td scope="row" style="display: table-cell;">
						<c:forEach items="${seat2 }" var="dto" varStatus="count" >
							<c:if test="${count.last }">
								${count.index+1 } 개
							</c:if>
						</c:forEach>
						</td>
						<td scope="row" style="display: table-cell;">잔여좌석</td>
						<td><a href="#" id="seat_2"><button class="detail">상세</button></a></td>
					</tr>
					<tr>
						<td scope="row" style="display: table-cell;">장안 도서관</td>
						<td scope="row" style="display: table-cell;">
						<c:forEach items="${seat3 }" var="dto" varStatus="count" >
							<c:if test="${count.last }">
								${count.index+1 } 개
							</c:if>
						</c:forEach>
						</td>
						<td scope="row" style="display: table-cell;">잔여좌석</td>
						<td><a href="#" id="seat_3"><button class="detail">상세</button></a></td>
					</tr>
					<tr>
						<td scope="row" style="display: table-cell;">분당 도서관</td>
						<td scope="row" style="display: table-cell;">
						<c:forEach items="${seat4 }" var="dto" varStatus="count" >
							<c:if test="${count.last }">
								${count.index+1 } 개
							</c:if>
						</c:forEach>
						</td>
						<td scope="row" style="display: table-cell;">잔여좌석</td>
						<td><a href="#" id="seat_4"><button class="detail">상세</button></a></td>
					</tr>
				</tbody>
			</table>
		</div>

</div>
</div>
<div id="seatList">

</div>

<table id = "seatTable" style="display: none;">
	<tr>
		<td title = "1001">1001</td>
		<td title = "1002">1002</td>
		<td title = "1003">1003</td>
		<td title = "1004">1004</td>
		<td title = "1005">1005</td>
	</tr>
	<tr>
		<td title = "2001">2001</td>
		<td title = "2002">2002</td>
		<td title = "2003">2003</td>
		<td title = "2004">2004</td>
		<td title = "2005">2005</td>
	</tr>
	<tr>
		<td title = "3001">3001</td>
		<td title = "3002">3002</td>
		<td title = "3003">3003</td>
		<td title = "3004">3004</td>
		<td title = "3005">3005</td>
	</tr>
</table>

</section>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>