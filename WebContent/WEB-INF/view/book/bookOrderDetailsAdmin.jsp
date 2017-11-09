<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>Book Order Details Admin</h2>
	
	
	<div>
		<p>num<input type="number" name="num" value=${requestScope.view.num }></p>
		<p>title<input type="text" name="title" value=${requestScope.view.title } ></p>
		<p>writer<input type="text" name="writer" value=${requestScope.view.writer }></p>
		<p>company<input type="text" name="company" value=${requestScope.view.company }></p>
		<p>publish_date<input type="text" name="publish_date" value=${requestScope.view.publish_date }></p>
		<p>contents<input type="text" name="contents" value=${requestScope.view.contents }></p>
		<p>id<input type="text" name="id" value=${requestScope.view.id }></p>
		<p>price<input type="text" name="price" value=${requestScope.view.price }></p>
		<p>library<input type="text" name="library" value=${requestScope.view.library } ></p>
		<p>state<input type="text" name="state" value=${requestScope.view.state } ></p>
		<p>cancel(취소사유)<input type="text" name="cancel" value=${requestScope.view.cancel } ></p>
		
	</div>

		
			<a href="./bookOrderOKAdmin.book?num=${view.num }">승인</a>
			<a href="./${requestScope.book}Delete.${requestScope.book}?num=${requestScope.view.num}">거절</a>
	
		<a href="./bookOrderListAdmin.book">LIST</a>
	
</body>
</html>