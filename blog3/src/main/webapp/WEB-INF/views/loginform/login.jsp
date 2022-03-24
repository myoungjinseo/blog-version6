<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Login</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginpage.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
		<h1 id="title">LOGIN</h1>
		<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
			charset="utf-8"></script>
	</head>

	<body>
		<div id="container">
			<form method="post">
				<p class="input">	
					<!--아이디-->
					<input type="text" name="userid" class="text" placeholder="아이디" />
				</p>
				<p class="input">
					<!--비밀번호-->
					<input type="password" class="text" name="password1"  placeholder="비밀번호" />
				</p>
				<!--로그인 버튼-->
				<p class="submit">
					<input type="submit" value="로그인" class="text" />
				</p>
	       		<!--회원가입 버튼-->
				<p class="join-btn">
          		<a href="/form2/register2">
				<input type="button" value="회원가입" class="text" />
          		</a>
        		</p>
				<p class="autologin">
					<input type="checkbox" name="autologin" value="1" />
					로그인 유지
				</p>
				
				<div class="error">${ errorMsg }</div>

				
				<!--간편로그인-->
				<div id="simpleLogin">
					<!--네이버-->
					<div id="naver_id_login"></div>
					<!--카카오-->
					<a href="javascript:kakaoLogin();">
						<img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png"
							style="height: 50px; width: auto" />
					</a>
				</div>
			</form>
		</div>

		<!--네이버 스크립트-->
		<script type="text/javascript">
			var naver_id_login = new naver_id_login(
				"55mXNbI5HBQcYFzdmwJN",
				"http://127.0.0.1:5500/mainpage.html"
			);
			var state = naver_id_login.getUniqState();
			naver_id_login.setButton("green", 3, 50);
			naver_id_login.setDomain(".service.com");
			naver_id_login.setState(state);
			naver_id_login.setPopup();
			naver_id_login.init_naver_id_login();
		</script>

		<!-- 카카오톡 스크립트 -->
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script>
			Kakao.init("7b36e48f724f19fe6967b802efa96010"); //자바 스크립트 키 (명진)
			console.log(Kakao.isInitialized()); // sdk초기화여부판단
			//카카오 로그인
			function kakaoLogin() {
				Kakao.Auth.login({
					scope: "profile_nickname, account_email, gender",
					success: function (authObj) {
						console.log(authObj);
						window.Kakao.API.request({
							url: "/v2/user/me",
							success: (res) => {
								const kakao_account = res.kakao_account;
								console.log(kakao_account);
								
								window.location.href = 'http://localhost:8088/form1/main';
								
							},
						});
					},
				});
			}
		</script>
	</body>

	</html>