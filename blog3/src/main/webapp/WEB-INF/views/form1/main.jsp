<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>main</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mainpage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font.css">
<script src="${pageContext.request.contextPath}/js/toggle.js"></script>
</head>

<body>
	<header>

		<div id="blog-gnb">
			<c:if test="${ userid eq null}">
				<a href="/loginform/login"><button id="login-btn">로그인</button></a>
			</c:if>
			<form method="post">
				<c:if test="${ userid ne null}">
					<span id="logined-id">${userid}</span>
					<a><button id="logout-btn">로그아웃</button></a>
		</div>
		</c:if>
		</form>
		</div>

	</header>
	<div class="container">
		<div id="top-section"></div>
		<div id="left-section">
			
				<div id="profile">
					<p id="userID">${ userid}</p>

					<p id="greetings">한줄소개?</p>
					<a> <!--글쓰기 페이지 링크 추가--> <c:if test="${ userid ne null}">

							<a href="write"><span id="writing-btn">글쓰기</span></a>
						</c:if>
					</a>
				</div>
				<div id="category">
					<p class="categoryTitle">category</p>
					<p class="categoryText">2022.02.</p>
					<p class="categoryText">2022.03.</p>
					<p class="categoryText">2022.04.</p>
				</div>
		</div>
		<div id="right-section">
			<div id="main">
				
				<div id="writingList">
					전체 n개의 글 <span id="toc-toggle" onclick="openCloseToc()">목록열기</span>
					<ol id="toc-content">
						<li>글1</li>
						<li>글2</li>
						<li>글3</li>
					</ol>
				</div>

		<c:forEach var="text" items="${texts}" >
				<div id="writing-section">
					<div id="writing-component">
						<p>
							<span id="writing-title">${text.title}</span>
						</p>
						<span id="writing-id">${text.userid}</span> <span
							id="writing-date">${text.date}</span>
					</div>

					<hr size="1" color="#bbb">
					<p id="writing">${text.maintext}</p>
				</div>
						</c:forEach>
			</div>
		
		
		</div>
		
	</div>

</body>

</html>