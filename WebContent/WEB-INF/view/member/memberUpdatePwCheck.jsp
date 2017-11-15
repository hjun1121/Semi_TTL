<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div>
	<c:import url="./myPage.jsp"></c:import>
</div>

<div id="form">
	<form action="./memberUpdatePwCheck.member" class="form-horizontal" method="post">
		<div class="form-group">
	      <label class="control-label col-sm-2" for="id">ID:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" name="id" value=${member.id } readonly="readonly">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="pw">PASSWORD:</label>
	      <div class="col-sm-10">
	        <input type="password" class="form-control" name="pw">
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-default">Submit</button>
	      </div>
	    </div>
	</form>
</div>
</body>
</html>