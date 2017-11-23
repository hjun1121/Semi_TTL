<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/qna/qnaUpdate.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	var library = ${library};
	var type= ${type};
	
	$(".library").each(function(){
		 if($(this).val() == library) {
			 $(this).attr("selected", true);
		 }
	 });
	
	$(".type").each(function(){
		 if($(this).val() == type) {
			 $(this).attr("selected", true);
		 }
	 });
	$("#btn_OK").click(function(){
		if($("#title2").val() == ""){
			alert("제목을 입력하세요.");
			$("#title2").focus();
		}else if($("#contents2").val() == ""){
			alert("내용을 입력하세요.");
			$("#contents2").focus();
		}else if($("#pw2").val() == ""){
			alert("비밀번호를 입력하세요.");
			$("#pw2").focus();
		}else{
			document.frm.submit();
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

<div id="divContentsW">
		<div id="divContents">
			<h2 id="divTitle">QnA 수정</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>QnA</li>
					<li>&gt;</li>
					<li>QnA 수정</li>
				</ul>
			</div>	
			
			<div class="cstmWrap">
			<form action="./qnaUpdate.qna?ln=${ln}" name="frm" method="post">
				<ul class = "otoForm mt30 borTc3">
					<li>
						<p class="writeTit" >No.</p>
						<input type="text" name="num" value=${qnaDTO.num } readonly="readonly">
					</li>
					<li>
						<p class="writeTit" >날짜</p>
						<input type="text" name="date" value=${qnaDTO.reg_date } readonly="readonly">
					</li>
					<li>
						<p class="writeTit" >제목</p>
						<input type="text" id="title2" name="title" value="${qnaDTO.title }" >
					</li>
					<li>
						<p class="writeTit" >내용</p>
						<input type="text" id="contents" name="contents" value="${qnaDTO.contents }" >
					</li>
					<li>
						<p class="writeTit" >작성자</p>
						<input type="text" name="writer" value="${qnaDTO.writer }" readonly="readonly">
					</li>
					<li>
						<p class="writeTit" >비밀번호</p>
						<input type="password" id="pw2" name="pw" value=${qnaDTO.pw } >
					</li>
					<li>
						<p class="writeTit">도서관명</p>
						<select name = "library">
							<option value = "1" class="library">기흥구</option>
							<option value = "2" class="library">송파구</option>
							<option value = "3" class="library">장안구</option>
							<option value = "4" class="library">분당구</option>
						</select>
					</li>
				</ul>
				<div class="btnBox">
					<button id="btn_NO"><a href="./qnaList.qna?library=${library}&ln=${ln}">취소</a></button>
					<button type="button" id="btn_OK">확인</button>
				</div>
			</form>
			</div>
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