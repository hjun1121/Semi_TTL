<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/market/bookBuy.css">
<script type="text/javascript">
$(function(){
	 var library = '${buyWishList.library}';
	 
	 $(".library").each(function(){
		 if($(this).val() == library) {
			 $(this).attr("selected", true);
		 }
	 });
	 
	 var f = '${f}';
	 $(".f").each(function(){
		 if($(this).val() == f) {
			 $(this).attr("selected", true);
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
		
		$("#lib").click(function(){
			$("#delivery").val("1");
			$("#carPrice").html("0,000won");
			$("#allPrice").html("<fmt:formatNumber value="${buyWishList.price}" groupingUsed="true" /> won");
			$("#libForm").removeAttr("style")
			$("#carForm").attr("style","display:none;")
		});
		
		$("#car").click(function(){
			$("#delivery").val("2");
			$("#carPrice").html("2,500won");
			$("#allPrice").html("<fmt:formatNumber value="${buyWishList.price+2500}" groupingUsed="true" /> won");
			$("#libForm").attr("style","display:none;")
			$("#carForm").removeAttr("style")
			
		});
		
		
		
		$("#btn").click(function(){
			var test =0;
			$("input[name=del]:checked").each(function() {
			    test = $(this).val();
			});
			
			if(test == 'lib'){
				if($("#chk_purchase_agreement0").prop("checked")==true){
					document.frm.submit();
				}else{
					alert("동의하지 않으시면 결제하실 수 없습니다.");
					$("#chk_purchase_agreement0").focus();
				}
			}else{
				if($("#chk_purchase_agreement0").prop("checked")==true){
					document.frm.submit();
				}else{
<<<<<<< HEAD
					alert("동의하지 않으시면 결제하실 수 없습니다.");
=======
					alert("동의좀 눌러주시겠습니까?");
					$("#chk_purchase_agreement0").focus();
>>>>>>> d1259410c42e81e4a447c5f625731c3841067fe7
				}
			}
		});
		
	});

</script>
</head>
<body>
<c:import url="${myContextPath}/temp/header.jsp"></c:import>


<div id="divContentsW">
	<div id="divContents">
			
		<h2 id="divTitle">주문서 작성</h2>
		<div id="divLocation">
			<ul>
				<li class="home"><a href="#"><img src="${pageContext.request.contextPath }/image/notice/home.png" alt="HOME"></a></li>
				<li>&gt;</li>
				<li>주문서 작성</li>
			</ul>
		</div>	


		<!-- ////////////// -->
	
		<div class="ec-base-table typeList ">
		<table border="1" summary="">
			<thead>
			<tr>
				<th><input type="radio" name="del" class="del" id="lib" value="lib" checked="checked">&nbsp;직접수령 &nbsp; <input type="radio" name="del" class="del" id="car" value="car">&nbsp;택배수령</th>
			</tr>
			</thead>
		</table>
		</div>
		
		<br>
		
	<form action="../market/marketBuy.market" name="frm" method="POST">
		<div class="xans-element- xans-order xans-order-form xans-record-">
		<div class="orderListArea ">
			<div class="ec-base-table typeList ">
			<input type="hidden" name="price" value= "${buyWishList.price}">
			<input type="hidden" id="delivery" name="delivery" value="1">
			<input type="hidden" name = "num" value = ${buyWishList.num }>
				<table border="1">
					<caption>기본배송</caption>
					<thead>
						<tr>
							<th scope="col">상품정보</th>
							<th scope="col">판매가</th>
							<th scope="col">수량</th>
							<th scope="col"></th>
							<th scope="col">배송비</th>
							<th scope="col">합계</th>
						</tr>
					</thead>
					<tbody class="xans-element- xans-order xans-order-normallist center">
						<tr class="xans-record-">
							<td class="left">
								<a href="${pageContext.request.contextPath }/market/marketTotalView.market?num=${buyWishList.num}"><strong>${buyWishList.title}</strong></a>
								<div class="option ">[저자: ${buyWishList.writer}]</div>
								<div class="option ">[출판사: ${buyWishList.company}]</div>
							</td>
							<td class="left">
								<div>
									<strong><fmt:formatNumber value="${buyWishList.price}" groupingUsed="true" /> won</strong>
								</div>
							</td>
							<td class="left">1</td>
							<td>
							</td>
							<td class="left" id="carPrice">0,000won</td>
							<td class="left">
								<strong id="allPrice"><fmt:formatNumber value="${buyWishList.price}" groupingUsed="true" /> won</strong>
							</td>
						</tr>
					</tbody>
					<tfoot class="right">
						<tr>
							<td id="allPrice2" colspan="8">
								<span class="gLeft">[기본배송]</span>
								상품구매금액 <strong><fmt:formatNumber value="${buyWishList.price}" groupingUsed="true" /></strong> + 배송비 
								<span id="domestic_ship_fee">0,000</span>= 합계 : 
								 <strong class="txtEm gIndent10">
								 <span id="domestic_ship_fee_sum" class="txt18">
									 <fmt:formatNumber value="${buyWishList.price}" groupingUsed="true" /> 
								 </span>
								 won
								 </strong> 
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		
		<!-- 직접수령 정보-->
		<br>
		<div class="orderArea" id="libForm">
			<div class="ec-base-table typeWrite">
						<input type="hidden" name="library" value="${buyWishList.library }">
				<table border="1" summary="">
					<caption>도서관명</caption>
					<colgroup>
						<col style="width:139px;">
						<col style="width:auto;">
					</colgroup>
				<tbody>
					<tr>
						<th scope="row">수령도서관</th>
						<td>
							<c:if test="${ buyWishList.library eq 1 }">형준 도서관</c:if>
							<c:if test="${ buyWishList.library eq 2 }">지현 도서관</c:if>
							<c:if test="${ buyWishList.library eq 3 }">희성 도서관</c:if>
							<c:if test="${ buyWishList.library eq 4 }">형민 도서관</c:if>
						</td>
					</tr>
					<tr>
						<th scope="row">수령인</th>
						<td>
							<input class="inputTypeText" placeholder="" size="15" type="text" value="${member.id }">
						</td>
					</tr>
				</tbody>
				</table>
			</div>
		</div>
		
		<!-- 배송 정보 -->
		<div class="orderArea" id="carForm" style="display: none;">
			<div class="title">
				<h4 class="-titlepack -font-ns">배송 정보</h4>
			</div>
			<div class="ec-base-table typeWrite">
				<table border="1" summary="">
					<caption>배송 정보 입력</caption>
					<colgroup>
						<col style="width:139px;">
						<col style="width:auto;">
					</colgroup>
				<tbody class="">
					<tr>
						<th scope="row">주문자명 </th>
						<td>
							<input class="inputTypeText" placeholder="" id="id" size="15" type="text" value="${member.id }">
						</td>
					</tr>
					<tr>
						<th scope="row">주소 </th>
						<td>
							<input type="text" id="postCode" name="postCode" placeholder="우편번호" readonly="readonly" value="${member.postCode }" class="inputTypeText" size="6" maxlength="6">							
							<input type="button" id="addrCheck" value="우편번호 찾기" class="-btn -white"><br>
							<input  type="text" id="addr" name="addr" placeholder="주소" readonly="readonly" value="${member.addr }" class="inputTypeText"  size="40"> <span class="grid">기본주소</span><br>
							<input type="text" id="addr2" name="addr2" placeholder="나머지주소 " value="${member.addr2 }" class="inputTypeText" size="40"> <span class="grid">나머지주소</span>
							<td>
						</td>
					</tr>
					<tr class="">
						<th scope="row">
						전화번호 <span class="displaynone"></span>
						</th>
						<td>
						<select id="rphone2_1" name="f">
							<option value="010" class="f">010</option>
							<option value="011" class="f">011</option>
						</select>
						-<input id="rphone2_2" maxlength="4" name="m" size="4" type="text" value="${m }">-<input id="rphone2_3" maxlength="4" size="4" type="text" name="l" value="${l }"></td>
					</tr>
				</tbody>
				<tbody class="delivery ">
					<tr class="">
					<th scope="row">배송메시지 </th>
					<td>
						<textarea id="omessage" maxlength="255" cols="70"></textarea>							
					</td>
				</tbody>
				</table>
			</div>
		</div>
			<br>
			<input id="chk_purchase_agreement0" type="checkbox" >결제정보를 확인하였으며, 구매진행에 동의합니다.
			<div class="btnCenter mt30" id="center">
				<span class="button1">
					<input type="button" class="type4 large" id="btn" value="결제">
				</span>	
			</div>
	</div>
</form>

	
	</div>
</div>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>