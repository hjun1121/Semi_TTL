<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중고장터 거래 내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/market/marketDealsDetails.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<div>
	<c:import url="../member/myPage.jsp?library=${library}&ln=${ln}"></c:import>
</div>

<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">MARKET 거래 상세 내역</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/common/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>MARKET 거래 내역</li>
				<li>&gt;</li>
				<li>상세 내역</li>
			</ul>
		</div>
	<form action="../market/marketDealsList.market?id=${member.id }&type=3&library=${library}&ln=${ln}" method="post">
		<table class="Dtable">
			<tr>
				<th>No.</th>
				<td><input type="text" class="noneBorder" name="num" value=${bookDealsDetail.num } readonly="readonly"></td>
			</tr>
			<tr>
				<th>서명</th>
				<td><input type="text" class="noneBorder" name="title" value="${bookDealsDetail.title }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>저자</th>
				<td><input type="text" class="noneBorder" name="writer" value="${bookDealsDetail.writer }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><input type="text" class="noneBorder" name="company" value="${bookDealsDetail.company }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>출판년도</th>
				<td><input type="text" class="noneBorder" name="publish_date" value=${bookDealsDetail.publish_date } readonly="readonly"></td>
			</tr>
			<tr>
				<th>거래일자</th>
				<td><input type="text" class="noneBorder" name="t_date" value=${bookDealsDetail.t_date } readonly="readonly"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" class="noneBorder" name="price" value=${bookDealsDetail.price } readonly="readonly"></td>
			</tr>
			<tr>
			<th>비치도서관</th>
					<c:choose>
					<c:when test="${bookDealsDetail.library eq 1}">
						<td><input type="text" class="noneBorder" value="기흥구" readonly="readonly"></td>
						<input type="hidden" name="library" value=${bookDealsDetail.library }>
					</c:when>
					<c:when test="${bookDealsDetail.library eq 2}">
						<td><input type="text" class="noneBorder" value="송파구" readonly="readonly"></td>
						<input type="hidden" name="library" value=${bookDealsDetail.library }>
					</c:when>
					<c:when test="${bookDealsDetail.library eq 3}">
						<td><input type="text" class="noneBorder" value="장안구" readonly="readonly"></td>
						<input type="hidden" name="library" value=${bookDealsDetail.library }>
					</c:when>
					<c:when test="${bookDealsDetail.library eq 4}">
						<td><input type="text" class="noneBorder" value="분당구" readonly="readonly"></td>
						<input type="hidden" name="library" value=${bookDealsDetail.library }>
					</c:when>
				</c:choose>
			</tr>
			<tr>
			<c:choose>
				<c:when test="${bookDealsDetail.kind eq 1}">
					<th>거래</th>
					<td><input type="text" class="noneBorder" value="판매" readonly="readonly"></td>
					<input type="hidden" name="kind" value=${bookDealsDetail.kind }>
				</c:when>
				<c:when test="${bookDealsDetail.kind eq 2}">
					<th>거래</th>
					<td><input type="text" class="noneBorder" value="구매" readonly="readonly"></td>
					<input type="hidden" name="kind" value=${bookDealsDetail.kind }>
				</c:when>
			</c:choose>
			</tr>
			<tr>
			<c:choose>
				<c:when test="${bookDealsDetail.state eq 1}">
					<th>상태</th>
					<td><input type="text" class="noneBorder" value="상" readonly="readonly"></td>
					<input type="hidden" name="state" value=${bookDealsDetail.state }>
				</c:when>
				<c:when test="${bookDealsDetail.state eq 2}">
					<th>상태</th>
					<td><input type="text" class="noneBorder" value="중" readonly="readonly"></td>
					<input type="hidden" name="state" value=${bookDealsDetail.state }>
				</c:when>
				<c:when test="${bookDealsDetail.state eq 2}">
					<th>상태</th>
					<td><input type="text" class="noneBorder" value="하" readonly="readonly"></td>
					<input type="hidden" name="state" value=${bookDealsDetail.state }>
				</c:when>
			</c:choose>
			</tr>
			<c:choose>
			<c:when test="${bookDealsDetail.delivery eq 1}">
				<tr>
				<th>수령방법</th>
				<td><input type="text" class="noneBorder" value="택배" readonly="readonly"></td>
				<input type="hidden" name="delivery" value=${bookDealsDetail.delivery }>
				</tr>
				<tr>
				<th>주소(우편번호)</th>
					<td><input type="text" name="postcode" class="noneBorder" size="5" value=${bookDealsDetail.postCode } readonly="readonly"></tr>
					<tr>
					<th>(상세주소)</th>
					<td><input type="text" name="addr" class="noneBorder"  value=${bookDealsDetail.addr } readonly="readonly">
					<input type="text" name="addr2" class="noneBorder" value=${bookDealsDetail.addr2 } readonly="readonly"></td>
				</tr>
			</c:when>
			<c:when test="${bookDealsDetail.delivery eq 2}">
			<tr>
				<th>수령방법</th>
				<td><input type="text" class="noneBorder" value="직접수령" readonly="readonly"></td>
				<input type="hidden" name="delivery" value=${bookDealsDetail.delivery }>
			</tr>
			</c:when>
			</c:choose>
		</table>
		
		<div class="btn">
			<input type="submit" class="btnType5" id="btn" name="btn" value="확인">
			<a href="./marketDealsDelete.market?num=${bookDealsDetail.num }&library=${library}&ln=${ln}"><input type="button" class="btnType5" value="삭제"></a>
			<a href="./bookBuyFinish.market?num=${bookDealsDetail.num }&ln=${ln}"><input type="button" class="btnType5" value="결제완료"></a>
		</div>
	</form>	
	</div>
</div>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>