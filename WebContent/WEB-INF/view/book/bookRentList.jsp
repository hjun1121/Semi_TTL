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
		$(".cur").each(function(){
			 if($(this).attr("title") == ${curPage }) {
				 $(this).attr("style", "color:red;");
			 }
		 });
	
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
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<div>
	<c:import url="${myContextPath}/WEB-INF/view/member/myPage.jsp?ln=${ln}"></c:import>
</div>

<div id="divContentsW">
	<div id="divContents">
		<h2 id="divTitle">대여 내역</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp?ln=${ln}"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>My Page</li>
				<li>&gt;</li>
				<li>대여 내역</li>
			</ul>
		</div>

	<div>
	<form name="frm" action="./bookRentList.book?library=${library}&ln=${ln}" method="post">
		<div class ="search">
			<span>
				<select id="year" name="year" class="selectBox1">
		            <option class="years" value="17" >2017</option>
		            <option class="years" value="16">2016</option>
		            <option class="years" value="15">2015</option>
		            <option class="years" value="14">2014</option>
		            <option class="years" value="13">2013</option>
  			      </select>
       			 년
       			 <select id="month" name="month" class="selectBox1">
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
		        <select id="day" name="day" class="selectBox1">
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
		        일 이전 까지 <input class="btnType5" id="btbtn" type="submit" value=" ">
      		  </span>
		</div>
		</form>
	</div>
	<br><br>
	<c:if test="${size eq 0 }">
		<h2 id="divTitle">대여 내역이 없습니다.</h2>
		<br><br><br><br>
	</c:if>
	<c:if test="${size ne 0 }">
	<div class="listTable">
	<table class="mobileTable tablet" >
		<tr>
			<th>No.</th>
			<th>서명</th>
			<th>구역</th>
			<th>저자</th>
			<th>출판사</th>
			<th>출판년도</th>
			<th>비치도서관</th>
			<th>대여시간</th>
			<th>반납시간</th>
			<th>연체일</th>
			<th></th>
		</tr>
		<c:forEach items="${bookRentList }" var="bookRent_list">
		<tr>
			<td scope="row" class="footable-first-column">${bookRent_list.bnum }</td>
 				<td scope="row" style="display: table-cell;"><a href="./bookRentDetails.book?num=${bookRent_list.num }&bnum=${bookRent_list.bnum }&library=${library}&ln=${ln}">${bookRent_list.title }</a></td>
 				<td scope="row" style="display: table-cell;">${bookRent_list.section }</td>
				<td scope="row" style="display: table-cell;">${bookRent_list.writer }</td>
				<td scope="row" style="display: table-cell;">${bookRent_list.company }</td>
				<td scope="row" data-class="expand">${bookRent_list.publish_date }</td>
				<c:choose>
					<c:when test="${bookRent_list.library eq 1}">
						<td scope="row" style="display: table-cell;">기흥구</td>
					</c:when>
					<c:when test="${bookRent_list.library eq 2}">
						<td scope="row" style="display: table-cell;">송파구</td>
					</c:when>
					<c:when test="${bookRent_list.library eq 3}">
						<td scope="row" style="display: table-cell;">장안구</td>
					</c:when>
					<c:when test="${bookRent_list.library eq 4}">
						<td scope="row" style="display: table-cell;">분당구</td>
					</c:when>
					<c:otherwise>
						<td scope="row" style="display: table-cell;">*</td>
					</c:otherwise>
				</c:choose>
				<td scope="row" data-class="expand">${bookRent_list.in_time }</td>
				<td scope="row" data-class="expand">${bookRent_list.out_time }</td>
				<c:choose>
					<c:when test="${empty bookRent_list.out_time }">
						<td> </td>
						<td scope="row" style="display: table-cell;">
						<a href="./bookReturn.book?num=${bookRent_list.num }&bnum=${bookRent_list.bnum }&library=${library}&ln=${ln}"><button class = "btn btn-default rent_btn">반납</button></a>
						</td>
					</c:when>
					<c:when test="${! empty bookRent_list.out_time }">
						<c:if test="${bookRent_list.late_date > 7}">
							<td scope="row" data-class="expand">${bookRent_list.late_date-7 }일</td>
						</c:if>
						<c:if test="${bookRent_list.late_date < 7}">
							<td scope="row" data-class="expand">0일</td>
						</c:if>
						<td> </td>
					</c:when>
					<c:otherwise>
						<td> </td>
						<td> </td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
	<div class = "paging" style = "text-align: center;">
			<ul class="pagination pagination-sm">
			<c:if test="${page.curBlock>1}">
			<li><button class="go" id="${page.startNum-1}">[이전]</button></li>
			</c:if>
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<li><a class="cur" title="${i }" href="./bookRentList.book?curPage=${i}&id=${id }&year=${year}&month=${month}&day=${day}&library=${library}&ln=${ln}">${i}</a></li>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./bookRentList.book?curPage=${requestScope.page.lastNum+1}&library=${library}&ln=${ln}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	</div>
	</c:if>
	<br><br><br><br><br><br><br>
	
	</div>
</div>	
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>