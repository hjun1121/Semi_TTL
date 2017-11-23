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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberUpdate.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>회원 정보 수정</title>
</head>
<script type="text/javascript">
	$(function(){
		if('${DTO.gender}' == 'f'){
			$("#gender").val("여자");
		}else{
			$("#gender").val("남자");
		}
		
		var kind = '${DTO.kind}';
		 $(".kind").each(function(){
			 if($(this).val() == kind) {
				 $(this).attr("selected", true);
			 }
		 });
		
		 var library = '${DTO.library}';
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
				$("#pwc").removeAttr("style");
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
					$("#pw2").removeAttr("readonly")
					$("#ch_pw").html('<p style="color: red">비밀번호를 확인해주세요</p>');
					$("#pw2").val("");
					pwCheck = false;
				}else{
					$("#pw2").attr("readonly", "readonly")
					$("#ch_pw").html('<p style="color: red">비밀번호는 1개 이상의 특수문자 와 8~12 자리 </p>');
					$("#pw2").val("");
					pwCheck = false;
				}
			});
		
		
			$("#pw2").change(function(){
				var pw1= $("#pw1").val();
				var pw2= $("#pw2").val();
				if(pw1 == pw2){
					$("#ch_pw").html('<p style="color: green">비밀번호가 동일합니다.</p>');
					pwCheck = true;
				}else{
					$("#ch_pw").html('<p style="color: red">비밀번호가 다릅니다.</p>');
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
			$("#ch_email").html("<p style=\"color: red\">이메일 인증 필요합니다.</p>");
			$("#mailCheck").attr("style","display:inline;");
		});
		$("#mailList").change(function(){
			mailCheck=false;
			$("#ch_email").html("<p style=\"color: red\">이메일 인증 필요합니다.</p>");
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
				url: "./memberEmailCheck.member?library=${library}&ln=${ln}",
				type: "POST",
				data: {
					email: email,
					ln: ${ln}
				},
				success:function(data){
					$("#ch_email").html(data);
				}
			});
		});
		 
		 $("#email").change(function(){
				mailCheck=false;
				$("#ch_email").html("<p style=\"color: red\">이메일 인증 필요합니다.</p>");
				$("#mailCheck").attr("style","display:inline;");
				
			});
			
		$("#ch_email").on("click", "#check_mail" , function(){
			if($("#num").val() == $("#check").val()){
				mailCheck=true;
				$("#ch_email").html("<p style=\"color: green\">인증된 이메일합니다.</p>");
			}else{
				$("#ch_email").html("<p style=\"color: red\">잘못된 인증번호 입니다.</p>");
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
				alert("비밀번호를 입력해주세요.");
				$("#pw1").focus();
			}else if($("#birth").val()==""){
				alert("생일를 입력해주세요.");	
				$("#birth").focus();
			}else if($("#addr").val()==""){
				alert("주소를 입력해주세요.");	
				$("#addr").focus();	
			}else if($("#addr2").val()==""){
				alert("주소를 입력해주세요.");	
				$("#addr2").focus();	
			}else if($("#m").val()==""){
				alert("주소를 입력해주세요.");
				$("#m").focus();
			}else if($("#l").val()==""){
				alert("번호를 입력해주세요.");
				$("#l").focus();
			}else if(mailCheck == false){
				alert("이메일을 입력해주세요.");
				$("#email1").focus();
			}else{
				document.frm.submit();
			}
		});
		
	});
</script>
</head>
<body>

<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp"></c:import>
</div>

<form action="./memberUpdate.member?ln=${ln}" method="post" id="frm" name="frm">

<div id="divContentsW">
		<div id="divContents">
		<h2 id="divTitle">개인 정보 관리</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/common/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>회원 정보 수정</li>
				<li>&gt;</li>
				<li>개인 정보 관리</li>
			</ul>
		</div>
		
		<div>
			<table class="revisionTable">
				<tr>
					<th>아이디</th>
					<td><input type="text" class="noneBorder" name="id" value=${DTO.id } readonly="readonly"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" class="noneBorder" name="pw1" id="pw1"value=${DTO.pw }></td>
				</tr>
				<tr id="pwc" style="display: none;">
					<th>비밀번호 확인</th>
					<td><input type="password" class="noneBorder" id="pw2"><div id="ch_pw"></div></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" class="noneBorder" value=${DTO.name } readonly="readonly"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" class="noneBorder" name="birth" value=${DTO.birth }></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
							<input type="text" class="noneBorder" id="gender" name="gender" value="" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" class="noneBorder" id="postCode" name="postCode" size="10" placeholder="우편번호" readonly="readonly" value=${DTO.postCode }>
						<input type="button" id="addrCheck" value="주소 찾기" class="btnType4" readonly="readonly"><br><br>
						<input type="text" class="noneBorder" id="addr" name="addr" placeholder="주소" readonly="readonly" size="60" value="${DTO.addr }">
						<input type="text" class="noneBorder" id="addr2" name="addr2" placeholder="나머지주소" size="40" value="${DTO.addr2 }">
					</td>
				</tr>
				<tr>
					<th>전화</th>
					<td>
						<select id="f" class="sel_size">
							<option value="010" class="num">010</option>
		   					<option value="011" class="num">011</option>
		   					<option value="031" class="num">031</option>
		   					<option value="02" class="num">02</option>
						</select>
					<input type="text" id="m" name="m" value=${m } size="10" class="noneBorder"> <b> - </b> <input class="noneBorder" size="10" type="text" id="l" name="l" value=${l }>
					<input type="hidden" id="phone" name="phone" value=${DTO.phone }>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
					<input type="text" id="email1" name="email1" class="noneBorder" value=${email1 } size="15"><b> @ </b><input type="text" size="15" class="noneBorder"  id="email2" name="email2" value=${email2 }>
						<select id="mailList" class="sel_size">
							<option value="0" class="email">직접입력</option>
		   					<option value="naver.com" class="email">naver.com</option>
		   					<option value="daum.net" class="email">daum.net</option>
		   					<option value="gmail.com" class="email">gmail.com</option>
		   					<option value="hotmail.com" class="email">hotmail.com</option>
						</select>
					<input type="button" style="display: none;" id="mailCheck" name="mailCheck" class="btnType3" value="이메일인증">
					<input type="hidden" id="email" name="email" value=${DTO.email }>
					</td>
				</tr>
				<tr>
					<th>도서관</th>
					<td>
					<select name="library" class="sel_size">
						<option value="1" class="library">기흥구</option>
	   					<option value="2" class="library">송파구</option>
	   					<option value="3" class="library">장안구</option>
	   					<option value="4" class="library">분당구</option>
					</select>
					</td>
				</tr>
				<tr>
				<c:if test="${sessionScope.member.kind ne 10 }">
					<c:if test="${member.kind eq 1}">
						<th>등급</th>
						<td><input type="text" class="noneBorder" value="일반사용자" readonly="readonly"></td>
						<input type="hidden" name="kind" value="1">
					</c:if>
				</c:if>
				<c:if test="${sessionScope.member.kind eq 10 }">
					<th>등급</th>
					<td>
						<select name="kind" class="sel_size">
						<option class="kind" value=10>운영자</option>
						<option class="kind" value=1>일반</option>
						<option class="kind" value=0>블랙</option>
						</select>
					</td>
				</c:if>
			</table>
			
			<div class="bottom_btn">
			<input type="button" class="btnType5" id="btn" name="btn" value="정보 수정">
				<span>
					<a href="./memberDelete.member?id=${DTO.id}&ln=${ln}">
					<button class = "btnType5" type = "button" >회원탈퇴</button>
					</a>
				</span>
				<span>
					<a href="./memberUpdatePwCheck.member?ln=${ln}">
						<button class = "btnType5" type = "button" >MYPAGE</button>
					</a>
				</span>
			</div>
		</div>
	</div>
</div>
</form>

<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>