<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<c:import url="../member/myPage.jsp"></c:import>
</div>
<div id="divContentsW">
		<div id="divContents">
			<h2 id="divTitle">개인정보 관리</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/common/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>MY PAGE</li>
					<li>&gt;</li>
					<li>개인정보 관리</li>
				</ul>
			</div>
	<div>
	<form name="frm" class="form-inline" action="./marketDealsList.market" method="post">
	
	<input type="hidden" name="type" id="type" value="${type }">
	<input type="hidden" name="id" id="id" value="${id }">
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
	<a href="./marketDealsList.market?id=${id }&type=3&year=${year}&month=${month}&day=${day}"><input type="button" value="전체"></a>
	<a href="./marketDealsList.market?id=${id }&type=1&year=${year}&month=${month}&day=${day}"><input type="button" value="판매"></a>
	<a href="./marketDealsList.market?id=${id }&type=2&year=${year}&month=${month}&day=${day}"><input type="button" value="구매"></a>
	<a href="../index.jsp"><input type="button" value="list"></a>
	<table class="table" border="1">
		<tr>
			<th>num</th>
			<th>title</th>
			<th>writer</th>
			<th>company</th>
			<th>publish_date</th>
			<th>T_date</th>
			<th>library</th>
			<th>price</th>
			<th>kind</th>
			<th>state</th>
			<th>delivery</th>
		</tr>
		<c:forEach items="${bookDeals }" var="bookDeals_list">
			<tr>
				<td>${bookDeals_list.num }</td>
				<td><a
					href="./marketDealsDetails.market?num=${bookDeals_list.num }">${bookDeals_list.title }</a></td>
				<td>${bookDeals_list.writer }</td>
				<td>${bookDeals_list.company }</td>
				<td>${bookDeals_list.publish_date }</td>
				<td>${bookDeals_list.t_date }</td>
				<c:choose>
					<c:when test="${bookDeals_list.library eq 1}">
						<td>기흥구</td>
					</c:when>
					<c:when test="${bookDeals_list.library eq 2}">
						<td>송파구</td>
					</c:when>
					<c:when test="${bookDeals_list.library eq 3}">
						<td>장안구</td>
					</c:when>
					<c:when test="${bookDeals_list.library eq 4}">
						<td>분당구</td>
					</c:when>
					<c:otherwise>
						<td>없음</td>
					</c:otherwise>
				</c:choose>
				<td>${bookDeals_list.price }</td>
				<c:choose>
					<c:when test="${bookDeals_list.kind eq 1}">
						<td>판매</td>
					</c:when>
					<c:when test="${bookDeals_list.kind eq 2}">
						<td>구매</td>
					</c:when>
					<c:otherwise>
						<td>없음</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${bookDeals_list.state eq 1}">
						<td>상</td>
					</c:when>
					<c:when test="${bookDeals_list.state eq 2}">
						<td>중</td>
					</c:when>
					<c:when test="${bookDeals_list.state eq 3}">
						<td>하</td>
					</c:when>
					<c:otherwise>
						<td>없음</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${bookDeals_list.delivery eq 2}">
						<td>택배</td>
					</c:when>
					<c:when test="${bookDeals_list.delivery eq 1}">
						<td>직접수령</td>
					</c:when>
					<c:otherwise>
						<td>없음</td>
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
				href="./marketDealsList.market?curPage=${i}&id=${id }&year=${year}&month=${month}&day=${day}&type=${type}">${i}</a></li>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./marketDealsList.market?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
</div>
</div>
	
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>