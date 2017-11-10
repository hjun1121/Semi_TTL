<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="./bookOrderOK.book" method="post">
				<input type="hidden" name="num" value="${num}">
				
			<div>	
			책분류
					<select name="type">
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
			</div>
				<button type="submit">승인</button>
	</form>
	
	