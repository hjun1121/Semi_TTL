<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="col-md-8 col-centered">
			<form action="./${requestScope.notice}Write.${notice}" method="post">
				<table class="table">
					<tr>
						<tr>
						<td colspan="2"><input type="text" name="title" placeholder="제목없음"></td>
						<td colspan="2"></td>
						<td id="reg_date"></td>
						<td id="writer"><input type="text" name="writer" readonly="readonly" value="${sessionScope.member.id }"></td>
					</tr>
					<tr>
					 	<td colspan="6" id="contents"><textarea name="contents" placeholder="내용을 입력하세요."></textarea></td>
					</tr>
				</table>
				
				<button type="submit">글쓰기</button>
			</form>
		</div>
</body>
</html>