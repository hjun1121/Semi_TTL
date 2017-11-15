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
			<form action="./${notice}Update.${notice}" method="post">
				<input type="hidden" name="num" value="${view.num}">
				<table class="table">
					<tr>
						<tr>
						<td colspan="2"><input class="form-control" type="text" name="title" value="${view.title}" placeholder="제목없음"></td>
						<td colspan="2"></td>
						<td id="reg_date"></td>
						<td id="writer"><input class="form-control" type="text" name="writer" readonly="readonly" value="${requestScope.view.writer}" placeholder="작성자"></td>
					</tr>
					<tr>
					 	<td colspan="6" id="contents"><textarea class="form-control" name="contents" placeholder="내용을 입력하세요.">${view.contents} </textarea></td>
					</tr>
				</table>
				
				<button>UPdate</button>
			</form>
			</div>
</body>
</html>