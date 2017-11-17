<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberUpdate.css">

<title>회원 정보 수정</title>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

<div>
	<c:import url="./myPage.jsp"></c:import>
</div>
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
<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">회원 정보 수정</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="#"><img src="./image/ko/local/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>회원 정보 수정</li>
			</ul>
		</div>
		
		<div class="revisionWrap">	
			<div class="revision mt50">
				<div class="revisionForm borTc3 mt10">
					<ul>
					<li>
						<div class="questBox writeTit">
							<span class="writePoint"></span>아이디
						</div>
						<div class="ansBox">
							<input type="text" name="id" value=${DTO.id } readonly="readonly">
						</div>
					</li>
					<li>
						<div class="questBox writeTit">
							<span class="writePoint"></span>비밀번호
						</div>
						<div class="ansBox">
							<input type="password" name="pw" value=${DTO.pw }>
						</div>
					</li>
					<li>
						<div class="questBox writeTit" style="display: none;">
						<span class="writePoint"></span>비밀번호 확인
						</div>
						<div class="ansBox">
							<p id="pwc">
							<input type="password" id="pw2"></p>
							<div id="ch_pw"></div>
						</div>
					</li>
					<li>
						<div class="questBox writeTit">
							<span class="writePoint"></span>이름
						</div>
						<div class="ansBox">
							<input type="text" value=${DTO.name } readonly="readonly">
						</div>
					</li>
					<li>
					<div class="questBox writeTit">
							<span class="writePoint"></span>생년월일
						</div>
						<div class="ansBox">
							<input type="date" name="birth" value=${DTO.birth }>
						</div>
					</li>
					<li>
						<div class="questBox writeTit">
							<span class="writePoint"></span>성별
						</div>
						<div class="ansBox">
						
						<c:if test="${DTO.gender eq f }">
						asd
						</c:if>
							<c:if test="${DTO.gender eq f }">
								<input type="text" id="gender" name="gender" value="남자" readonly="readonly">
							</c:if>
							<c:if test="${DTO.gender eq m }">
								<input type="text" id="gender" name="gender" value="여자" readonly="readonly">
							</c:if>
						</div>
					</li>
					<li>
						<div class="questBox writeTit">
							<span class="writePoint"></span>주소
						</div>
						<div class="ansBox">
							<input type="text" id="postCode" name="postCode" value=${DTO.postCode } readonly="readonly">
							<input type="text" id="addr" name="addr" value=${DTO.addr } readonly="readonly">
							<input type="text" id="adrr2" name="addr2" value=${DTO.addr2 } readonly="readonly">
						</div>
					</li>
					<li>
						<div class="questBox writeTit">
							<span class="writePoint"></span>전화
						</div>
						<div class="ansBox">
							<select id="f" class="sel_size">
								<option value="010" class="num">010</option>
   								<option value="011" class="num">011</option>
   								<option value="031" class="num">031</option>
   								<option value="02" class="num">02</option>
							</select>
							<input type="text" id="m" name="m" value=${m }>-<input type="text" id="l" name="l" value=${l }>
							<input type="hidden" id="phone" name="phone" value=${DTO.phone }>
						</div>
					</li>
					<li>
						<div class="questBox writeTit">
							<span class="writePoint"></span>이메일
						</div>
						<div class="ansBox">
						<input type="text" id="email1" name="email1" value=${email1 }>@<input type="text" id="email2" name="email2" value=${email2 }>
							<select id="mailList" class="sel_size">
								<option value="0" class="email">직접입력</option>
   								<option value="naver.com" class="email">naver.com</option>
   								<option value="daum.net" class="email">daum.net</option>
   								<option value="gmail.com" class="email">gmail.com</option>
   								<option value="hotmail.com" class="email">hotmail.com</option>
							</select>
							<input type="button" style="display: none;" id="mailCheck" name="mailCheck" value="이메일">
							<input type="hidden" id="email" name="email" value=${DTO.email }>
						</div>
					</li>
					<li>
						<div class="questBox writeTit">
							<span class="writePoint"></span>도서관
						</div>
						<div class="ansBox">
							<select name="library" class="sel_size">
								<option value="1" class="library">기흥구</option>
   								<option value="2" class="library">송파구</option>
   								<option value="3" class="library">장안구</option>
   								<option value="4" class="library">분당구</option>
							</select>
						</div>
					</li>
					<c:if test="${sessionScope.member.kind ne 10 }">
						<c:if test="${member.kind eq 1}">
							<div class="questBox writeTit">
							<span class="writePoint"></span>등급
						</div>
						<div class="ansBox">
							<input type="text" value="일반사용자" readonly="readonly">
						</div>
						</c:if>
					</c:if>
					<c:if test="${sessionScope.member.kind eq 10 }">
						<div class="questBox writeTit">
							<span class="writePoint"></span>등급
						</div>
						<div class="ansBox">
							<select name="kind" class="sel_size">
								<option class="kind" value=10>운영자</option>
								<option class="kind" value=1>일반</option>
								<option class="kind" value=0>블랙</option>
							</select>
						</div>
					</c:if>
				</ul>
			</div>
		</div>
			<div class="btnCenter mt30">
			<input type="button" class="type4 large" id="btn" name="btn" value="정보 수정">
				<span class="button1">
					<a href="./memberDelete.member?id=${DTO.id }" class="type4 large">
						<input type="button" class="type4 large" value="회원탈퇴">
					</a>
				</span>
				<span class="button1">
					<a href="../index.jsp" class="type4 large">
						<input type="button" class="type4 large" value="메인">
					</a>
				</span>
			</div>
		</div>
	</div>
</div>

<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>