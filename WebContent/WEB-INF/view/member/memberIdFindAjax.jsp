<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${size ne 0 }">
	<table border="1">
		<c:forEach items="${list }" var="dto">
			<tr>
				<th>id</th>
				<th>생년월일</th>
			</tr>
			<tr>
				<td>${dto.id }</td>
				<td>${dto.birth }</td>
			</tr>	
		</c:forEach>
	</table>
</c:if>  
<c:if test="${size eq 0 }">
일치하는 id가 없습니다
</c:if>