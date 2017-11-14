<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			var f = $("#f").val();
			var m = $("#m").val();
			var l = $("#l").val();
			var all = f+'-'+m+'-'+l;
			
			$("#phone").val(all);
		});
		
	});
	
</script>
</head>
<body>
	<select id="f">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="031">031</option>
		<option value="02">02</option>
	</select>
	-<input type="text" id="m" >-<input type="text" id="l" >
	<p><input type="text" id="phone" name="phone"></p>
	<input type="button" id="btn" value="클릭">
</body>
</html>