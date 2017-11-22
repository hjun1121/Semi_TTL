<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 작성 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/qna/qnaWrite.css">
<script type="text/javascript">
$(function(){
	$(".library").each(function(){
		 if($(this).val() == ${member.library}) {
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
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<!-- <h2>QnA Details</h2> -->
<%-- <form action="./qnaWrite.qna?library=${library}" method="post"> --%>
<!-- 		<p> -->
<!-- 		<select name="type"> -->
			<!-- <option value="1">중고장터문의</option>
			<option value="2">도서신청문의</option>
			<option value="3">이용문의</option>
<!-- 		</select> -->
<!-- 		</p> -->
<!-- 		<p>title<input type="text" name="title"></p> -->
<!-- 		<p>contents<input type="text" name="contents"></p> -->
<%-- 		<p>writer<input type="text" name="writer" value="${member.id }" readonly="readonly"></p> --%>
<!-- 		<p>password<input type="text" name="pw"></p> -->
		
<!-- 		<p> -->
<!-- 		<select name="library" name="library"> -->
			<!-- <option class="library" value="1">기흥구</option>
			<option class="library" value="2">송파구</option>
			<option class="library" value="3">장안구</option>
			<option class="library" value="4">분당구</option>
<!-- 		</select> -->
<!-- 		</p> -->
<!-- 		<button type="submit">확인</button> -->
<!-- </form>	 -->

<c:import url="${myContextPath}/temp/header.jsp"></c:import>
<div id="divContentsW">
		<div id="divContents">
			<h2 id="divTitle">글쓰기</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>QnA</li>
					<li>&gt;</li>
					<li>글쓰기</li>
				</ul>
			</div>	
			
			<div class="cstmWrap">
			<form action="./qnaWrite.qna?library=${library}" name="frm" method="post" >
				<input type = "hidden" class = "form-control" name = "id" value = "${member.id }">
				<ul class = "otoForm mt30 borTc3">
					<li>
						<p class="writeTit" >문의</p>
						<select name="type" id="type">
							<option value="1">중고장터문의</option>
							<option value="2">도서신청문의</option>
							<option value="3">이용문의</option>
						</select>
					</li>
					
					<li>
						<p class="writeTit" >제목</p>
						<input type="text" id="title2" name="title">
					</li>
					<li>
						<p class="writeTit" >내용</p>
						<input type="text" id="contents2" name="contents">
					</li>
					<li>
						<p class="writeTit" >작성자</p>
						<input type="text" name="writer" value="${member.id }" readonly="readonly">
					</li>
					<li>
						<p class="writeTit" >비밀번호</p>
						<input type="password" id="pw2" name="pw">
					</li>
					<li>
						<p class="writeTit">도서관명</p>
						<select name="library" id="library">
							<option class="library" value="1">기흥구</option>
							<option class="library" value="2">송파구</option>
							<option class="library" value="3">장안구</option>
							<option class="library" value="4">분당구</option>
						</select>
					</li>
				</ul>
				<div class="btnBox">
					<button id="btn_NO"><a href="./qnaList.qna?library=${library}">취소</a></button>
					<button type="button" id="btn_OK">확인</button>
				</div>
			</form>
			</div>
		</div>
	</div>

<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>