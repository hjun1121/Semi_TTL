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

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/admin_bookOrderView.css">
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


<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp"></c:import>
</div>

<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">신청 상세 내역</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>책 신청 내역</li>
				<li>&gt;</li>
				<li>상세 내역</li>
			</ul>
		</div>
	
	
	<table class="Dtable">
			<tr>
				<th>No.</th>
				<td><input type="text" class="noneBorder" name="title" value=${requestScope.view.num }  readonly="readonly"></td>
			</tr>
			<tr>
				<th>서명</th>
				<td><input type="text" class="noneBorder" name="title" value=${requestScope.view.title }  readonly="readonly"></td>
			</tr>
			<tr>
				<th>저자</th>
				<td><input type="text" class="noneBorder" name="writer" value=${requestScope.view.writer } readonly="readonly"></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><input type="text" class="noneBorder" name="company" value=${requestScope.view.company } readonly="readonly"></td>
			</tr>
			<tr>
				<th>출판년도</th>
				<td><input type="text" class="noneBorder" name="publish_date" value=${requestScope.view.publish_date } readonly="readonly"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" class="noneBorder" name="t_date" value=${requestScope.view.contents } readonly="readonly"></td>
			</tr>
			<tr>
				<th>ID</th>
				<td><input type="text" class="noneBorder" name="t_date" value=${requestScope.view.id } readonly="readonly"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" class="noneBorder" name="price" value=${requestScope.view.price } readonly="readonly"></td>
			</tr>
			<tr>
			<th>비치도서관</th>
			<c:choose>
				<c:when test="${requestScope.view.library eq 1}">
					<td><input type="text" class="noneBorder" value="기흥구" readonly="readonly"></td>
				</c:when>
				<c:when test="${requestScope.view.library eq 2}">
					<td><input type="text" class="noneBorder" value="송파구" readonly="readonly"></td>
				</c:when>
				<c:when test="${requestScope.view.library eq 3}">
					<td><input type="text" class="noneBorder" value="장안구" readonly="readonly"></td>
				</c:when>
				<c:when test="${requestScope.view.library eq 4}">
					<td><input type="text" class="noneBorder" value="분당구" readonly="readonly"></td>
				</c:when>
			</c:choose>
			</tr>
		</table>
		<div class="btn">
			<input type="button" class="btnType5" id="btn" value="승인">
			<input type="button" class="btnType5" id="btn_no" value="거절">
			<a href="./bookOrderListAdmin.book">
			<input type="button" class="btnType5" value="LIST"></a>
		</div>
		</div>
</div>		
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>