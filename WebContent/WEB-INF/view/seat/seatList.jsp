<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>좌석 리스트</title>
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
				url: "./seatList.seat?ln=${ln}",
				type: "POST",
				data: {
					library : 1,
					ln: ${ln}
				},
				success:function(data){
					$("#seatList").html(data.trim());
				}
			});
		});
		
		$("#seat_2").click(function(){
			$.ajax({
				url: "./seatList.seat?ln=${ln}",
				type: "POST",
				data: {
					library : 2,
					ln: ${ln}
				},
				success:function(data){
					$("#seatList").html(data.trim());
				}
			});
			
		});
		
		$("#seat_3").click(function(){
			$.ajax({
				url: "./seatList.seat?ln=${ln}",
				type: "POST",
				data: {
					library : 3,
					ln: ${ln}
				},
				success:function(data){
					$("#seatList").html(data.trim());
				}
			});
			
		});
		
		$("#seat_4").click(function(){
			$.ajax({
				url: "./seatList.seat?ln=${ln}",
				type: "POST",
				data: {
					library : 4,
					ln: ${ln}
				},
				success:function(data){
					$("#seatList").html(data.trim());
				}
			});
			
		});

	});
</script>
</head>
<body>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

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
						${cntAlla1} 석
						</td>
						<td scope="row" style="display: table-cell;">${cnta1 } 석</td>
						<td><a id="seat_1"><button class="detail">상세</button></a></td>
					</tr>
					<tr>
						<td scope="row" style="display: table-cell;">송파 도서관</td>
						<td scope="row" style="display: table-cell;">
						${cntAlla2} 석
						</td>
						<td scope="row" style="display: table-cell;">${cnta2 } 석</td>
						<td><a id="seat_2"><button class="detail">상세</button></a></td>
					</tr>
					<tr>
						<td scope="row" style="display: table-cell;">장안 도서관</td>
						<td scope="row" style="display: table-cell;">
						${cntAlla3} 석
						</td>
						<td scope="row" style="display: table-cell;">${cnta3 } 석</td>
						<td><a id="seat_3"><button class="detail">상세</button></a></td>
					</tr>
					<tr>
						<td scope="row" style="display: table-cell;">분당 도서관</td>
						<td scope="row" style="display: table-cell;">
						${cntAlla4} 석
						</td>
						<td scope="row" style="display: table-cell;">${cnta4 } 석</td>
						<td><a id="seat_4"><button class="detail">상세</button></a></td>
					</tr>
				</tbody>
			</table>
		</div>
</div>
</div>
<div id="seatList">

</div>

</section>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>