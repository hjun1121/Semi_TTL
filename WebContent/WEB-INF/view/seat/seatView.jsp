<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty member }">
	<table style="border-left: none; border: 1px solid e6e6e6;">
		<tr><th style="background-color: #f3f3f3; color: #727272; width:100px">1F</th>
		<c:forEach begin="0" end="${cnt1-1 }" items="${list }" var="dto">
			<c:if test="${dto.state eq 1}">
				<td style="width: 150px; text-align: center;">${dto.seat_num }</td>
			</c:if>
			<c:if test="${dto.state ne 1}">
				<td style="background-color: #004640;text-align: center;color: red;">${dto.seat_num }</td>
			</c:if>
		</c:forEach>
		</tr>
		
		<tr><th style="background-color: #f3f3f3; color: #727272; width:100px">2F</th>
		<c:forEach begin="${cnt1 }" end="${cnt2-1 }" items="${list }" var="dto">
			<c:if test="${dto.state eq 1}">
				<td style="width: 150px; text-align: center;">${dto.seat_num }</td>
			</c:if>
			<c:if test="${dto.state ne 1}">
				<td style="background-color: #004640;text-align: center;color: red;">${dto.seat_num }</td>
			</c:if>
		</c:forEach>	
		</tr>	
		
		<tr><th style="background-color: #f3f3f3; color: #727272; width:100px">3F</th>
		<c:forEach begin="${cnt2 }" end="${cnt3-1 }" items="${list }" var="dto">
			<c:if test="${dto.state eq 1}">
				<td style="width: 150px; text-align: center;">${dto.seat_num }</td>
			</c:if>
			<c:if test="${dto.state ne 1}">
				<td style="background-color: #004640;text-align: center;color: red;">${dto.seat_num }</td>
			</c:if>
		</c:forEach>	
		</tr>	
	</table>
</c:if>

<c:if test="${not empty member }">
	<table style="border-left: none; border: 1px solid e6e6e6;">
		<tr><th style="background-color: #f3f3f3; color: #727272; width:100px">1F</th>
		<c:forEach begin="0" end="${cnt1-1 }" items="${list }" var="dto">
			<c:if test="${dto.state eq 1}">
				<td style="width: 150px; text-align: center;">
				<a style="color: black;" target="blank" href="${pageContext.request.contextPath }/seat/seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">${dto.seat_num }</a>
				</td>
			</c:if>
			<c:if test="${dto.state ne 1}">
				<td style="background-color: #004640;text-align: center;">
				<a style="color: red;" target="blank" href="${pageContext.request.contextPath }/seat/seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">${dto.seat_num }</a>
				</td>
			</c:if>
		</c:forEach>
		</tr>
		
		<tr><th style="background-color: #f3f3f3; color: #727272;">2F</th>
		<c:forEach begin="${cnt1 }" end="${cnt2-1 }" items="${list }" var="dto">
			<c:if test="${dto.state eq 1}">
				<td style="width: 150px; text-align: center;">
				<a style="color: black;" target="blank" href="${pageContext.request.contextPath }/seat/seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">${dto.seat_num }</a>
				</td>
			</c:if>
			<c:if test="${dto.state ne 1}">
				<td style="background-color: #004640;text-align: center;">
				<a style="color: red;" target="blank" href="${pageContext.request.contextPath }/seat/seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">${dto.seat_num }</a>
				</td>
			</c:if>
		</c:forEach>	
		</tr>	
		
		<tr><th style="background-color: #f3f3f3; border-bottom: 1px solid e6e6e6; color: #727272;">3F</th>
		<c:forEach begin="${cnt2 }" end="${cnt3-1 }" items="${list }" var="dto">
			<c:if test="${dto.state eq 1}">
				<td style="width: 150px; text-align: center;">
				<a style="color: black;" target="blank" href="${pageContext.request.contextPath }/seat/seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">${dto.seat_num }</a>
				</td>
			</c:if>
			<c:if test="${dto.state ne 1}">
				<td style="background-color: #004640;text-align: center;">
				<a style="color: red;" target="blank" href="${pageContext.request.contextPath }/seat/seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">${dto.seat_num }</a>
				</td>
			</c:if>
		</c:forEach>	
		</tr>	
	</table>

</c:if>

