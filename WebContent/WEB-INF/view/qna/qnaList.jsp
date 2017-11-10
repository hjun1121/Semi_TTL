<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var kind = '${kind}';
	$(".kind").each(function(){
		 if($(this).val() == kind1) {
			 $(this).attr("selected", true);
		 }
	});

</script>
</head>
<body>
<h2>Qna List</h2>
	<div>
		<form name="frm" class="form-inline" action="./qnaList.qna" method="post">
			<div>
				<span> <select name="kind">
						<option class="kind" value="title">제목</option>
						<option class="kind" value="writer">저자</option>
				</select> <input type="text" class="form-control" id="search" placeholder="Enter" name="search" value="${search }">
				</span>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-default" value="Search">
					</div>
				</div>
			</div>
		</form>
	</div>
	<table id = "qnaList" border="1">
	<tr>
		<th>num</th>
		<th>title</th>
		<th>date</th>
		<th>writer</th>
		<th>hit</th>
	</tr>
	<c:forEach items="${list }" var="qnaDTO">
		<tr>
			<td>${qnaDTO.num }</td>
			<td><a href="./qnaViewCheck.qna?num=${qnaDTO.num }&type=${qnaDTO.type}&library=${qnaDTO.library}">${qnaDTO.title }</a></td>
			<td>${qnaDTO.reg_date }</td>
			<td>${qnaDTO.writer }</td>
			<td>${qnaDTO.hit }</td>
		</tr>
	</c:forEach>
	<tr>
	<a href="./qnaWrite.qna"><input type="button" value="글쓰기"></a>
	</tr>
	</table>
	<div style = "text-align: center;">
			<ul class="pagination pagination-sm">
				<c:if test="${page.curBlock>1}">
				<li><a href = "./qnaList.qna?curPage=${page.startNum-1}">[이전]</a></li>
				</c:if>
				
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li><a id="pa" href="./qnaList.qna?curPage=${i}&kind=${kind}&search=${search}">${i}</a></li>
				</c:forEach>

				<c:if test="${page.curBlock < page.totalBlock}">
				<li><a href="./qnaList.qna?curPage=${page.lastNum+1}">[다음]</a></li>
				</c:if>
			</ul>
		</div>
</body>
</html>