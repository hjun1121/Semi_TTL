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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/market/marketTotalList.css">
<title>Insert title here</title>
<script type="text/javascript">

	$(function(){
		
		$(function(){
			$(".cur").each(function(){
				 if($(this).attr("title") == ${curPage }) {
					 $(this).attr("style", "color:red;");
				 }
			 });
		});
		
		var kind = '${kind}';
		$(".kind").each(function() {
			if($(this).val() == kind){
				$(this).attr("selected", true);
			}
		});
		
		
		$(".wish_btn").click(function() {
			var num = $(this).val();
			var title = $(this).attr("title");

			if (title == 1) {
				$.ajax({
					url: "./bookBuyWishReturn.market",
					type: "GET",
					data: {
						num:num,
						curPage: ${curPage},
						id: '${member.id}'
					},
					success: function(data) {
						alert(data);
						location.href="./marketTotalList.market?curPage=${curPage}";
					}
				});

			} else if (title == 0) {
				$.ajax({
					url: "./bookBuyWish.market",
					type: "GET",
					data: {
						num:num,
						curPage: ${curPage},
						id: '${member.id}'
					},
					success: function(data) {
						alert(data);
						location.href="./marketTotalList.market?curPage=${curPage}";
					}
				});
			}
		});
		
	});

</script>
</head>
<body>
<c:choose>
	<c:when test="${library eq 1}"><c:import url="${myContextPath}/temp/header_1.jsp"></c:import></c:when>
	<c:when test="${library eq 2}"><c:import url="${myContextPath}/temp/header_2.jsp"></c:import></c:when>
	<c:when test="${library eq 3}"><c:import url="${myContextPath}/temp/header_3.jsp"></c:import></c:when>
	<c:when test="${library eq 4}"><c:import url="${myContextPath}/temp/header_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/header.jsp"></c:import></c:otherwise>
</c:choose>

<section id = "section">
	<div id="divContentsW">
		<div id="divContents">
			
			<div id = "bts_top_section">
			<h2 id="divTitle">중고 장터</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>중고 장터</li>
				</ul>
			</div>
			
		<!-- 검색 시작  -->
		<form name="frm" class="form-inline" action="./marketTotalList.market" method="post">
			<fieldset>
				<legend>검색</legend>
				
				<span class="bunch">
					<label class="skip">검색어</label>
					<select name="kind" id="kind" class="selectBox1">
						<option class="kind" value="title">제목</option>
						<option class="kind" value="writer">글쓴이</option>
						<option class="kind" value="company">출판사</option>
					</select> 
					<input type="text" class="inputTextType3 sw" id="search" maxlength="100" title="검색어" placeholder="검색어를 입력하세요" name="search" value=${search }>
				</span>
					 <input type="submit" class="btnType5" value="검색">
			 </fieldset>
		</form>
		<br>
		<!-- 검색 끝 -->
		<c:if test="${size eq 0 }">
			<h2 id="divTitle">중고 내역이 없습니다.</h2>
		</c:if>	
		<c:if test="${size ne 0 }">
		<!-- list 시작 -->
		<div class="listTable">
			<table id ="marketList" class="mobileTable tablet">
			<thead>
				<tr>
					<th class="footable-first-column">No.</th>
					<th data-class="expand">서명</th>
					<th style="display: table-cell;">저자</th>
					<th style="display: table-cell;">출판사</th>
					<th style="display: table-cell;">출판년도</th>
					<th style="display: table-cell;">가격</th>
					<th style="display: table-cell;">찜</th>
					<c:if test="${ not empty member }">
						<th>찜</th>
						<th>구매</th>
					</c:if>
				</tr>
			</thead>
			<c:forEach items="${list }" var="dto">
			<tbody>
				<tr>
					<td>${dto.num }</td>
					<td><a href="./marketTotalView.market?num=${dto.num }">${dto.title }</a></td>
					<td>${dto.writer }</td>
					<td>${dto.company }</td>
					<td>${dto.publish_date }</td>
					<td>${dto.price }</td>
					<td>${dto.wish }</td>
			<c:set var="heart1" value="0" ></c:set>
			<c:set var="heart2" value="0" ></c:set>
			<c:if test="${ not empty member }">
				<c:forEach items="${buy_wish_list}" var="wish">
					<c:if test="${wish.num eq dto.num}">
						<c:choose>
							<c:when test="${heart1 == 0}">
								<td><button class = "btn btn-default wish_btn" type = "submit" value = "${dto.num}" title="1">❤</button></td>
								<c:set var="heart1" value="1" ></c:set>
								<c:set var="heart2" value="1" ></c:set>
							</c:when>
						</c:choose>
					</c:if>
				</c:forEach>
					<c:if test="${heart2 == 0}">
						<td><button class = "btn btn-default wish_btn" type = "submit" value = "${dto.num}" title="0">♡</button></td>
					</c:if>
				<td><a href="./bookBuy.market?num=${dto.num }"><input type="button"  class = "btn btn-default wish_btn" value="구매"></a></td>
			</c:if>
			</tr>
			</tbody>
					
			</c:forEach>
		</table>
			</div>
			<!-- list 끝 -->
		</c:if>	
		<br><br>
		<c:if test="${not empty member}">
		<form id = "order_btn" action="./marketOrder.market?id=${member.id }">
			<button style = "float: right;" class ="adv" type = "submit">신청하기</button>		
		</form>
		</c:if>
		<br><br>
		<!-- 페이징  시작 -->
		<div style = "text-align: center;">
			<ul class="pagination pagination-sm">
				<c:if test="${page.curBlock>1}">
				<li><a href = "./marketTotalList.market?curPage=${page.startNum-1}&kind=${kind }&search=${search }">[이전]</a></li>
				</c:if>
				
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li><a id="pa" class="cur" title="${i }" href="./marketTotalList.market?curPage=${i}&kind=${kind }&search=${search }">${i}</a></li>
				</c:forEach>

				<c:if test="${page.curBlock < page.totalBlock}">
				<li><a href="./marketTotalList.market?curPage=${page.lastNum+1}&kind=${kind }&search=${search }">[다음]</a></li>
				</c:if>
			</ul>
		</div>
		<!-- 페이징 끝 -->
			</div>
		</div>
	</div>
</section>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>
