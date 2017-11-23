<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookOrderList.css">
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
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp?ln=${ln}"></c:import>
</div>


<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">신청 내역</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp?ln=${ln}"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>신청 내역</li>
			</ul>
		</div>

	<div>
	<!-- 검색 시작 -->
		<form name="frm" class="form-inline" action="./bookOrderList.book?ln=${ln}" method="post">
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
	</div>
	
	<br>
	<a href="./bookOrderList.book?id=${member.id }&state=3&kind=${kind}&search=${search}&library=${library}&ln=${ln}"><input class="btnType3" type="button" value="전체"></a>
	<a href="./bookOrderList.book?id=${member.id }&state=0&kind=${kind}&search=${search}&library=${library}&ln=${ln}"><input class="btnType3" type="button" value="대기"></a>
	<a href="./bookOrderList.book?id=${member.id }&state=1&kind=${kind}&search=${search}&library=${library}&ln=${ln}"><input class="btnType3" type="button" value="거절"></a>
	<a href="./bookOrderList.book?id=${member.id }&state=2&kind=${kind}&search=${search}&library=${library}&ln=${ln}"><input class="btnType3" type="button" value="승인"></a>
	<br><br>
	<c:if test="${size eq 0 }">
		<h2 id="divTitle">신청 내역이 없습니다.</h2>
		<br><br><br>
	</c:if>
	<c:if test="${size ne 0 }">
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
			<th>취소사유</th>
		</tr>
		<c:forEach items="${bookOrderList }" var="bookOrder_list">
			<tr>
				<td scope="row" class="footable-first-column">${bookOrder_list.num }</td>
				<td><a
					href="./bookOrderDetails.book?num=${bookOrder_list.num }&library=${library}&ln=${ln}">${bookOrder_list.title }</a></td>
				<td scope="row" style="display: table-cell;">${bookOrder_list.writer }</td>
				<td scope="row" style="display: table-cell;">${bookOrder_list.company }</td>
				<td  scope="row" data-class="expand">${bookOrder_list.publish_date }</td>
				<td scope="row" style="display: table-cell;">${bookOrder_list.price }</td>
				<c:choose>
					<c:when test="${bookOrder_list.library eq 1}">
						<td scope="row" style="display: table-cell;">기흥구</td>
					</c:when>
					<c:when test="${bookOrder_list.library eq 2}">
						<td scope="row" style="display: table-cell;">송파구</td>
					</c:when>
					<c:when test="${bookOrder_list.library eq 3}">
						<td scope="row" style="display: table-cell;">장안구</td>
					</c:when>
					<c:when test="${bookOrder_list.library eq 4}">
						<td scope="row" style="display: table-cell;">분당구</td>
					</c:when>
					<c:otherwise>
						<td scope="row" style="display: table-cell;">없음</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${bookOrder_list.state eq 1}">
						<td scope="row" style="display: table-cell;">거절</td>
						<td>${bookOrder_list.cancel }</td>
					</c:when>
					<c:when test="${bookOrder_list.state eq 0}">
						<td scope="row" style="display: table-cell;">대기</td>
						<td></td>
					</c:when>
					<c:otherwise>
						<td scope="row" style="display: table-cell;">승인</td>
						<td></td>
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
				<li><a class="cur" title="${i }" href="./bookOrderList.book?curPage=${i}&id=${id }&kind=${kind}&search=${search}&library=${library}&ln=${ln}">${i}</a></li>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
				<li><a href="./bookOrderList.book?curPage=${requestScope.page.lastNum+1}&library=${library}&ln=${ln}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	</div>
	</c:if>
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