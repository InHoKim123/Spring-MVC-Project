<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="./css/styles.css">
<link href="./css/memberDelete.css" rel="stylesheet">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="./js/memberDelete.js"></script>
<script src="./js/jquery.placeholder.label.min.js" type="text/javascript"></script>
<script src="./js/placeholder.js" type="text/javascript"></script>

<title>회원 삭제</title>
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
 <form name="join" action="./MemberDelete" method="post">
 <div class="user-delete-page">
  <fieldset>
  <c:choose>
   <c:when test="${sessionScope.seman eq 1}">
    <font class="member_profile">회원삭제</font><br><br><hr>
   </c:when>
   <c:when test="${sessionScope.id eq memberlist.id}">
    <font class="member_profile">회원탈퇴</font><br><br><hr>
   </c:when>
  </c:choose>
  
   <p>삭제할 회원의 아이디와 비밀번호를 입력하세요</p>
   <p>
    <input type="text" id="id" name="id" class="inputstyleid" value="${memberlist.id }" placeholder="아이디 passwd/varchar2(20BYTE)">
   </p>
   <p>
    <input type="password" class="inputstyleid" id="passwd" name="passwd" placeholder="비밀번호 passwd/varchar2(30BYTE)">
   </p>
  
  <br><br>
  <p style="margin-left: 110px">
   <c:choose>
   <c:when test="${sessionScope.seman eq 1}">
    <button type="button" onclick="deleteMember()" class="user-info-delete">회원 삭제</button>
   </c:when>
   <c:when test="${sessionScope.id eq memberlist.id}">
    <button type="button" onclick="deleteMember()" class="user-info-delete">회원 탈퇴</button>
   </c:when>
   </c:choose>
   
  </p> 
  </fieldset>
  </div>
 </form>
</div> 
 	<footer> <p class="footercla">Copyright KimInHo © 2022 SpringProject </p> </footer>
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="./js/main.js"></script>
</body>
</html>