<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="./bookOrderNO.book" method="post">
				<input type="hidden" name="num" value="${num}">
				
			<div>	
				취소사유: <input type="text" name="cancel">
			</div>
				<button type="submit" >거부</button>
	</form>
	