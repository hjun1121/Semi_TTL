<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookOrderDetails.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>
<div>
	<c:import url="../member/myPage.jsp"></c:import>
</div>

<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">신청 상세 내역</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/common/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>신청 내역</li>
				<li>&gt;</li>
				<li>신청 상세 내역</li>
			</ul>
		</div>
		<form action="../book/bookOrderList.book?id=${member.id }&state=3" method="post">
		<div>
			<input type="hidden" name="num" value=${bookOrderDetails.num }>
			<input type="hidden" name="id" value=${bookOrderDetails.id }>
			<table class="revisionTable">
				<tr>
					<th>서명</th>
					<td><input type="text" name="title" class="noneBorder" value="${bookOrderDetails.title }"readonly="readonly"></td>
				</tr>
				<tr>
					<th>권수</th>
					<td>1</td>
				</tr>
				<tr>
					<th>저자</th>
					<td><input type="text" name="writer" class="noneBorder" value="${bookOrderDetails.writer } "readonly="readonly"></td>
				</tr>
				<tr>
					<th>출판사</th>
					<td><input type="text" name="company" class="noneBorder" value="${bookOrderDetails.company } "readonly="readonly"></td>
				</tr>
				<tr>
					<th>출판년도</th>
					<td><input type="number" name="publish_date" class="noneBorder" value=${bookOrderDetails.publish_date } readonly="readonly"></td>
				</tr>
				<tr>
					<th>신청사유</th>
					<td><input type="text" class="noneBorder"  class="noneBorder" name="contents" value="${bookOrderDetails.contents }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="number" name="price" class="noneBorder" value=${bookOrderDetails.price } readonly="readonly"></td>
				</tr>
				<tr>
					<th>비치도서관</th>
					<c:choose>
						<c:when test="${bookOrderDetails.library eq 1}">
							<td>기흥구</td>
							<input type="hidden" name="library" value=${bookOrderDetails.library }>
						</c:when>
						<c:when test="${bookOrderDetails.library eq 2}">
							<td>송파구</td>
							<input type="hidden" name="library" value=${bookOrderDetails.library }>
						</c:when>
						<c:when test="${bookOrderDetails.library eq 3}">
							<td>장안구</td>
							<input type="hidden" name="library" value=${bookOrderDetails.library }>
						</c:when>
						<c:when test="${bookOrderDetails.library eq 4}">
							<td>분당구</td>
							<input type="hidden" name="library" value=${bookOrderDetails.library }>
						</c:when>
						<c:otherwise>
							<td>기흥구</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
				<th>상태</th>
				<c:choose>
					<c:when test="${bookOrderDetails.state eq 0}">
						<td>취소(<input type="text" name="cancel" class="noneBorder" value="${bookOrderDetails.cancel }">)</td>
						<input type="hidden" name="state" class="noneBorder" value=${bookOrderDetails.state } readonly="readonly">
					</c:when>
					<c:when test="${bookOrderDetails.state eq 1}">
						<td>대기<td>
						<input type="hidden" name="state" class="noneBorder" value=${bookOrderDetails.state } readonly="readonly">
					</c:when>
					<c:otherwise>
						<td>승인</td>
						<input type="hidden" name="state" class="noneBorder" value=${bookOrderDetails.state } readonly="readonly">
					</c:otherwise>
				</c:choose>
				</tr>
			</table>
			
			<div class="btn">
			<input type="submit" class="btnType5" id="btn" name="btn" value="확인">
			<c:if test="${bookOrderDetails.state eq 1 }">
				<a href="./bookOrderUpdate.book?num=${bookOrderDetails.num }"><input class="btnType5" type="button" value="정보 수정"></a>
				<a href="./bookOrderDelete.book?num=${bookOrderDetails.num }"><input class="btnType5" type="button" value="신청 취소"></a>
			</c:if>
			</div>
		</div>
		</form>
	</div>
</div>
</form>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>