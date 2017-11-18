<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(function(){
	  $("#btn").click(function(){
		  
	  $.ajax({
			url:"./bookOrderAjax.book",
			type:"POST",
			data: {
				num:${requestScope.view.num }
				
			},
			success:function(data){
				$("#OK").html(data);
				
			}
		});
	  });
	  
  });
  
  $(function(){
	  $("#btn_no").click(function(){
		  
	  $.ajax({
			url:"./bookOrderNOAjax.book",
			type:"POST",
			data: {
				num:${requestScope.view.num }
				
			},
			success:function(data){
				$("#NO").html(data);
				
			}
		});
	  });
	  
  });
  </script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>

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
		
	</div>
		<input type="button" id="btn" value="OK">
		<div id="OK"></div>
		
		<input type="button" id="btn_no" value="NO">
		<div id="NO"></div>
		
			<%-- <a href="./${requestScope.book}Delete.${requestScope.book}?num=${requestScope.view.num}">거절</a> --%>
	
		<a href="./bookOrderListAdmin.book">LIST</a>

<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>