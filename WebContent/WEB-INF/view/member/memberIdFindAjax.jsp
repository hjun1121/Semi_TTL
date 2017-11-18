<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberIdFindAjax.css">
<c:if test="${size ne 0 }">
	<table border="1">
		<c:forEach items="${list }" var="dto">
			
			<br>
			회원님의 아이디는 ${dto.id } 입니다.
			<%-- <tr>
				<th>id</th>
				<th>생년월일</th>
			</tr>
			<tr>
				<td>${dto.id }</td>
				<td>${dto.birth }</td>
			</tr>	 --%>
		</c:forEach>
	</table>
</c:if>  
<c:if test="${size eq 0 }">
<br>
일치하는 아이디가 없습니다.
</c:if>