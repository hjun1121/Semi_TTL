<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table style="width: 100%; border: none; border-collapse: collapse;"> 
<c:forEach items="${seat }" var="dto" varStatus="count">
	<c:if test="${empty sessionScope.member }">
		<c:if test="${dto.state eq 1 }">
			<tr><td id="${count.index }" class="seats" style="background-color: white; color: black"> ${dto.seat_num }</td></tr>
		</c:if>
		
		<c:if test="${dto.state eq 0 }">
			<tr><td id="${count.index }" class="seats" style="background-color: black; color: white"> ${dto.seat_num }</td></tr>
		</c:if>
	</c:if>
	
	
	<c:if test="${not empty sessionScope.member }">
		<c:if test="${dto.state eq 1 }">
			<tr>
				<td id="${count.index }" class="seats">
					<a  style="background-color: white; color: black" target="1" href="./seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">
					${dto.seat_num }</a>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${dto.state eq 0 }">
			<tr>
				<td id="${count.index }" class="seats">
					<a style="background-color: black; color: white" target="1" href="./seatInfo.seat?seat_num=${dto.seat_num }&state=${dto.state}&library=${dto.library}">
					${dto.seat_num }</a>
				</td>
			</tr>
		</c:if>
	</c:if>
</c:forEach>
</table>
