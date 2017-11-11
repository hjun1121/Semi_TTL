<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	
});

</script>

</head>
<body>
<h2>QnA Update</h2>
<form action="./qnaUpdate.qna" method="post">
		<p>num<input type="text" name="num" value=${qnaDTO.num } readonly="readonly"></p>
		<p>type
		<select name = "type">
				<option value="1" class="type">중고장터문의</option>
				<option value="2" class="type">도서신청문의</option>
				<option value="3" class="type">이용문의</option>
		</select>
		</p>
		
		<p>title<input type="text" name="title" value=${qnaDTO.title } ></p>
		<p>contents<input type="text" name="contents" value=${qnaDTO.contents }></p>
		<p>writer<input type="text" name="writer" value=${qnaDTO.writer } readonly="readonly"></p>
		<p>date<input type="text" name="date" value=${qnaDTO.reg_date } readonly="readonly"></p>
		<p>library
		<select name = "library">
					<option value = "1" class="library">기흥구</option>
					<option value = "2" class="library">송파구</option>
					<option value = "3" class="library">장안구</option>
					<option value = "4" class="library">분당구</option>
		</select>
		</p>
		<p>pw<input type="text" name="pw" value=${qnaDTO.pw } ></p>
		<button type="submit">확인</button>
</form>	
</body>
</html>