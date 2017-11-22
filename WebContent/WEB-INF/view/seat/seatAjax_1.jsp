<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach items="${seat }" var="dto" varStatus="i">
	<li>
		<img src="${pageContext.request.contextPath }/image/index/readingRoom2.png">
		<span id="useSeat0_2">105</span> / <span id="totalSeat0_2">292</span>
	</li>
</c:forEach>

<%-- <li>
	<img src="${pageContext.request.contextPath }/image/index/readingRoom2.png">
	<span id="useSeat0_2">105</span> / <span id="totalSeat0_2">292</span>
</li> --%>