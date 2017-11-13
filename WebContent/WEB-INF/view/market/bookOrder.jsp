<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	 var library = '${buyWishList.library}';
	 
	 $(".library").each(function(){
		 if($(this).val() == library) {
			 $(this).attr("selected", true);
		 }
	 });
	 
	 $("#approval").change(function(){
		 var approval = $("#approval").val(); 
		 if(approval==2 ){
			 $("#addr").attr("style","display:inline;");
		 }else {
			 $("#addr").attr("style","display:none;");
		 }
	 });
	 
});
</script>
</head>
<body>
	<h3>Market- 구매신청form</h3>
	<div style = "height: 50px"></div>
	<form action="../market/bookBuy.market" method="POST">
	<input type = "hidden" class = "form-control" name = "num" value = ${buyWishList.num }>
		<input type = "hidden" class = "form-control" name = "id" value = ${member.id }>
		<input type = "hidden" class = "form-control" name = "kind" value = '1'>
		<table class = "table">
			<tr>
				<td>책제목</td>
				<td><input type = "text" class = "form-control" name = "title" value="${buyWishList.title}"></td>
				<td>저자</td>
				<td><input type = "text" class = "form-control" name = "writer" value="${buyWishList.writer}"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type = "text" class = "form-control" name = "company" value="${buyWishList.company}"></td>
				<td>출판년도</td>
				<td><input type = "text" class = "form-control" name = "publish_date" placeholder = "출판년도는 숫자만 입력해 주세요" value="${buyWishList.publish_date}"></td>
			</tr>
			<tr>
				<td>정가</td>
				<td><input type = "text" class = "form-control" name = "price" value="${buyWishList.price}"></td>
			</tr>
			<tr>
				<td>도서관명</td>
				<c:choose>
					<c:when test="${buyWishList.library eq 1}">
						<td><input type = "text" class = "form-control"value="기흥구"></td>
						<input type = "hidden" class = "form-control" name = "library" value="1">
					</c:when>
					<c:when test="${buyWishList.library eq 2}">
						<td><input type = "text" class = "form-control" value="송파구"></td>
						<input type = "hidden" class = "form-control" name = "library" value="2">
					</c:when>
					<c:when test="${buyWishList.library eq 3}">
						<td><input type = "text" class = "form-control" value="장안구"></td>
						<input type = "hidden" class = "form-control" name = "library" value="3">
					</c:when>
					<c:when test="${buyWishList.library eq 4}">
						<td><input type = "text" class = "form-control" value="분당구"></td>
						<input type = "hidden" class = "form-control" name = "library" value="4">
					</c:when>
					<c:otherwise>
						<td>-</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td>구입방법</td>
				<td><select name = "approval" id="approval">
					<option class = "approval" value = "1">직접수령</option>
					<option class = "approval" value = "2">택배</option>
				</select>
				<td id="price"></td>
			</tr>
			<tr id="addr" style="display: none;">
				<td>주소</td>
				<td><input type="text" name="addr" value=${member.addr }></td>
				<td>택배결제시 2500원 추가되어 결제됩니다.</td>
			</tr>
		</table>
		<button style = "float: right;" class = "btn btn-default" type = "submit">CONFIRM</button>
	</form>
</body>
</html>