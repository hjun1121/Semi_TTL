<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/seat/seatTotalList.css">
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
		
		$(".cur").each(function(){
			 if($(this).attr("title") == ${curPage }) {
				 $(this).attr("style", "color:red;");
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
		<h2 id="divTitle">좌석 예약 내역</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>좌석 예약 내역</li>
			</ul>
		</div>


	<div>
	<form name="frm" class="form-inline" action="./seatTotalList.seat?library=${library}&ln=${ln}" method="post">
		<div>
			<span>
				<select id="year" name="year" class="selectBox1">
					 <option class="years" value="18" >2018</option>
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
		<h2 id="divTitle">좌석 예약 내역이 없습니다.</h2>
	</c:if>
	<c:if test="${size ne 0 }">
	<div class="listTable">
		<table class="mobileTable tablet" >
		<tr>
			<th>No.</th>
			<th>좌석 번호</th>
			<th>도서관 명</th>
			<th>입실 시간</th>
			<th>퇴실 시간</th>
			<th>상태</th>
			<th></th>
		</tr>
		<c:forEach items="${seatList }" var="seatTotal_list" varStatus="count">
			<tr>
			<td scope="row" class="footable-first-column">${count.count }</td>
			<td scope="row" style="display: table-cell;">${seatTotal_list.seat_num }</td>
			<c:choose>
				<c:when test="${seatTotal_list.library eq 1}">
					<td scope="row" style="display: table-cell;">기흥도서관</td>
				</c:when>
				<c:when test="${seatTotal_list.library eq 2}">
					<td scope="row" style="display: table-cell;">송파도서관</td>
				</c:when>
				<c:when test="${seatTotal_list.library eq 3}">
					<td scope="row" style="display: table-cell;">장안도서관</td>
				</c:when>
				<c:when test="${seatTotal_list.library eq 4}">
					<td scope="row" style="display: table-cell;">분당도서관</td>
				</c:when>
				<c:otherwise>
					<td scope="row" style="display: table-cell;">없음</td>
				</c:otherwise>
			</c:choose>
				<td scope="row" data-class="expand">${seatTotal_list.in_time }</td>
				<td scope="row" data-class="expand">${seatTotal_list.out_time }</td>
				<c:choose>
				<c:when test="${seatTotal_list.state eq 0 && empty seatTotal_list.in_time && empty seatTotal_list.out_time}">
					<td scope="row" style="display: table-cell;">예약중</td>
					<td>
					<a href="./seatCancel.seat?seat_num=${seatTotal_list.seat_num }&library=${library}&ln=${ln}"><button class = "btn btn-default wish_btn" type = "button" >취소</button></a>
					<a href="./seatIn.seat?num=${seatTotal_list.num }&library=${library}&ln=${ln}"><button class = "btn btn-default wish_btn" type = "button" >입실</button></a>
					</td>
				</c:when>
				<c:when test="${seatTotal_list.state eq 1 && !empty seatTotal_list.in_time && empty seatTotal_list.out_time}">
					<td scope="row" style="display: table-cell;">입실 완료</td>
					<td><a href="./seatOut.seat?num=${seatTotal_list.num }&seat_num=${seatTotal_list.seat_num }&library=${library}&ln=${ln}"><button class = "btn btn-default wish_btn" type = "button" >퇴실</button></a></td>
				</c:when>
				<c:when test="${seatTotal_list.state eq 2 && !empty seatTotal_list.out_time && !empty seatTotal_list.in_time}">
					<td scope="row" style="display: table-cell;">퇴실 완료</td>
					<td></td>
				</c:when >
				<c:when test="${seatTotal_list.state eq 3 && empty seatTotal_list.out_time && empty seatTotal_list.in_time}">
					<td scope="row" style="display: table-cell;">취소</td>
					<td> </td>
				</c:when>
				<c:otherwise>
					<td scope="row" style="display: table-cell;">없음</td>
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
			<li><a class="cur" title="${i }" href="./seatTotalList.seat?curPage=${i}&id=${id }&year=${year}&month=${month}&day=${day}&library=${library}&ln=${ln}">${i}</a></li>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./seatTotalList.seat?curPage=${requestScope.page.lastNum+1}&library=${library}&ln=${ln}">[다음]</a></li>
			</c:if>
		</ul>
	</div>
	</div>
	</c:if>
	<br><br><br><br><br><br><br><br><br><br>
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