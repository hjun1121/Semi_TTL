<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		 var library = '${member.library}';
		 $(".library").each(function(){
			 if($(this).val() == library) {
				 $(this).attr("selected", true);
			 }
		 });
		
		 var meilCheck=false;
		 var pwCheck = true;
		 
		//pw 확인 체크
			$("#pw1").change(function(){
				$("#ch_pw").html('<p style="color: red">pw 확인해주세요</p>');
				$("#pw2").val("");
				$("#pwc").attr("style","display: block;");
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
				$("#mailCheck").attr("style","display:inline;");
				
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
			if(pwCheck == false){
				alert("pw확인해주세요");
				$("#pw1").focus();
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
		
	});
	

</script>
</head>
<body>
	<h2>회원 정보 수정</h2>
	<form action="./memberUpdate.member" method="post" name="frm">
		<p>id<input type="text" name="id" value=${member.id } readonly="readonly"></p>
		<p>pw<input type="password" name="pw" id="pw1" value=${member.pw } ></p>
		<p id="pwc" style="display: none;">pw확인<input type="password" id="pw2"></p>
		<div id="ch_pw"></div>
		<p>name<input type="text" name="name" value=${member.name } readonly="readonly"></p>
		<p>birth<input type="date" name="birth" value=${member.birth } ></p>
		<p>gender<input type="text" name="gender" value=${member.gender } readonly="readonly"></p>
		<p>addr<input type="text" name="addr" value=${member.addr } ></p>
		<p>phone<input type="text" name="phone" value=${member.phone } ></p>
		<p>email<input type="text" id="email" name="email" value=${member.email } >
		<input type="button" style="display:none;" id="mailCheck" value="이메일 인증"></p>
		<div id="ch_email"></div>
		<p>library
			<select name="library" >
				<option class="library" value="1">기흥구</option>
				<option class="library" value="2">송파구</option>
				<option class="library" value="3">장안구</option>
				<option class="library" value="4">분당구</option>
			</select>
		</p>
		
		<c:if test="${sessionScope.member.kind ne 10 }">
			<c:if test="${member.kind eq 1}">
				<p>kind<input type="text" value="일반사용자" readonly="readonly"></p>
				<input type="hidden" name="kind" value=${member.kind } readonly="readonly">
			</c:if>
		</c:if>
		
		<c:if test="${sessionScope.member.kind eq 10 }">
			<select name="kind">
				<option value=10>운영자</option>
				<option value=1 selected="selected">일반</option>
				<option value=0>블랙</option>
			</select>
		</c:if>
		
		<input type ="button" id="btn" value="정보 수정">
		<a href="./memberDelete.member?id=${member.id }"><input type="button" value="회원 탈퇴"></a>
		<a href="../index.jsp"><input type="button" value="메인으로"></a>
	</form>	
</body>
</html>