<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	 var library = '${buyWishList.library}';
	 
	 $(".library").each(function(){
		 if($(this).val() == library) {
			 $(this).attr("selected", true);
		 }
	 });
	 
	 $("#approval").change(function(){
		 var approval = $("#approval").val(); 
		 if(approval==2 ){
			 $("#addrDis").attr("style","display:inline;");
		 }else {
			 $("#addrDis").attr("style","display:none;");
		 }
	 });
	 
	 
		//주소검색
		
		$("#addrCheck").click(function(){
			new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("#postCode").val(data.zonecode);  //5자리 새우편번호 사용
					$("#addr").val(fullAddr);
	                // 커서를 상세주소 필드로 이동한다.
	                $("#addr2").val("");
	                $("#addr2").focus();
	            }
	        }).open();
		    
		});	
});
</script>
</head>
<body>
	<h3>Market- 구매신청form</h3>
	<div style = "height: 50px"></div>
	<form action="../market/bookBuy.market" method="POST">
	<input type = "hidden" class = "form-control" name = "num" value = ${buyWishList.num }>
		<input type = "hidden" class = "form-control" name = "id" value = ${member.id }>
		<input type = "hidden" class = "form-control" name = "kind" value = '1'>
		<table class = "table">
			<tr>
				<td>책제목</td>
				<td><input type = "text" class = "form-control" name = "title" value="${buyWishList.title}"></td>
				<td>저자</td>
				<td><input type = "text" class = "form-control" name = "writer" value="${buyWishList.writer}"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type = "text" class = "form-control" name = "company" value="${buyWishList.company}"></td>
				<td>출판년도</td>
				<td><input type = "text" class = "form-control" name = "publish_date" placeholder = "출판년도는 숫자만 입력해 주세요" value="${buyWishList.publish_date}"></td>
			</tr>
			<tr>
				<td>정가</td>
				<td><input type = "text" class = "form-control" name = "price" value="${buyWishList.price}"></td>
			</tr>
			<tr>
				<td>도서관명</td>
				<c:choose>
					<c:when test="${buyWishList.library eq 1}">
						<td><input type = "text" class = "form-control"value="기흥구"></td>
						<input type = "hidden" class = "form-control" name = "library" value="1">
					</c:when>
					<c:when test="${buyWishList.library eq 2}">
						<td><input type = "text" class = "form-control" value="송파구"></td>
						<input type = "hidden" class = "form-control" name = "library" value="2">
					</c:when>
					<c:when test="${buyWishList.library eq 3}">
						<td><input type = "text" class = "form-control" value="장안구"></td>
						<input type = "hidden" class = "form-control" name = "library" value="3">
					</c:when>
					<c:when test="${buyWishList.library eq 4}">
						<td><input type = "text" class = "form-control" value="분당구"></td>
						<input type = "hidden" class = "form-control" name = "library" value="4">
					</c:when>
					<c:otherwise>
						<td>-</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td>구입방법</td>
				<td><select name = "approval" id="approval">
					<option class = "approval" value = "1">직접수령</option>
					<option class = "approval" value = "2">택배</option>
				</select>
				<td id="price"></td>
			</tr>
			<tr id="addrDis" style="display: none;">
				<td>주소</td>
				<td>
					<input type="text" id="postCode" name="postCode" placeholder="우편번호" readonly="readonly" value=${member.postCode }>
					<input type="button" id="addrCheck" value="우편번호 찾기" ><br>
					<input type="text" id="addr" name="addr" placeholder="주소" readonly="readonly" value="${member.addr }">
					<input type="text" id="addr2" name="addr2" placeholder="나머지주소 " value=${member.addr2 }>	
				</td>
				<td>택배결제시 2500원 추가되어 결제됩니다.</td>
			</tr>
		</table>
		<button style = "float: right;" class = "btn btn-default" type = "submit">CONFIRM</button>
	</form>
</body>
</html>