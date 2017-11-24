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
<title>QnA 상세페이지</title>
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
		
		var replyHtml = '<textarea class="reText" id="upContents'+replyNum+'">'+replyCon+'</textarea>';
		replyHtml = replyHtml + '<td colspan="1"><input type="button" id="btn4" class="up" value="완료" title='+replyNum+'></td>';
		
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
		var replyHtml = '<textarea class="reText" id="inContents'+replyNum+'"></textarea>'
		replyHtml = replyHtml+ '<td colspan="1"><input type="button" class="inReply" id="btn4"  value="완료" title='+replyNum+'></td>'
		$("#reply"+replyNum).html(replyHtml);
		
	});
	
	$("table").on("click", ".inReply", function(){  //댓글 수정 눌렀을때 생기는 up 클래스 버튼들
		var replyNum = $(this).attr("title");
		var replyCon = $("#inContents"+replyNum).val();  //새로운 reply contents
		document.frm3.num.value=replyNum;      //댓글 달 애 번호 
		document.frm3.contents.value=replyCon; //댓글내용
		document.frm3.submit();
	});
	
/* 	$("#upbtn").click(function(){
		location.href="../qna/qnaUpdate.qna?library?num=${qnaDTO.num }";
	}); */
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
		</div>
		
		<form id = "qnaDetail_frm" action="../qna/qnaUpdate.qna?ln=${ln}" method="get" name="frm">
		<div class = "boardInfo">
			<input type="hidden" name="num" value=${qnaDTO.num } readonly="readonly">
			<input type="hidden" name="library" value=${qnaDTO.library } readonly="readonly">
			<input type="hidden" name="type" value=${qnaDTO.type } readonly="readonly">
			
			<p class="boardInfoTitle">${qnaDTO.title}</p>
			<p class="writeInfo">${qnaDTO.reg_date}<span>조회&nbsp;${qnaDTO.hit}</span></p>
			<dl class="writerInfo">
					<dd class="writer">
						<span>${qnaDTO.writer}</span>
					</dd>
					<dd class="writerEmail">
							<span>
								<c:if test="${qnaDTO.type eq 1}">중고장터문의</c:if>
								<c:if test="${qnaDTO.type eq 2}">도서신청문의</c:if>
								<c:if test="${qnaDTO.type eq 3}">이용문의</c:if>
							</span>
					</dd>
			</dl>
		</div>
		<div class = "boardContent">
		<br>
			<p>${qnaDTO.contents}</p>
		<br>
		</div>
		<div id = "bottom_btns">
		
		<c:if test="${not empty member and member.id eq qnaDTO.writer }">
			<input type="submit" id="upbtn" class="adv" value="수정">
			<a href="../qna/qnaDelete.qna?num=${qnaDTO.num }&library=${library}&ln=${ln}"><input type="button" class="adv" value="삭제"></a>
		</c:if>
			<a href="../qna/qnaList.qna?library=${library}&ln=${ln}"><input type="button" class="adv" value="list"></a>
		</div>
		</form>
		
		<hr>
		
		<div class = "boardList">
		<form action="../qnaReply/qnaReplyInsert.qnaReply?library=${library}&ln=${ln}" method="post">
			<input type ="hidden" value="${qnaDTO.num}" name="pNum">
			<input type ="hidden" value="${qnaDTO.pw}" name="pw">
			<textarea name="contents" class = "reply"></textarea>
			<c:if test="${not empty member }">
				<button type="submit" class="adv">등록</button> 
			</c:if>
		</form>
		</div>
	</div>
</div>
</section>
<!-- -------------------------------------------------------------------- -->



<div id="reQna">
<c:if test="${replyList ne null }">
		<c:forEach items="${replyList }" var="dto" varStatus="i">
	<dl class = "write-wrap e-talk">
		<dl class = "cmt_item f_line">
			<dt>
				<span class = "nameui" title = "writer_id">${dto.writer }</span>
				<i>${dto.reg_date }</i>
			</dt>
			<dd class = "usertxt">
				<span>
				<c:forEach begin="1" end="${dto.depth }">
					<img src = "${pageContext.request.contextPath }/image/common/bu_arr.png">
				</c:forEach>
				${dto.contents}</span>
			</dd>
<%-- 			<input type="button" id="btn1" class="btn${dto.num } replyBtn" title="${dto.num }" value="답글"> --%>
<%-- 			<c:if test="${member.id eq dto.writer}"> --%>
<%-- 				<input type="button" id="btn2" class="replyUpdate btn${dto.num }" title="${dto.num }" value="수정"> --%>
<%-- 			</c:if> --%>
			<c:if test="${member.id eq dto.writer or member.kind eq 10 or member.id eq qnaDTO.writer }">
				<a href="../qnaReply/qnaReplyDelete.qnaReply?num=${dto.num }&pNum=${qnaDTO.num }&library=${library}"><input type="button" id="btn3" class="btn${dto.num }" value="삭제"></a>
			</c:if>
		</dl>
	</dl>

<!-- 	<table> -->
<!-- 			<tr style="height: 50px;"> -->
<%-- 				<td id="wtd">${dto.writer }</td> --%>
<%-- 				<td id="dtd"><sub>${dto.reg_date }</sub></td> --%>
<!-- 				<td colspan="3"> -->
<%-- 				<input type="button" id="btn1" class="btn${dto.num } replyBtn" title="${dto.num }" value="답글"> --%>
<%-- 				<c:if test="${member.id eq dto.writer}"> --%>
<%-- 					<input type="button" id="btn2" class="replyUpdate btn${dto.num }" title="${dto.num }" value="수정"> --%>
<%-- 				</c:if> --%>
<%-- 				<c:if test="${member.id eq dto.writer or member.kind eq 10 or member.id eq qnaDTO.writer }"> --%>
<%-- 					<a href="../qnaReply/qnaReplyDelete.qnaReply?num=${dto.num }&pNum=${qnaDTO.num }&library=${library}"><input type="button" id="btn3" class="btn${dto.num }" value="삭제"></a> --%>
<%-- 				</c:if> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
			
<!-- 			<tr style="height: 50px;"> -->
<%-- 				<td colspan="3" id="${dto.num }" title="${dto.contents }" class="ctd" > --%>
<%-- 				<c:forEach begin="1" end="${dto.depth }"> --%>
<!-- 					-> -->
<%-- 				</c:forEach> --%>
<%-- 				${dto.contents }</td> --%>
<!-- 				<td> -->
<%-- 				<input type="button" class="btn${dto.num } replyBtn" title="${dto.num }" value="답글"> --%>
<%-- 				<c:if test="${member.id eq dto.writer}"> --%>
<%-- 					<input type="button" class="replyUpdate btn${dto.num }" title="${dto.num }" value="수정"> --%>
<%-- 				</c:if> --%>
<%-- 				<c:if test="${member.id eq dto.writer or member.kind eq 10 or member.id eq qnaDTO.writer }"> --%>
<%-- 					<a href="../qnaReply/qnaReplyDelete.qnaReply?num=${dto.num }&pNum=${qnaDTO.num }&library=${library}&ln=${ln}"><input type="button" class="btn${dto.num }" value="삭제"></a> --%>
<%-- 				</c:if> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<%-- 			<tr id="reply${dto.num }" class="reReply" title="${dto.num }"> --%>
<!-- 			</tr> -->
		</c:forEach>
	</table>
</c:if>
</div>

<form action="../qnaReply/qnaReplyUpdate.qnaReply?library=${library}&ln=${ln}" name="frm2">
	<input type ="hidden" value="${qnaDTO.num }" name="pNum">
	<input type ="hidden" value="${qnaDTO.pw }" name="pw">
	<input type ="hidden" name="num">
	<input type ="hidden" name="contents">
</form>

<form action="../qnaReply/reQnaReplyInsert.qnaReply?library=${library}&ln=${ln}" name="frm3">
	<input type ="hidden" value="${qnaDTO.num }" name="pNum">
	<input type ="hidden" value="${qnaDTO.pw }" name="pw">
	<input type ="hidden" name="num">
	<input type ="hidden" name="contents">
</form>

<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>