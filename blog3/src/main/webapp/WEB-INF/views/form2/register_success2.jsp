<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
</head>
<body>

<div class="container">

<h1>회원가입 성공</h1>

<table>

  <tr>
    <td>사용자 아이디</td>
    <td>${ member.userid }</td>
  </tr>
  <tr>
    <td>이름</td>
    <td>${ member.name }</td>
  </tr>
  <tr>
    <td>휴대전화</td>
    <td>${ member.phone1 }-${ member.phone2 }-${ member.phone3 }</td>
  </tr>
  <tr>
    <td>이메일</td>
    <td>${ member.email }</td>
  </tr>
</table>
 <a href="/loginform/login"><button id="login-btn">로그인 페이지로 이동</button></a>
</div>
</body>
</html>
