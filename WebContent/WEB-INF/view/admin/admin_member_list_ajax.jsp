<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${size eq 0 }">
		<h3 id="eqeq">검색 결과가 없습니다.</h3>
</c:if>
<c:if test="${size ne 0 }">
<input type="hidden" name="kind" id="kind0" value="${kind }">
<table id = "member" class="kind" >
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
					<td><a href="./memberUpdate.member?id=${dto.id }">${dto.id }</a></td>
					<td>${dto.pw }</td>
					<td>${dto.name }</td>
					<td>${dto.birth }</td>
					<td>${dto.gender }</td>
					<td>${dto.addr }</td>
					<td>${dto.phone }</td>
					<td>${dto.email }</td>
					<td>${dto.library }</td>
					<td>${dto.kind }</td>
				</tr>
			</c:forEach>
		</table>
		<div style = "text-align: center;">
			<ul class="pagination pagination-sm">
				<c:if test="${page.curBlock>1}">
				<li><a href = "./memberList.member?curPage=${page.startNum-1}&kind=${kind}&search=${search}&kind1=${kind1}&library=${library}">[이전]</a></li>
				</c:if>
				
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<li><a class="cur" title="${i }" href="./memberList.member?curPage=${i}&kind=${kind}&search=${search}&kind1=${kind1}&library=${library}">${i}</a></li>
				</c:forEach>

				<c:if test="${page.curBlock < page.totalBlock}">
				<li><a href="./memberList.member?curPage=${page.lastNum+1}&search=${search}&search=${search}&kind1=${kind1}&library=${library}">[다음]</a></li>
				</c:if>
			</ul>
		</div>
</c:if>