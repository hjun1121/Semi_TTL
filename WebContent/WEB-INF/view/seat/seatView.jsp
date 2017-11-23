<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty member }">
	<table border="1">
		<tr><td>1층</td>
		<c:forEach begin="0" end="${cnt1-1 }" items="${list }" var="dto">
			<c:if test="${dto.state eq 1}">
				<td style="background-color: green">${dto.seat_num }</td>
			</c:if>
			<c:if test="${dto.state ne 1}">
				<td style="background-color: red">${dto.seat_num }</td>
			</c:if>
		</c:forEach>
		</tr>
		
		<tr><td>2층</td>
		<c:forEach begin="${cnt1 }" end="${cnt2-1 }" items="${list }" var="dto">
			<c:if test="${dto.state eq 1}">
				<td style="background-color: green">${dto.seat_num }</td>
			</c:if>
			<c:if test="${dto.state ne 1}">
				<td style="background-color: red">${dto.seat_num }</td>
			</c:if>
		</c:forEach>	
		</tr>	
		
		<tr><td>3층</td>
		<c:forEach begin="${cnt2 }" end="${cnt3-1 }" items="${list }" var="dto">
			<c:if test="${dto.state eq 1}">
				<td style="background-color: green">${dto.seat_num }</td>
			</c:if>
			<c:if test="${dto.state ne 1}">
				<td style="background-color: red">${dto.seat_num }</td>
			</c:if>
		</c:forEach>	
		</tr>	
	</table>
</c:if>

<c:if test="${not empty member }">
	<table border="1">
		<tr><td>1층</td>
		<c:forEach begin="0" end="${cnt1-1 }" items="${list }" var="dto">
			<c:if test="${dto.state eq 1}">
				<td style="background-color: green">
				<a style="color: yellow;" target="blank" href="${pageContext.request.contextPath }/seat/seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">${dto.seat_num }</a>
				</td>
			</c:if>
			<c:if test="${dto.state ne 1}">
				<td style="background-color: red">
				<a style="color: black;" target="blank" href="${pageContext.request.contextPath }/seat/seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">${dto.seat_num }</a>
				</td>
			</c:if>
		</c:forEach>
		</tr>
		
		<tr><td>2층</td>
		<c:forEach begin="${cnt1 }" end="${cnt2-1 }" items="${list }" var="dto">
			<c:if test="${dto.state eq 1}">
				<td style="background-color: green">
				<a style="color: yellow;" target="blank" href="${pageContext.request.contextPath }/seat/seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">${dto.seat_num }</a>
				</td>
			</c:if>
			<c:if test="${dto.state ne 1}">
				<td style="background-color: red">
				<a style="color: black;" target="blank" href="${pageContext.request.contextPath }/seat/seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">${dto.seat_num }</a>
				</td>
			</c:if>
		</c:forEach>	
		</tr>	
		
		<tr><td>3층</td>
		<c:forEach begin="${cnt2 }" end="${cnt3-1 }" items="${list }" var="dto">
			<c:if test="${dto.state eq 1}">
				<td style="background-color: green">
				<a style="color: yellow;" target="blank" href="${pageContext.request.contextPath }/seat/seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">${dto.seat_num }</a>
				</td>
			</c:if>
			<c:if test="${dto.state ne 1}">
				<td style="background-color: red">
				<a style="color: black;" target="blank" href="${pageContext.request.contextPath }/seat/seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">${dto.seat_num }</a>
				</td>
			</c:if>
		</c:forEach>	
		</tr>	
	</table>

</c:if>

