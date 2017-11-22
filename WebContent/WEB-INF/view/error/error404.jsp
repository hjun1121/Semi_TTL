<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	요청한 페이지를 찾을 수 없습니다. (404)
	<form action="${pageContext.request.contextPath }/index.jsp">
		<input type="submit" value="홈으로">
	</form>
</body>
</html>