<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookOrderUpdate.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
var library = '${DTO.library}';
$(function(){
	$(".library").each(function(){
		 if($(this).val() == ${bookorder.library }) {
			 $(this).attr("selected", true);
		 }
	});
	$("#btn").click(function(){
		if($("#title").val()==""){
			alert("서명을 입력 해주세요.");
			$("#title").focus();
		}else if($("#writer").val()==""){
			alert("저자를 입력해주세요.");	
			$("#writer").focus();
		}else if($("#company").val()==""){
			alert("출판사를 입력 해주세요.");	
			$("#company").focus();	
		}else if($("#publish_date").val()==""){
			alert("출판년도를 입력 해주세요.");	
			$("#publish_date").focus();	
		}else if($("contents").val()==""){
			alert("신청사유을 입력 해주세요.");
			$("#contents").focus();
		}else if($("#price").val()==""){
			alert("가격을 입력 해주세요.");
			$("#price").focus();
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

<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp"></c:import>
</div>

<form action="./bookOrderUpdate.book?library=${library}" method="post" name="frm" id="frm">
<div id="divContentsW">
		<div id="divContents">
		<h2 id="divTitle">신청 내역 수정</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/common/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>신청 내역</li>
				<li>&gt;</li>
				<li>신청 상세 내역</li>
				<li>&gt;</li>
				<li>신청 수정</li>
			</ul>
		</div>
		
		<div>
		<input type="hidden" name="num" value=${bookorder.num }>
			<table class="table">
				<tr>
					<th>서명</th>
					<td><input type="text" name="title" id="title" class="useBorder" value="${bookorder.title }"></td>
				</tr>
				<tr>
					<th>권수</th>
					<td>1</td>
				</tr>
				<tr>
					<th>저자</th>
					<td><input type="text" name="writer" id="writer" class="useBorder" value="${bookorder.writer }"></td>
				</tr>
				<tr>
					<th>출판사</th>
					<td><input type="text" name="company" id="company" class="useBorder" value="${bookorder.company }"></td>
				</tr>
				<tr>
					<th>출판년도</th>
					<td><input type="text" name="publish_date" id="publish_date" class="useBorder" value=${bookorder.publish_date }></td>
				</tr>
				<tr>
					<th>신청사유</th>
					<td><textarea class="noneBorder" row="30"  cols="150" id="contents" name="contents" style="resize: none; wrap:hard;">${bookorder.contents }</textarea></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="number" name="price" id="price" class="useBorder" value=${bookorder.price }></td>
				</tr>
				<tr>
					<th>비치도서관</th>
					<td>
					<select name="library" class="sel_size">
						<option value="1" class="library">기흥구</option>
	   					<option value="2" class="library">송파구</option>
	   					<option value="3" class="library">장안구</option>
	   					<option value="4" class="library">분당구</option>
					</select>
				</tr>
				<tr>
				<th>상태</th>
				<c:choose>
					<c:when test="${bookorder.state eq 1}">
						<td>취소</td>
						<input type="hidden" name="state" class="useBorder" value=${bookorder.state } >
					</c:when>
					<c:when test="${bookorder.state eq 0}">
						<td>대기<td>
						<input type="hidden" name="state" class="useBorder" value=${bookorder.state } >
					</c:when>
					<c:otherwise>
						<td>승인</td>
						<input type="hidden" name="state" class="useBorder" value=${bookorder.state } >
					</c:otherwise>
				</c:choose>
				</tr>
			</table>
			
			<div class="btn">
			<a href="./bookOrderList.book?state=3&library=${library}"><input type="button" class="btn_NO" value="취소"></a>
			<input type="button" class="btn_OK" id="btn" name="btn" value="수정">
			</div>
		</div>
	</div>
</div>
</form>
	
<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>