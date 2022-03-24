<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
</head>
<body>

<div class="container">

<h1>회원가입 성공</h1>

<table>
  <tr>
    <td>사용자 아이디</td>
    <td>${ userid }</td>
  </tr>
  <tr>
    <td>이름</td>
    <td>${ name }</td>
  </tr>
  <tr>
    <td>휴대전화</td>
    <td>${ phone }</td>
  </tr>
  <tr>
    <td>이메일</td>
    <td>${ email }</td>
  </tr>
</table>

</div>
</body>
</html>
