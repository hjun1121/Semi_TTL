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
		
		$("#mailList").change(function(){
			var ml = $("#mailList").val();
			
			if(ml==0){
				$("#email2").prop('readonly', false);
				$("#email2").val("");
				$("#email2").focus();
			}else{
				$("#email2").val(ml);
				$("#email2").prop('readonly', true);
			}
		});
		
		$("#mailCheck").click(function(){
			var email1 = $("#email1").val();
			var email2 = $("#email2").val();
			var all = email1+'@'+email2;
			$("#email").val(all);
		});

		$("#email1").change(function(){
			mailCheck=false;
			$("#ch_email").html("<p style=\"color: red\">이메일 인증 필요</p>");
		});
		$("#mailList").change(function(){
			alert("s");
		});
	});
	
</script>
</head>
<body>
	<input id="email1" type="text">@<input type="text" id="email2" >
	<select id = "mailList">
		<option  value="0">직접입력</option>
		<option  value="naver.com">naver.com</option>
		<option  value="daum.net">daum.net</option>
		<option  value="gmail.com">gmail.com</option>
		<option  value="hotmail.com">hotmail.com</option>
	</select>
	<input type="text" id="email" name="email" >
	
	<input type="button" id="mailCheck" value="클릭">
</body>
</html>