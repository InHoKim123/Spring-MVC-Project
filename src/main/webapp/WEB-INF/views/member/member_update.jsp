<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="./css/styles.css">
<link href="./css/memberUpdate.css" rel="stylesheet">
<link href="./css/bootstrap.css" rel="stylesheet">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="./js/memberUpdateform.js"></script>
<script src="./js/jquery.placeholder.label.min.js" type="text/javascript"></script>
<script src="./js/placeholder.js" type="text/javascript"></script>
<title>회원 정보 수정</title>
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
<form name="join" action="./MemberUpdate" method="post" enctype="multipart/form-data">
 <div class="user-update-page">
  <fieldset>
   <div class="user-profile">
	<div class="profile">
	   <span><img class="profilepic" alt="프로필사진" src="./img/${memberlist.attachedfile }"></span>
	   <span><label class="profileupdate" for="fileName">프로필변경</label>
	   <input type="file" class="profileupdate" id="fileName" name="fileName" style="display: none"></span>
	   <div class="user-info">
	    <ul>
	     <li><font id="user-name">${memberlist.nicname }</font></li>
	     <li><font id="user-num">일반회원</font></li>
	    </ul>
	   </div>
	</div>
	<hr>
	<div>
	 <div class="user-id">
	  <div class="user-font"> 아이디 </div>
	  <div> <input type="text" name="id" value="${memberlist.id }" class="inputstyleid" readonly="readonly"> </div>
	 </div>
     <div class="user-passwd">
	  <div class="user-font"> 비밀번호 </div>
	  <div> <input type="password" name="passwd" value="${memberlist.passwd }" class="inputstyleid"> </div>
	 </div>
	 
	 <div class="user-passwd">
	  <div class="user-font"> 비밀번호 확인</div>
	  <div> <input type="password" name="passwdre" value="${memberlist.passwd }" class="inputstyleid"> </div>
	 </div>
	 
	 <div class="user-name">
	  <div class="user-font"> 이름 </div>
	  <div> <input type="text" name="name" value="${memberlist.name }" class="inputstyleid"> </div>
	 </div>
	 
	 <div class="user-nicname">
	  <div class="user-font"> 닉네임 </div>
	  <div> <input type="text" name="nicname" value="${memberlist.nicname }" class="inputstyleid"> </div>
	 </div>
	 
	 <div class="user-email">
	  <div class="user-font"> 이메일 </div>
	  <div> <input type="email" name="email" value="${memberlist.email }" class="inputstyleid"> </div>
	 </div>
	 
	 <div class="user-managernum">
	  <div> <input type="hidden" name="managernum" value="0" class="inputstyleid" readonly="readonly"> </div>
	 </div>
	 
	 <div class="user-date">
	  <div class="user-font"> 가입일 </div>
	  <div> <input type="text" name="date" value="${memberlist.memberday }" class="inputstyleid" readonly="readonly"> </div>
	 </div>
	 
	 <div class="user-membertech">
	  <div class="user-font"> 관심분야 </div>
	  <div> 
	   <select name="membertech" style="margin-left: 35px" class="inputstyleid">
        <optgroup label="프로그래밍 언어">
        <option value="C"> C </option>
        <option value="Java"> Java </option>
        <option value="JavaScritpt"> JavaScritpt </option>
        <option value="HTML"> HTML </option>
        <option value="C++"> C++ </option>
        <option value="C#"> C# </option>
        <option value="Python"> Python </option>
        <option value="Ruby"> Ruby </option>
        <option value="PHP"> PHP </option>
        </optgroup>
       </select> 
	  </div>
	 </div>
	</div>
	<br><br>
	<button type="button" onclick="updateMemberDone()" class="user-info-update">정보 수정 확인</button>
  </div>
  <br><br>
  <p style="margin-left: 200px">
   
   <!-- <button type="button" onclick="location.href='./memberDelete.html'">회원 삭제</button> -->
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