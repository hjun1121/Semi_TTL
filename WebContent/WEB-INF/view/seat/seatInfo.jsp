<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>좌석 현황</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/seat/seatInfo.css">
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
<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<section id = "section">
<div id = "bts_top_section">
	<div id="divContents">
		<h2 id="divTitle">좌석 예약</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>좌석 현황</li>
					<li>&gt;</li>
					<li>좌석 예약</li>
				</ul>
			</div>
			<div class = "listTable">
			<table class = "mobileTable tablet">
				<tr>
					<th>좌석번호</th>
					<th>도서관</th>
					<th>상태</th>
					<th>사용자</th>
					<th>예약시간</th>
				</tr>
				<tr>
					<td>${seat.seat_num }</td>
					<td>${seat.library }</td>
					<c:if test="${seat.state  eq 0 }">
						<td>사용 중</td>
					</c:if>
					<c:if test="${seat.state  eq 1 }">
						<td>사용 가능</td>
					</c:if>
					<td></td>
					<td></td>
				</tr>
			</table>
			</div>
			<br><br>
			<div class="btnBox">
				<form action="./seatInfo.seat" method="post">
					<input type="hidden" name="seat_num" value=${seat.seat_num }>
					<input type="hidden" name="library" value=${seat.library }>
					<input type="hidden" name="state" value=${seat.state }>
					<input type="hidden" name="id" value=${member.id }>
					<a href="./seatList.seat?library=${library}"><button type="button" class="btn_NO">취소</button></a>
					<button type="submit" class="btn_OK">예약</button>
				</form>
			</div>
	</div>
</div>
</section>

<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>