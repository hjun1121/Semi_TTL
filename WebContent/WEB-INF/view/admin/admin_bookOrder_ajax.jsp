<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="./bookOrderOK.book" method="post">
	<input type="hidden" name="num" value="${num}">
		<table class="Dtable">
		<tr>
		<th>책분류</th>
		<div>
			<td>
				<select name="type" style="width:60px; height: 32px; border: 1px solid #d1d0cf; background-color: #fff; line-height: 29px;">
					<option value="총류" >총류</option>
					<option value="철학" >철학</option>
					<option value="종교" >종교</option>
					<option value="사회과학" >사회과학</option>
					<option value="자연과학" >자연과학</option>
					<option value="기술과학" >기술과학</option>
					<option value="예술" >예술</option>
					<option value="언어" >언어</option>
					<option value="문학" >문학</option>
					<option value="역사" >역사</option>
				</select>
			</td>
		</div>
		</tr>
		</table>
		<br>
		<div style="text-align: center; margin-bottom: 60px;">
			<a href="./bookOrderListAdmin.book?state=3&library=${library}"><button style="width: 150px; height: 50px;line-height: 48px;font-size: 16px;color: #666;background: #fff;border: 1px solid #aaa;" type="button">취소</button></a>
			<button type="submit" style="width: 150px; height: 50px; line-height: 48px; font-size: 16px; color: #fff; background: #033823; border: 1px solid #aaa;">승인</button>
		</div>
</form>
	
	