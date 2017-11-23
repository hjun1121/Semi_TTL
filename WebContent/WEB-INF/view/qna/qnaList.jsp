<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/qna/qnaList.css">
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
		
		$("#write_btn").click(function(){

			location.href="./qnaWrite.qna?library=${library}&ln=${ln}";
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

<section id = "section">
<div id = "bts_top_section">
<div id="divContentsW">
		<div id="divContents">
			<h2 id="divTitle">QnA</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>QnA</li>
				</ul>
			</div>
	<!-- 검색 시작 -->	
	
	<form name="frm" class="form-inline" action="./qnaList.qna?library=${library}&ln=${ln}" method="post">
			<fieldset>
				<legend>검색</legend>
				
				<span class="bunch">
					<label class="skip">검색어</label>
					<select name="kind" id="kind" class="selectBox1">
						<option class="kind" value="title">제목</option>
						<option class="kind" value="writer">글쓴이</option>
						<option class="kind" value="contents">내용</option>
					</select> 
					<input type="text" class="inputTextType3 sw" id="search" maxlength="100" title="검색어" placeholder="검색어를 입력하세요" name="search" value=${search }>
				</span>
					 <input type="submit" class="btnType5" value="검색">
			 </fieldset>
		</form>
		<br>
	<!-- 검색 끝 -->
	
	
	<!-- qna list 시작 -->
	<c:if test="${size eq 0 }">
		<h2 id="divTitle">QNA 내역이 없습니다.</h2>
	</c:if>
	<c:if test="${size ne 0 }">
	<div class="listTable">
		<table class="mobileTable tablet">
			<caption>게시판 목록</caption>
			<thead>
				<tr>
					<th class="footable-first-column">No.</th>
					<th data-class="expand" style="text-align: left;">제목</th>
					<th style="display: table-cell;">작성자</th>
					<th style="display: table-cell;">작성일</th>
					<th style="display: table-cell;">조회수</th>
					<c:if test="${member.kind eq 10 }">
						<th>pw</th>
					</c:if>
					
				</tr>
			</thead>
			<c:forEach items="${list}" var="dto">
			<tbody>
				<tr>
					<td class="num footable-first-column">${dto.num}</td>
					<td class="title expand">
						<c:catch>
						<c:forEach  begin="0" end="${dto.depth-1}">
							--
						</c:forEach>
						</c:catch>
						<a href="./qnaViewCheck.qna?num=${dto.num }&library=${library}">${dto.title}</a>&nbsp;

					</td>
					<td class="writer" style="display: table-cell;">
						${dto.writer}
					</td>
					<td class="reportDate" style="display: table-cell;">${dto.reg_date}</td>
					<td class="view_cnt" style="display: table-cell;">${dto.hit}</td>
					<c:if test="${member.kind eq 10 }">
						<td>${dto.pw }</td>
					</c:if>
				</tr>	
			</tbody>
			</c:forEach>
		</table>
	</div>
	</c:if>
	<br><br>
	<c:if test="${not empty member}">
	<input type="button" class="adv" id="write_btn" value="글쓰기">
	</c:if>
	
	<div class = "paging" style = "text-align: center;">
		<ul class="pagination pagination-sm">
			<c:if test="${page.curBlock>1}">
			<li><a href = "./qnaList.qna?curPage=${page.startNum-1}&library=${library}&ln=${ln}">[이전]</a></li>
			</c:if>
			
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<li><a id="pa" class="cur" title="${i }" href="./qnaList.qna?curPage=${i}&kind=${kind}&search=${search}&library=${library}&ln=${ln}">${i}</a></li>
			</c:forEach>

			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a href="./qnaList.qna?curPage=${page.lastNum+1}&library=${library}&ln=${ln}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	</div>
</div>
</div>
</section>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>