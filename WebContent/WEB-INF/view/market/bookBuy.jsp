<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	 
	 $("#delivery").change(function(){
		 var delivery = $("#delivery").val(); 
		 if(delivery==2 ){
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


		<div class="xans-element- xans-order xans-order-form xans-record-">
		<div class="orderListArea ">
			<div class="ec-base-table typeList ">
				<div id="SMS_order_name" style="display:none">corduroy boy pants</div>
				<table border="1" summary="">
					<caption>기본배송</caption>
						
					<thead>
						<tr>
							<th scope="col" class="displaynone"><input type="checkbox" disabled=""></th>
							<th scope="col">상품정보</th>
							<th scope="col">판매가</th>
							<th scope="col">수량</th>
							<th scope="col">배송구분</th>
							<th scope="col">배송비</th>
							<th scope="col">합계</th>
						</tr>
					</thead>
					<tfoot class="right">
						<tr>
							<td class="displaynone"></td>
							<td colspan="8">
								<span class="gLeft">[기본배송]</span>
								상품구매금액 <strong>42,000
								</strong> + 배송비 
								<span id="domestic_ship_fee">2,500</span> 
								 = 합계 : <strong class="txtEm gIndent10">
								 <span id="domestic_ship_fee_sum" class="txt18">44,500</span>
								 won</strong> <span class="displaynone"></span>
							</td>
							
						</tr>
					</tfoot>
					<tbody class="xans-element- xans-order xans-order-normallist center">
						<tr class="xans-record-">
							
							
							<td class="left">
								<a href="#"><strong>corduroy boy pants</strong></a>
								<div class="option ">[옵션: 크림/Small]</div>
								<p class="gBlank5 displaynone">무이자할부 상품</p>
								<p class="gBlank5 displaynone">유효기간 : </p>
							</td>
							<td class="right">
								<div class="">
									<strong>42,000won</strong>
									<p class="displaynone"></p>
								</div>
								<div class="displaynone">
									<strong>42,000won</strong>
									<p class="displaynone"></p>
								</div>
							</td>
							<td>1</td>
							
							<td>
								<div class="txtInfo">기본배송</div>
							</td>
							<td>[조건]</td>
							<td class="right">
								<strong>42,000won</strong>
								<div class="displaynone"></div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<!-- 배송 정보 -->
		<div class="orderArea">
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
						<th scope="row">받으시는 분 </th>
						<td>
							<input id="rname" name="rname" class="inputTypeText" placeholder="" size="15" type="text">
						</td>
					</tr>
					<tr>
						<th scope="row">주소 <img src="#" alt="필수"></th>
						<td>
							<input id="rzipcode1" class="inputTypeText" size="6" maxlength="6" type="text">							
							<a href="#none" id="btn_search_rzipcode" class="-btn -white"><i class="fa fa-map-o"></i> &nbsp; 우편번호</a><br>
							<input id="raddr1" class="inputTypeText"  size="40" readonly="1" value="" type="text"> <span class="grid">기본주소</span><br>
							<input id="raddr2" class="inputTypeText" size="40" value="" type="text"> <span class="grid">나머지주소</span><span class="grid displaynone">(선택입력가능)</span>
						</td>
					</tr>
					<tr class="">
						<th scope="row">
						휴대전화 <span class="displaynone"></span>
						</th>
						<td>
						<select id="rphone2_1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						-<input id="rphone2_2" maxlength="4" size="4" type="text">-<input id="rphone2_3" maxlength="4" size="4" type="text"></td>
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

		<div class="-titlepack">
			<br><br>
			<h3 class="-font-ns">결제수단</h3>
		</div>
		<div class="payArea">
			<div class="payment">
				<div class="method">
					<span class="ec-base-label">
					<input id="addr_paymethod2" type="radio"><label for="addr_paymethod2">카드 결제</label></span>
					<span class="ec-base-label">
					<input id="addr_paymethod3" type="radio"><label for="addr_paymethod3">직접수령</label></span>
				</div>
			</div>

			<!-- 최종결제금액 -->
			<div class="total">
				<h4>
					<strong id="current_pay_name">무통장 입금</strong> <span>최종결제 금액</span>
				</h4>
				<p class="price">
				<span></span>
				<input id="total_price" class="inputTypeText" style="text-align:right;ime-mode:disabled;clear:none;border:0px;float:none;" size="10" readonly="1" value="44500" type="text"><span>won</span></p>
				<p class="paymentAgree" id="chk_purchase_agreement" style="display: block;"><input id="chk_purchase_agreement0" name="chk_purchase_agreement" fw-filter="" fw-label="구매진행 동의" fw-msg="" value="T" type="checkbox" style="display: block;"><label for="chk_purchase_agreement0">결제정보를 확인하였으며, 구매진행에 동의합니다.</label></p>
				<div class="button smp-btn-pay-info"><a href="#none"><img src="/_panda/image/cafe24/btn_place_order.gif" id="btn_payment" alt="결제하기"></a></div>
				
			</div>
		</div>






</div>



		<!-- /////////////// -->

	<div style = "height: 50px"></div>
	<form action="../market/marketBuy.market" method="POST">
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
				<td><select name = "delivery" id="delivery">
					<option class = "delivery" value = "1">직접수령</option>
					<option class = "delivery" value = "2">택배</option>
				</select>
				<td id="price"></td>
			</tr>
			<tr id="addrDis" style="display: none;">
				<td>주소</td>
				<td>
					<input type="text" id="postCode" name="postCode" placeholder="우편번호" readonly="readonly" value="${member.postCode }">
					<input type="button" id="addrCheck" value="우편번호 찾기" ><br>
					<input type="text" id="addr" name="addr" placeholder="주소" readonly="readonly" value="${member.addr }">
					<input type="text" id="addr2" name="addr2" placeholder="나머지주소 " value="${member.addr2 }">	
				</td>
				<td>택배결제시 2500원 추가되어 결제됩니다.</td>
			</tr>
		</table>
		<button class = "btn btn-default" type = "submit">CONFIRM</button>
	</form>
	
	
	</div>
</div>
<c:import url="${myContextPath}/temp/footer.jsp"></c:import>
</body>
</html>