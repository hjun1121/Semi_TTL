<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var type = ${qnaDTO.type};
	if(type == 1){
		$("#type").val("중고장터문의");
	}else if(type ==2){
		$("#type").val("도서신청문의");
	}else if(type ==3){
		$("#type").val("이용문의");
	}
	
	var library = ${qnaDTO.library};
	if(library == 1){
		$("#library").val("기흥구");
	}else if(library ==2){
		$("#library").val("송파구");
	}else if(library ==3){
		$("#library").val("장안구");
	}else if(library ==4){
		$("#library").val("분당구");
	}
	
	
});
</script>
</head>
<body>

<h2>QnA Details</h2>
<form action="../qna/qnaUpdate.qna" method="get" name="frm">
		<p>num<input type="text" name="num" value=${qnaDTO.num } readonly="readonly"></p>
		<input type="hidden" name="type" value=${qnaDTO.type } readonly="readonly">
		<p>type<input type="text" id="type" readonly="readonly" ></p>
		<p>title<input type="text" name="title" value=${qnaDTO.title } readonly="readonly"></p>
		<p>contents<input type="text" name="contents" value=${qnaDTO.contents } readonly="readonly"></p>
		<p>writer<input type="text" name="writer" value=${qnaDTO.writer } readonly="readonly"></p>
		<p>date<input type="text" name="date" value=${qnaDTO.reg_date } readonly="readonly"></p>
		<p>hit<input type="text" name="hit" value=${qnaDTO.hit } readonly="readonly" ></p>
		<input type="hidden" name="library" value=${qnaDTO.library } readonly="readonly">
		<p>library <input type="text" id="library" value=${qnaDTO.library } readonly="readonly"></p>
		
		<input type="submit" value="수정">
		<a href="../qna/qnaDelete.qna?num=${qnaDTO.num }"><input type="button" value="삭제"></a>
		<a href="../qna/qnaList.qna"><input type="button" value="list"></a>
</form>	
<hr>
<form action="../qnaReply/qnaReplyInsert.qnaReply?pNum=${qnaDTO.num }" method="post">
	<p><textarea name="contents"></textarea>
	<button type="submit">등록</button> </p>
</form>
<c:if test="${replyList ne null }">
	<table border="1">
		<c:forEach items="${replyList }" var="DTO" varStatus="i">
			<tr>
				<td colspan="4">${DTO.writer }</td>
				<td colspan="2">${DTO.reg_date }</td>
			</tr>
			
			<tr>
				<td colspan="3" id="${DTO.num }"><div id="update${DTO.num }">${DTO.contents }</div></td>
				<td class="btn${DTO.num }"><input type="button" class="replyUpdate" title="${DTO.num }" value="수정"></td>
				<td><input type="button" class="reReply btn${DTO.num }" title="${DTO.num }" value="답글"></td>
				<td class="btn${DTO.num }"><a href="../qnaReply/qnaReplyDelete.qnaReply?num=${DTO.num }&pNum=${qnaDTO.num }"><input type="button" value="삭제"></a></td>
			</tr>
			
			<tr id="reReply${DTO.num }">
			</tr>
		</c:forEach>
	</table>
</c:if>
</body>
</html>