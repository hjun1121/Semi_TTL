<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberJoinAgree.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberJoin.css">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var check= false;
	
	$("#chAll").click(function(){
		check=$("#chAll").prop("checked");
		for(var i =0; i<$(".box").length;i++){
			$(".box").prop("checked", check)
			$(".box2").prop("checked", check)
		}
	});//전체동의 끝
	
	
	$(".box").click(function(){
		if(this.checked){
			
			var flag=true;
			$(".box").each(function(){
				if(this.checked==false){
					flag=false;
				}
				$("#chAll").prop("checked", flag);
			});
			
		}else{
			$("#chAll").prop("checked", false);
		}
		
	});//필수동의 끝
	
	
	$("#btn").click(function(){
		if($("#chAll").prop("checked")==true ){
			frm.submit();
		}else{
			alert("동의하세요");
		}
	});//동의필수
	
	
	
});

</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

<form action="${pageContext.request.contextPath }/member/memberJoinAgree.member" id = "frm" name="frm" method="post">
	<input type="hidden" name="agCheck" id="agCheck">
	<div id="agree_form">
		<div id="agree_all">
			
		<!-- all -->
			<div id="agree_check_all">
				<h4>이용약관, 개인정보 수집 및 이용,<br>
				위치정보 이용약관(선택), 프로모션 안내<br>
				메일 수신(선택)에 모두 동의합니다.
				<input type="checkbox" class="btn float"  id="chAll"></h4>
			</div>
		<!-- 1 -->
			<div id="agree_1" class="agree_0">
				<h4>TTL 이용약관 동의 <span>(필수)</span> <input type="checkbox" id="ch1" class="box float"></h4>
				<textarea rows="5" cols="169" readonly="readonly">
					동의 ? 어 보감
					동의 ? 어 보감
					동의 ? 어 보감
					동의 ? 어 보감
					동의 ? 어 보감
					동의 ? 어 보감
					동의 ? 어 보감

				</textarea>
			</div>
		<!-- 2 -->	
			<div id="agree_2"  class="agree_0">
				<h4>개인정보 수집 및 이용에 대한 안내 <span>(필수)</span> <input type="checkbox" id="ch2" class="box float"> </h4>
				<textarea rows="5" cols="169" readonly="readonly">
					양파? 어 니언
				</textarea>
			</div>
		<!-- 3 -->	
			<div id="agree_3"  class="agree_0">
				<h4>위치정보 이용약관 동의 <span>(선택)</span><input type="checkbox" id="ch3" class="box2 float"> </h4> 
				<textarea rows="5" cols="169" readonly="readonly">
					관리자? 어 드민
				</textarea>
			</div>
			
	
			
		<!-- 가입버튼 -->
			<div id="agree_submit">
				<button type="reset" id="agree_reset">
					<span>비동의</span>
				</button>
			
				<input type="button" id="btn" value="동의">
			</div>
		</div>
	</div>
	</form>



<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>