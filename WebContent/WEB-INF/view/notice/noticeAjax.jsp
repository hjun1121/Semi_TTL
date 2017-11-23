<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach begin="0" end="4" items="${list }" var="dto" varStatus="i">
	<span class="noticeType1">공지</span> <a href="${pageContext.request.contextPath }/notice/noticeView.notice?num=${dto.num}&library=${library}&ln=${ln}">${dto.title }</a> <br>
	<div class ="notice_margin"></div>
</c:forEach>