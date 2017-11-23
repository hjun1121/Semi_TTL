<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/admin_member_list.css">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	red();
	function red (){
		$(".cur").each(function(){
			 if($(this).attr("title") == ${curPage }) {
				 $(this).attr("style", "color:red;");
			 }
		 });
	}
	
	function redAjax (){
		$(".cur").each(function(){
			 if($(this).attr("title") == 1) {
				 $(this).attr("style", "color:red;");
			 }
		 });
	}
	
	 var kind1 = '${kind1}';
		 $(".kind1").each(function(){
			 if($(this).val() == kind1) {
				 $(this).attr("selected", true);
			 }
		 });
		 
		if(${kind} == 10){
			$(".kind1").attr("style", "background-color: #fff");
	 		$("#btn_admin").attr("style", "background-color: #dcdcdc");
		}else if(${kind} == 0){
			$(".kind1").attr("style", "background-color: #fff");
	 		$("#btn_black").attr("style", "background-color: #dcdcdc");
		}else{
			$(".kind1").attr("style", "background-color: #fff");
	 		$("#btn_member").attr("style", "background-color: #dcdcdc");
		}
		
		
	$("#btn_admin").click(function() {
		$("#kind0").val("10");
 		$(".kind1").attr("style", "background-color: #fff");
 		$("#btn_admin").attr("style", "background-color: #dcdcdc");
		
		$.ajax({
			url:"./memberList.member?ln=${ln}",
			type:"POST",
			data: {
				kind:10,
				kind1:'${kind1}',
				search:'${search}'
			},
			success:function(data){
				$("#list").html(data);
				redAjax();
			}
		});
	});

	$("#btn_member").click(function() {
		$("#kind0").val("1");
 		$(".kind1").attr("style", "background-color: #fff");
 		$("#btn_member").attr("style", "background-color: #dcdcdc");
 		
 		$.ajax({
			url:"./memberList.member",
			type:"post",
			data: {
				kind:1,
				kind1:'${kind1}',
				search:'${search}'
			},
			success:function(data){
				$("#list").html(data);
				redAjax();
			}
		});
	});

	$("#btn_black").click(function() {
		$("#kind0").val("0");
		$(".kind1").attr("style", "background-color: #fff");
		$("#btn_black").attr("style", "background-color: #dcdcdc");
	
		$.ajax({
			url:"./memberList.member?ln=${ln}",
			type:"post",
			data: {
				kind:0,
				kind1:'${kind1}',
				search:'${search}'
			},
			success:function(data){
				$("#list").html(data);
				redAjax();
			}
		});
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
		<h2 id="divTitle">회원 리스트</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="${pageContext.request.contextPath}/index.jsp?ln=${ln}"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>MY PAGE</li>
				<li>&gt;</li>
				<li>회원 리스트</li>
			</ul>
		</div>
	<!-- 검색 시작 -->
		<form name="frm" class="form-inline" action="./memberList.member?ln=${ln}" method="post">
		<input type="hidden" name="sel" value="sel">
		<input type="hidden" name="kind" id="kind0" value="${kind}">
			<fieldset>
				<span class="bunch">
					<select name="kind1" id = "kind1">
					<option class = "kind1" value="id">ID</option>
					<option class = "kind1" value="name">NAME</option>
					<option class = "kind1" value="email">EMAIL</option>
				</select>
				<input type="text" id = "search" name = "search" value = "${search}" class="inputTextType3 sw" maxlength="100" title="검색어" placeholder="검색어를 입력하세요">
				</span>
				<input type="submit" class="btnType5" value="검색" id = "search">
			</fieldset>
		</form>
		<!-- 검색 끝 -->
	
	<div style = "height: 50px"></div>
	<form action="">
		<table class = "table">
			<tr>
				<td><input type = "button" id = "btn_admin" class = "btnType3 kind1" value = "ADMIN"></td>
				<td><input type = "button" id = "btn_member" class = "btnType3 kind1" style = "background-color: #dcdcdc" value = "MEMBER"></td>
				<td><input type = "button" id = "btn_black" class = "btnType3 kind1" value = "BLACKLIST"></td>
			</tr>
		</table>
	</form>
	
	<div id = "list"> 
	<c:if test="${size eq 0 }">
		<h3>검색 결과가 없습니다.</h3>
	</c:if>
	<c:if test="${size ne 0 }">
	<table class="mobileTable tablet kind" id = "member">
	<thead>
		<tr>
			<th>ID</th>
			<th>PASSWORD</th>
			<th>NAME</th>
			<th>BIRTH</th>
			<th>GENDER</th>
			<th>ADDRESS</th>
			<th>PHONE</th>
			<th>EMAIL</th>
			<th>LIBRARY</th>
			<th>KIND</th>
		</tr>
		<c:forEach items="${list }" var="dto">
			<tr>
				<td scope="row" class="footable-first-column">
				<a href="./memberUpdate.member?id=${dto.id }">${dto.id }</a></td>
				<td scope="row" class="footable-first-column">${dto.pw }</td>
				<td scope="row" style="display: table-cell;">${dto.name }</td>
				<td scope="row" style="display: table-cell;">${dto.birth }</td>
				<td  scope="row" data-class="expand">${dto.gender }</td>
				<td scope="row" style="display: table-cell;">${dto.addr }</td>
				<td scope="row" style="display: table-cell;">${dto.phone }</td>
				<td scope="row" style="display: table-cell;">${dto.email }</td>
				<td scope="row" style="display: table-cell;">${dto.library }</td>
				<td scope="row" style="display: table-cell;">${dto.kind }</td>
			</tr>
		</c:forEach>
	</thead>
	</table>
	
	<div class = "paging" style = "text-align: center;">
		<ul class="pagination pagination-sm">
				<c:if test="${page.curBlock>1}">
				<li><a href = "./memberList.member?curPage=${page.startNum-1}&kind=${kind}&search=${search}&kind1=${kind1}&library=${library}&ln=${ln}">[이전]</a></li>
				</c:if>

				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li><a id="pa" class="cur" title="${i }" href="./memberList.member?curPage=${i}&kind=${kind}&search=${search}&kind1=${kind1}&library=${library}&ln=${ln}">${i}</a></li>
				</c:forEach>

				<c:if test="${page.curBlock < page.totalBlock}">
				<li><a href="./memberList.member?curPage=${page.lastNum+1}&kind=${kind}&search=${search}&kind1=${kind1}&library=${library}&ln=${ln}">[다음]</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>
	</div>

	<a href="../index.jsp" class="btnType3">HOME</a>

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