<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	alert('${message}');
	$(function(){
		document.frm.submit();
	});
</script>
</head>
<body>
<h2>result Qna</h2>
	<form action="../qna/qnaViewCheck.qna" method="post" name="frm">
		<input type="hidden" name="num" value=${num }>
		<input type="hidden" name="pw" value=${pw }>
	</form>
	
</body>
</html>