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
	$(".replyUpdate").click(function() {
		var c = $(this).attr("title");
		var s =$("#update"+c).html();
		var chtml = '<textarea id="upContents'+c+'">'+s+'</textarea>';
		chtml+='<input type="button" class="up" value="완료" title='+c+'>';
		chtml+='</a>';
		$("#update"+c).html(chtml);
		
		$(".btn"+c).hide();
	});
	
	$(".reReply").click(function() {
		var c = $(this).attr("title");
		var rehtml='<td>';
		rehtml+='<textarea id="reReplyCon'+c+'"></textarea>';
		rehtml+='</td>'
		rehtml+='<td><input type="button" class="upReply" value="완료" title='+c+'></td>';
		$("#reReply"+c).html(rehtml);
		$(".btn"+c).hide();
	});
	
	$("table").on("click", ".up", function() {
		var c = $(this).attr("title");
		var con = $("#upContents"+c).val();
		document.frm.rnum.value=c;
		document.frm.rcontents.value=con;
		document.frm.pnum.value=document.frm2.num.value;
		document.frm.submit();
	});
	$("table").on("click", ".upReply", function() {
		var c = $(this).attr("title");
		var rcon = $("#reReplyCon"+c).val();
		document.frm.rcontents.value=rcon;
		document.frm.submit();
	});
});
</script>
</head>
<body>
<form action="../qnaReply/qnaReplyUpdate.qnaReply" name="frm">
	<input type="hidden" name="rnum">
	<input type="hidden" name="rcontents">
	<input type="hidden" name="pnum">
</form>
<form action="../qnaReply/qnaReplyInsert.qnaReply" name="frm">
	<input type="hidden" name="rnum">
	<input type="hidden" name="rcontents">
	<input type="hidden" name="pnum">
</form>
<h2>QnA Details</h2>
<form action="../index.jsp" method="post" name="frm2">
		<p>num<input type="text" name="num" value=${qnaDTO.num }></p>
		<p>type<input type="text" name="type" value=${qnaDTO.type } ></p>
		<p>title<input type="text" name="title" value=${qnaDTO.title } ></p>
		<p>contents<input type="text" name="contents" value=${qnaDTO.contents }></p>
		<p>writer<input type="text" name="writer" value=${qnaDTO.writer }></p>
		<p>date<input type="text" name="date" value=${qnaDTO.reg_date }></p>
		<p>hit<input type="text" name="hit" value=${qnaDTO.hit } ></p>
		<p>kind<input type="text" name="kind" value=${qnaDTO.kind } ></p>
		<button type="submit">확인</button>
		<a href="./qnaDelete.qna?num=${qnaDTO.num }"><input type="button" value="삭제"></a>
		<a href="./qnaUpdate.qna?num=${qnaDTO.num }"><input type="button" value="수정"></a>
</form>	
<hr>
<form action="../qnaReply/qnaReplyInsert.qnaReply?pNum=${qnaDTO.num }" method="post">
	<p><textarea name="reply"></textarea><button>등록</button> </p>
</form>
<c:if test="${rDTO ne null }">
<table>
<c:forEach items="${rDTO }" var="DTO" varStatus="i">
	<tr>
		<td>${DTO.writer }</td>
		<td>${DTO.reg_date }</td>
	</tr>
	
	<tr>
		<td id="${DTO.num }"><div id="update${DTO.num }">${DTO.contents }</div></td>
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