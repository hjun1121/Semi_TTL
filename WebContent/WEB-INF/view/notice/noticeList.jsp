<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/temp/header.css">
<link rel="stylesheet" href="../css/temp/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
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
<c:import url="../../../temp/header.jsp"></c:import>
	<div>
		<form name="frm" class="form-inline" action="./noticeList.notice"
			method="post">
			<div>
				<span> <select name="kind" id="kind">
						<option class="kind" value="title">제목</option>
						<option class="kind" value="writer">글쓴이</option>
						<option class="kind" value="contents">내용</option>
				</select> <input type="text" class="form-control" id="search"
					placeholder="Enter" name="search" value=${search }>
				</span>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-default" value="Search">
					</div>
				</div>
			</div>
		</form>
	</div>
	<h1>${fn:toUpperCase(requestScope.notice)}</h1>
	<table class="table table-hover">
		<tr>
			<td>num</td>
			<td>title</td>
			<td>writer</td>
			<td>date</td>
			<td>hit</td>
		</tr>
		<c:forEach items="${requestScope.list}" var="dto">
		
		<tr>
			<td>${dto.num}</td>
			<td>
			<c:catch>
			<c:forEach begin="0" end="${dto.depth-1}">
				--
			</c:forEach>
			</c:catch>
			<a href="./${requestScope.notice}View.${requestScope.notice}?num=${dto.num}">${dto.title}</a>
			</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.hit}</td>
		</tr>
		</c:forEach>
	</table>
	<c:if test="${not empty member and member.kind eq 10}">
		<a href="./${requestScope.notice}Write.${requestScope.notice}">WRITE</a>
	</c:if>
	
	<div>
		<ul class="pagination">
			<c:if test="${page.curBlock>1}">
			<li><button class="go" id="${page.startNum-1}">[이전]</button></li>
			</c:if>
			
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<li><a
				href="./${requestScope.notice}List.${requestScope.notice}?curPage=${i}">${i}</a></li>
			</c:forEach>
			
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./${requestScope.notice}List.${requestScope.notice}?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
			</c:if>
			
		</ul>
	</div>
<c:import url="../../../temp/footer.jsp"></c:import>
</body>
</html>