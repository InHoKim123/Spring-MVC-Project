<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="./css/styles.css">
<link href="./css/postUpdate.css" rel="stylesheet">
<link href="./css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="./css/site.css" rel="stylesheet">
<link href="./js/richtext.min.css" rel="stylesheet">

<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.richtext.js" type="text/javascript"></script>
<script type="text/javascript" src="./js/postUpdateform.js"></script>
<title>게시글 수정</title>
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
					<a href="./PostSelectAll" class="nav__link active">
					 <ion-icon name="home-outline" class="nav__icon"></ion-icon>
					 <span class="nav_name">홈</span>
					</a> 


    					<c:if test="${sessionScope.seman eq 1}">  
       						<a href="./MemberSelectAll" class="nav__link">
					 		 <ion-icon name="people-outline" class="nav__icon"></ion-icon>
					 		 <span class="nav_name">회원검색</span>
							</a> 
						</c:if>
				
					<c:choose>  
    					<c:when test="${!empty sessionScope.id}">  
       						<a href="./PostSelectAll" class="nav__link">
					 		 <ion-icon name="reader-outline" class="nav__icon"></ion-icon> 
					 		 <span class="nav_name">게시판</span>
							</a> 
    					</c:when>  
    				 <c:otherwise>  
         					 <a href="./Login" class="nav__link">
							  <ion-icon name="reader-outline" class="nav__icon"></ion-icon> 
							  <span class="nav_name">게시판</span>
							 </a> 
    				 </c:otherwise>  
					</c:choose>  
					<form action="./MemberSelectDetail" method="get">
					<c:if test="${!empty sessionScope.id}">
						<a href="./MemberSelectDetail?id=${sessionScope.id }" class="nav__link">					 
						 <ion-icon name="person-outline" class="nav__icon"></ion-icon>
						 <span class="nav_name"> 내정보</span>
						</a>
					</c:if>
					</form>
					<c:choose>  
    					<c:when test="${!empty sessionScope.id}">  
       						<a href="./LogOut" class="nav__link">
							 <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
				 			 <span class="nav_name">로그아웃</span>
							</a>
    					</c:when>  
    				 <c:otherwise>  
         					 <a href="./Login" class="nav__link">
							  <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
							  <span class="nav_name">로그인</span>
							 </a> 
    				 </c:otherwise>  
					</c:choose>  
					
						
				</div>
				
			</div>
		</nav>
		
		</div>
		<div>
			<hr>
		</div>
		<form name="join" action="./PostUpdate" method="post">
			<span><font class="write_post">글 수정</font></span><br>
			<br>
			<div class="post-update-page">
				<div class="text-area">
					<div>
						<input type="text" class="form-control" id="floatingInput"
							name="postname" maxlength="30" value="${postlist.postname}"
							style="width: 100%; height: 30px; font-size: 16pt;"><br>
					</div>

					<br>
					<div>
						<select name="postkind"
							style="width: 100%; height: 30px; font-size: 16pt;">
							<option value="자유게시판" selected="selected">자유게시판
							<c:if test="${sessionScope.seman eq 1}">
							<option value="공지사항">공지사항
							</c:if>
							<option value="질문게시판">질문게시판
						</select>
					</div>
					<br>

					<div class="page-wrapper box-content">
						<textarea class="content" name="postcontent">${postlist.postcontent}</textarea>
					</div>

					<br> <br> 
					<input type="date" id="postwriteday" name="postwriteday" readonly="readonly"> 
					<input type="hidden" name="views" value="${postlist.views}"> 
					<input type="hidden" name="postnum" value="${postlist.postnum }">
					<br> <br>
					<div>
						<button type="button" class="post-update-done" onclick="postUpdate()">게시글 수정</button>
					</div>
				</div>
			</div>
		</form>

	</div>
	<script type="text/javascript">
		document.getElementById("postwriteday").valueAsDate = new Date();
	</script>
	<script>
		$(document).ready(function() {
			$('.content').richText();
		});
	</script>

	<footer>
		<p class="footercla">Copyright KimInHo © 2022 SpringProject</p>
	</footer>
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="./js/main.js"></script>
</body>
</html>