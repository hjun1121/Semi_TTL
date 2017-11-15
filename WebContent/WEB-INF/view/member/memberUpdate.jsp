<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var kind = '${DTO.kind}';
		 $(".kind").each(function(){
			 if($(this).val() == kind) {
				 $(this).attr("selected", true);
			 }
		 });
		
		 var library = '${member.library}';
		 $(".library").each(function(){
			 if($(this).val() == library) {
				 $(this).attr("selected", true);
			 }
		 });
		var num = '${f}';
		 $(".num").each(function(){
			 if($(this).val() == num) {
				 $(this).attr("selected", true);
			 }
		 });
		 var mail = '${email2}';
		 $(".email").each(function(){
			 if($(this).val() == mail) {
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
		                $("#addr2").val("");
		                $("#addr2").focus();
		            }
		        }).open();
			    
			});	
			
			
		//email 합치기
		
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
		
		$("#email1").change(function(){
			mailCheck=false;
			$("#ch_email").html("<p style=\"color: red\">이메일 인증 필요</p>");
			$("#mailCheck").attr("style","display:inline;");
		});
		$("#mailList").change(function(){
			mailCheck=false;
			$("#ch_email").html("<p style=\"color: red\">이메일 인증 필요</p>");
			$("#mailCheck").attr("style","display:inline;");
		});
		
		//email 체크
		$("#mailCheck").click(function(){
			var email1 = $("#email1").val();
			var email2 = $("#email2").val();
			var all = email1+'@'+email2;
			$("#email").val(all);
			
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
			var f = $("#f").val();
			var m = $("#m").val();
			var l = $("#l").val();
			var all = f+'-'+m+'-'+l;
			$("#phone").val(all);
			
			
			if(pwCheck == false){
				alert("pw확인해주세요");
				$("#pw1").focus();
			}else if($("#birth").val()==""){
				alert("birth 입력");	
				$("#birth").focus();
			}else if($("#addr").val()==""){
				alert("addr 입력");	
				$("#addr").focus();	
			}else if($("#addr2").val()==""){
				alert("addr2 입력");	
				$("#addr2").focus();	
			}else if($("#m").val()==""){
				alert("중간번호 확인");
				$("#m").focus();
			}else if($("#l").val()==""){
				alert("끝번호 확인");
				$("#l").focus();
			}else if(mailCheck == false){
				alert("email확인해주세요");
				$("#email1").focus();
			}else{
				document.frm.submit();
			}
		});
		
	});
	

</script>
</head>
<body>
	<div>
		<c:import url="./myPage.jsp"></c:import>
	</div>
	
	<div>
	<form action="./memberUpdate.member" class="form-horizontal" method="post" name="frm">
		<div class="form-group">
			<label class="control-label col-sm-2" for="id">ID:</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="id" value=${DTO.id } readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="pw">PASSWORD:</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" name="pw" value=${DTO.pw }>
			</div>
		</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">NAME:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="name"
						value=${DTO.name } readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="birth">BIRTH:</label>
				<div class="col-sm-10">
					<input type="date" class="form-control" name="birth"
						value=${DTO.birth }>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="gender">GENDER:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="gender"
						value=${DTO.gender } readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input type="text" class="form-control" id="postCode"
						name="postCode" placeholder="우편번호" value=${DTO.postCode }
						readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input type="text" class="form-control" id="addrCheck" name="addr"
						value=${DTO.addr } readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input type="text" class="form-control" id="addrCheck" name="addr2"
						value=${DTO.addr2 } readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">PHONE:</label>
				<div class="col-sm-10">
					<select id="f">
						<option value="010" class="num">010</option>
						<option value="011" class="num">011</option>
						<option value="031" class="num">031</option>
						<option value="02" class="num">02</option>
					</select> <input type="text" class="form-control" id="m" name="m"
						value=${m }>-<input type="text" class="form-control"
						id="l" name="l" value=${l }> <input type="hidden"
						id="phone" name="phone" value=${DTO.phone }>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">PHONE:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="email1" name="email1"
						value=${email1 }>@<input type="text" class="form-control"
						id="email2" name="email2" value=${email2 }> <select
						id="mailList">
						<option class="email" value="0">직접입력</option>
						<option class="email" value="naver.com">naver.com</option>
						<option class="email" value="daum.net">daum.net</option>
						<option class="email" value="gmail.com">gmail.com</option>
						<option class="email" value="hotmail.com">hotmail.com</option>
					</select> <input type="button" class="form-control" style="display: none;"
						id="mailCheck" value="이메일"> <input type="hidden"
						id="email" name="email" value=${DTO.email }>
					<div id="ch_email"></div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">LIBRARY:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="addrCheck" name="addr"
						value=${DTO.addr } readonly="readonly">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="name">LIBRARY:</label>
				<div class="col-sm-10">
					<select name="library">
						<option class="library" value="1">기흥구</option>
						<option class="library" value="2">송파구</option>
						<option class="library" value="3">장안구</option>
						<option class="library" value="4">분당구</option>
					</select>
				</div>
			</div>

			<c:if test="${sessionScope.member.kind ne 10 }">
				<c:if test="${member.kind eq 1}">
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">KIND:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" value="일반사용자"
								readonly="readonly">
						</div>
					</div>
				</c:if>
			</c:if>

			<c:if test="${sessionScope.member.kind eq 10 }">
				<div class="form-group">
					<div class="col-sm-10">
						<select name="kind">
							<option class="kind" value=10>운영자</option>
							<option class="kind" value=1>일반</option>
							<option class="kind" value=0>블랙</option>
						</select>
					</div>
				</div>
			</c:if>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="form-control" id="btn" name="btn"
						value="정보 수정">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="./memberDelete.member?id=${DTO.id }"><input
						type="button" class="form-control" value="회원탈퇴 수정"></a>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="../index.jsp"><input type="button"
						class="form-control" value="메인으로"></a>
				</div>
			</div>
	</form>
	</div>
	<%-- 	//<p>id<input type="text" name="id" value=${DTO.id } readonly="readonly"></p>
		//<p>pw<input type="password" name="pw" id="pw1" value=${DTO.pw } ></p>
		<p id="pwc" style="display: none;">pw확인<input type="password" id="pw2"></p>
		<div id="ch_pw"></div>
		
		//<p>name<input type="text" name="name" value=${DTO.name } readonly="readonly"></p>
		//<p>birth<input type="date" name="birth" value=${DTO.birth } ></p>
		//<p>gender<input type="text" name="gender" value=${DTO.gender } readonly="readonly"></p>
		
		//<input type="text" id="postCode" name="postCode" placeholder="우편번호" readonly="readonly" value=${DTO.postCode }>
		//<input type="button" id="addrCheck" value="우편번호 찾기" ><br>
		//<input type="text" id="addr" name="addr" placeholder="주소" readonly="readonly" value="${DTO.addr }">
		//<input type="text" id="addr2" name="addr2" placeholder="나머지주소 " value="${DTO.addr2 }">	
		
		//<p>phone
			<select id="f">
				<option value="010" class="num">010</option>
				<option value="011" class="num">011</option>
				<option value="031" class="num">031</option>
				<option value="02" class="num">02</option>
			</select>
			-<input type="text" id="m" value=${m } >-<input type="text" id="l" value=${l } ></p>
		//<input type="hidden" id="phone" name="phone" value=${DTO.phone }>
		
		/<p><input id="email1" type="text" value=${email1 }>@<input type="text" id="email2" value=${email2 }>
			<select id = "mailList">
				<option class="email" value="0">직접입력</option>
				<option class="email" value="naver.com">naver.com</option>
				<option class="email" value="daum.net">daum.net</option>
				<option class="email" value="gmail.com">gmail.com</option>
				<option class="email" value="hotmail.com">hotmail.com</option>
			</select>
			<input type="hidden" id="email" name="email" value=${DTO.email } >
		<input type="button" style="display:none;" id="mailCheck" value="이메일 인증"></p>
		//<div id="ch_email"></div>
		
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
				<input type="hidden" name="kind" value=${DTO.kind } readonly="readonly">
			</c:if>
		</c:if>
		
		<c:if test="${sessionScope.member.kind eq 10 }">
			<select name="kind">
				<option class="kind" value=10>운영자</option>
				<option class="kind" value=1>일반</option>
				<option class="kind" value=0>블랙</option>
			</select>
		</c:if> 
		<input type ="button" id="btn" value="정보 수정">
		<a href="./memberDelete.member?id=${DTO.id }"><input type="button" value="회원탈퇴"></a>
		<a href="../index.jsp"><input type="button" value="메인으로"></a>	
		--%>
</body>
</html>