<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/joinpage.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
		
</head>
<body>
	<h1 id="title">join</h1>
	<form method="post">
	<table>
		<tr class="id">
			<th>아이디</th>
			<td>
				<input type="text" 
				id="member_id" 
				class="inputText" 
				name="userid" 
				value="${ member.userid }" />
			</td>
		</tr>
		<tr class="password">
			<th>비밀번호</th>
			<td>
				<input type="password" id="member_password" class="inputText" name="password1" />
			</td>
		</tr>
		<tr class="checkPassword">
			<th>비밀번호 확인</th>
			<td>
				<input type="password" id="check_password" class="inputText" name="password2" />
			</td>
		</tr>
		<tr class="name">
			<th>이름</th>
			<td>
				<input type="text" id="member_name" class="inputText" name="name" value="${ member.name }" />
			</td>
		</tr>
		<tr class="phone">
			<th>휴대전화</th>
			<td>
				<select id="mobile1" class="mobile" name="phone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>

					<input id="mobile2" class="mobile" maxlength="4" name="phone2"/>

					<input id="mobile3" class="mobile" maxlength="4" name="phone3"/>
				</select>
			</td>
		</tr>
		<tr class="email">
			<th>이메일</th>
			<td>
				<input type="email" placeholder="id@host" id="member_email" class="inputText" name="email" value="${ member.email }" />
			</td>
		</tr>
		
	</table>

	<input type="submit" id="submit-btn" />

	<c:if test="${ not empty errorMsg }">
		<div class="error">${ errorMsg }</div>
	</c:if>
	</form>
</body>
</html>
