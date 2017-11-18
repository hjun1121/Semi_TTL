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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book/bookRentList.css">
<script type="text/javascript">
$(function(){
		var y = '${year}';
		$(".years").each(function() {
			if($(this).val()==y){
				$(this).attr("selected", true);
			}
		});
		
		var m = '${month}';
		$(".month").each(function() {
			if($(this).val()==m){
				$(this).attr("selected", true);
			}
		});
		
		var d = '${day}';
		$(".day").each(function() {
			if($(this).val()==d){
				$(this).attr("selected", true);
			}
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
		<h2 id="divTitle">책 대여 내역</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="../index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>책 대여 내역</li>
			</ul>
		</div>

	<div>
	<form name="frm" class="form-inline" action="./bookRentList.book" method="post">
	
		<div>
			<span>
				<select id="year" name="year">
		            <option class="years" value="17" >2017</option>
		            <option class="years" value="16">2016</option>
		            <option class="years" value="15">2015</option>
		            <option class="years" value="14">2014</option>
		            <option class="years" value="13">2013</option>
  			      </select>
       			 년
       			 <select id="month" name="month">
		            <option class="month" value="01">01</option>
		            <option class="month" value="02">02</option>
		            <option class="month" value="03">03</option>
		            <option class="month" value="04">04</option>
		            <option class="month" value="05">05</option>
		            <option class="month" value="06">06</option>
		            <option class="month" value="07">07</option>
		            <option class="month" value="08">08</option>
		            <option class="month" value="09">09</option>
		            <option class="month" value="10">10</option>
		            <option class="month" value="11">11</option>
		            <option class="month" value="12">12</option>
		        </select>
    		    월
		        <select id="day" name="day">
		            <option class="day" value="01">01</option>
		            <option class="day" value="02">02</option>
		            <option class="day" value="03">03</option>
		            <option class="day" value="04">04</option>
		            <option class="day" value="05">05</option>
		            <option class="day" value="06">06</option>
		            <option class="day" value="07">07</option>
		            <option class="day" value="08">08</option>
		            <option class="day" value="09">09</option>
		            <option class="day" value="10">10</option>
		            <option class="day" value="11">11</option>
		            <option class="day" value="12">12</option>
		            <option class="day" value="13">13</option>
		            <option class="day" value="14">14</option>
		            <option class="day" value="15">15</option>
		            <option class="day" value="16">16</option>
		            <option class="day" value="17">17</option>
		            <option class="day" value="18">18</option>
		            <option class="day" value="19">19</option>
		            <option class="day" value="20">20</option>
		            <option class="day" value="21">21</option>
		            <option class="day" value="22">22</option>
		            <option class="day" value="23">23</option>
		            <option class="day" value="24">24</option>
		            <option class="day" value="25">25</option>
		            <option class="day" value="26">26</option>
		            <option class="day" value="27">27</option>
		            <option class="day" value="28">28</option>
		            <option class="day" value="29">29</option>
		            <option class="day" value="30">30</option>
		            <option class="day" value="31">31</option>
		        </select>
		        일 이전 까지
      		  </span>
      		  <div class="form-group">
	      		  <div class="col-sm-offset-2 col-sm-10">
	      		 	 <input type="submit" class="btn btn-default" value="Search">
	      		  </div>
      		  </div>
		</div>
		</form>
	</div>
<h2>Book Rent List</h2>
<table class="table" border="1">
		<tr>
			<th>num</th>
			<th>title</th>
			<th>section</th>
			<th>writer</th>
			<th>company</th>
			<th>publish_date</th>
			<th>library</th>
			<th>in_time</th>
			<th>out_time</th>
			<th>late_time</th>
			<th></th>
		</tr>
		<c:forEach items="${bookRentList }" var="bookRent_list">
			<tr>
			<td>${bookRent_list.num }</td>
 				<td><a href="./bookRentDetails.book?num=${bookRent_list.num }">${bookRent_list.title }</a></td>
 				<td>${bookRent_list.section }</td>
				<td>${bookRent_list.writer }</td>
				<td>${bookRent_list.company }</td>
				<td>${bookRent_list.publish_date }</td>
				<c:choose>
					<c:when test="${bookRent_list.library eq 1}">
						<td>기흥구</td>
					</c:when>
					<c:when test="${bookRent_list.library eq 2}">
						<td>송파구</td>
					</c:when>
					<c:when test="${bookRent_list.library eq 3}">
						<td>장안구</td>
					</c:when>
					<c:when test="${bookRent_list.library eq 4}">
						<td>분당구</td>
					</c:when>
					<c:otherwise>
						<p>library<input type="number" value="없음" ></p>
					</c:otherwise>
				</c:choose>
				<td>${bookRent_list.in_time }</td>
				<td>${bookRent_list.out_time }</td>
				<c:choose>
					<c:when test="${empty bookRent_list.out_time }">
						<td>-</td>
						<td><a href="./bookReturn.book?num=${bookRent_list.num }"><input type="button" value="반납"></a></td>
					</c:when>
					<c:when test="${! empty bookRent_list.out_time }">
						<td>${bookRent_list.late_date }</td>
					</c:when>
					<c:otherwise>
						<td>0</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
	<div>
		<ul class="pagination">
			<c:if test="${page.curBlock>1}">
			<li><button class="go" id="${page.startNum-1}">[이전]</button></li>
			</c:if>
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<li><a
				href="./bookRentList.book?curPage=${i}&id=${id }&year=${year}&month=${month}&day=${day}">${i}</a></li>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./bookRentList.book?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	
	</div>
</div>	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>