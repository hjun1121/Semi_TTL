<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/qna/qnaView.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

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
		</div>
		
		<form id = "qnaDetail_frm" action="../qna/qnaUpdate.qna" method="get" name="frm">
		<div class = "boardInfo">
			<input type="hidden" name="library" value=${qnaDTO.library } readonly="readonly">
			<p class="boardInfoTitle">${qnaDTO.title}</p>
			<p class="writeInfo">${qnaDTO.reg_date}<span>조회&nbsp;${qnaDTO.hit}</span></p>
			<dl class="writerInfo">
					<dd class="writer">
						<span>${qnaDTO.writer}</span>
					</dd>
					<dd class="writerEmail">
							<span>${qnaDTO.type}</span>
					</dd>
			</dl>
		</div>
		<div class = "boardContent">
		<br>
			<p>${qnaDTO.contents}</p>
		<br>
		</div>
		<div id = "bottom_btns">
			<input type="submit" class="adv" value="수정">
			<a href="../qna/qnaDelete.qna?num=${qnaDTO.num }"><input type="button" class="adv" value="삭제"></a>
			<a href="../qna/qnaList.qna"><input type="button" class="adv" value="list"></a>
		</div>
		</form>
		
		<hr>
		
		<div class = "boardList">
		<form action="../qnaReply/qnaReplyInsert.qnaReply" method="post">
			<input type ="hidden" value="${qnaDTO.num}" name="pNum">
			<input type ="hidden" value="${qnaDTO.pw}" name="pw">
			<p><textarea name="contents" class = "reply"></textarea>
			<button type="submit" class="adv">등록</button> </p>
		</form>
		</div>
	</div>
</div>
</section>
<!-- -------------------------------------------------------------------- -->
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

<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>