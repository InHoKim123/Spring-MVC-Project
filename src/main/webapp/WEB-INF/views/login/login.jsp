<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->
<link rel="stylesheet" href="./css/styles.css">
<link href="./css/login.css" rel="stylesheet">

<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="./js/memberLoginform.js"></script>
<script src="./js/jquery.placeholder.label.min.js"
	type="text/javascript"></script>
<script src="./js/placeholder.js" type="text/javascript"></script>
<title>로그인</title>
</head>
<body id="body-pd">
	<div id="wrap">
		<div class="l-navbar" id="navbar">

			<nav class="nav">
				<div>

					<div class="nav__brand">
						<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
						<a href="./PostSelectAll" class="nav__logo">OKKY</a>
					</div>
					<div class="nav__list">
						<a href="./PostSelectAll" class="nav__link active"> <ion-icon
								name="home-outline" class="nav__icon"></ion-icon> <span
							class="nav_name">홈</span>
						</a> <a href="./PostSelectAll" class="nav__link"> <ion-icon
								name="reader-outline" class="nav__icon"></ion-icon> <span
							class="nav_name">게시판</span>
						</a> <a href="./Login" class="nav__link"> <ion-icon
								name="log-out-outline" class="nav__icon"></ion-icon> <span
							class="nav_name">로그인</span>
						</a>


					</div>

				</div>
			</nav>


		</div>
		<main>
		<form name="join" action="Login" method="post">
			<div class="user-LoginPage">
				<fieldset>
					<div>
						<p>
							<font> 로그인 </font>
						</p>
					</div>
					<div class="LoginMain">
						<p class="fontid">아이디 로그인
						<p>
						<hr>
						<div>
							<input type="text" name="id"
								placeholder="아이디 id/varchar2(30BYTE)" class="inputstyleid"><br>
							<input type="password" name="passwd"
								placeholder="비밀번호 passwd/varchar2(30BYTE)" class="inputstylepd"><br>
							<br> <br>
						</div>
						<!-- 
						 <label class="doLogin"><input type="checkbox" name="checklogin">로그인 유지 </label><br>
						-->
						
						<button type="button" value="로그인" class="inputlogin"
							onclick="loginMember()">로그인</button>
						<br> <br>
						<div class="user-sign">
							<span><a href="#" class="user-find">계정 찾기</a></span> <span>/</span>
							<span><a href="./MemberInsert" class="user-insert">회원가입</a></span>
						</div>

					</div>
				</fieldset>
			</div>

		</form>
		</main>
	</div>
	<footer>
		<p class="footercla">Copyright KimInHo © 2022 SpringProject</p>
	</footer>
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="./js/main.js"></script>

</body>
</html>