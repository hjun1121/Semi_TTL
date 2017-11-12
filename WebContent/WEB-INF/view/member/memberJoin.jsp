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
		var idCheck = false;
		var pwCheck = false;
		var mailCheck = false;
		
		//id 중복체크
		$("#id").change(function(){
			var id = $("#id").val();
			
			$.ajax({
				url: "./memberIdCheck.member",
				type: "POST",
				data: {
					id:id
				},
				success:function(data){
					if($("#id").val().length>5){
						if(data.trim() == 'ok'){
							$("#ch_id").html('<p style="color: green">사용가능 아이디</p>');	
							idCheck= true;
						}else{
							$("#ch_id").html('<p style="color: red">중복된 아이디</p>');	
							idCheck= false;
						}
					}else{
						$("#ch_id").html('<p style="color: red">아이디는 6자 이상</p>');	
						idCheck= false;
					}
				}//
			});
			
		});

		
		//pw 확인 체크
		$("#pw1").change(function(){
			$("#ch_pw").html('<p style="color: red">pw 확인해주세요</p>');
			$("#pw2").val("");
			pwCheck = false;
		});
		
		$("#pw2").change(function(){
			var pw1= $("#pw1").val();
			var pw2= $("#pw2").val();
			if(pw1 == pw2){
				$("#ch_pw").html('<p style="color: green">pw 확인 완료</p>');
				pwCheck = true;
			}else{
				$("#ch_pw").html('<p style="color: red">pw가 다릅니다</p>');
				pwCheck = false;
			}
		});

		//email 체크
		$("#mailCheck").click(function(){
			var email = $("#email").val();
			$.ajax({
				url: "./memberEmailCheck.member",
				type: "POST",
				data: {
					email: email
				},
				success:function(data){
					$("#ch_email").html(data);
				}
			});
			
		});

		$("#email").change(function(){
			mailCheck=false;
			$("#ch_email").html("<p style=\"color: red\">이메일 인증 필요</p>");
			
		});
		
		$("#ch_email").on("click", "#check_mail" , function(){
			if($("#num").val() == $("#check").val()){
				alert("인증번호 일치");
				mailCheck=true;
				$("#ch_email").html("<p style=\"color: green\">인증된 이메일</p>");
			}else{
				alert("인증번호 불일치");
				mailCheck=false;
			}	
		});
		
		
		$("#btn").click(function(){
			if(idCheck == false){
				alert("id확인해주세요");
				$("#id").focus();
			}else if(pwCheck == false){
				alert("pw확인해주세요");
				$("#pw1").focus();
			}else if($("#name").val()==""){
				alert("name 입력");
				$("#name").focus();
			}else if($("#birth").val()==""){
				alert("birth 입력");	
				$("#birth").focus();
			}else if($("#addr").val()==""){
				alert("addr 입력");	
				$("#addr").focus();				
			}else if($("#phone").val()==""){
				alert("phone 확인");
				$("#phone").focus();
			}else if(mailCheck == false){
				alert("email확인해주세요");
				$("#email").focus();
			}else{
				document.frm.submit();
			}
		});
		
		/* $("#btn").click(function(){
			if(idCheck == false){
				alert("id확인해주세요");
			}else if(pwCheck == false){
				alert("pw확인해주세요");
			}else if(mailCheck == false){
				alert("mail확인해주세요");
			}else{
				document.frm.submit();
			}
		}); */
		
		
	});

</script>
</head>
<body>
<h1>memberJoinForm</h1>

<form action="./memberJoin.member" method="post" id="frm" name="frm">
	<p>id<input type="text" id ="id" name="id"></p>
	<div id="ch_id"></div>
	<p>pw<input type="password" name="pw" id="pw1"></p>
	<p>pw확인<input type="password" id="pw2"></p>
	<div id="ch_pw"></div>
	<p>name<input type="text" id="name" name="name"></p>
	<p>birth<input type="date" id="birth" name="birth"></p>
	<p>
		<input type="radio" value="m" checked="checked" name="gender">남
		<input type="radio" value="f" name="gender">여
	</p>
	<p>addr<input type="text" id="addr" name="addr"></p>
	<p>phone<input type="text" id="phone" name="phone"></p>
	<p>email<input type="text" id="email" name="email">
	<input type="button" id="mailCheck" value="이메일 인증"></p>
	<div id="ch_email"></div>
	<p>library
		<select name="library">
			<option value="1">기흥구</option>
			<option value="2">송파구</option>
			<option value="3">장안구</option>
			<option value="4">분당구</option>
		</select>
	</p>
	<input type="button" id="btn" value="join">
</form>

</body>
</html>