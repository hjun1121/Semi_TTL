<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form action="./bookOrderNO.book" method="post">
	<input type="hidden" name="num" value="${num}">
		<table class="Dtable">
		<tr>
		<th>취소 사유</th>
			<td>
				<input type="text" name="cancel" style="width: 290px;height: 35px;border: 1px solid #d1d0cf;line-height: 2.1em;font-size: 13px;vertical-align: top;color: #4c4c4c;padding: 0 5px;font-family: NanumBarunGothic,sans-serif;">
			</td>
		</tr>
		</table>
		<br>
		<div style="text-align: center; margin-bottom: 60px;">
			<a href="./bookOrderListAdmin.book?state=3"><button style="width: 150px; height: 50px;line-height: 48px;font-size: 16px;color: #666;background: #fff;border: 1px solid #aaa;" type="button">취소</button></a>
			<button type="submit" style="width: 150px; height: 50px; line-height: 48px; font-size: 16px; color: #fff; background: #033823; border: 1px solid #aaa;">거절</button>
		</div>
</form>