<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookOrderForm.css">
<title>도서 신청 폼</title>
<script type="text/javascript">
	$(function() {
		var library = '${member.library}';
		 $(".library").each(function(){
			 if($(this).val() == library) {
				 $(this).attr("selected", true);
			 }
		 });
		 
		 $("#btn_NO").click(function(){
				location.href="${pageContext.request.contextPath }/book/bookOrderTotalList.book?ln=${ln}";
			});
		 
		 
		 $("#btn_OK").click(function(){

				if($("#title").val() == ""){
					alert("도서명 입력하세요.");
					$("#title").focus();
				}else if($("#writer").val() == ""){
					alert("저자 입력하세요.");
					$("#writer").focus();
				}else if($("#company").val() == ""){
					alert("출판사 입력하세요.");
					$("#company").focus();
				}else if($("#publish_date").val() == ""){
					alert("출판년도 입력하세요.");
					$("#publish_date").focus();
				}else if($("#price").val() == ""){
					alert("정가 입력하세요.");
					$("#price").focus();
				}else if($("#label001").val() == ""){
					alert("사유 입력하세요.");
					$("#label001").focus();	
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

<section id = "section">
	<div id = "bts_top_section">
		<h2 id="divTitle">도서신청</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="../../index.jsp?ln=${ln}"><img src="${pageContext.request.contextPath}/image/bookTotalSearch/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>통합검색</li>
				<li>&gt;</li>
				<li>소장도서</li>
			</ul>
		</div>


	<!-- /// -->
	<div class="cstmWrap">
	<form action="./bookOrderForm.book?ln=${ln}" name="frm" method="post">
		<input type = "hidden" class = "form-control" name = "id" value = "${member.id}">
		<ul class = "otoForm mt30 borTc3">
			<li>
				<p class="writeTit" >도서명</p>
				<input type="text" id="title" name="title">
			</li>
			<li>
				<p class="writeTit" >저자</p>
				<input type="text" id="writer" name="writer">
			</li>
			<li>
				<p class="writeTit" >출판사</p>
				<input type="text" id="company" name="company">
			</li>
			<li>
				<p class="writeTit" >출판년도</p>
				<input type="number" id="publish_date" name="publish_date" placeholder = "출판년도는 숫자만 입력해 주세요">
			</li>
			<li>
				<p class="writeTit" >가격</p>
				<input type="number" id="price" name="price">
			</li>
			<li>
				<p class="writeTit">신청사유</p>
				<div class="textForm js-label mt10">
					<textarea id="label001"  name="contents" cols="30" rows="10"></textarea>
				</div> 
			</li>
			<li>
				<p class="writeTit">비치 도서관</p>
				<select name = "library" style="min-width:100px; height: 40px;">
					<option value = "1" class="library" id = "1">기흥구</option>
					<option value = "2" class="library" id = "2">송파구</option>
					<option value = "3" class="library" id = "3">장안구</option>
					<option value = "4" class="library" id = "4">분당구</option>
				</select>
			</li>
		</ul>
		<div class="btnBox">
			
			<span class="button1">
				<input type="button" id="btn_NO" class="type4 large" value="취소">
			</span>
			<span class="button1">
				<!-- <button id="btn_OK" class = "type1 large" type = "submit">신청</button> -->
				<input type="button" id="btn_OK" class="type1 large" value="신청">
			</span> 
		</div>
		
	</form>
	</div>
	<!-- /// -->
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