<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp94197155'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:${mddDTO.title}',
		    amount : ${mddDTO.price},
		    buyer_email : '${member.email}',
		    buyer_name : '${member.id}',
		    buyer_tel : '${member.phone}',
		    buyer_addr : '${mddDTO.addr}'+'${mddDTO.addr2}',
		    buyer_postcode : '${mddDTO.postCode}',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
		        document.frm.submit();
		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        location.href="../index.jsp";
		    }
		    alert(msg);
		});
	});
</script>
</head>
<body>
	<h2>결제페이지</h2>
	<form action="../market/bookBuy.market" method="POST" name="frm">
		<input type="hidden" class="form-control" name="num" value=${mddDTO.num }> 
		<input type="hidden" class="form-control" name="id" value=${mddDTO.id }> 
		<input type="hidden" class="form-control" name="kind" value='1'>
		<input type="hidden" class="form-control" name="title" value="${mddDTO.title}">
		<input type="hidden" class="form-control" name="writer" value="${mddDTO.writer}">
		<input type="hidden" class="form-control" name="company" value="${mddDTO.company}">
		<input type="hidden" class="form-control" name="publish_date" value="${mddDTO.publish_date}">
		<input type="hidden" class="form-control" name="price" value="${mddDTO.price}">
		<input type="hidden" class="form-control" name="library" value="${mddDTO.library}">
		<input type="hidden" class="form-control" name="delivery" value="${mddDTO.delivery}">
		<input type="hidden" id="postCode" name="postCode" placeholder="우편번호" value="${mddDTO.postCode }">
		<input type="hidden" id="addr" name="addr" value="${mddDTO.addr }">
		<input type="hidden" id="addr2" name="addr2" value="${mddDTO.addr2 }">
	</form>

</body>
</html>