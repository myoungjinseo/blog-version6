<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	
	<!DOCTYPE html>
	<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
		<title>main</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/write.css">
	</head>

<body>

<form method="post">
    <div id="container">
      
      <input
        id="writing-title"
        type="text"
        minlength="0"
        maxlength="30"
        placeholder="제목을 입력하세요."
        name="title"
      />
      <textarea
        id="writing"
        placeholder="본문을 입력하세요."
        style="resize: none"
        name="maintext"
      ></textarea>
      <input id="submit-btn" type="submit" value="등록하기" />
    </div>
    </form>
  </body>


	</html>