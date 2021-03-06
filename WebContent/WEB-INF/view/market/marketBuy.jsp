<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중고장터 구매 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/temp/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/market/bookBuy.css">

<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
		        location.href="./marketTotalList.market?library=${library}&ln=${ln}";
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

	<form action="../market/bookBuy.market?ln=${ln}" method="POST" name="frm">
		<input type="hidden" class="form-control" name="num" value=${mddDTO.num }> 
		<input type="hidden" class="form-control" name="id" value=${member.id }> 
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
		<input type="hidden"  name="state" value="${mddDTO.state }">
	</form>
		<br><br><br><br><br><br><br><br><br>
		<center><strong>고객님의 상품이 결제되고 있습니다.</strong></center>
		<center><p><img alt="" src="${pageContext.request.contextPath }/image/market/txt_progress.gif"></p></center>
		<center><p><img alt="" src="${pageContext.request.contextPath }/image/market/img_loading.gif"></p></center>
			<br><br><br><br><br><br><br><br><br>
<c:choose>
	<c:when test="${ln eq 1}"><c:import url="${myContextPath}/temp/footer_1.jsp"></c:import></c:when>
	<c:when test="${ln eq 2}"><c:import url="${myContextPath}/temp/footer_2.jsp"></c:import></c:when>
	<c:when test="${ln eq 3}"><c:import url="${myContextPath}/temp/footer_3.jsp"></c:import></c:when>
	<c:when test="${ln eq 4}"><c:import url="${myContextPath}/temp/footer_4.jsp"></c:import></c:when>
	<c:otherwise><c:import url="${myContextPath}/temp/footer.jsp"></c:import></c:otherwise>
</c:choose>
</body>
</html>