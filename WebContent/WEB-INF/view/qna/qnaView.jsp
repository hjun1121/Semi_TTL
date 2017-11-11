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
	
	$(".replyUpdate").click(function(){
		var replyNum = $(this).attr("title");  //title 숫자  = 리플 num 숫자
		var replyCon = $("#"+replyNum).attr("title"); //reply contents 내용
		
		var replyHtml = '<textarea id="upContents'+replyNum+'">'+replyCon+'</textarea>';
		replyHtml = replyHtml + '<input type="button" class="up" value="완료" title='+replyNum+'>';
		
		$("#"+replyNum).html(replyHtml);
		$(".btn"+replyNum).hide();
	});
	
	
	$("table").on("click", ".up", function(){  //댓글 수정 눌렀을때 생기는 up 클래스 버튼들
		var replyNum = $(this).attr("title");
		var replyCon = $("#upContents"+replyNum).val();  //새로운 reply contents
		document.frm2.num.value=replyNum;  		//댓글 번호
		document.frm2.contents.value=replyCon;  //댓글 내용
		document.frm2.submit();
		
	});
	
	$(".replyBtn").click(function(){
		$(".reReply").html("");
		var replyNum = $(this).attr("title"); //댓글 번호
		var replyHtml = '<td colspan="4"> <textarea id="inContents'+replyNum+'"></textarea> </td>'
		replyHtml = replyHtml+ '<td colspan="1"><input type="button" class="inReply" value="완료" title='+replyNum+'></td>'
		$("#reply"+replyNum).html(replyHtml);
		
	});
	
	$("table").on("click", ".inReply", function(){  //댓글 수정 눌렀을때 생기는 up 클래스 버튼들
		var replyNum = $(this).attr("title");
		var replyCon = $("#inContents"+replyNum).val();  //새로운 reply contents
		document.frm3.num.value=replyNum;      //댓글 달 애 번호 
		document.frm3.contents.value=replyCon; //댓글내용
		document.frm3.submit();
	});
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
<form action="../qnaReply/qnaReplyInsert.qnaReply" method="post">
	<input type ="hidden" value="${qnaDTO.num }" name="pNum">
	<input type ="hidden" value="${qnaDTO.pw }" name="pw">
	<p><textarea name="contents"></textarea>
	<button type="submit">등록</button> </p>
</form>

<c:if test="${replyList ne null }">
	<table border="1">
		<c:forEach items="${replyList }" var="dto" varStatus="i">
			<tr>
				<td>작성자</td>
				<td>${dto.writer }</td>
				<td>날짜</td>
				<td>${dto.reg_date }</td>
				<td colspan="3">버튼들</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td colspan="3" id="${dto.num }" title="${dto.contents }" >
				<c:forEach begin="1" end="${dto.depth }">
					->
				</c:forEach>
				${dto.contents }</td>
				<td>
				<input type="button" class="btn${dto.num } replyBtn" title="${dto.num }" value="답글">
				<c:if test="${member.id eq dto.writer}">
					<input type="button" class="replyUpdate btn${dto.num }" title="${dto.num }" value="수정">
				</c:if>
				<c:if test="${member.id eq dto.writer or member.kind eq 10 or member.id eq qnaDTO.writer }">
					<a href="../qnaReply/qnaReplyDelete.qnaReply?num=${dto.num }&pNum=${qnaDTO.num }"><input type="button" class="btn${dto.num }" value="삭제"></a>
				</c:if>
				</td>
			</tr>
			<tr id="reply${dto.num }" class="reReply" title="${dto.num }">
			</tr>
			
			
		</c:forEach>
	</table>
</c:if>

<form action="../qnaReply/qnaReplyUpdate.qnaReply" name="frm2">
	<input type ="hidden" value="${qnaDTO.num }" name="pNum">
	<input type ="hidden" value="${qnaDTO.pw }" name="pw">
	<input type ="hidden" name="num">
	<input type ="hidden" name="contents">
</form>

<form action="../qnaReply/reQnaReplyInsert.qnaReply" name="frm3">
	<input type ="hidden" value="${qnaDTO.num }" name="pNum">
	<input type ="hidden" value="${qnaDTO.pw }" name="pw">
	<input type ="hidden" name="num">
	<input type ="hidden" name="contents">
</form>

</body>
</html>