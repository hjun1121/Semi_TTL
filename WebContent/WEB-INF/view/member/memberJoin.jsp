<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

		//주소검색
		$("#addrCheck").click(function(){
			new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("#postCode").val(data.zonecode);  //5자리 새우편번호 사용
					$("#addr").val(fullAddr);
	                // 커서를 상세주소 필드로 이동한다.
	                $("#addr2").focus();
	            }
	        }).open();
		    
		});
		
		
		//email 체크 합치기
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
			mailCheck=false;
			$("#ch_email").html("<p style=\"color: red\">이메일 인증 필요</p>");
		});
		
		//이메일 체크
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
			}else if($("#addr2").val()==""){
				alert("addr2 입력");	
				$("#addr2").focus();	
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
	
	<input type="text" id="postCode" name="postCode" placeholder="우편번호" readonly="readonly">
	<input type="button" id="addrCheck" value="우편번호 찾기" readonly="readonly"><br>
	<input type="text" id="addr" name="addr" placeholder="주소" readonly="readonly">
	<input type="text" id="addr2" name="addr2" placeholder="나머지주소">	

	<p>phone<input type="text" id="phone" name="phone"></p>
	<p>
	<input id="email1" type="text">@<input type="text" id="email2" >
	<select id = "mailList">
		<option  value="0">직접입력</option>
		<option  value="naver.com">naver.com</option>
		<option  value="daum.net">daum.net</option>
		<option  value="gmail.com">gmail.com</option>
		<option  value="hotmail.com">hotmail.com</option>
	</select>
	<input type="hidden" id="email" name="email" >
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