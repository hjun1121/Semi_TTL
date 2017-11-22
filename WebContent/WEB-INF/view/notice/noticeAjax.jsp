<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach begin="0" end="4" items="${list }" var="dto" varStatus="i">
	공지 : ${dto.title } <br>
</c:forEach>