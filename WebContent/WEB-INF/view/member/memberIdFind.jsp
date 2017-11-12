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
	<h2>Member Id Find</h2>
	
	<form action="./memberIdFind.member" method="post">
		<p>name<input type="text" id="name" name="name"></p>
		<p>email<input type="text" id="email" name="email"></p>
		<input type="button" id = "btn" value="id찾기">
	</form>
	<div id="list">
	</div>
</body>
</html>