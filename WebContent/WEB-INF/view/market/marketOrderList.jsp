<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 판매 신청 리스트</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/market/marketOrderList.css">
<script type="text/javascript">
$(function(){
	
	$(".cur").each(function(){
		 if($(this).attr("title") == ${curPage }) {
			 $(this).attr("style", "color:red;");
		 }
	 });
	
	 var kind = '${kind}';
	 
	 $(".kind").each(function(){
		 if($(this).val() == kind) {
			 $(this).attr("selected", true);
		 }
	 });
});
</script>
</head>
<body>
<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp?library=${library}"></c:import>
</div>
<section id="section">
<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">중고 거래 현황</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>MARKET 거래 현황</li>
			</ul>
		</div>

	<!-- 검색 시작 -->
		<form name="frm" class="form-inline" action="./marketOrderList.market?library=${library}" method="post">
			<fieldset>
				<span class="bunch">
					<select id="kind" name = "kind" class="selectBox1">
						<option class = "kind" value="title">서명</option>
						<option class = "kind" value="writer">저자</option>
						<option class = "kind" value="company">출판사</option>
					</select>
				<input type="text" id = "search" name = "search" value = "${search}" class="inputTextType3 sw" maxlength="100" title="검색어" placeholder="검색어를 입력하세요">
				</span>
				<input type="submit" class="btnType5" value="검색" id = "search">
			</fieldset>
		</form>
		<!-- 검색 끝 -->
	<br><br>
	
	<div class="listTable">
	<table class="mobileTable tablet" >
	<thead>
		<tr>
			<th>No.</th>
			<th>서명</th>
			<th>저자</th>
			<th>출판사</th>
			<th>출판년도</th>
			<th>가격</th>
			<th>비치도서관</th>
			<th>상태</th>
		</tr>
		<c:forEach items="${marketOrderList }" var="marketOrderList">
			<tr>
				<td scope="row" class="footable-first-column">${marketOrderList.num }</td>
				<td scope="row" class="footable-first-column">${marketOrderList.title }</td>
				<td scope="row" style="display: table-cell;">${marketOrderList.writer }</td>
				<td scope="row" style="display: table-cell;">${marketOrderList.company }</td>
				<td  scope="row" data-class="expand">${marketOrderList.publish_date }</td>
				<td scope="row" style="display: table-cell;">${marketOrderList.price }</td>
				<c:choose>
					<c:when test="${marketOrderList.library eq 1}">
						<td scope="row" style="display: table-cell;">기흥구</td>
					</c:when>
					<c:when test="${marketOrderList.library eq 2}">
						<td scope="row" style="display: table-cell;">송파구</td>
					</c:when>
					<c:when test="${marketOrderList.library eq 3}">
						<td scope="row" style="display: table-cell;">장안구</td>
					</c:when>
					<c:when test="${marketOrderList.library eq 4}">
						<td scope="row" style="display: table-cell;">분당구</td>
					</c:when>
					<c:otherwise>
						<td scope="row" style="display: table-cell;">없음</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${marketOrderList.approval eq 0}">
						<td>거절</td>
					</c:when>
					<c:when test="${marketOrderList.approval eq 1}">
						<td>대기</td>
					</c:when>
					<c:when test="${marketOrderList.approval eq 10}">
						<td>수락</td>
					</c:when>
					<c:otherwise>
						<td>없음</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
	<div class = "paging" style = "text-align: center;">
		<ul class="pagination pagination-sm">
			<c:if test="${page.curBlock>1}">
			<li><button class="go" id="${page.startNum-1}">[이전]</button></li>
			</c:if>
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<li><a class="cur" title="${i }" href="./marketOrderList.market?curPage=${i}&id=${id }&kind=${kind}&search=${search}&library=${library}">${i}</a></li>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./marketOrderList.market?curPage=${requestScope.page.lastNum+1}&library=${library}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	</div>
	</div>
</div>		
	</section>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>