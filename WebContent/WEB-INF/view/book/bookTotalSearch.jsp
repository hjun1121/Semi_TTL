<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="../css/temp/header.css">
	<link rel="stylesheet" href="../css/temp/footer.css">
	<link rel="stylesheet" href="../css/book/bookTotalSearch.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	 var kind = '${kind}';

	 $(".kind").each(function(){
		 if($(this).val() == kind) {
			 $(this).attr("selected", true);
		 }
	 });

	$(".rent_btn").click(function() {
		var num = $(this).val();
		$.ajax({
			url: "./bookRent.book",
			type: "GET",
			data: {
				num:num,
				kind:'${kind}',
				curPage: ${curPage},
				search: '${search}',
				rent_id:'${member.id}'
			},
			success: function(data) {
				alert(data);
				location.href="./bookTotalSearch.book?search=${search}&curPage=${curPage}&kind=${kind}";
			}
		});
	});
	
	$(".wish_btn").click(function() {
		var num = $(this).val();
		var title = $(this).attr("title");
		
		if (title == 1) {
			$.ajax({
				url: "../book/bookRentWishReturn.book",
				type: "GET",
				data: {
					num:num,
					kind:'${kind}',
					curPage: ${curPage},
					search: '${search}',
					rent_id:'${member.id}'
				},
				success: function(data) {
					alert(data);
					location.href="./bookTotalSearch.book?&search=${search}&curPage=${curPage}&kind=${kind}";
				}
			});

		} else if (title == 0) {
			$.ajax({
				url: "../book/bookRentWish.book",
				type: "GET",
				data: {
					num:num,
					kind:'${kind}',
					curPage: ${curPage},
					search: '${search}',
					rent_id:'${member.id}'
				},
				success: function(data) {
					alert(data);
					location.href="./bookTotalSearch.book?&search=${search}&curPage=${curPage}&kind=${kind}";
				}
			});
		}
	});

 });
</script>
</head>
<body>

	<!-- header -->
		<c:import url="../../../temp/header.jsp"></c:import>
	<!-- header -->
	<div style = "height: 50px"></div>

	<section>
		<div id = "bts_top_section">
			<h2 id="divTitle">소장도서</h2>
			<div id="divLocation">
				<ul>
					<li class="home"><a href="../../index.jsp"><img src="../../../image/bookTotalSearch/home.png" alt="HOME"></a></li>
					<li>&gt;</li>
					<li>통합검색</li>
					<li>&gt;</li>
					<li>소장도서</li>
				</ul>
			</div>
		</div>

		<!-- 검색 시작 -->
			<fieldset>
				<span class="bunch">
					<select id="kind" name = "kind" class="selectBox1">
						<option class = "kind" value="title">서명</option>
						<option class = "kind" value="writer">저자</option>
						<option class = "kind" value="company">출판사</option>
						<option class = "kind" value="type">분류</option>
					</select>
				<input type="text" class="inputTextType3 sw" maxlength="100" title="검색어" placeholder="검색어를 입력하세요">
				</span>
				<input type="submit" class="btnType5" value="검색">
			</fieldset>
		<!-- 검색 끝 -->
	
	</section>


	<!-- footer -->
		<c:import url="../../../temp/footer.jsp"></c:import>
	<!-- footer -->

</body>
</html>