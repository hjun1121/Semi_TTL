<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberJoin.css">
<script type="text/javascript">
	$(function(){
		var idCheck = false;
		var pwCheck = false;
		var mailCheck = false;
		//id 중복체크
		$("#id").change(function(){
			var id = $("#id").val();
			
			$.ajax({
				url: "./memberIdCheck.member?library=${library}",
				type: "POST",
				data: {
					id:id
				},
				success:function(data){
					if($("#id").val().length>5){
						if(data.trim() == 'ok'){
							$("#ch_id").html('<p style="color: green">사용 가능 아이디입니다.</p>');	
							idCheck= true;
						}else{
							$("#ch_id").html('<p style="color: red">중복된 아이디입니다.</p>');	
							idCheck= false;
						}
					}else{
						$("#ch_id").html('<p style="color: red">아이디는 6자 이상</p>');	
						idCheck= false;
					}
				}//
			});
			
		});

		$("#pw1").change(function(){
			var pw1= $("#pw1").val();
			var pwpw=false;
			for(var i=0; i<pw1.length;i++){
				if(pw1.charAt(i) == '!' || pw1.charAt(i) == '@' || pw1.charAt(i) =='#' || pw1.charAt(i) =='$' || pw1.charAt(i) =='%' || pw1.charAt(i) =='^' || pw1.charAt(i) =='&' || pw1.charAt(i) =='*'){
					i= pw1.length;
					pwpw=true;
				}else{
				}
			}
			
			if(pwpw==true && pw1.length>7 && pw1.length<13 ){
				
				$("#ch_pw").html('<p style="color: red">비밀번호를 확인해주세요</p>');
				$("#pw2").val("");
				$("#pw2").removeAttr("readonly")
				pwCheck = false;
				
			}else{
				$("#ch_pw").html('<p style="color: red">비밀번호는 1개 이상의 특수문자 와 8~12 자리 </p>');
				$("#pw2").val("");
				
				$("#pw2").attr("readonly", "readonly")
				pwCheck = false;
			}
			
		});
		
		
		
		$("#pw2").change(function(){
			var pw1= $("#pw1").val();
			var pw2= $("#pw2").val();
			if(pw1 == pw2){
				$("#ch_pw").html('<p style="color: green">비밀번호 확인 완료</p>');
				pwCheck = true;
			}else{
				$("#ch_pw").html('<p style="color: red">비밀번호가 다릅니다</p>');
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
			var email1 = $("#email1").val();
			var email2 = $("#email2").val();
			var all = email1+'@'+email2;
			$("#email").val(all);
			
			var email = $("#email").val();
			$.ajax({
				url: "./memberEmailCheck.member?library=${library}",
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
			var f = $("#f").val();
			var m = $("#m").val();
			var l = $("#l").val();
			var all = f+'-'+m+'-'+l;
			$("#phone").val(all);
			
			if(idCheck == false){
				alert("아이디를 확인해 주세요.");
				$("#id").focus();
			}else if(pwCheck == false){
				alert("비밀번호를 확인해 주세요.");
				$("#pw1").focus();
			}else if($("#name").val()==""){
				alert("이름을 입력해 주세요");
				$("#name").focus();
			}else if($("#birth").val()==""){
				alert("생년월일을 입력해 주세요");	
				$("#birth").focus();
			}else if($("#addr").val()==""){
				alert("주소를 입력해 주세요");	
				$("#addr").focus();	
			}else if($("#addr2").val()==""){
				alert("나머지 주소를 입력해 주세요");	
				$("#addr2").focus();	
			}else if($("#m").val()==""){
				alert("중간번호를 확인해 주세요");
				$("#m").focus();
			}else if($("#l").val()==""){
				alert("끝번호를 확인해 주세요");
				$("#l").focus();
			}else if(mailCheck == false){
				alert("이메일을 확인해 주세요");
				$("#email").focus();
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

<section id = "section">
<div id = "bts_top_section">
<div id="divContentsW">
		<div id="divContents">
			
			<h2 id="divTitle">회원가입</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>회원가입</li>
				</ul>
			</div>
			
		
		<div class="joinWrap">	
			<div class="joinCont mt50">
			
			<form action="./memberJoin.member?library=${library}" method="post" id="frm" name="frm">
			
				<div class="joinForm mt10">
					<dl class="plusInfo pull_down_group mt50">
						<dd class="pull_down_con" style="display: block;">	
						<ul>
							<li>회원가입 양식</li>
							<li>
								<div class="questBox writeTit">
									<span class="writePoint"></span>아이디
								</div>
								<div class="ansBox">
									<input type="text" placeholder="아이디" id ="id" name="id">
									<span class="pwinfo">(아이디는 6자리 이상 가능)</span>
									<div id="ch_id"></div>
								</div>
							</li>
							<li>
								<div class="questBox writeTit">
									<span class="writePoint"></span>비밀번호
								</div>
								<div class="ansBox">
									<input type="password" name="pw" id="pw1">
									<span class="pwinfo">(영문, 특수문자를 조합한 8~12자리)</span>
								</div>
							</li>
							<li>
								<div class="questBox writeTit">
									<span class="writePoint"></span>비밀번호 확인
								</div>
								<div class="ansBox">
									<input type="password" id="pw2" >
									<div id="ch_pw"></div>
								</div>
							</li>
							<li>
								<div class="questBox writeTit">
									<span class="writePoint"></span>이름
								</div>
								<div class="ansBox">
									<input type="text"  id="name" name="name">
								</div>
							</li>
							<li>
								<div class="questBox writeTit">
									<span class="writePoint"></span>생년월일
								</div>
								<div class="ansBox">
									<input type="date" id="birth" name="birth">
								</div>
							</li>
							<li>
								<div class="questBox writeTit">
									<span class="writePoint"></span>성별
								</div>
								<div class="ansBox">
									<span class="radioForm">
										<input type="radio" value="m" checked="checked" name="gender">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;남자
									</span>
									<span class="radioForm">
										<input type="radio"  value="f" name="gender">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;여자
									</span>
								</div>
							</li>
							<li>
								<div class="questBox writeTit">
									<span class="writePoint"></span>주소
								</div>
								<div class="ansBox">
									<div class="addressBox">
										<input type="text" placeholder="주소를 입력해주세요." id="postCode" name="postCode" placeholder="우편번호" readonly="readonly">
										<span class="button1"><input type="button" id="addrCheck" value="우편번호 찾기" readonly="readonly" style="margin-top: 5px;"></span>
										<input type="text" class="mt5"  id="addr" name="addr" placeholder="주소" readonly="readonly">
										<input type="text" class="mt5" id="addr2" name="addr2" placeholder="나머지주소">
									</div>
								</div>
							</li>
							
							<li>
								<div class="questBox writeTit">
									<span class="writePoint"></span>전화번호
								</div>
								<div class="ansBox">
									<select id="f" name="f" class="sel_size" style="margin-bottom: 5px;">
   										<option value="">선택하세요</option>
    									<option value="010">010</option>
										<option value="011">011</option>
									</select>
									<div class="phoneNumBox">
										<input type="text" name="homePhoneNo1" id="m">
											-
										<input type="text" name="homePhoneNo1"  id="l">
										<input type="hidden" id="phone" name="phone">
									</div>
								</div>
							</li>
							<li>
								<div class="questBox writeTit">
									<span class="writePoint"></span>이메일
								</div>
									<div class="ansBox">
										<div class="mailBox">
											<input type="text" id="email1">
											<span class="betweenTxt">@</span>
											<input type="text" id="email2">
											<select id = "mailList"  class="sel_size">
   												<option  value="0">직접입력</option>
												<option  value="naver.com">naver.com</option>
												<option  value="daum.net">daum.net</option>
												<option  value="gmail.com">gmail.com</option>
												<option  value="hotmail.com">hotmail.com</option>
											</select>
											<input type="hidden" id="email" name="email" >
											<input type="button" id="mailCheck" value="이메일 인증" style="margin-top: 5px;">
											<div id="ch_email"></div>
										</div>
									</div>
								</li>
								<li>
									<div class="questBox writeTit">
										<span class="writePoint"></span>도서관 선택
									</div>
									<div class="ansBox">
										<select name="library" class="sel_size">
   											<option value="1">기흥구</option>
											<option value="2">송파구</option>
											<option value="3">장안구</option>
											<option value="4">분당구</option>
										</select>
									</div>
								</li>
						</ul>
					</dd>
				</dl>
			</div>
			
			<div class="btnCenter mt30" id="center">
				<span class="button1"><a href="${pageContext.request.contextPath }/index.jsp" class="type4 large">취소</a></span>
				<span class="button1"><input type="button" id="btn" value="가입" class="type1 large"></span>  
			</div>
			</form>
			</div>
		</div>
	</div>
</div>
</div>
</section>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>