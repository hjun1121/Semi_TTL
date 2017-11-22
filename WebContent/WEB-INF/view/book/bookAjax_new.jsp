<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach items="${list }" var="dto" varStatus="i">

<li style="width: 143px;">
	<a href="${pageContext.request.contextPath }/book/bookInformation.book?num=${dto.num}">
		<span class="bookCover"><img src="#"  width="107px;" height="150px;"  alt="책표지" title="${dto.title }"></span>
		<span class="bookTit">${dto.title }</span>
		<span class="writer">${dto.writer }</span>
	</a>
</li>

</c:forEach>