<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/notice/detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberJoin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/notice/noticeList.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	
		$(".cur").each(function(){
			 if($(this).attr("title") == ${curPage }) {
				 $(this).attr("style", "color:red;");
			 }
		 });
	
		var kind = '${kind}';
		$(".kind").each(function() {
			if($(this).val() == kind){
				$(this).attr("selected", true);
			}
		});
});
</script>
<title>Notice</title>
</head>
<body>
<c:import url="${myContextPath }/temp/header.jsp"></c:import>

<section id = "section">
<div id = "bts_top_section">
	<div id="divContentsW">
		<div id="divContents">
			
			<h2 id="divTitle">공지사항</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>공지사항</li>
				</ul>
			</div>
			

	
	<!-- 검색 시작  -->
	
		<form name="frm" class="form-inline" action="./noticeList.notice" method="post">
			<fieldset>
				
				<span class="bunch">
					<label class="skip">검색어</label>
					<select name="kind" id="kind" class="selectBox1">
						<option class="kind" value="title">제목</option>
						<option class="kind" value="writer">글쓴이</option>
						<option class="kind" value="contents">내용</option>
					</select> 
					<input type="text" class="inputTextType3 sw" id="search" maxlength="100" title="검색어" placeholder="검색어를 입력하세요" name="search" value=${search }>
				</span>
					 <input type="submit" class="btnType5" value="검색" style="width: 95px;">
			 </fieldset>
		</form>
		
		<br>
	<!-- 검색 끝 -->

	<!-- list 시작 -->
	<div class="listTable">
			<table class="mobileTable tablet">
				<caption>게시판 목록</caption>
				<thead>
					<tr>
						<th class="footable-first-column">No.</th>
						<th data-class="expand">제목</th>
						<th style="display: table-cell;">작성자</th>
						<th style="display: table-cell;">작성일</th>
						<th style="display: table-cell;">조회수</th>
						<th class="footable-last-column" style="display: table-cell;">첨부파일</th>
					</tr>
				</thead>
				<c:forEach items="${requestScope.list}" var="dto">
				<tbody>
					<tr>
						<td class="num footable-first-column">${dto.num}</td>
						<td class="title expand">
							<c:catch>
							<c:forEach  begin="0" end="${dto.depth-1}">
								--
							</c:forEach>
							</c:catch>
							<a href="./noticeView.notice?num=${dto.num}">${dto.title}</a>&nbsp;
						</td>
						<td class="writer" style="display: table-cell;">
							${dto.writer}
						</td>
						<td class="reportDate" style="display: table-cell;">${dto.reg_date}</td>
						<td class="view_cnt" style="display: table-cell;">${dto.hit}</td>
						<td class="footable-last-column" style="display: table-cell;">
							<img class="addedFile" src="${pageContext.request.contextPath }/image/notice/clip.png" title="첨부파일" alt="첨부파일">
						</td>
					</tr>	
				</tbody>
				</c:forEach>
			</table>
		</div>
	
	
	<c:if test="${not empty member and member.kind eq 10}">
		<a id = "adm_write_btn" class="btn btn-default" href="./noticeWrite.notice">WRITE</a>
	</c:if>
	
	<!-- 페이징 -->
<!-- 	<div style = "text-align: center;"> -->
<!-- 	<div class="paging"> -->
		
<!-- 		<ul class="pagination"> -->
			
<%-- 			<c:if test="${page.curBlock>1}"> --%>
<!-- 				<li> -->
<%-- 					<a href="./noticeList.notice?curPage=${page.startNum-1}"> --%>
<%-- 					<img src="${pageContext.request.contextPath }/image/notice/prevPage.gif" alt="이전" title="이전"> --%>
<!-- 					</a> -->
<!-- 				</li> -->
<%-- 			</c:if> --%>
			
<%-- 			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i"> --%>
<!-- 			<li> -->
<%-- 				<a href="./noticeList.notice?curPage=${i}&kind=${kind}&search=${search}"> --%>
<%-- 					<span>${i}</span> --%>
<!-- 				</a> -->
<!-- 			</li> -->
<%-- 			</c:forEach> --%>
		
			
<%-- 			<c:if test="${page.curBlock < page.totalBlock}"> --%>
<!-- 				<li> -->
<%-- 					<a href="./${requestScope.notice}List.${requestScope.notice}?curPage=${requestScope.page.lastNum+1}"> --%>
<%-- 						<img src="${pageContext.request.contextPath }/image/notice/nextPage.gif" alt="다음" title="다음"> --%>
<!-- 					</a> -->
<!-- 				</li> -->
<%-- 			</c:if> --%>
			
<!-- 		</ul> -->
<!-- 	</div> -->
<!-- 	</div> -->
	
		<div class = "paging" style = "text-align: center;">
			<ul class="pagination pagination-sm">
				<c:if test="${page.curBlock>1}">
				<li><a href = "./noticeList.notice?curPage=${page.startNum-1}"><img width="13" height="16"  src="${pageContext.request.contextPath}/image/bookTotalSearch/prevPage.gif" alt="이전" title="이전"></a></li>
				</c:if>

				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li><a class="cur" title="${i }" href="./noticeList.notice?curPage=${i}&kind=${kind}&search=${search}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${page.curBlock < page.totalBlock}">
				<li><a href="./${requestScope.notice}List.${requestScope.notice}?curPage=${requestScope.page.lastNum+1}"><img width="13" height="16" src="${pageContext.request.contextPath}/image/bookTotalSearch/nextPage.gif" alt="다음" title="다음"></a></li>
				</c:if>
			</ul>
		</div>
	
	<!-- 페이징 끝 -->
	
	</div>
</div>
</div>
</section>
<c:import url="${myContextPath }/temp/footer.jsp"></c:import>
</body>
</html>