<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberIdFind.css">

<script type="text/javascript">
	$(function(){
		
		$("#btn").click(function(){
			var name = $("#name").val();
			var email = $("#email").val();
			$.ajax({
				url:"./memberIdFind.member",
				type:"POST",
				data: {
					name: name,
					email: email
				},
				success:function(data){
					$("#list").html(data);
				}
			});
		});
		
		
	});

</script>
</head>


<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>
	
	<div id="divContentsW">
		<div id="divContents">
			
			<h2 id="divTitle">아이디 찾기</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>아이디 찾기</li>
				</ul>
			</div>
	
	<form action="./memberIdFind.member" method="post">
		<p>name<input type="text" id="name" name="name"></p>
		<p>email<input type="text" id="email" name="email"></p>
		<input type="button" id = "btn" value="id찾기">
	</form>
	<div id="list">
	</div>
	
	
	</div>
</div>
	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>